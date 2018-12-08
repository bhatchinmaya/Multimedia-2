x= [0:0.1:10];
t = cos(2*pi*1*x);


figure(1);
plot(x,t);
% for only fft
figure(2);
plot(x,abs(fft(t)))

%for only fftshift 
figure(3);
plot(x,abs(fftshift(t)))

%for both fft and fftshift
figure(4);
plot(x,fftshift(abs(fft(t))))