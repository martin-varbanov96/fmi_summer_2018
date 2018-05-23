sin(0)


hold on;
description = '\Pi';
x = -10:0.1:10;
plot (x, sin (x), "*");
plot (x, cos (x), "m");
legend("sin_star", description)
hold off;

t = 0:0.1:6.3;
plot (t, cos(t), "asdasda", t, sin(t), "-b;sin(t);");


x=linspace(0,50,4);
subplot(2,1,1);
plot(x,x.^2);
subplot(2,1,2);
plot(x,x.^4);

x=linspace(0,50,4);
subplot(1,2,1);
plot(x,x.^2);
subplot(1,2,2);
plot(x,x.^4);



#####################
x1 = (randn(n,1)*5)+100;
x2 = 5 + ramd(n,1)*(15-5);
merged_sample = x2.^2./x1;
hist(merged_sample,200)
###################
#normal distr
normal_sample = []
for i=1:1000
  normal_sample = horzcat(normal_sample, [normrnd(100,5)]) 
endfor
normal_sample_std = std(normal_sample) 
hist(normal_sample,200)

# uniform distr
n = 1000;
x2 = 5 + rand(n,1)*(15-5);
uniform_distr = x2;
hist(uniform_distr, 10)
uniform_distr_mean = mean(uniform_distr)
uniform_distr_std = std(uniform_distr)

#merged sample
merged_sample = vertcat(normal_sample, uniform_distr)

subplot(2,2,1)
hist(normal_sample,10)
subplot(2,2,3)
hist(uniform_distr, 10)
subplot(2,2,2)
qqplot(merged_sample)
subplot(2,2,4)
text (pi, 0.7, "arbitrary text");


##################################################
t = 0:1000;
r = 0.01*t;
x = r.*cos(2*pi*t/100);
y = r.*sin(2*pi*t/100);
z=0.1*t;
%subplot(1,2,1);
plot3(x,y,z,'k', 'LineWidth', 2)
xlabel('x')
ylabel('y')

figure(2)

t = 0:1000;
r = 0.1*t;
x = r.*cos(2*pi*t/100);
y = r.*sin(2*pi*t/100);
z=0.1*t;
%subplot(1,2,2);
plot3(x,y,z,'k', 'LineWidth', 2)
xlabel('x')
ylabel('y')
##################################################





##################################################
t = 0:1000;
r = 0.01*t;
x = r.*cos(2*pi*t/100);
y = r.*sin(2*pi*t/100);
z=0.1*t;
subplot(1,2,1);
plot3(x,y,z,'k', 'LineWidth', 2)
xlabel('x')
ylabel('y')

t = 0:1000;
r = 0.1*t;
x = r.*cos(2*pi*t/100);
y = r.*sin(2*pi*t/100);
z=0.1*t;
subplot(1,2,2);
plot3(x,y,z,'k', 'LineWidth', 2)
axis ([0, 20, 0, 50], "square");
xlabel('x')
ylabel('y')

##################################################





##################################################
w = 1000;
x1 =(randn(n, 1)*5)+100
##################################################


