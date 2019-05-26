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