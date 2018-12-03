% Set Paths
addpath(genpath('/home/kg314/Documents/MATLAB/fileexchange'));

addpath('/home/kg314/Documents/phd_thesis');
addpath(genpath_safe('/home/kg314/Documents/MATLAB/sundialsTB'));
addpath(genpath_safe('/home/kg314/Documents/MATLAB/casadi-linux-matlabR2014b-v3.4.2'));
addpath(genpath_safe('/home/kg314/Documents/MATLAB/SPM_thesis'));
% addpath(genpath_safe('/home/kg314/Documents/MATLAB/ML_PP2D_model_trial/'));
% addpath(genpath_safe('/home/kg314/Documents/MATLAB/LIONSIMBA_const_diffCond_zerothermalmodel'));
addpath(genpath_safe('/home/kg314/Documents/MATLAB/zerothermal_LIONSIMBA_Imperial_Internal'));

set(0,'defaultfigurecolor',[1 1 1]);
set(0,'defaultaxesfontsize',12,'defaultaxeslinewidth',1.5,'defaultlinelinewidth',2,'defaultpatchlinewidth',2);
set(0,'DefaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
% set(0,'DefaultFigureWindowStyle','docked');
set(0,'DefaultFigureWindowStyle','normal');
