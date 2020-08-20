FROM continuumio/anaconda3
MAINTAINER Fedor Baart <fedor.baart@deltares.nl>
# install node for the  proxy
RUN apt-get install -yq --no-install-recommends \
        nodejs \
        ca-certificates \
        curl \
        gnupg \
        npm \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
RUN npm install -g configurable-http-proxy@^4.2.0 \
        && rm -rf ~/.npm
WORKDIR /root
RUN conda update -n base -c defaults conda
# Create course environment
COPY environment.yml .
RUN conda env create -f environment.yml

# By  default activate  he  course environment
RUN echo "source activate course" > ~/.bashrc
ENV PATH /opt/conda/envs/course/bin:$PATH
ENV CONDA_DEFAULT_ENV course

# Create default python environment
RUN /opt/conda/envs/course/bin/python -m ipykernel install --name 'python' --display-name "Python (default)"
RUN mkdir -p /srv/jupyterhub
RUN openssl rand -hex 32 > /srv/jupyterhub/jupyterhub_cookie_secret && chmod 600 /srv/jupyterhub/jupyterhub_cookie_secret


# add the rhea user, who will run the server
# she needs to be in the shadow group in order to access the PAM service
RUN useradd -m -G shadow -p $(openssl passwd -1 rhea_admin_password) rhea

# Give rhea passwordless sudo access to run the sudospawner mediator on behalf of users:
ADD sudoers /tmp/sudoers
RUN cat /tmp/sudoers >> /etc/sudoers
RUN rm /tmp/sudoers

# Create default notebooks
COPY notebooks /etc/skel/notebooks

# Use external home directory for  persistency
VOLUME /home

# add some regular users
RUN for i in $(seq 0 5);do name=user$i; useradd -m -p $(openssl passwd -1 user$i) $name; done

# make home directories private
RUN chmod o-rwx /home/*

# Create volumes for external data and models
# Share datasets from here
VOLUME /data

# Share and extract model code from here
ADD /models/dimrset_lnx64_370.tar.gz /models

# Configure jupyterhub
ADD jupyterhub /etc/jupyterhub

# Export model file path to memory
ENV LD_LIBRARY_PATH=/models/lnx64/lib

# Start the container in the course  environment
CMD ["jupyterhub", "-f", "/etc/jupyterhub/jupyterhub_config.py"]
