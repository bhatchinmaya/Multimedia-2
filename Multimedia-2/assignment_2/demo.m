% Start the excercise for ring and ray spectra.

close all

% load image

delta = 0.16933;                    % mm
Fs = 1/delta;                       % sampling_rate in x-,y-direction

% Load the reference image and the comparison image
image_ref = double(imread('pictures/D106.png'));
%image_compare = double(imread('pictures/D106.png'));
image_compare = double(imread('pictures/D106upscaled.png'));
%image_compare = double(imread('pictures/D106rot.png'));
%image_compare = double(imread('pictures/D085.png'));

% determine ring and ray spectra
ray_spectra_ref=ray_powerspectra(image_ref);
ring_spectra_ref=ring_powerspectra(image_ref);
ring_spectra_compare=ring_powerspectra(image_compare);
ray_spectra_compare=ray_powerspectra(image_compare);

% Show original and comparison image
figure
subplot(1,2,1)
imshow(image_ref,[0, max(max(image_ref))])
title('reference image')
subplot(1,2,2)
imshow(image_compare,[0, max(max(image_compare))])
title('compare image')

% Show the FFT sprectra of the original and the comparison image
figure
subplot(1,2,1)
plot_powerspectra(image_ref)
title('FFT reference image')
subplot(1,2,2)
plot_powerspectra(image_compare)
title('FFT compare image')


% Plot the ring spectrum of the original and the comparison image
figure
subplot(2,1,1)
plot(linspace(0,0.5,numel(ring_spectra_ref)),ring_spectra_ref,'b')
hold all
plot(linspace(0,0.5,numel(ring_spectra_compare)),ring_spectra_compare,'r')
titlename=['ring spectrum | dist = ' ,num2str(sum(abs(ring_spectra_ref-ring_spectra_compare)))];
title(titlename)
legend('reference','compare')
subplot(2,1,2)
plot(linspace(0,360,numel(ray_spectra_ref)),ray_spectra_ref,'b')
hold all
plot(linspace(0,360,numel(ray_spectra_compare)),ray_spectra_compare,'r')
titlename=['ray spectrum | dist = ' ,num2str(sum(abs(ray_spectra_ref-ray_spectra_compare)))];
title(titlename)
legend('reference','compare')

