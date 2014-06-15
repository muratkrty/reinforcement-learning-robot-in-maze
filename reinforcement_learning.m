% Author: Murat Kirtay
% Date: 27/05/2014
% Description: Reinforcement Learning, Q learning Algorithm that used by a
%              robot to solve a maze and reach the goal
% Notes: 0- If robot moves from free space to obstacles, it gains -4 reward
%           otherwise -1 reward
%
% Bugs: No known, yet not finalized.

clc
num_of_iteration = 1000;
N = 5; 
r = 20;
gamma = 0.8;
learning_rate = 0.1;
actions = 4; % North, East, West, South (N, E, W, S)
exploration_rate = 0.4;

action_matrix = [-5 1 -1 5 ];
maze = create_random_maze2(N, r);
q_matrix = construct_q_matrix(N, actions);

i = 1;
reward = 0;
trace_index = [];
for episode = 1 : num_of_iteration
    
    initial_state = N*N;
    goal_state = 1;
    
    current_state = initial_state;
    while current_state ~= goal_state
        
        % select an action and execute it
        % TODO: there is an -inf problem
        if rand < exploration_rate
            eliminate_inf = find(q_matrix(current_state, :) > -inf);
            prefered_action = eliminate_inf(randi(numel(eliminate_inf)));
        else
            [temp_value, prefered_action] = max( q_matrix(current_state,:) );
        end
        
        % receive immediate reward
        maze_exp_index = current_state + action_matrix(prefered_action);
        trace_index(i)  = maze_exp_index;
        i = i + 1;
        
        if maze(maze_exp_index) == 1
            reward = -4;
        else
            reward = -1;
        end
        
        % update table entry, below two equation can be used.
        % q_matrix(current_state, prefered_action) = reward + gamma * max(q_matrix(maze_exp_index,:));
        q_matrix(current_state, prefered_action) = (1-learning_rate) * q_matrix(current_state, prefered_action)+...
                                                   learning_rate * (reward + gamma * max(q_matrix(maze_exp_index,:)));
        
        % observe new state
        current_state = maze_exp_index ;
        
    end
end

% display maze and q_matrix
maze
q_matrix


