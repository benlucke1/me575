clear, clc, close all 
t = linspace(0, 5, 1000);
sys = tf([1],[1 4 5]);
resp_analytical = 1/5 - 1/5*exp(-2*t).*cos(t) - 2/5*exp(-2*t).*sin(t);
[mlstep, ts]  = step(sys);
hold on
plot(t,resp_analytical,'k--')
plot(ts,mlstep)
