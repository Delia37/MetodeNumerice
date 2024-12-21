function [decoded_path] = decode_path (path, lines, cols)
   num_cells = length(path);
    decoded_path = zeros(num_cells, 2);

    for i = 1:num_cells
        cell_index = path(i);
        if cell_index ~= num_cells + 1  % Exclude WIN state
            row = ceil(cell_index / cols);
            col = mod(cell_index - 1, cols) + 1;
            decoded_path(i, :) = [row, col];
        end
    end

    % Elimin rândurile corespunzătoare stării WIN (toate zerourile)
decoded_path = decoded_path(1:end-1, :);
endfunction