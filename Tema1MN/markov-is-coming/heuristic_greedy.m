function [path] = heuristic_greedy(start_position, probabilities, adjacency_matrix)
  path = [start_position];
  visited = zeros(length(probabilities), 1);
  visited(start_position) = 1;
  
  while ~isempty(path)
    position = path(end);
    
    if position == length(probabilities)-1 % WIN state
      return;
    end
    
    unvisited_neighbours = find(adjacency_matrix(position, :) & ~transpose(visited));

    
    if isempty(unvisited_neighbours)
      path(end) = [];
    else
      [~, max_idx] = max(probabilities(unvisited_neighbours));
      max_neigh = unvisited_neighbours(max_idx);
      visited(max_neigh) = 1;
      path = [path, max_neigh];
    end
  end
  
  path = []; % no path to WIN state
end
