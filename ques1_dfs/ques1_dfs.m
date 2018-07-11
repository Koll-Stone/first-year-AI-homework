% ��һ�� �����������
clear;
clc;


origin_node = node;    % ����Դ�ڵ�
origin_node.value = [2,8,3;1,6,4;7,0,5];    

stack = [origin_node];    % ά��һ����ջ
stack_length = 1;    

global visited_value    % ȫ�ֱ��������������Ѿ����ʹ��Ľڵ�
visited_value = [];

while stack_length > 0    % ����ջ���գ�˵�������ɼ���
	 display('stacklength')
	 display(stack_length)
	 if stack_length>20    % ����ȳ���20�����ݵ���һ���ڵ�
	 	 stack = stack(2:end);
		 stack_length = stack_length-1;
     end
    temporal_node = stack(1);    % ջ��Ԫ�س�ջ
    if is_destination(temporal_node) 
	    break  
    else
        leaf_node = generate_unvisited_leaf_node(temporal_node);
        if isequal(leaf_node.value,zeros(3))
	        stack = stack(2:end);    % ����Ԫ��û��Ϊ���ʹ���Ҷ�ڵ㣬�����������ݵ���һ���ڵ�
		    stack_length = stack_length - 1;
		    continue
        else
		    stack = [leaf_node, stack];
		    stack_length = stack_length + 1;
        end
    end
end

path = [temporal_node.value];    % path����·��������ӡ
while ~(isequal(temporal_node.former.value, origin_node.value))
     last_step = temporal_node.former;
     path = [last_step.value, path];
     temporal_node = last_step;
end
path = [origin_node.value,path];
display('��ʼ��ӡ�����')
for k=1:3:size(path,2)
     sprintf('step: %d', floor(k/3))
     path(:,k:k+2) 
end
