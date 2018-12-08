close all, clc; clear all;


image = [   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];

% compute the (outer) contour image
% YOUR TURN:

contour_image = imdilate(image, ones(3,3)) - image;
[contour_x, contour_y] = find(contour_image);
%contur_image=  bwtraceboundary(image, [x y],'W');% YOUR TURN

% compute contour signals m(p), n(p)
[m,n] = getContourSignals(contour_image, contour_x(1), contour_y(1)); % YOUR TURN


% plot contour
figure(1);
subplot(1,3,1)
plot_m(m);
subplot(1,3,2)
plot_n(n);
subplot(1,3,3)
plot([m' m(1)], [n' n(1)], 'LineWidth',3)
pause;

% complex contour description
t = m + 1i*n;% YOUR TURN



% dft of the complex contour description
% HINT: fftshift rearrange the fft output, so that the zero-frequency 
%       component becomes the center of the vector.
%       
%       Wo perform the fftshift to simplify the lowpass-filtering, that will 
%       be executed in line81 
Y= fftshift(fft(t));% YOUR TURN


% plot amplitude and phase
figure(2);
subplot(1,2,1)
plot_dft_amplitude(Y)
subplot(1,2,2)
plot_dft_phase(Y)
pause


figure(3)    
% plot contour signal for different lowpass filters
% vary cutoff frequency (fg) of lowpass and display resulting contour
for fg= [numel(Y)/2:-1:0]/numel(Y)
    
    % lowpass filtering of spectrum Y
     Y_low = lowpass(Y,fg);% YOUR TURN
    
    % inverse dft : reconstruction of contour signal
    % HINT: first we have to undo the fftshift (cp. ln. 60) 
    t2=  ifft(ifftshift(Y_low));
    % YOUR TURN
    
    
    % plot spectra of original and lowpass filtered DFT
    subplot(1,5,1)  
    hold off
    newplot
    plot_dft_amplitude(Y)
    hold on
    plot_lowpass(Y,fg); 

    subplot(1,5,2)
    plot_dft_amplitude(Y_low);
    
    % plot contour coordinates m and n
    subplot(1,5,3)
    hold off
    newplot
    stem(real(t2));     
    title('contour signal m')

    subplot(1,5,4)
    hold off
    newplot
    stem(imag(t2));
    title('contour signal n')
    
    % plot contour
    subplot(1,5,5)
    hold off
    newplot
    plot([real(t2) real(t2(1))], [imag(t2) imag(t2(1))], 'LineWidth',3);
    title('contour '); xlabel('m'); ylabel('n')
    
   pause
end






