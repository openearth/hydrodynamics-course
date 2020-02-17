# hydrodynamics-course-binder

This is the repository for exercises for the hydrodynamics course.

## To do's
* Ex1B - River Flood.ipynb :: working but exercise description needs to be completed
* Ex5A & 5B :: not tested yet, missing model config files
* Ex6 - Estuary.ipynb :: not finished testing, some paths in last cell of notebook not correct
* update environment.yml with `pip install mako`


## Installation instructions
To run these notebooks locally on your (Windows) machine we use [Anaconda](https://repo.anaconda.com/archive/Anaconda3-2019.10-Windows-x86_64.exe) to manage our Python 3.7 installation. We will also use pip to install some other libraries.

After installing Anaconda, launch `Anaconda Prompt` and navigate to the directory where you want to keep all the files related to this course.

Then do
```
> git clone https://github.com/openearth/hydrodynamics-course-binder.git
> conda env create -f environment.yml 
> conda activate paotm-2020
> jupyter notebook
```

You will also need to have access to and download the latest D-Flow Flexible Mesh model from Deltares' build server:
https://build.deltares.nl/repository/download/Delft3DSobek_OssBuilds_BuildFmWin64vs2015if16/1264528:id/oss_artifacts_x64_65957.zip   

NB! After unzipping oss_artifacts_x64_65957.zip, navigate to `dflowfm\bin\` and copy all files in that directory to `\share\bin\`.

## Running on the cloud
...

## Directory tree
```
|-environment.yml 
|-README.md
|-LICENS
|-Workshop 2019 (all the files from 2019)
|-Workshop 2020
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
```
