% 第一题 广度优先搜索
clc;
clear;


origin_node = node;    % 创建源节点
origin_node.value = [2,8,3;1,6,4;7,0,5];

queue = [origin_node];    % 维护一个队列
queue_length = 1; 

while queue_length > 0    % 当队列不空时，说明搜索可继续
    temporal_node = queue(1);  
    queue = queue(2:end);    % 第一个元素出队列
    queue_length = queue_length - 1;
    if is_destination(temporal_node)
        break    % 若该元素就是目标节点，则搜索结束
    else
        queue_of_leaf_node = generate_leaf_node(temporal_node);    % 否则，把该节点的叶节点全部加入队列
        queue = [queue, queue_of_leaf_node];
        queue_length = queue_length + length(queue_of_leaf_node);
    end
end

path = [temporal_node.value];    % 保存从源节点到目标节点的路径
while ~(isequal(temporal_node.former.value, origin_node.value))    % 当当前节点的前一个不是源节点时，把它加入路径
     % ，并把当前节点设为它的前一个
     last_step = temporal_node.former;
     path = [last_step.value, path];
     temporal_node = last_step;
end
path = [origin_node.value,path];
for k=1:3:size(path,2)    % 打印从源节点到目标的路径
     sprintf('step: %d', floor(k/3))
     path(:,k:k+2) 
end