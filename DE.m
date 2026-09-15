function [Best_score, Best_pos, DE_curve] = DE(SearchAgents, Max_iterations, lowerbound, upperbound, dimension, fitness)
    
    % Inisialisasi batas ruang pencarian
    lowerbound = ones(1, dimension) .* lowerbound;
    upperbound = ones(1, dimension) .* upperbound;
    
    % Parameter standar Differential Evolution (DE)
    F = 0.5;   % Mutation factor (Skala selisih vektor)
    CR = 0.9;  % Crossover rate (Peluang rekombinasi)
    
    % Inisialisasi populasi awal (X)
    X = zeros(SearchAgents, dimension);
    fit = zeros(SearchAgents, 1);
    
    for i = 1:dimension
        X(:, i) = lowerbound(i) + rand(SearchAgents, 1) .* (upperbound(i) - lowerbound(i));
    end
    
    % Evaluasi fitness awal
    for i = 1:SearchAgents
        fit(i) = fitness(X(i, :));
    end
    
    % Cari individu terbaik di inisialisasi awal
    [Best_score, min_idx] = min(fit);
    Best_pos = X(min_idx, :);
    
    DE_curve = zeros(1, Max_iterations);
    
    % Loop Utama Differential Evolution
    for t = 1:Max_iterations
        for i = 1:SearchAgents
            
            % 1. MUTATION: Pilih 3 agen acak yang berbeda dari i
            idxs = randperm(SearchAgents);
            idxs(idxs == i) = []; 
            r1 = idxs(1); r2 = idxs(2); r3 = idxs(3);
            
            % Buat vektor mutan (V)
            V = X(r1, :) + F * (X(r2, :) - X(r3, :));
            
            % Pastikan vektor mutan tidak keluar batas (Clamp)
            V = max(V, lowerbound);
            V = min(V, upperbound);
            
            % 2. CROSSOVER: Binomial crossover untuk membuat vektor trial (U)
            j_rand = randi(dimension); % Pastikan minimal 1 dimensi dari mutan diambil
            U = zeros(1, dimension);
            for j = 1:dimension
                if rand() <= CR || j == j_rand
                    U(j) = V(j);
                else
                    U(j) = X(i, j);
                end
            end
            
            % 3. SELECTION: Evaluasi trial vektor
            new_fit = fitness(U);
            
            % Jika trial vektor lebih baik, gantikan individu lama
            if new_fit <= fit(i)
                X(i, :) = U;
                fit(i) = new_fit;
                
                % Update Global Best jika ditemukan yang lebih superior
                if new_fit < Best_score
                    Best_score = new_fit;
                    Best_pos = U;
                end
            end
        end
        
        % Catat rekam jejak konvergensi
        DE_curve(t) = Best_score;
        
        % 4. STOPPING CRITERIA (Batas 5% sesuai kesepakatan)
        if Best_score <= 5
            DE_curve = DE_curve(1:t); % Potong array agar tidak kepanjangan
            break;
        end
    end
end