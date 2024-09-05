%% Element-by-element matrix manipulation example

H = hilb(30);
% Iterating through the elements of H(i, j) and making some checks
k=0;
for i=1:30
    for j=1:30
        % if i'd put a semicolumn like H(:, j) it will take all
        % of the elements of that row and cycle through the columns
        if sin(H(i,j)) > 0.03
            k=k+1;
        end
    end
end

% Repeating the example with a different target: summing up all of
% the elements whitin this matrix, that are < 0.03

% Hilbert matrix allocation
H = hilb(100);

% Counter
k = 0;
% Cycling and summing up
for i = 1:100
    for j = 1:100
        if H(i,j) < 0.03 
            k = k + H(i,j);
        end
    end
end

% Hilbert matrix manipulation third part

A = hilb(80);
c = 0;

for i = 1:80
    for j = 1:80
        if A(i,j) < 0.05
            c = c + A(i,j);
        end
    end
end
