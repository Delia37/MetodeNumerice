function [Adj] = get_adjacency_matrix(Labyrinth)
    % determin dimensiunile labirintului
    [m, n] = size(Labyrinth);

    % numarul total de noduri din graful labirintului
    nr = m*n + 2; % add two nodes for special entrance and exit nodes

    Adj = sparse(nr, nr);

    % parcurg fiecare celula
    for i = 1:m
        for j = 1:n
            %incep sa verific peretii labirintului
            index = (i-1)*n + j;

            if i == 1 && bitget(Labyrinth(i,j), 4) == 0
                Adj(j, nr-1) = 1;
            endif

            if i == m && bitget(Labyrinth(i,j), 3) == 0
                Adj(index, nr-1) = 1;
            endif

            if j == 1 && bitget(Labyrinth(i,j), 1) == 0
                Adj(index, nr) = 1;
            endif

            if j == n && bitget(Labyrinth(i,j), 2) == 0
                Adj(index, nr) = 1;
            endif

            if j > 1 && bitget(Labyrinth(i,j), 1) == 0
                Adj(index, index-1) = 1;
                Adj(index-1, index) = 1;
            endif

            if j < n && bitget(Labyrinth(i,j), 2) == 0
                Adj(index, index+1) = 1;
                Adj(index+1, index) = 1;
            endif

            if i < m && bitget(Labyrinth(i,j), 3) == 0
                Adj(index, index+n) = 1;
                Adj(index+n, index) = 1;
            endif

            if i > 1 && bitget(Labyrinth(i,j), 4) == 0
                Adj(index, index-n) = 1;
                Adj(index-n, index) = 1;
            endif
        endfor
    endfor

    Adj(nr-1, nr-1) = 1;
    Adj(nr, nr) = 1;
endfunction
