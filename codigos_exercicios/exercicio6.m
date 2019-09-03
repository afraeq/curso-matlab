% definindo a matriz 9X9
A = [1:9; 10:18; 19:27; 28:36; 37:45; 46:54; 55:63; 64:72; 73:81];

% guardando a submatriz 1 na variavel auxiliar aux 
aux = A(1:3, 1:3);

% trocando a submatriz 1 pela 3 e vice-versa
A(1:3, 1:3) = A(7:9, 7:9);
A(7:9, 7:9) = aux;

% guardando a submatriz 2
aux = A(1:3, 7:9);

% trocando a submatriz 2 pela 4 e vice-versa
A(1:3, 7:9) = A(7:9, 1:3);
A(7:9, 1:3) = aux