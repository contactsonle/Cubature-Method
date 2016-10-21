function y = V1(y0,t)
y(1) = y0(1)*exp(t*sqrt(y0(2)));
y(2) = y0(2);
y(3) = y0(3);
end