# hydrodynamics-course-binder

This is the repository for exercises for the hydrodynamics course.

In 2020 the course will start on **7 April**

## To do's (and deadlines)
- [x] **Bjorn (by 21 Feb)**: For all Ex, generalise path to model files (dflowfm folder on repo)
- [x] **Bjorn (by 21 Feb)**: Ex5A & 5B :: test, missing model config files could be in cursus_2019\2. Lakes and Reservoirs\2.6. Demos and Exercises\Exercises\day2\models\Channel_new
- [x] **Bjorn (by 21 Feb)**: Ex6 - Estuary.ipynb :: finish testing, fix paths in last cell of notebook which were not correct
- [x] **Frank and Willem (by 21 Feb)**: Ex5A and 5B: check that the correct .mdu files are being used in the notebooks.
- [x] **Frank and Wouter (by 27 Feb)**: Ex4 and 5: check consistency of notebooks and model input. Make wishlist for improvements.
- [x] **Fine and Fedor with Cindy (by 28 Feb)**: remove Workshop 2019 folder and move all folders in Workshop 2020 to same level as README.md, and merge Clean-up-repo branch with master
- [ ] **Fine (by 2 Mar)**: test notebooks on linux
- [ ] **Fine and Fedor (by 3 Mar)**: clone repo to Azure and test Ex1 - Rivers and add work around to get dflowfm executable onto Azure (use Azure / Amazon bucket) and add azure_environment.yml and add to Azure VM
- [ ] **Frank and Willem (by 6 Mar)**: clone clean-up-repo branch, check that all notebooks and model config files are the most recent versions and remove redundant files
- [ ] **Frank and Willem (by 6 Mar)**: decide if want to use Ex1B - River Flood.ipynb
- [ ] **Cindy (by 12 Mar)**: Incorporate Wouter's wishlist for improvements for exercise 4 and 5 (Workshop 2020/Remarks Exercise 4.txt and Remarks Exercise 5.txt).
- [ ] **Wouter (by 13 Mar)**: clone repo and test that notebooks work as expected
- [ ] **Fedor (by 19 Mar)**: set up additional users with different environments on Azure JupyterHub
- [ ] **Fedor, Fine, Cindy and Anna (by 18 Mar)**: Port all exercises to the cloud (Azure)
- [ ] **All (by 18 Mar)**: test connection a few time, stop-start etc see how long it takes - communicate start up time to lecturer
- [ ] **All (18 MAr)**: update README.md to include instructions for running on Azure
- [ ] **All (on 19 Mar)**: Internal workshop to test exercises
- [ ] **All (on 24 Mar)**: Major test exercises on Wouter, Joost and Edward
- [ ] **All (by 3 Apr)**: Final adjustments and preparations before start of **PAOTM course on 7 Apr**

### Other to do's

- [ ] arrange laptops for course?
- [ ] check if tidal constituents can be set through BMI, instead of using mako package (Ex6)
- [ ] generate install script for running on VM
- [ ] **Bjorn**: check if we can use notebooks.egi.eu

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
|-Workshop 2019 (all the files from 2019)
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
