% ��һ�� �����������
clc;
clear;


origin_node = node;    % ����Դ�ڵ�
origin_node.value = [2,8,3;1,6,4;7,0,5];

queue = [origin_node];    % ά��һ������
queue_length = 1; 

while queue_length > 0    % �����в���ʱ��˵�������ɼ���
    temporal_node = queue(1);  
    queue = queue(2:end);    % ��һ��Ԫ�س�����
    queue_length = queue_length - 1;
    if is_destination(temporal_node)
        break    % ����Ԫ�ؾ���Ŀ��ڵ㣬����������
    else
        queue_of_leaf_node = generate_leaf_node(temporal_node);    % ���򣬰Ѹýڵ��Ҷ�ڵ�ȫ���������
        queue = [queue, queue_of_leaf_node];
        queue_length = queue_length + length(queue_of_leaf_node);
    end
end

path = [temporal_node.value];    % �����Դ�ڵ㵽Ŀ��ڵ��·��
while ~(isequal(temporal_node.former.value, origin_node.value))    % ����ǰ�ڵ��ǰһ������Դ�ڵ�ʱ����������·��
     % �����ѵ�ǰ�ڵ���Ϊ����ǰһ��
     last_step = temporal_node.former;
     path = [last_step.value, path];
     temporal_node = last_step;
end
path = [origin_node.value,path];
for k=1:3:size(path,2)    % ��ӡ��Դ�ڵ㵽Ŀ���·��
     sprintf('step: %d', floor(k/3))
     path(:,k:k+2) 
end