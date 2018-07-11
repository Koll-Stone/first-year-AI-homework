% 第四题

% 数据准备
x1 = [1,1,1;0,1,0;0,1,0];
x2 = [1,0,0;1,1,1;1,0,0];
x3 = [0,1,0;0,1,0;1,1,1];
x4 = [0,0,1;1,1,1;0,0,1];
x5 = [1,0,0;1,0,0;1,1,1];
x6 = [0,0,1;0,0,1;1,1,1];
x7 = [1,1,1;0,0,1;0,0,1];
x8 = [1,1,1;1,0,0;1,0,0];


X1 = [reshape(x1,[9,1]),reshape(x2,[9,1]),reshape(x3,[9,1]),reshape(x4,[9,1])];
X2 = [reshape(x5,[9,1]),reshape(x6,[9,1]),reshape(x7,[9,1]),reshape(x8,[9,1])];
X = [];
for i = 1:10
    X = [X, X1+0.2*rand(9,4)];
end
for i = 1:10
    X = [X, X2+0.2*rand(9,4)];
end                             %给原数据加小噪声，以扩充数据量

Y1 = [1,1,1,1];
Y2 = [-1,-1,-1,-1];
Y = [];
for i = 1:10
    Y = [Y,Y1]; 
end
for i = 1:10
    Y = [Y,Y2];     % 相应label
end

% 网络构建
net = newff(X, Y, [3], {'tansig', 'activation_self_define'},'trainlm','learngdm');
net.trainParam.goal = 1e-5;
net.trainParam.epochs = 200;


% 训练
net = train(net,X,Y);

% 输出权值
display("从输入层到隐藏层的权重")
net.IW{1,1}  
display("从隐藏层到输出层的权重")
net.LW{2,1}  
display("隐藏层的偏置项")
net.b{1,1}
display("输出层的偏置")
net.b{2,1}
net(X(:,1:40))
% 输出分类结果
scatter(1:40,net(X(:,1:40)));
hold on
net(X(:,41:80))
scatter(1:40,net(X(:,41:80)));
