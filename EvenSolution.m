clc
clear all

n1 = input('Indeks bias kelongsong (n1): ');
n2 = input('Indeks bias inti (n2): ');
d = input('Lebar inti (d): ');
lambda = input('Panjang gelombang: ');

V = sqrt((n2.^2 - n1.^2)*(pi*d/lambda).^2);

f = @(u) sqrt(V.^2 - u.^2) - u.*tan(u);

eps = 1e-6;
disp('Masukkan interval nilai tebakan.');
a = input('Batas bawah: ');
b = input('Batas atas: ');
FA = f(a);
FB = f(b);
while FA * FB > 0
    disp('Tebakan awal tidak valid.');
    break;
end
while abs(b - a) > 1e-06
    c = (a + b)/2;
    FC = f(c);
    while abs(FC) < 1e-10
        akar = c;
        break;
    end;
    if FA * FC < 0
        b = c;
        FB = FC;
    else
        a = c;
        FA = FC;
    end
    while abs(b - a) < eps
        akar = c;
        break;
    end
end

beta = sqrt((2*pi*n2/lambda).^2 - (2*akar/lambda).^2);
neff = beta*lambda/(2*pi);

disp('Indeks bias efektif (neff): ');
disp(neff);

u = akar;
v = sqrt(V.^2 - u.^2);

C = 1;
B = C*exp(-v)*(d + 2*v)/(d*cos(u) + 2*u*sin(u));

x1 = -1000:0.01:-d/2;
x2 = -d/2:0.01:d/2;
x3 = d/2:0.01:1000;
y1 = C*exp(2*v*x1/d);
y2 = B*cos(2*u*x2/d);
y3 = C*exp(-2*v*x3/d);

figure
title('Even Solution');
xlabel('x (nm)');
ylabel('E(x)');
xlim([-1000 1000])
plot(x1, y1); hold on;
plot(x2, y2); hold on;
plot(x3, y3);
grid on;