function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

    x = x0; % Initial guess
    steps = 0; % numar de pasi

    err = inf; % initializez eroarea cu val max

    while err > tol && steps < max_steps
        x_prev = x; 
        x = G * x + c;
        steps = steps + 1; 
        err = norm(x - x_prev);
    end

    err = norm(x - x_prev);
end
