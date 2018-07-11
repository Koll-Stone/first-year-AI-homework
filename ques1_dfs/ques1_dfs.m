% 第一题 深度优先搜索
clear;
clc;


origin_node = node;    % 创建源节点
origin_node.value = [2,8,3;1,6,4;7,0,5];    

stack = [origin_node];    % 维护一个堆栈
stack_length = 1;    

global visited_value    % 全局变量，用来保存已经访问过的节点
visited_value = [];

while stack_length > 0    % 当堆栈不空，说明搜索可继续
	 display('stacklength')
	 display(stack_length)
	 if stack_length>20    % 当深度超过20，回溯到上一个节点
	 	 stack = stack(2:end);
		 stack_length = stack_length-1;
     end
    temporal_node = stack(1);    % 栈首元素出栈
    if is_destination(temporal_node) 
	    break  
    else
        leaf_node = generate_unvisited_leaf_node(temporal_node);
        if isequal(leaf_node.value,zeros(3))
	        stack = stack(2:end);    % 若该元素没有为访问过的叶节点，则丢弃它，回溯到上一个节点
		    stack_length = stack_length - 1;
		    continue
        else
		    stack = [leaf_node, stack];
		    stack_length = stack_length + 1;
        end
    end
end

path = [temporal_node.value];    % path保存路径，并打印
while ~(isequal(temporal_node.former.value, origin_node.value))
     last_step = temporal_node.former;
     path = [last_step.value, path];
     temporal_node = last_step;
end
path = [origin_node.value,path];
display('开始打印结果：')
for k=1:3:size(path,2)
     sprintf('step: %d', floor(k/3))
     path(:,k:k+2) 
end
