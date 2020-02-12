# Course exercises

Here you can find an overview of the exercises that are part of the course, including the themes that these tests illustrate or treat. The three course days are listed consequtively.

## Day 1: Rivers

  - Ex. 1: Channel flow:
    - 1.1 Equilibirum flow
    - 1.2 Backwater curve
    - 1.3 Flood wave
  
  - Ex. 2: Weir flow:
    - 2.1 Energy loss
    - 2.2 Perfect weir flow
    - 2.3 Drowned weir flow
    
  - Ex. 3: Groyne flow:
    - 3.1 Energy loss
    - 3.2 Flow structure (eddies)
    - (3.3 Grid resolution?)

## Day 2: Lakes and reservoirs

  - Ex. 4: Wind-generated set-up and circulations in a homogeneous lake
    - 4.1 Wind over lake with uniform depth (2DH) 
    - 4.2 Wind over lake with non-uniform depth (2DH)
    - 4.3 Wind over lake with uniform depth (3D)
    - 4.4 Wind over lake with non-uniform depth (3D)
  
  - Ex. 5: Wind-effects on a stratified lake
    - 5.1 Baroclinic tilt and vertical  circulations
    - 5.2 Internal flow

## Day 3: Estuaries 
  - Ex. 6: Estuarine hydrodynamics:
    - 6.1 Stratified or mixed?
    - 6.2 Harbor basins
    - 6.3 Classification

# Steerable parameters

Below you can find a table with the variables/parameters that are steerable trough the BMI interface, for the corresponding exercise.

| Exercise number | Exercise name | Steerable parameter (in brackets the variable name) |
| --- | --- | --- |
| 1     | Channel flow              | |
| 1.1   | Equilibrium flow          | Chézy roughness (frcu), inflow discharge Q (zbndq), outflow water level $zeta; (zbndz)|
| 1.2   | Backwater curve           | idem |
| 1.3   | Flood wave                | Chézy roughness (frcu), outflow water level &zeta; (zbndz), time series of Q or &zeta; at inflow (from file or steerable?) |
| 2     | Weir flow                 |      |  
| 2.1   | Energy loss               | Chézy roughness (frcu), inflow discharge Q (zbndq), outflow water level &zeta; (zbndz) |
| 2.2   | Perfect weir flow         | idem |
| 2.3   | Drowned weir flow         | idem |
| 3     | Groyne flow               |      |
| 3.1   | Energy loss               | idem |
| 3.2   | Flow structure (eddies)   | idem |
| (3.3) | (Grid resolution)         | idem |
| 4     | Wind-generated set-up and circulations in a homogeneous lake | |
| 4.1   | Wind over lake with uniform depth (2DH) | Wind x-velocity (wx) |
| 4.2   | Wind over lake with non-uniform depth (2DH) | idem |
| 4.3   | Wind over lake with uniform depth (3D) | idem |
| 4.4   | Wind over lake with non-uniform depth (3D) | idem |
| 5     | Wind-effects on a stratified lake | |
| 5.1   | Baroclinic tilt and vertical  circulations | Wind x-velocity (wx) |
| 5.2   | Internal flow                              | idem |
| 6     | Estuarine hydrodynamics | |
| 6.1   | Stratified or mixed? | Chézy roughness (frcu), inflow discharge Q (zbndq), M2 tidal amplitude (par_M2), S2 tidal amplitude (par_S2) |
| 6.2   | Harbor basins  | idem |
| 6.3   | Classification | idem |
