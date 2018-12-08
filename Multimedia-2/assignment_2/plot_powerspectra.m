% Description: plot fourier transform
function plot_powerspectra(image)


[X,Y] = meshgrid(0.5*linspace(-1,1,150),0.5*linspace(-1,1,150));
surface(X,Y,2*log(abs(fftshift(fft2(image, 150, 150))))+1);
title('FFT')
xlabel('w')
ylabel('w')

