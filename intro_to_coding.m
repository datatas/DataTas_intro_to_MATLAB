% STUCK? HERE'S HOW TO FIND HELP
% 1) The first port of call is always Google. type "matlab + [what you want to do, or the name of the error]" 
% into Google, and the first results will probably be a page of the Mathworks website: 
% https://au.mathworks.com/help/matlab/, or a helpful post on Stack Exchange.
% 2) In MATLAB itself: type "help + [name of command]" into the command
% window, and the documentation will appear. If you don't know the name of
% the command, just guess. They usually have reasonable names. 

%% DATA TYPES: Integers
% single values useful for e.g. defining constants in an equation
a = 5;           % a semicolon tells MATLAB not to print output to the command line.
b = 7;
c = a*b;

c   % we want to know what c is, so we leave off the semicolon and it is output in the command window


%% Strings
% for storing information as words or characters

name = "Lisa";                 % quotation marks tell MATLAB to store as characters
language = "MATLAB";

disp(strcat(name, " loves using ", language))   % our message is displayed in the command window

%% Vectors
% a one-dimensional array of values. Only one index number is needed to identify a
% specific value

fibonacci = [1 1 3 5 8 13 21 34 55 89 144 233 377];   %square brackets denote an array
fifth = fibonacci(5);    % we can specify one value using its index (indexing starts at 1!!)
last = fibonacci(end);   %"end" stands in for the index of the final entry

plot(fibonacci)         %this gives a basic plot of values against their index.

%we can also create evenly spaced vectors
q = linspace(1, 10, 10)      % remember indexing starts at 1!


%% Matrices
% An array with multiple dimensions. To find a value, we need an index with
% multiple components to point to its location.

matrix = [1 2 3; 4 5 6; 7 8 9]; % you can think of this as three vectors, separated by semicolons.
matrix % take a look at the matrix in the command window
row2col3 = matrix(2,3)      % now the index has two components: row and column
row1 = matrix(1,:);
col2 = matrix(:,2);     % a colon takes all values in that row or column

% we can also create a matrix which is all ones, or all zeros
matzero = zeros(3,3)
matone = ones(3,3)

%% let's add another dimension to our matrix!
tens = matrix*10;    %it's really easy to apply an operation to every value in a matrix.
matrix(:,:,2) = tens;  % our index now has three components. We are adding to the third dimension of our matrix.

n = matrix(1,1,2);

spy(matrix)    %this plots the "sparsity" of the matrix, showing every point where there is a nonzero value.
matrix(1,2,1) = 0; % we can set one of our values to zero
spy(matrix)       % now we can see there is a  gap in our matrix.


%% manipulating matrices

% we can stick matrices together to make bigger ones by concatenating
a = [1 2 3];
b = [3 2 1];
c = vertcat(a,b)
d = horzcat(a,b)

a = a';    % a single quote transposes our matrix
a

c = vertcat(a,b);  %now we can't do this!

% adding and multiplying
a = a';
times = a*b;  % why doesn't this work?
times = a.*b;  % if we want to multiply element-wise, we need to use ".*"

plus = a + b;  % there is no such problem with adding matrices.

%% Cell arrays
% for storing multiple types of data together

cell = {name, matrix, fibonacci};

%% Tables
% for storing information organised in columns or tables, e.g. imported
% from a spreadsheet. Very useful for scientists!

% here are some values corresponding to different timtam types.
type = {'original'; 'double coat'; 'chewy caramel'; 'white choc'; 'dark choc'}; % these are strings, so are entered as a cell
weight_g = [19; 22; 19; 18; 18];   % these are integers, so are entered as an array
calories = [98; 117; 96; 98; 95];
price_per_biscuit = [0.3636; 0.4444; 0.4444; 0.4444; 0.3636];

timtams = table(type, weight_g, calories, price_per_biscuit);  % now we have a nice table with all of our values.

mean_weight = mean(timtams.weight_g);  % we can perform operations on one column of the table

