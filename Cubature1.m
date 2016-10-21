error_cub = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
fin_value =[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

m = [100,200,300,400,500,1000,2000,3000,4000,5000,10000,20000,30000,40000,50000,100000,200000,300000,400000,500000];
T = 1; 
%Declare constants:
miu = 0.05; K = 1.05; alpha = 2; beta = 0.1; theta = 0.09; 

%Monte-Carlo:
mc = 1e4;
for l = 1:20
    n = m(l);
    Y_1_value = zeros(1,mc); Y_2_value = zeros(1,mc); Y_3_value = zeros(1,mc); Payoff_value = zeros(1,mc);
    
    for p = 2:mc
        %Y1, Y2, Y3 arrays:
        Y_1 = zeros(1,n); Y_2 = zeros(1,n); Y_3 = zeros(1,n); Payoff = zeros(1,n);
        
        %Initial condition and calculation:
        Y = zeros(1,3); Y(1,1) = 1; Y(1,2) = 0.09; Y(1,3) = 1;
        Y_1(1,1) = Y(1,1); Y_2(1,1) = Y(1,2); Y_3(1,1) = Y(1,3);
        J = theta - (beta^2/(4*alpha));
        A = miu - (Y(1,2)/2);
        
        for k = 2:n
            flip = randi([0,1]);
            Z1 = randn;
            Z2 = randn;
            if flip == 0
                Y = V0(Y, miu, J, alpha, 1/(2*n));
                Y = V1(Y, Z1 / sqrt(n)) ;
                Y = V2(Y , beta,  Z2 / sqrt(n));
                Y = V0(Y, miu, J, alpha, 1/ (2*n));
            else
                Y = V0(Y, miu, J, alpha, 1/(2*n));
                Y = V2(Y , beta,  Z2 / sqrt(n));
                Y = V1(Y, Z1 / sqrt(n)) ;
                Y = V0(Y, miu, J, alpha, 1/ (2*n));
            end
            Y_1(1,k) = Y(1,1); Y_2(1,k) = Y(1,2); Y_3(1,k)=Y(1,3);
        end
        
        Y_1_value(1,p) = Y_1(1,n);
        Y_2_value(1,p) = Y_2(1,n);
        Y_3_value(1,p) = Y_3(1,n);
    end
    
    fin_value(l) = mean(Y_1_value);
end

plot(fin_value)


        
        
        
        
        
        
        