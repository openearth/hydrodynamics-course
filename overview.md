# Course exercises

Here you can find an overview of the exercises that are part of the course, including the themes that these tests illustrate or treat. The three course days are listed consequtively.

## Day 1: Rivers

  - <b>Ex. 1: Channel flow</b>:
    - 1.1 Equilibirum flow
    - 1.2 Backwater curve
    - 1.3 Flood wave
  
  - <b>Ex. 2: Weir flow</b>:
    - 2.1 Energy loss
    - 2.2 Perfect weir flow
    - 2.3 Drowned weir flow
    
  - <b>Ex. 3: Groyne flow</b>:
    - 3.1 Energy loss
    - 3.2 Flow structure (eddies)
    - (3.3 Grid resolution?)

## Day 2: Lakes and reservoirs

  - <b>Ex. 4: Wind-generated set-up and circulations in a homogeneous lake</b>:
    - 4.1 Wind over lake with uniform depth (2DH) 
    - 4.2 Wind over lake with non-uniform depth (2DH)
    - 4.3 Wind over lake with uniform depth (3D)
    - 4.4 Wind over lake with non-uniform depth (3D)
  
  - <b>Ex. 5: Wind-effects on a stratified lake</b>:
    - 5.1 Baroclinic tilt and vertical  circulations
    - 5.2 Internal flow

## Day 3: Estuaries 
  - <b>Ex. 6: Estuarine hydrodynamics</b>:
    - 6.1 Stratified or mixed?
    - 6.2 Harbor basins
    - 6.3 Classification

# Steerable parameters

Below you can find a table with the variables/parameters that are steerable trough the BMI interface, for the corresponding exercises.

| Exercise number | Exercise name | Steerable parameter (in brackets the variable name) |
| --- | --- | --- |
| <b>1</b>     | <b>Channel flow</b>              | |
|  &nbsp;&nbsp; 1.1   | Equilibrium flow          | Chézy roughness (frcu), inflow discharge Q (zbndq), outflow water level $zeta; (zbndz)|
|  &nbsp;&nbsp; 1.2   | Backwater curve           | idem |
|  &nbsp;&nbsp; 1.3   | Flood wave                | Chézy roughness (frcu), outflow water level &zeta; (zbndz), time series of Q or &zeta; at inflow (from file or steerable?) |
| <b>2</b>     | <b>Weir flow</b>                 |      |  
| &nbsp;&nbsp; 2.1   | Energy loss               | Chézy roughness (frcu), inflow discharge Q (zbndq), outflow water level &zeta; (zbndz) |
| &nbsp;&nbsp; 2.2   | Perfect weir flow         | idem |
| &nbsp;&nbsp; 2.3   | Drowned weir flow         | idem |
| <b>3</b>     | <b>Groyne flow</b>               |      |
| &nbsp;&nbsp; 3.1   | Energy loss               | Chézy roughness (frcu), inflow discharge Q (zbndq), outflow water level &zeta; (zbndz) |
| &nbsp;&nbsp; 3.2   | Flow structure (eddies)   | idem |
| &nbsp;&nbsp; (3.3) | (Grid resolution)         | idem |
| <b>4</b>     | <b>Wind-generated set-up and circulations in a homogeneous lake</b> | |
| &nbsp;&nbsp; 4.1   | Wind over lake with uniform depth (2DH) | Wind x-velocity (wx) |
| &nbsp;&nbsp; 4.2   | Wind over lake with non-uniform depth (2DH) | idem |
| &nbsp;&nbsp; 4.3   | Wind over lake with uniform depth (3D) | idem |
| &nbsp;&nbsp; 4.4   | Wind over lake with non-uniform depth (3D) | idem |
| <b>5</b>     | <b>Wind-effects on a stratified lake</b> | |
| &nbsp;&nbsp; 5.1   | Baroclinic tilt and vertical  circulations | Wind x-velocity (wx) |
| &nbsp;&nbsp; 5.2   | Internal flow                              | idem |
| <b>6</b>     | <b>Estuarine hydrodynamics</b> | |
| &nbsp;&nbsp; 6.1   | Stratified or mixed? | Chézy roughness (frcu), inflow discharge Q (zbndq), M2 tidal amplitude (par_M2), S2 tidal amplitude (par_S2) |
| &nbsp;&nbsp; 6.2   | Harbor basins  | idem |
| &nbsp;&nbsp; 6.3   | Classification | idem |


