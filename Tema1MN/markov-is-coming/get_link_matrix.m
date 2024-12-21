function [Link] = get_link_matrix(Labyrinth)
    % dimensiunile labirintului
    [m, n] = size(Labyrinth);

    % respectiv ale grafului
    nr = m*n + 2; % Adaug două noduri pentru noduri speciale de intrare și ieșire

    % initializez cu 0
    Link = sparse(nr, nr);

    p_move = zeros(m*n, 1);

    % calculez probabilitatea de a trece de la o celulă la alta
    for i = 1:m
        for j = 1:n
            for z = 1:4
                p_move((i-1)*n + j, 1) = p_move((i-1)*n + j, 1) + ~(bitget(Labyrinth(i, j), z));
            end
            p_move((i-1)*n + j, 1) = 1 / p_move((i-1)*n + j, 1);
        end
    end

    for i = 1:m
        for j = 1:n
            index = (i-1)*n + j;

            % verific daca e perete in stanga
            if j > 1 && bitget(Labyrinth(i, j), 1) == 0
                Link(index, index-1) = p_move(index);
            end

            % verific daca e perete in dreapta
            if j < n && bitget(Labyrinth(i, j), 2) == 0
                Link(index, index+1) = p_move(index);
            end

            % verific daca e perete deasupra
            if i > 1 && bitget(Labyrinth(i, j), 4) == 0
                Link(index, index-n) = p_move(index);
            end

            % verific daca e perete dedesupt
            if i < m && bitget(Labyrinth(i, j), 3) == 0
                Link(index, index+n) = p_move(index);
            end

            % conectez nodul de intrare special la rândul de sus de noduri
            if i == 1 && bitget(Labyrinth(i, j), 4) == 0
                Link(j, nr-1) = p_move(index);
            end

            % fac acelasi luctru pentru toate pozitiile
            if i == m && bitget(Labyrinth(i, j), 3) == 0
                Link(index, nr-1) = p_move(index);
            end

            if j == n && bitget(Labyrinth(i, j), 2) == 0
                Link(index, nr) = p_move(index);
            end

            if j == 1 && bitget(Labyrinth(i, j), 1) == 0
                Link(index, nr) = p_move(index);
            end
        end
    end

    % setez nodurile speciale de intrare și ieșire să nu aibă margini de ieșire
    Link(nr-1, :) = zeros(1, nr);
    Link(nr, :) = zeros(1, nr);
    Link(nr-1, nr-1) = 1;
    Link(nr, nr) = 1;
end
