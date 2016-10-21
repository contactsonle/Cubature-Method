function y = V2(y0,beta,t)
y(1) = y0(1);
y(2) = ((beta*t)/2 + sqrt(y0(2)))^2;
y(3) = y0(3);
end