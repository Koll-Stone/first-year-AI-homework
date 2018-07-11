function [queue_of_leaf_node, queue_of_evaluation_of_leaf_node] = generate_leaf_node_h(input_node)
    queue_of_leaf_node = [];
	queue_of_evaluation_of_leaf_node = [];
    [i,j] = find(input_node.value==0);
    neighbor_i = neighbor_number(i);
    neighbor_j = neighbor_number(j);
    for k = 1:length(neighbor_i)
        tmp_value = input_node.value;
        tmp_value(neighbor_i(k),j) = input_node.value(i,j);
        tmp_value(i,j) = input_node.value(neighbor_i(k),j);
        tmp = node_h;
		tmp.depth = input_node.depth + 1;
        tmp.former = input_node;
        tmp.value = tmp_value;
		tmp.distance = find_distance(tmp.value);
        queue_of_leaf_node = [queue_of_leaf_node, tmp];
    end
    for k = 1:length(neighbor_j)
        tmp_value = input_node.value;
        tmp_value(i,neighbor_j(k)) = input_node.value(i,j);
        tmp_value(i,j) = input_node.value(i,neighbor_j(k));
        tmp = node_h;
		tmp.depth = input_node.depth + 1;
        tmp.former = input_node;
        tmp.value = tmp_value;
		tmp.distance = find_distance(tmp.value);
        queue_of_leaf_node = [queue_of_leaf_node, tmp];
	end
    
	for k=1:length(queue_of_leaf_node)
		
		queue_of_evaluation_of_leaf_node = [queue_of_evaluation_of_leaf_node, (queue_of_leaf_node(k).depth ...
			+ queue_of_leaf_node(k).distance)];
	end
	
    
end