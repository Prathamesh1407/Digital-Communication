pkg load statistics
x=-5:0.1:5;  % Create an array of x-values from -5 to 5 with a step of 0.5.
y=normpdf(x,2,1);

#x is the point(s) at which you want to evaluate the PDF. It can be a single value or an array of values.
#mu is the mean (average) of the normal distribution.
#sigma is the standard deviation of the normal distribution.
#The normpdf function returns the probability density at the specified value(s) x.

subplot(1,3,1); #(r,c,spec index)
plot(x,y,"linewidth",1.5);
#'linewidth' property controls the thickness of the lines in the plot.

axis([-5 7 0 1]);
title("mean: 2,std dev: 1");


y=normpdf(x,0,0.5);
subplot(1,3,2);
plot(x,y,"linewidth",1.5);
axis([-5 7 0 1]);
title("mean: 0,std dev:0.5");


y=normpdf(x,1,1);
subplot(1,3,3);
plot(x,y,"linewidth",1.5);
axis([-5 6 0 1]);
title("mean: 1, std dev : 1");


