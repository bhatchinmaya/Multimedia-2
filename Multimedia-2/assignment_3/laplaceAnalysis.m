% Description: Definition of gradient operation to be performed on input
% image. Returned image contains edges found by gradient analysis


function [ output_image ] = laplaceAnalysis( input_image, mode )

    % definition of gradient operation
    Gv = [-1, 1];
    Gh = [-1; 1];
    
    % generate laplace operators by self-convolution
    laplace_v = 1/2 * conv(Gv,Gv);%YOUR TURN;
    laplace_h = 1/2 * conv(Gh,Gh);%YOUR TURN;
    
    % definition of laplace 3x3 matrices
    L3_v = zeros([3 3]);
    L3_h = zeros([3 3]);
    
    % define the 3x3 kernels for easier addition
    L3_v(2,:) = laplace_v;
    L3_h(:,2) = laplace_h;
    L3_dplus = 1/2 * [[-1, 0, 0]
                      [0, 2, 0]
                      [0, 0, -1]];
    L3_dminus = 1/2 * [[0, 0, -1]
                       [0, 2, 0]
                       [-1, 0, 0]];

    % now generate filter kernels
    laplaceKernel_1 = (L3_v + L3_h)/2; %YOUR TURN;
    laplaceKernel_2sep = laplace_h * laplace_v;%YOUR TURN;
    laplaceKernel_2 = (L3_h + L3_v + L3_dplus + L3_dminus)/4;%YOUR TURN;
    
    % apply filter kernel
    if strcmp(mode, '1')
        output_image =  conv2(input_image,laplaceKernel_1); %YOUR TURN;
    elseif strcmp(mode, '2sep')
        output_image =  conv2(input_image, laplaceKernel_2sep);      %YOUR TURN;
    elseif strcmp(mode, '2')
        output_image = conv2(input_image, laplaceKernel_2); %YOUR TURN;
    end

end

