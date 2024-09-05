%% Theoretical background
%{
% A spline is a mathematical curve or a piecewise-defined function
% Splines are particularly useful for creating smooth and continuous curves 
% that can approximate or interpolate a set of data points.
% One common type of spline is called the "spline with no knots," which 
% is sometimes referred to as a "natural spline" or a 
% "smooth spline". The term "knot" in this context refers to the points 
% where different polynomial functions are 
% joined together to form the spline. In a spline with no knots, the 
% curve is defined as a single 
% polynomial function over the entire interval, and there are no 
% points of discontinuity where different polynomial 
% segments meet.
%}

%% Basic usage of the spline

% Given the following set of data 
x = [-1 1 7 9 19];
y = [4 3 10 10 9];

% Computing the Not-a-Knot spline which interpolates the datas in the
% point log(0.9)
s = spline(x, y, log(0.9));
