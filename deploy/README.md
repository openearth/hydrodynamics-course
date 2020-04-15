
# JupyterHub on Azure Kubernetes

## Prerequisites

 - [azure client](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
 - [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
 - [helm](https://helm.sh/docs/intro/install/)

## Setup Kubernetes Cluster
Follow this documentation to setup a scaling kubernetes cluster in Azure:

[JupyterHub on azure documentation](https://zero-to-jupyterhub.readthedocs.io/en/latest/microsoft/step-zero-azure-autoscale.html)

**Remarks:**
 - Use Kubernetes version 1.14: https://github.com/jupyterhub/kubespawner/issues/354. Next time check compatability of the kubernetes python api. Move the newer version if compatible.
 
 ## Setting up Helm
 Follow this documentation to setup Helm. Helm is a package manager for kubernetes. JupyterHub can be installed with this package manger.
[JupyterHub setting up Helm](https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-jupyterhub/setup-helm.html)

## Setting up JupyterHub
Follow this documentation to setup a basic JupyterHub installation. Customizations for the PAOTM course will follow in the next sections. The config.yaml in git already contains some settings for the customizations. For this step the basic config.yaml from the documentations can be used.

[Setting up JupyterHub](https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-jupyterhub/setup-jupyterhub.html)

## Create custom container
For the course we can make a custom container. The container contains the model and notebook for the course.
First we need a private container registry to store the container. Create a registry on microsoft Azure with the follow commands:
Resource group should be the same as the kubernetes cluster.

    az acr create --resource-group <resource group> --name <name container registry> --sku Basic

Login the container registry

	az acr login --name <name container registry>

Attach the container registry to the kubernetes cluster

	az aks update -n <cluster-name> -g <resource group> --attach-acr <name container registry>

The dockerfile for the custom container is stored in thi git repo: Dockerfile-jupyterhub. You first need to download FM from the [build server.](https://build.deltares.nl/buildConfiguration/Dimr_DimrCollector) [This build](https://build.deltares.nl/repository/download/Dimr_DimrCollector/1306704:id/dimrset_lnx64_373.tar.gz) was used for the demo.

 - Download FM, unzip the file and store it in the models folder. 
 - Change the reference in Dockerfile-jupyter to the model in the models folder. It is something like [container registry name].azurecr.io

Build the container localy. The loginServer is a result from the creation of the container registry

	docker build -f Dockerfile-jupyterhub -t <loginServer>/hydrodynamicscourse:<version number> .

Push the container to the azure container registry

	docker push <loginServer>/hydrodynamicscourse:v1

Update the JupyterHub config.yaml with the new container. Add the following code block:

	singleuser:
	  image:
	    name: loginServer<>/hydrodynamicscourse
	    tag: <version>

Update the helm installation:

	 RELEASE=jhub
	 helm upgrade $RELEASE jupyterhub/jupyterhub --version=0.8.2 -f config.yaml

## Customize resources
The resources for a container can be specified in the config.yaml

	singleuser:
	  image:
	    name: loginServer<>/hydrodynamicscourse
	    tag: v4
	  memory:
	    limit: 4G
	    guarantee: 4G
	  cpu:
	    limit: 1.5
	    guarantee: 1.5

Again update the helm installation:
	
	RELEASE=jhub
	 helm upgrade $RELEASE jupyterhub/jupyterhub --version=0.8.2 -f config.yaml

## Customize storage

By default JupyterHub creates a persistent volume (pv) en persistent volume claim (pvc) for each user. The volume is mounted in /home/jovyan. So all the changes here will be stored in the persistent volume.
For the PAOTM course we disabled this option by adding the following setting to the config.yaml

	singleuser:
	  storage:
	    type: none

It is also possible to create a pv and pvc and attach those to the container.
First create the storage and add it to the cluster:

Create storage account

	az storage account create -n <name> -g <resource group> -l westeurope --sku Standard_LRS

List keys for storage account

	az storage account keys list -g <resource group> -n <name>

Create azure file share for notebooks. Use key from the previous command.

	az storage share create \
	  --name notebooks \
	  --account-key <key> \
	  --account-name <name>

Add file to azure files notebooks (git repo)

	az storage file upload-batch \
	  --destination notebooks \
	  --source <local notebooks folder>\
	  --account-key <key>\
	  --account-name <name> \
	  
Add secret to kubernetes cluster with storage account key

	kubectl create secret generic paotm-notebooks-secret \
	  --from-literal=azurestorageaccountname=<name> \
	  --from-literal=azurestorageaccountkey=<key>

 add persistent volume notebooks to cluster. The example pv file is stored in git
 
	kubectl apply -f notebooks-pv.yml

add persistent volume claim notebooks to cluster. The example pvc file is in git

	kubectl apply -f notebooks-pvc.yml
	
Add the following section to the config.yaml to attach the pvc to each container started in the JupyterHub Environment.

	singleuser:
	  storage:
	    type: dynamic
	    dynamic:
	      pvcNameTemplate: claim-{username}{servername}
	      volumeNameTemplate: volume-{username}{servername}
	      storageAccessModes: [ReadWriteOnce]
	    extraVolumes:
	      - name: paotm-shared
	        persistentVolumeClaim:
	          claimName: notebooks
	    extraVolumeMounts:
	      - name: paotm-shared
	        mountPath: /home/jovyan/notebooks

Update the helm installation:
	
	RELEASE=jhub
	 helm upgrade $RELEASE jupyterhub/jupyterhub --version=0.8.2 -f config.yaml
## Git checkout in container
A lifecycleHook can be used to checkout a git repository in the container before it is ready for the user. This is done with nbgitpuller. nbgitpuller should be in the requirements for this option to work. 

Add the following to the config.yaml

	singleuser:
	  lifecycleHooks:
	    postStart:
	      exec:
	        command: ["gitpuller", "https://github.com/openearth/hydrodynamics-course.git", "master", "notebooks"]
	        
Update the helm installation:
	
	RELEASE=jhub
	 helm upgrade $RELEASE jupyterhub/jupyterhub --version=0.8.2 -f config.yaml
This option is used in the PAOTM course at the moment.
## Authentication
At the moment dummy authentication method is available. This is done with the following section in the config.yaml.

	auth:
	  type: dummy
	  dummy:
	    password: '<password>'
	  whitelist:
	    users:
	      - user1
	      - user2
	      - user3
	      - user4
	      - user5
	      - user6
	      - user7
	      - user8
	      - user9
	      - user10
	  admin:
	    users:
	      - admin

Currently this is replaced with MyDeltares login. Documentation about this can be found [here](https://zero-to-jupyterhub.readthedocs.io/en/latest/administrator/authentication.html). The OpenID Connect method can be used to connect with MyDeltares. The following codeblock in the config.yaml is used for the myDeltares connection.

	hub:
	  extraEnv:
	    OAUTH2_AUTHORIZE_URL: https://${host}/auth/realms/${realm}/protocol/openid-connect/auth
	    OAUTH2_TOKEN_URL: https://${host}/auth/realms/${realm}/protocol/openid-connect/token
	    OAUTH_CALLBACK_URL: https://<your_jupyterhub_host>/hub/oauth_callback
	auth:
	  type: custom
	  custom:
	    className: oauthenticator.generic.GenericOAuthenticator
	    config:
	      client_id: ""
	      client_secret: ""
	      token_url: https://${host}/auth/realms/${realm}/protocol/openid-connect/token
	      userdata_url: https://${host}/auth/realms/${realm}/protocol/openid-connect/userinfo
	      userdata_method: GET
	      userdata_params: {'state': 'state'}
	      username_key: email

