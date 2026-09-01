function euler()

% given dy/dt = f(t,y), approximate y
% -- --------------------------------------------------------------------

t_0 = 0;    % set initial time
t_f = 2;    % set final time
%h   = 0.01; % set stepsize (in time)
y_0 = 1;    % set initial condition

% loop through values of stepsize h 
hvect = [0.05 0.025 0.01 0.001]; NH = length(hvect);

for m = 1:NH
    h = hvect(m);
    y(1) = y_0; %initialize y to y_0
    t = t_0: h : t_f;       % create a vector of t-values

    % -- Euler method
    for j = 1:length(t)-1 % j loops through timesteps
      y(j+1) = y(j) + h*f1(t(j),y(j));   % update y
    end % end for
    
    Yh(m) = y(end); % save the value of y(t_f)

    % output table of t and y values
    NT = 1:length(t); % create vector of indices
    fprintf('----------------------------------------------\n')
    fprintf('h = %-.3f Euler Method \n',h)
    fprintf('----------------------------------------------\n')
    for K = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 1.0, 1.5, 2.0]
        J = NT(t==K);
        fprintf('%-2g  \t %-8.6f \n', t(J), y(J))
    end

end % end the loop over values of h

% create a plot of h vs. y(2) for each value of h
figure(1), plot(hvect, Yh)
xlabel('h'), ylabel('y_E'), title('Euler method for f=1-t-4y')

% use the command loglog to create a log-log plot
% type 'help loglog' to find out how it works


% -- ---------------------------------------
function f = f1(t,y) % specify function f here

f = 1 - t + 4*y;