Anaconda and Windows setup python environment 

```
>conda create -n "paotm" python=3 
>conda activate paotm
```

You should now see (paotm) at the start of your command prompt

```
>conda install jupyter netcdf4 cython 
>pip install pywin32
```

For plotting and signal processing consider adding the following packages: 
>conda install matplotlib
[//](>conda install scipy)
>conda install ipywidgets
>conda install numpy==1.14.6

Get the bmi source source and install 
```
[//](>pip install git+https://github.com/openearth/bmi-python.git)
pip install bmi-python==0.2.7
```

* Run test from jupyter notebook

```
>cd ../tests
>jupyter notebook "Ex1 - River.ipynb"
```


------------------------------------------------------------------------------
Bij opnieuw opstarten:
1. Start via Start menu Anaconda Prompt. 
 
2. Laad dan juiste omgeving:
> conda activate paotm
 
3. Laad de notebook 
(paotm) > jupyter notebook "Ex1 - River.ipynb"
