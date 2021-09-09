h = 0.01;
T = 0;
N = 1000;
t = 1:N;
x1 = ones(1,N);
x2 = ones(1,N);
x1(1) = 25;
x2(1) = 25;
x1_star = 50;
alpha1 = 1;
beta1 = 1;
alpha2 = 50;
beta2 = 1;

psi = @(x1)(x1 - x1_star);
u = @(x1,x2)((-(T+1)*psi(x1))/h - alpha1*x1 + beta1*x1*x2);
f1 = @(x1,x2)(alpha1*x1 - beta1*x1*x2);
f2 = @(x1,x2)(-alpha2*x2 + beta2*x1*x2);

for i = 1:N-1
    x1(i+1) = x1(i) + h*f1(x1(i),x2(i)) + h*u(x1(i),x2(i));
    x2(i+1) = x2(i) + h*f2(x1(i),x2(i));
end

plot(t,x1,t,x2); 
legend('Prey','Predator');
