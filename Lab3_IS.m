function IS_lab_3
n = 0.15;         
C1 = 0.2;        						
C2 = 0.9;
sigma1 = 0.14;
sigma2 = 0.17;  
x = 0.1 : 1/22 : 1;
baseFunction = BaseFunction(x);

w0 = rand(1);
w1 = rand(1);    							 
w2 = rand(1);
b = rand(1);

for i = 1 : 100
    for j = 1 : length(x)
    F1 = GaussianFunction(x(j), C1, sigma1);
    F2 = GaussianFunction(x(j), C2, sigma2);
    v1 = F1 * w1 + F2 * w2 + w0;
    err = BaseFunction(x(j)) - v1; 
    w1 = w1 + n * err * F1;
    w2 = w2 + n * err * F2;
    w0 = w0 + n * err;
    end
end 
    
for j = 1 : length(x) %Neuron function
F1 = GaussianFunction(x(j), C1, sigma1);
F2 = GaussianFunction(x(j), C2, sigma2);
v2 = F1 * w1 + F2 * w2 + w0;
Y(j) = v2;
end
    plot(x, baseFunction, x, Y);
    legend('Base function', 'Neuron function');
end

function y = GaussianFunction(x, c, r)
    y = exp(-(x-c)^2/(2*r^2));
end

function y = BaseFunction(x)
    y = (1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x) / 2;
end