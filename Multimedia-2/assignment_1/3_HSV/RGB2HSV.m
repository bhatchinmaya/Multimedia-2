% Convert the given image from the RGB color space to the HSV color space.
% The input array should be 3-dimensional (size_x, size_y, 3) with all
% values for RGB being in the range [0,1].
% The output will be of equal size with S and V bein in range [0,1] and H
% being in the range [0,2*pi].

function [image_hsv] = RGB2HSV(image_rgb)

image_hsv = zeros(size(image_rgb));

% Iterate over the image.
[size_y, size_x, ndim] = size(image_hsv);
for y=1:size_y
    for x=1:size_x
        % Get RGB values for pixel.
        r = image_rgb(y,x,1);
        g = image_rgb(y,x,2);
        b = image_rgb(y,x,3);
        
        rgb = [r, g, b];
        
        MAX = max(rgb);
        MIN = min(rgb);
        
        delta = MAX - MIN; 
        
        v = MAX;
        
        if (MAX ~= 0)
            s = delta/MAX ; 
        else
            s = 0; 
        end 
        
        if ( MAX == r )
            
            h = mod(g-b/delta, 6);
            
        elseif (MAX == g)
            
            h = mod(2 + (b-r)/delta, 6) ; 
            
        else
            
            h  = mod(4 + (r-g)/delta, 6) ; 
        
        
        end
        
        
        
        % YOUR TURN. 
        %First task. Convert the (r,g,b) values into (h,s,v) values.
        % Consider all cases. What happens if v is 0 or the angle h is
        % smaller than 0?
       
        % Second task. Manually modify the hsv values and see what happens.
        % For example add an offset to the angle H or to the values S and/or V.
        %  h = h;
        
        % Set HSV values.
        image_hsv(y,x,1) = mod(h, 2*pi);
        image_hsv(y,x,2) = min(1, max(s, 0));
        image_hsv(y,x,3) = min(1, max(v, 0));
    end;
end;


