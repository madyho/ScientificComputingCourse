xtrue1 = reshape(xtrue, [64,64]);
bn1 = reshape(bn, [64,64]);
sgtitle('Plot of the normal and blurred images');
subplot(1,2,1);
imshow(xtrue1, []);
subplot(1,2,2);
imshow(bn1, []);
saveas(gcf, 'deblurplot.jpg');

%% part c
title('naive solution');
x_n= A\bn;
imshow(reshape(x_n, [64, 64]));
saveas(gcf, 'naivesolution.jpg');

%% part d
%condition number k_2(A) = ||A||_2||A^-1||_2
k_2 = norm(A)*norm(A^(-1));

%% part e
% [u, s, v] = svd(A);
% utbn = u'*bn;
t = cell(3600,1);
sv = diag(s);
for j = 1: 3600 %indexing by kval
    t{j} = v(:,j)*(dot(u(:,j),bn)/sv(j));
end

xk = cell(3600,1);
xk{1} = t{1};

for i = 2: 3600
    xk{i} = t{i} + xk{i-1};
end

for i = 1:9
    xk_mat = reshape(xk{400*i}, [64,64]);
    subplot(3,3,i);
    imshow(xk_mat, [])
    title(sprintf('rank %d approximation', 400*i));
    saveas(gcf, 'noisesum.jpg');
end

%% part f
x = linspace(400,3600,9);

for i = 1:9
    ek(i) = norm(xk{400*i} - xtrue)/norm(xtrue);
end
plot(x, ek);
title('relative error reconstructed solution');
xlabel('truncation index k');
ylabel('relative error');
saveas(gcf, 'relerror.jpg');