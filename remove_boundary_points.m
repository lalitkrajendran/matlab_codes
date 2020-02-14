function data_new = remove_boundary_points(data, NR_im, NC_im, left_boundary_buffer, right_boundary_buffer, bottom_boundary_buffer, top_boundary_buffer)

    if nargin < 5
        right_boundary_buffer = left_boundary_buffer;
        top_boundary_buffer = left_boundary_buffer;
        bottom_boundary_buffer = left_boundary_buffer;
    end
    
    indices_cols = find(data.X(1,:) > left_boundary_buffer & data.X(1,:) < NC_im - right_boundary_buffer);
    indices_rows = find(data.Y(:,1) > bottom_boundary_buffer & data.Y(:,1) < NR_im - top_boundary_buffer);
%     indices_rows = 1+boundary_buffer:num_rows-boundary_buffer;
%     indices_cols = 1+boundary_buffer:num_cols-boundary_buffer;
    
    data_new.X = data.X(indices_rows, indices_cols);
    data_new.Y = data.Y(indices_rows, indices_cols);
    data_new.U = data.U(indices_rows, indices_cols);
    data_new.V = data.V(indices_rows, indices_cols);
    
    if isfield(data, 'Eval')
        if size(data.Eval,1) == 1 || size(data.Eval, 2) == 1
            data.Eval = reshape(data.Eval, size(data.X, 1), size(data.X, 2));
        end
        
        data_new.Eval = data.Eval(indices_rows, indices_cols);
    end
    
    if isfield(data, 'uncertainty2D')
        if isfield(data.uncertainty2D, 'UpprxUB')
            data_new.uncertainty2D.UpprxUB = data.uncertainty2D.UpprxUB(indices_rows, indices_cols);
            data_new.uncertainty2D.UppryUB = data.uncertainty2D.UppryUB(indices_rows, indices_cols);

            data_new.uncertainty2D.UpprxLB = data.uncertainty2D.UpprxLB(indices_rows, indices_cols);
            data_new.uncertainty2D.UppryLB = data.uncertainty2D.UppryLB(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'UmixUB')
            data_new.uncertainty2D.UmixUB = data.uncertainty2D.UmixUB(indices_rows, indices_cols);
            data_new.uncertainty2D.UmiyUB = data.uncertainty2D.UmiyUB(indices_rows, indices_cols);

            data_new.uncertainty2D.UmixLB = data.uncertainty2D.UmixLB(indices_rows, indices_cols);
            data_new.uncertainty2D.UmiyLB = data.uncertainty2D.UmiyLB(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'Uimx')
            data_new.uncertainty2D.Uimx = data.uncertainty2D.Uimx(indices_rows, indices_cols);
            data_new.uncertainty2D.Uimy = data.uncertainty2D.Uimy(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'MCx')
            data_new.uncertainty2D.MCx = data.uncertainty2D.MCx(indices_rows, indices_cols);
            data_new.uncertainty2D.MCy = data.uncertainty2D.MCy(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'CSx')
            data_new.uncertainty2D.CSx = data.uncertainty2D.CSx(indices_rows, indices_cols);
            data_new.uncertainty2D.CSy = data.uncertainty2D.CSy(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'Ixx')
            data_new.uncertainty2D.Ixx = data.uncertainty2D.Ixx(indices_rows, indices_cols);
            data_new.uncertainty2D.Iyy = data.uncertainty2D.Iyy(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'Neff')
            data_new.uncertainty2D.Neff = data.uncertainty2D.Neff(indices_rows, indices_cols);
        end
        
        if isfield(data.uncertainty2D, 'biasx')
            data_new.uncertainty2D.biasx = data.uncertainty2D.biasx(indices_rows, indices_cols);
            data_new.uncertainty2D.biasy = data.uncertainty2D.biasy(indices_rows, indices_cols);
        end
    end
    
end