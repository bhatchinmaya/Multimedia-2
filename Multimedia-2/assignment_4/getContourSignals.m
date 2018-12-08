function [m,n] = getContourSignals(image, StartPoint_m, StartPoint_n)
    contour = bwtraceboundary(image, [StartPoint_m  StartPoint_n],'W');
    m = contour(:,1); n = contour(:,2); 
end