# Figures / plots

Below you can find a table with the plots that are generated for the corresponding exercises.<br/>

The variable names used are as follows:<br/>

&nbsp;&nbsp; s1=water level [m], <br/>
&nbsp;&nbsp; b=bed level [m],<br/>
&nbsp;&nbsp; h = water depth [m],<br/>
&nbsp;&nbsp; ucx = u-velocity [m/s],<br/>
&nbsp;&nbsp; ucx_top = u-velocity in top layer (3D model) [m/s],<br/>
&nbsp;&nbsp; |u| = velocity magnitude (&radic;(ucx²+vcx²)) [m/s],<br/>
&nbsp;&nbsp; eh = energy head [m],<br/>
&nbsp;&nbsp; Fr = Froude number [-],<br/>
&nbsp;&nbsp; sal = salinity [ppt],<br/>
&nbsp;&nbsp; tem = temperature [° Celcius],<br/>
&nbsp;&nbsp; zws = grid layer z-positions [m], </br>


| Exercise number | Exercise name | Plot description (type, subplots, variables, options) | 
| --- | --- | --- |
| <b>1</b>     | <b>Channel flow</b>              | Plot with 3 vertical subplots (3,1). Subplot 1 (top): (x,s1)- and (x,b)-line. Subplot 2 (middle): (x,h)-line. Subplot 3 (bottom): (x,ucx)-line. Only bottom plot has the xlabel "Distance [m]"     |
| <b>2</b>     | <b>Weir flow</b>                 | Plot with 2 vertical subplots (2,1). Subplot 1 (top): (x,s1)-, (x,b)- and (x,Eh)-line. Subplot 2 (middle): (x,Fr)-line. Only bottom plot has the xlabel "Distance [m]". An additional line was included in both subplots to indicate the position of the weir.  |  
| <b>3</b>     | <b>Groyne flow</b>               | Plot with 1 subplot (1,1). Subplot 1: (x,y,|u|)-contour and a (ucx,ucy)-quiver. An additional line was included in both subplots to indicate the position of the weir.      |
| <b>4</b>     | <b>Wind-generated set-up and circulations in a homogeneous lake</b> | |
| &nbsp;&nbsp; 4.1  | Wind over lake with uniform depth (2DH) | Plot with 2 horizontal subplots (1,2). Subplot 1 (left): (x,y,ucx)-contour. Subplot 2 (right): (x,y,s1)-contour. Note1: the function grid2matrix together with parameters (indx,indy) are used to sort the grid to ascending (x,y) indicdes. Note2: The ylabel is switched off for the right subplot. Note3: The position of subplot 2 is specified relative to the position of subplot 1. Note4: 2 separate colourbars. |
| &nbsp;&nbsp; 4.2   | Wind over lake with non-uniform depth (2DH) | idem |
| &nbsp;&nbsp; 4.3   | Wind over lake with uniform depth (3D) | Plot with 4 subplots (2,2). Subplot 1 (top left): (x,y,ucx_top)-contour. Subplot 2 (top right): (x,y,s1)-contour. Subplot 3 (bottom left): (x_slice, zws, slice_ucx) contour plot. Subplot 4 (bottom right): (slice_ucx[lx/2], zws[lx/2]) line plot of velocity profile. Note1: the function grid2matrix together with parameters (indx,indy) are used to sort the grid to ascending (x,y) indicdes, with SPECIAL TREATMENT of the z-dimension. Also an additional loop in function UPDATE_DATA taking into account the 3rd dimension. Note2: The ylabel is switched off for the right subplot. Note3: The position of subplot 2 is specified relative to the position of subplot 1. Note4: 2 separate colourbars. |
| &nbsp;&nbsp; 4.4   | Wind over lake with non-uniform depth (3D) | idem, with an additional slice line in subplots (1,1) and (2,1), i.e. top left and bottom left. |
| <b>5</b>     | <b>Wind-effects on a stratified lake</b> | Plot with 6 subplots (3,2). Subplot 1 spans both columns (top row): (x,zws,sal). Subplot 2 spans both colums (middle row): (t,s1)-plot (dots, no line). Subplot 3 (bottom left): (sal,z)-line. Subplot 4 (bottom right): (ucx,z)-line.    |
| <b>6</b>     | <b>Estuarine hydrodynamics</b> |    |
