function [Best_score, Best_pos, PSO_curve] = PSO(SearchAgents, Max_iterations, lowerbound, upperbound, dimension, fitness)
    
    % Inisialisasi batas (ubah ke bentuk array jika berupa skalar)
    lowerbound = ones(1, dimension) .* lowerbound;
    upperbound = ones(1, dimension) .* upperbound;
    
    % Parameter PSO standar
    w_max = 0.9;  % Inertia weight maksimum (Eksplorasi)
    w_min = 0.4;  % Inertia weight minimum (Eksploitasi)
    c1 = 2.0;     % Komponen kognitif (belajar dari pengalaman sendiri)
    c2 = 2.0;     % Komponen sosial (belajar dari pemimpin swarm)
    
    % Inisialisasi Posisi (X) dan Kecepatan (V)
    X = zeros(SearchAgents, dimension);
    V = zeros(SearchAgents, dimension);
    
    for i = 1:dimension
        X(:, i) = lowerbound(i) + rand(SearchAgents, 1) .* (upperbound(i) - lowerbound(i));
        % Kecepatan awal diset 0
        V(:, i) = zeros(SearchAgents, 1); 
    end
    
    % Evaluasi fitness awal
    fit = zeros(SearchAgents, 1);
    for i = 1:SearchAgents
        fit(i) = fitness(X(i, :));
    end
    
    % Inisialisasi pBest (Personal Best) dan gBest (Global Best)
    pBest_X = X;
    pBest_score = fit;
    
    [gBest_score, min_idx] = min(pBest_score);
    gBest_X = pBest_X(min_idx, :);
    
    PSO_curve = zeros(1, Max_iterations);
    
    % Loop Utama PSO
    for t = 1:Max_iterations
        % Update inertia weight (linier menurun agar di akhir lebih fokus eksploitasi lokal)
        w = w_max - t * ((w_max - w_min) / Max_iterations);
        
        for i = 1:SearchAgents
            % Update Kecepatan
            r1 = rand(1, dimension);
            r2 = rand(1, dimension);
            
            V(i, :) = w * V(i, :) ...
                      + c1 * r1 .* (pBest_X(i, :) - X(i, :)) ...
                      + c2 * r2 .* (gBest_X - X(i, :));
            
            % Update Posisi
            X(i, :) = X(i, :) + V(i, :);
            
            % Clamp Posisi agar tidak keluar batas (Boundaries)
            X(i, :) = max(X(i, :), lowerbound);
            X(i, :) = min(X(i, :), upperbound);
            
            % Evaluasi fitness baru
            new_fit = fitness(X(i, :));
            
            % Update Personal Best (pBest)
            if new_fit < pBest_score(i)
                pBest_score(i) = new_fit;
                pBest_X(i, :) = X(i, :);
            end
            
            % Update Global Best (gBest)
            if pBest_score(i) < gBest_score
                gBest_score = pBest_score(i);
                gBest_X = pBest_X(i, :);
            end
        end
        
        % Catat history gBest
        PSO_curve(t) = gBest_score;
        
        % Stopping criteria (seperti yang kita sepakati: batas 5%)
        if gBest_score <= 5
            % Potong array curve jika berhenti lebih awal
            PSO_curve = PSO_curve(1:t);
            break;
        end
    end
    
    % Return nilai akhir
    Best_score = gBest_score;
    Best_pos = gBest_X;
end