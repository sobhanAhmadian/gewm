A = [4, -1, 3; 2, 7, 5; 5, -3, -1];
b = [-1; 2; 1];

if size(A, 1) ~= size(A, 2)
    error('A is not square');
end

if size(A, 1) ~= size(b, 1)
    error('dimension of b is incompatibale with A')
end

n = size(A, 1);
for j = 1: n
    for i = j+1: n
        m = -1 * A(i, j) / A(j, j);
        A(i, j: end) = A(i, j: end) + m * A(j, j: end);
        b(i) = b(i) + m * b(j);
    end
end

disp(A)
disp(b)

x = zeros(n, 1);

for i = n: -1: 1
    temp = b(i) - sum(A(i, i + 1: end) * x(i + 1: end));
    x(i) = temp / A(i, i);
end

disp(x)