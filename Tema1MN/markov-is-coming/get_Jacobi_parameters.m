function [G, c] = get_Jacobi_parameters(Link)

    [num_nodes, ~] = size(Link);

    % Inițializez matricea de iterație G și vectorul de iterație c
    G = sparse(num_nodes-2, num_nodes-2);
    c = sparse(num_nodes-2, 1);

    % Copiez submatricea din stânga jos a matricei de legături în G
    G(1:num_nodes-2, 1:num_nodes-2) = Link(1:num_nodes-2, 1:num_nodes-2);

    % Copiez ultima coloană (cu excepția ultimelor două rânduri) a matricei de legături în c
    c = Link(1:num_nodes-2, num_nodes-1);

    % Convertesc G și c în matrici complete
    G = full(G);
    c = full(c);
end
