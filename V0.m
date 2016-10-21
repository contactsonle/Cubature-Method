function y = V0(y0, miu, J, alpha, t)
A = miu - y0(2)/2;
y(1) = y0(1)*exp( (miu-(J/2))*t + ((y0(2)-J)/(2*alpha))*(exp(-alpha*t)-1) );
y(2) = J + (y0(2)-J)*exp(-alpha*t);
y(3) = y0(3) + ( y0(1) * (exp(A*t)-1) ) / A;
end