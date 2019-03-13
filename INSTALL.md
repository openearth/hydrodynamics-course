Anaconda and Windows setup python environment 

```
(>conda create -n "paotm" python=3)
(>conda activate paotm)
```

You should now see (paotm) at the start of your command prompt

```
>conda install jupyter 
>conda install matplotlib numpy==1.14.6

(>conda install netcdf4 cython)
(>conda install ipywidgets)
(>pip install pywin32)

```

Get the bmi source source and install 
>pip install bmi-python==0.2.7
```
(>pip install git+https://github.com/openearth/bmi-python.git)
```

* Run test from jupyter notebook

```
>jupyter notebook "Ex1 - River.ipynb"
```


------------------------------------------------------------------------------
Bij opnieuw opstarten:
1. Start via Start menu Anaconda Prompt. 
 
2. Laad dan juiste omgeving:
> conda activate paotm
 
3. Laad de notebook 
(paotm) > jupyter notebook "Ex1 - River.ipynb"
