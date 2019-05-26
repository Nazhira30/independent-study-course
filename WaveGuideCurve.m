clc
clear all

n1 = input('Indeks bias kelongsong (n1): ');
n2 = input('Indeks bias inti (n2): ');
d = input('Lebar inti (d): ');
lambda = input('Panjang gelombang: ');

V = sqrt((n2.^2 - n1.^2)*(pi*d/lambda).^2);

u = 0:0.01:V+0.01;
v = sqrt(V.^2 - u.^2);
figure
plot(u,v); hold on;
ezplot('u.*tan(u)'); hold on;
ezplot('-u.*cot(u)');
title('Graphic Solution');
xlabel('u');
ylabel('v');
xlim([0 V]);
ylim([0 V]);
grid on;