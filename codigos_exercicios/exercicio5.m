% item a
a = magic(4)

% item b
a(2,:) = a(2,:)/2

% item c
a(:,4) = a(:,4)+a(:,2)

% item d
a = a - diag(diag(a)) + 5*eye(4)