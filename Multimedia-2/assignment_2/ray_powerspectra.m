% Calculate the ray spectra for the given image
function [spectra] = ray_powerspectra(image)


N  = size(image,2); % number of pixel in x-direction
M  = size(image,1); % number of pixel in y-direction

NFFTx = 2^nextpow2(N);  % number of FFT coefficients in x-direction
NFFTy = 2^nextpow2(M);  % number of FFT coefficients in y-direction

complex_spec = fftshift(fft2(image, NFFTy, NFFTx))/sqrt(NFFTy * NFFTx);
powersp = complex_spec.*conj(complex_spec);

% 1000 theta values from 0 to 2pi
thetaValues=linspace(0,2*pi,1000);
% 1000 spectra values. One for every theta value (ray)
spectra=zeros(1000,1);
% 1000 roh values from 0.05 to 0.95
rohValues = linspace(0.05,0.95,1000);

% For every theta value (ray)


for theta_idx=1:1000
    theta = thetaValues( theta_idx );
 
    x = 0; y = 0;
    raySum = 0;
    for rho_idx = 1:1000
        rho = rohValues(rho_idx);
        
        x = round(rho * cos(theta) * NFFTx/2 + NFFTx/2); 
        y = round(rho * sin(theta) * NFFTy/2 + NFFTy/2);   
    
        raySum = powersp(y,x) + raySum;
    end
    
    
    spectra(theta_idx) = raySum;
    
    
end



spectra = spectra/sum(spectra);

end

