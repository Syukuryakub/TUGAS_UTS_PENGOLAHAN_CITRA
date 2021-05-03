function varargout = TugasUTS(varargin)
% TUGASUTS MATLAB code for TugasUTS.fig
%      TUGASUTS, by itself, creates a new TUGASUTS or raises the existing
%      singleton*.
%
%      H = TUGASUTS returns the handle to a new TUGASUTS or the handle to
%      the existing singleton*.
%
%      TUGASUTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASUTS.M with the given input arguments.
%
%      TUGASUTS('Property','Value',...) creates a new TUGASUTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasUTS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasUTS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasUTS

% Last Modified by GUIDE v2.5 02-May-2021 14:32:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasUTS_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasUTS_OutputFcn, ...
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


% --- Executes just before TugasUTS is made visible.
function TugasUTS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasUTS (see VARARGIN)

% Choose default command line output for TugasUTS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasUTS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasUTS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]= uigetfile({'*.png','*.jpg'});
citra1 = imread([pathname,filename]);

%Menampilkan di axes 1,2,3,4 dan histogram di axes 5,6,7
axes(handles.axes1);
imshow(citra1);

R =citra1(:,:,1);
G =citra1(:,:,2);
B =citra1(:,:,3);

a= zeros(size(citra1,1),size(citra1,2));
redOnly= cat(3,R,a,a);
greenOnly= cat(3,a,G,a);
blueOnly= cat(3,a,a,B);

axes(handles.axes2);imshow(redOnly);
axes(handles.axes3);imshow(greenOnly);
axes(handles.axes4);imshow(blueOnly);
axes(handles.axes5);imhist(R);
axes(handles.axes6);imhist(G);
axes(handles.axes7);imhist(B);
