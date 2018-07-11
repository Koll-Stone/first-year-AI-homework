% ��һ�� ����ʽ����
clc;
clear;


origin_node = node_h;
origin_node.depth = 0;
origin_node.value = [2,8,3;1,6,4;7,0,5];
origin_node.distance = find_distance(origin_node.value);    % ����Դ�ڵ�

queue = [origin_node];
queue_of_evaluation = [origin_node.depth + origin_node.distance];    % ά��һ������
queue_length = 1;

while queue_length > 0    % �����в���ʱ�������ɼ���
     [unuse, location] = min(queue_of_evaluation);    % �Ӷ���������һ������õġ��ڵ������
     temporal_node = queue(location);
     queue(location) = [];
	 queue_of_evaluation(location) = [];
     queue_length = queue_length - 1;
     if is_destination(temporal_node)
         break 
     else
         [queue_of_leaf_node, queue_of_evaluation_of_leaf_node] = generate_leaf_node_h(temporal_node);
         queue = [queue, queue_of_leaf_node];
		 queue_of_evaluation = [queue_of_evaluation, queue_of_evaluation_of_leaf_node];
         queue_length = queue_length + length(queue_of_leaf_node);
     end
end

path = [temporal_node.value];    % ��ӡ·��
while ~(isequal(temporal_node.former.value, origin_node.value))
      last_step = temporal_node.former;
      path = [last_step.value, path];
      temporal_node = last_step;
end
path = [origin_node.value,path];
for k=1:3:size(path,2)
     sprintf('step: %d', floor(k/3))
     path(:,k:k+2) 
end