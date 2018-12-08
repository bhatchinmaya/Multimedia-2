% Description: Definition of gradient operation to be performed on input
% image. Returned image contains edges found by gradient analysis


function [ output_image ] = gradientAnalysis( input_image, direction )

    % definition of gradient operation
    Gv = [-1 0 1];%YOUR TURN;
    Gh = [-1 0 1]';%YOUR TURN;
    Gd_plus = [0 1; -1 0];%YOUR TURN;

    Gd_minus = [-1 0; 0 1];%YOUR TURN;
    
    %{
    % definition of low-pass filtering
    Mv = 1/3 * [1 1 1]';%YOUR TURN;
    Mh = 1/3 * [1 1 1];%YOUR TURN;
    Md_plus = 1/3 * [1 1;1 1];%YOUR TURN;
    Md_minus = 1/3 * [1 1;1 1];%YOUR TURN;
    %}
    
    Mv = 1/4* [1 2 1]';
    Mh = 1/4* [1 2 1];
    Md_plus = 1/4*[1 2;2 1];
    Md_minus = 1/4*[2 1;1 2];
    %}
    
    
    % now generate filter kernels
    Kv          = conv2(Gv, Mv);%YOUR TURN;
    Kh          = conv2(Gh, Mh); %YOUR TURN; 
    Kd_plus     = conv2(Gd_plus, Md_plus);%YOUR TURN;
    Kd_minus    = conv2(Gd_minus, Md_minus); %YOUR TURN;
    
    % apply filter kernel according to direction switch    
    if strcmp(direction, 'v')
        output_image = conv2(input_image,Kv); %YOUR TURN;
    elseif strcmp(direction, 'h')
       output_image = conv2(input_image, Kh);%YOUR TURN;
    elseif strcmp(direction, 'd+')
       output_image = conv2(double(input_image), Kd_plus);%YOUR TURN;
    elseif strcmp(direction, 'd-')
        output_image = conv2(double(input_image), Kd_minus);%YOUR TURN;
    end

end

