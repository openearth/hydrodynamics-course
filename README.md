# hydrodynamics-course-binder

This is the repository for exercises for the PAOTM hydrodynamics course.

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
