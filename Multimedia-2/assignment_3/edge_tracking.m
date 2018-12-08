function [tracked_image] = edge_tracking(edge_image, high_th, low_th)


edge_image = padarray(edge_image,[1 1]);


edge_image_above_low_th = uint8(edge_image > low_th) .* uint8(edge_image);


store_matrix = zeros(10,12);
[m,n]= find((edge_image >= high_th));
%[m,n]= find((edge_image > low_th));
temp_in = 0; temp = 0;
for i = 1:7
    
        
       
      row = m(i); col = n(i) ;
      row_in = row; col_in = col;
      
      edge_image_above_low_th(row,col) = 1;
      store_matrix(row,col) = 1;
      temp = edge_image_above_low_th(row-1:row+1, col-1:col+1);
      [max_value, max_index] = max(temp(:));
      temp_in = temp;
      
      while max_value > low_th
      [row_in_mid col_in_mid] = ind2sub(size(temp_in), max_index);
   
      row_in = row_in + row_in_mid - 2;
      col_in = col_in + col_in_mid - 2;
      edge_image_above_low_th(row_in,col_in) = 1;
      store_matrix(row_in, col_in) = 1;
      temp_in = edge_image_above_low_th(row_in-1:row_in+1, col_in-1:col_in+1);
      [max_value,max_index] = max(temp_in(:));
      
      
      end
          
edge_image_above_low_th = uint8(edge_image > low_th) .* uint8(edge_image);

end

final = store_matrix(2:9, 2:11);
tracked_image = bwlabel(final, 8);
    

