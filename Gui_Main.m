function varargout = Gui_Main(varargin)
% GUI_MAIN MATLAB code for Gui_Main.fig
%      GUI_MAIN, by itself, creates a new GUI_MAIN or raises the existing
%      singleton*.
%
%      H = GUI_MAIN returns the handle to a new GUI_MAIN or the handle to
%      the existing singleton*.
%
%      GUI_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MAIN.M with the given input arguments.
%
%      GUI_MAIN('Property','Value',...) creates a new GUI_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_Main

% Last Modified by GUIDE v2.5 07-Dec-2016 14:30:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gui_Main is made visible.
function Gui_Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_Main (see VARARGIN)

% Choose default command line output for Gui_Main
handles.output = hObject;
import_all
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Bio con push button
clf
import_all
% [file path] = uigetfile('.xlsx','C:\Users\Public\Documents\New folder'); 
% data = xlsread([path '/' file],'B1:C51');
% handles.data = data;
Bicon_raw_data
BoiCon_Liklihood_Indicator
 Analysis = uicontrol('Style', 'pushbutton', 'String', 'Analyze the data here','Position', [420 10 150 20],...
        'Callback', 'BoiCon_Calculation');
    Main_page =uicontrol('Style', 'pushbutton', 'String', 'Main Menu',...
        'Position', [820 10 150 20],...
        'Callback', 'button_testing');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% Net Leak push button
clf
import_all
 Flow_Anomalies = uicontrol('Style', 'pushbutton', 'String', 'Flow Anomalies','FontUnits','inches','FontSize',0.4,'Position', [620 550 450 150],...
                'Callback', '');  
     Sensor_Anomalies = uicontrol('Style', 'pushbutton', 'String', 'Sensor Anomalies ','FontUnits','inches','FontSize',0.4,'Position', [620 300 450 150],...
                'Callback', 'Sensor_anomalies');  
  
  
