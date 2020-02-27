clc;
close all;
warning off all;
format long;

% Set type of boundary specification
bndup    = 1;
bnddown  = 0;

% Input parameters
L        = 90000                  ;
Q        =  1000                  ;
B        =   250                  ;
C        =    50                  ;
deltab   =     9                  ;
ib       = deltab./L              ;
deq      = (Q/B/C/sqrt(ib)).^(2/3);

% Read the output
hsim     = nc_varget('dflowfmoutput/waal_schematic_map.nc','s1'          );
xf       = nc_varget('dflowfmoutput/waal_schematic_map.nc','FlowElem_xcc');
yf       = nc_varget('dflowfmoutput/waal_schematic_map.nc','FlowElem_ycc');
nodx     = nc_varget('dflowfmoutput/waal_schematic_map.nc','NetNode_x'   );
nody     = nc_varget('dflowfmoutput/waal_schematic_map.nc','NetNode_y'   );
nodz     = nc_varget('dflowfmoutput/waal_schematic_map.nc','NetNode_z'   );
fecx     = nc_varget('dflowfmoutput/waal_schematic_map.nc','FlowElemContour_x');
fecy     = nc_varget('dflowfmoutput/waal_schematic_map.nc','FlowElemContour_y');

% Find lowest bed level related to each flow-element
for i=1:size(fecx,1);
    for j=1:size(fecy,2);
        xg     = fecx(i,j);
        yg     = fecy(i,j);
        if isnan(xg)==0 & isnan(yg)==0;
            idx       = find(nodx==xg & nody==yg);
            bed(j)    = nodz(idx);
        else
            bed(j)    = 1e9;
        end
    end
    zf(i)      = min(bed(:));
    %xf(i)      = xg;
    clear bed;
end

% Compute water depth
hsim     =  hsim(end,:);
df       =  hsim - zf;
de       =  deq.*ones(1,length(df));

% Compute rms difference
ddiff    = sqrt(mean((df - deq).^2));          % compute rms-difference anal/sim
display(['Result for rms-difference:']);
display(['  rms-difference  = ',num2str(ddiff,'%1.5e')]);

figure(1)
plot(xf,df)
xlabel('Distance along channel in (m)')
ylabel('Water depth in (m)')