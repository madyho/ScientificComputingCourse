%% question 3
%part b
figure(1);
sgtitle('clean and noisy images')
hold on
subplot(1,2,1)
imshow(A, [])
title('A');
subplot(1,2,2)
imshow(An, [])
title('A + E');
saveas(gcf, 'swiftplots.jpg')

%An = A + E;

%% part c
[un,sn,vn] = svd(An);
[u,s,v] = svd(A);
sigma_n = diag(sn);
sigma = diag(s);

s1 = sigma_n(1:100);
s2 = sigma(1:100);

figure(2);
x = [1:100];
subplot(1,2,1);
xlabel('index of singular value')
ylabel('singular value')
hold on
semilogy(x, s1);
subplot(1,2,2);
semilogy(x, s2);
sgtitle('First 100 singular values of A and A tilde')
xlabel('index of singular value')
ylabel('singular value')
saveas(gcf,'100points.jpg');
n = 45;

%% part d
l = linspace(5,45,9);

for i = 1:n
    uk = u(:,1:i);
    vk = v(:,1:i);
    sk = s(1:i,1:i);

    A_k{i} = uk*sk*vk';
end


for(i = 1:9)
subplot(3,3,i);
imshow(A_k{5*i}, []);
title(sprintf('Rank %d Approximation', 5*i ));
saveas(gcf, 'rankapprox.jpg');
end

%% part e
%show the storage cost of truncated svd and relative error of Ak.
figure(3)
x = linspace(5,45,9);
sc = [];
for(i = 1:9)
sc(i) = (5*i)*(512 + 1024 + 1);
end

e = [];
for k = 1:9
    e(k) = norm(A-A_k{5*k}, 'fro')/(norm(A, 'fro'));
end
subplot(2,1,1);
title('storage costs');
hold on;
plot(x,sc);
xlabel('target rank');
subplot(2,1,2);
title('relative error of frobenius norm');
hold on;
plot(x, e);
xlabel('target rank');
saveas(gcf, 'costerror.jpg');

%% part f
l = linspace(5,45,9);

for(i = 1:n)
    unk = un(:,1:i);
    vnk = vn(:,1:i);
    snk = sn(1:i,1:i);
    
    An_k{i} = unk * snk * vnk';
end

for(i = 1:9)
subplot(3,3,i);
imshow(An_k{5*i}, []);
title(sprintf('Rank %d Approximation Noise', 5*i ));
saveas(gcf, 'RankNoise.jpg');
end

%% part g
e = [];
x = linspace(5,45,9);

for k = 1:9
    e(k) = norm(An - An_k{5*k}, 'fro')/norm(An,'fro');
end
figure(4);
title('relative error of frobenius norm on noisy image');
xlabel('target rank');
hold on;
plot(x, e);
saveas(gcf, 'noiseerror.jpg')
