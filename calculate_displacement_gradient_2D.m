function [dU_dX, dU_dY, dV_dX, dV_dY] = calculate_displacement_gradient_2D(X, Y, U, V)
    
    % extract grid spacing
    dX = X(1, 2) - X(1, 1);
    dY = Y(2, 1) - Y(1, 1);
    
    
    % calculate displacement gradient
    dU_dX = socdiff(U, dX, 2);
    dU_dY = socdiff(U, dY, 1);
    dV_dX = socdiff(V, dX, 2);
    dV_dY = socdiff(V, dY, 1);
    

end