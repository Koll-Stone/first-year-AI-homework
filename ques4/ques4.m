% ������

% ����׼��
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
end                             %��ԭ���ݼ�С������������������

Y1 = [1,1,1,1];
Y2 = [-1,-1,-1,-1];
Y = [];
for i = 1:10
    Y = [Y,Y1]; 
end
for i = 1:10
    Y = [Y,Y2];     % ��Ӧlabel
end

% ���繹��
net = newff(X, Y, [3], {'tansig', 'activation_self_define'},'trainlm','learngdm');
net.trainParam.goal = 1e-5;
net.trainParam.epochs = 200;


% ѵ��
net = train(net,X,Y);

% ���Ȩֵ
display("������㵽���ز��Ȩ��")
net.IW{1,1}  
display("�����ز㵽������Ȩ��")
net.LW{2,1}  
display("���ز��ƫ����")
net.b{1,1}
display("������ƫ��")
net.b{2,1}
net(X(:,1:40))
% ���������
scatter(1:40,net(X(:,1:40)));
hold on
net(X(:,41:80))
scatter(1:40,net(X(:,41:80)));
