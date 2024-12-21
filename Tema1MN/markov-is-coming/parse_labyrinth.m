function [Labyrinth] = parse_labyrinth(file_path)
	% deschid fisierul
  fid = fopen(file_path);
    size_str = fgetl(fid);
    size_array = sscanf(size_str, '%d');
    m = size_array(1);
    n = size_array(2);
    % initializez matricea cu 0
    Labyrinth = zeros(m, n, 'uint8');
    for i = 1:m
        row = fscanf(fid, '%d', [1 n]);
        Labyrinth(i,:) = row;
    end
    fclose(fid);
endfunction
