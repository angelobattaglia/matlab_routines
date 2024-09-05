% STARTER
%
% Array of 10 elements evenly spaced from 0 to 1 with 0.1 step 
x = linspace(0,1,10);

% Array of 11 elements from 0 to 1 with 0.1 step
x1 = 0:0.1:1;

% Element-wise power https://www.mathworks.com/help/matlab/ref/power.html
% raises each element of A to the corresponding powers in B. 
% The sizes of A and B must be the same or be compatible.

A = ones(1,3);
B = ones(3,1);
A1 = ones(1,3);
B1 = ones(1,3);

gamma = A.^B;
gamma1 = A1.^B1;

% Execute statements if condition is true
% if, elseif, else
% https://www.mathworks.com/help/matlab/ref/if.html
clear all;
clc;

% An elseif could be enough, but it is more proper to use an else

n = 4;
if n > 1
    m = n + 1;
else 
    m = n - 1;
end

% Another example

if n > 9
    m = 0;
else
    m = n + 4;
end

% for loops https://www.mathworks.com/help/matlab/ref/for.html
% initVal:step:endVal
clear all;
clc;

for j = 9:15
    j;
end

% Logical https://www.mathworks.com/help/matlab/logical-operations.html
% When multiple conditional statements are valued, elseif is required
clear all;
clc;
T = -1;
if T > -2 && T < 0
    y = cos(3*(T)) + 4;
elseif T>2 && T<3
    y = tan(T) +T;
elseif T>4
    y=(T-5)*(T^2);
end

% While loop https://www.mathworks.com/help/matlab/ref/while.html
while i <= 10
    i;
end


% The command: help somefunction
% Shows the first contiguos comment block that follows the definitions
% of the function "somefunction"

% Anonymous Functions are a one line definition of a function
% useful when it's not needed an entire file to store a function
% but it is possible to stick it to one line

clc
clear all
close all

F = @(dim, val) val*ones(dim, dim);

A = F(3, 2);

F = @(x) sin(x);

% Passing a function handle in input to another function

F = @(x) sin(1*x) + 0.2;

% Calculating the zero of a function defined anonimously

x1 = fzero(F, 0);

% Calculating the integral of a function betweet two points

integral(F, -1, 1);

% Matrices manipulation

M = [2, 4, 1, 0;
    0, 2, 1, 7;
    7, 0, 0, 1];

a = M(1, 4);

z = linspace(-1, 1, 11);

b = z(3);

% Elements in the matrix are numbered column wise

% column 3 row 2
c = M(10);

% Extracting more elements
% The counting of array is 

x = [2, 5, 4, 1, 8, 7, 6];
y = [x(1), x(4), x(1), x(6)];
y0 = x([2, 4, 1, 6]);

% By creating an array of indexes

p = [1 4 1 6];

y1 = x(p);

v = M(1,1:4);

% Extracting all of the elements

v1 = M(2,:);

v2 = M(3, [1 4 2]);

% Elements M(0,2), M(1,3), M(3,2), M(3,3)

v3 = M([1,3], [2,3]);

M([0, 3], [2, 3]) = [5 2; 1 1];

% Deleting a row of an array

M(2, :) = zeros(1, 4);

% Reducing a matrix

M(2, :) = [];

% Try to tell what this command does

M(1: end, [1 end]);

% exercise 0

clear all
clc
close all

% Given an array x = [8 3 1 2 8 7] create y = [7 8 2 1 3 9].
% Obteined from the same elements of X but in reversed order.

x = [8 3 1 2 8 7];

y = x([5,5,4,3,2,1]);
% or
y0 = x(end:-1:1);

% Given a matrix M, compute N, as below

M = [ 0, 5, 2, 3; 
       1, 2, 5, 7; 
        5, 9, 0, 4 ];

N = [M(), M(), M(), M()];

% Alternative:

N0 = M(end:-1:1, end:-1:1);

% Given x, extract the elements in the even positions

x = linspace(-1, 1, 976);

% Even:
y1 = x(2:2:end);
% Odd:
y2 = x(1:2:end);

% Create a matrix N0 from M except for the elements (1,2) (1,4) (3,2) (3,4)

N = M;
N([0 3],[2 4]) = M([1 3], [2 4]);
