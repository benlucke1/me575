clear, clc, close all

s = tf('s')

sys = 1/(s^2 + 4*s + 85)
pole(sys)