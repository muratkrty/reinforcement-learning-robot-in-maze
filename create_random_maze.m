% Author: Murat Kirtay, M.A. Zamani
% Date: 27/05/2014
% Description: Create maze matrix and locate random obstacles.
% Bugs: No known.

function [ maze ] = create_random_maze(N, r)

maze_temp = zeros(N, N);

for i = 1 : N
    for j = 1 : N
        if rand < 0.01 * r
            maze_temp(i, j) = 1;
        end
    end
end

maze = maze_temp;

end

