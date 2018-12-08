% Quantize the given HSV image in the HSV color space.

 function [image_bin] = ColorQuantizeHSV(image_hsv)

[size_y, size_x, ndim] = size(image_hsv);
% Contains the bin for each pixel.
image_bin = zeros(size_y, size_x);
bin = 0;

% Iterate over the image.
for y=1:size_y
    
    for x=1:size_x
        
        % Get HS values for pixel. V is ignored.
        h = image_hsv(y,x,1);
        s = image_hsv(y,x,2);
        
         if (0<= s) && (s<0.33) ;
            bin = 1; 
        
        
        elseif (0.33<= s) && (s<0.66) ; 
            
            
            if ( (((5/3)*pi <= h ) && ( h < 2*pi) ) || ( (0 <= h ) && ( h < pi/3)) ) ;
                bin = 2;
                
            
            elseif ( pi/3 <= h ) && ( h < pi ) ; 
                bin = 3;
            
            
            else ( pi <= h ) && ( h< (5/3)*pi ) ;
                bin = 4;
                  
            end
           
        
        
       else (0.66<= s) && (s<1) ;
            
            
            if (( (11/6)*pi <= h) &&   ( h <  2 * pi ))   ||     ( ( 0 < h ) && ( h < pi/6 ) )  ;
                    bin = 5;
            
            
            elseif  (pi/6 <= h ) && ( h < pi/2 )  ;             
                    bin = 6;
                 
            
            elseif  ( pi/2 <= h ) && ( h < (5/6)*pi )    ;          
                    bin = 7;
                     
            
            elseif  ( (5/6)*pi <= h ) && ( h < (7/6)*pi )   ;            
                     bin = 8;
            
            elseif ( (7/6)*pi <= h ) && ( h < (3/2)*pi )  ;
                     bin = 9;
                              
            
            elseif ( (3/2)*pi <= h) && ( h < (11/6)*pi )  ;
                     bin = 10; 
                                    
            end
            
        end  
      
        image_bin(y,x) = bin;
        
        
    end;
end;

