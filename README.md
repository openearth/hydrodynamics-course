# hydrodynamics-course-binder

This is the repository for exercises for the hydrodynamics course.

In 2020 the course will start on **7 April**

## To do's (and deadlines)
- [ ] **Wouter (by 17 MAr)**: contact PAO to discuss status of course
- [ ] **ALL (by 18 Mar lunch time)**: update notebooks so that Anna and Fine can pull those to VMWare / Azure
- [ ] **Anna (by 18 Mar)**: get actual notebooks available in the Azuer Kubernetes cluster
- [ ] **Fine (by 18 MAr)**: follow up with Christian Romijn about additional VMs + logins on VMWare Horizon for course participants
- [ ] **Cindy (by 16 Mar)**: Exercise 1B - At startup: Value (Roughness Chézy) has been set to: 2500.0 is given. This is a very high value for the roughness. Update BMI
- [ ] **Frank and Cindy (by 16 Mar)**:  New schematisation made, but exercise appears broken at the moment. **Check setting through slice of zbndz**. And discuss with Willem.
- [ ] **Frank and Willem + ask Cindy for help if needed (by 18 Mar)**: Exercise 3 - update exercises and modify text in notebooks
	- [ ] Split this exercise in two parts, upstream waterlevel / upstream discharge ?
	- [ ] Step 3a) mentions to set the upstream waterlevel, but you can only set the upstream discharge - should we  
	- [ ] Step 3b) also depends on upstream waterlevel
- [ ] **Frank and Willem (by 18 Mar)**: task follows from above, decide if want to use Ex1B - River Flood.ipynb
- [ ] **Cindy, Wouter and Willem (by 18 Mar)**: Incorporate Wouter's wishlist for improvements for exercise 4 and 5 (Workshop 2020/Remarks Exercise 4.txt and Remarks Exercise 5.txt). Confer with Willem re updates to BMI.
- [ ] **Fedor, Fine, Cindy and Anna (by 18 Mar)**: Port all exercises to the cloud (Azure)
- [ ] **All (18 Mar)**: for discussion on Thursday 19 Mar 
	- where to keep instructions for course participants, 
	- update README.md to include instructions for running on platforms?
	- need clean starting point, e.g. press a link and start exercises
	- test speed for Ex6 and adjust resources if needed (that will cost some $$)
- [ ] **All (on 19 Mar)**: Internal workshop to test exercises
- [ ] **All (on 24 Mar)**: test exercises on Wouter, Joost and Edward
- [ ] **All (by 3 Apr)**: Final adjustments and preparations before start of **PAOTM course on 7 Apr**

### Other to do's
- [ ] Confirm this action on Thurssday: arrange laptops for course? ideally not, keep in mind, ICT needs 2 weeks lead time to arrange laptops
- [ ] **Wouter, Frank and Willem**: create an issue in Git to check if tidal constituents can be set through BMI, instead of using mako package (Ex6)
- [ ] **Bjorn**: create an issue on the Git to generate install script for running on VM
- [ ] **Bjorn**: create an issue to check if we can use notebooks.egi.eu

## Dependencies
* Chrome
* Git
* Anaconda (miniconda)

## Installation instructions
To run these notebooks locally on your (Windows) machine we use [Anaconda](https://repo.anaconda.com/archive/Anaconda3-2019.10-Windows-x86_64.exe) to manage our Python 3.7 installation. We will also use pip to install some other libraries.

After installing Anaconda, launch `Anaconda Prompt` and navigate to the directory where you want to keep all the files related to this course.

Then do
```
> git clone https://github.com/openearth/hydrodynamics-course-binder.git
> cd hydrodynamics-course/deploy
> conda env create -f environment.yml
> conda activate course
> cd ..
> jupyter notebook
```

You will also need to have _access to_ and download the latest D-Flow Flexible Mesh model executable from Deltares' build server:
https://build.deltares.nl/viewLog.html?buildTypeId=Delft3DSobek_OssBuilds_BuildFmWin64vs2015if16&buildId=lastSuccessful&tab=artifacts
You should select the zip file starting with `oss_artifacts_x64` e.g. `oss_artifacts_x64_65957.zip`

NB! After downloading _oss_artifacts_x64_65957.zip_, unzip it in `dflowfm_exe`, then navigate to `dflowfm_exe\x64\dflowfm\bin\`
and copy all files in that directory to `dflowfm_exe\x64\share\bin\`.

## Running on the cloud
...

## Directory tree
```
|-README.md
|-LICENSE
|-1. Rivers
	|-Exercises
	|-Models
|-2. Weir
	|-Exercises
	|-Models
|-3. Groyne
	|-Exercises
	|-Models
|-4. Lakes
	|-Exercises
	|-Models
|-5. Channel
	|-Exercises
	|-Models
|-6. Estuary
	|-Exercises
	|-Models
|-dflowfm_exe (this is where the dflowfm executable should be)
|-deploy
	|-Dockerfile
	|-environment.yml
	|-jupyterhub
		|-jupyterhub.service
        |-jupyterhub_config.py
```
