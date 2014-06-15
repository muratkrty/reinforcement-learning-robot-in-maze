% Author: Murat Kirtay
% Date: 28/05/2014
% Description: Construct q_matrix and initialize unreachable actions to -inf
%               
% Bugs: No known.

function [ q_matrix ] = costruct_q_matrix( N, actions )

q_matrix = zeros(N*N, actions);

q_matrix(N*N, 4) = -inf;    
q_matrix(1:N, 1) = -inf;
q_matrix(N*4+1 : N*N, 4) = -inf;

for i = 1 : N
    q_matrix(i*N,2) = -inf;
    q_matrix(i*N + 1, 3) = -inf;
end

% q_matrix was expanded over loop, lets slice it :)
q_matrix = q_matrix( 1:N*N, :);

end