%% Those are some of the key data types. Let's celebrate!
load handel
sound(y, Fs)

%% Loops
% Note: because MATLAB is optimised for arrays, loops are not the most efficient way to work with large datasets. 
% If you can replace a loop with an operation performed on an array, do!

% we can use a for loop to generate a certain number of values in the fibonacci sequence.
fibonacci = [1 1];  % let's just give it the first two entries to start with
for i = 1:15        % this is the number of iterations we want the loop to do. Let's go up to 15.
    new = fibonacci(end) + fibonacci(end-1);   %for each iteration, we will generate a new entry from the last two
    fibonacci = [fibonacci new];  % and then stick it onto the end of our sequence.
end                               % don't forget to tell it to stop!

% alternatively, we can generate the sequence up to a certain value using a while loop
fibonacci = [1 1];
n = 3;     % we already have two entries, so will start with the third
while fibonacci(end) < 1000    % we tell MATLAB to only follow these instructions while teh last value is less than 1000
    fibonacci(n) = fibonacci(n-1) + fibonacci(n-2);  
    n = n+1;  % after each iteration of the loop, we increase n to move to the next entry.
end

%% Functions
%functions are very useful if you want to perform an operation over and
%over again. They can make your code much neater!

%let's create a function in a separate file, and store it somewhere in the
%MATLAB path.

timesten(fibonacci)
linear = linspace(1, 10, 10);
timesten(linear)

%% other handy stuff

% commands you will end up using a lot:
clear   % clears everything from the workspace. Make sure you save anything that you need before doing this!
clc  %clears the command window
cd path % to change your current directory (if no path specified, it will go to your home directory)
ls % for a list of all files in your current directory
edit filename % opens a script in the editor window
whos % lists all variables in the workspace (useful if you are not using the MATLAB GUI)
save filename % saves the current workspace as a .mat file
figure  % opens a blank figure window which you can then plot onto
close all % closes all currently open figure wondows

% if you are a purist, or are using a system without a GUI interface (e.g a
% supercomputer), you can use MATLAB in the command line using:
% >> matlab -nodesktop -nosplash

%% you can specify default settings in your startup.m file 
% stored in your default MATLAB directory

% e.g. mine contains:
addpath % for all of the data directories I commonly use
cd % to the directory I most commonly start work in
set(groot, 'defaultFigureColor', [1 1 1]);  % changing the  default background colour of figures to white
set(groot, 'defaultTextInterpreter', 'latex'); % and the text interpreter to read LaTeX code for beautiful text!
% you can change the plotting defaults so that every figure you plot looks good straight away.

%% There are plenty of external packages you can load into MATLAB.

% "cmocean" is a toolbox with slick colormaps from oceanography, much
% nicer than that ones that come with MATLAB:
% https://au.mathworks.com/matlabcentral/fileexchange/57773-cmocean-perceptually-uniform-colormaps

% "m-code" will format your MATLAB codes to be pasted straight into a LaTeX
% document, colours and all: https://au.mathworks.com/matlabcentral/fileexchange/8015-m-code-latex-package

% check out the Matlab file exchange for user-contributed packages to do
% almost anything you can imagine: https://au.mathworks.com/matlabcentral/fileexchange/

%% if you are trying to decrease runtime, 
% you can time how long sections of your code are taking using "tic" and "toc":

% e.g. compare this for loop:
tic
t = 0;
for i = 0:20
    t = t + 1;
    y(t) = sin(i);
end
toc
plot(y)


%% to this vectorised equivalent:
tic
i = linspace(0,20,21);
y = sin(i);
toc
plot(y)
% wow, so fast!!

%% you can tell MATLAB to email you when your code is finished running:
sendmail('myemail@utas.edu.au', 'your results are ready!')
% this requires some setup. see https://au.mathworks.com/help/matlab/ref/sendmail.html

%% bored?

xpbombs
fifteen

    