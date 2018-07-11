function queue_of_leaf_node = generate_leaf_node(input_node)
    queue_of_leaf_node = [];
    [i,j] = find(input_node.value==0);
    neighbor_i = neighbor_number(i);
    neighbor_j = neighbor_number(j);
    for k = 1:length(neighbor_i)
        tmp_value = input_node.value;
        tmp_value(neighbor_i(k),j) = input_node.value(i,j);
        tmp_value(i,j) = input_node.value(neighbor_i(k),j);
        tmp = node;
        tmp.former = input_node;
        tmp.value = tmp_value;
        queue_of_leaf_node = [queue_of_leaf_node, tmp];
    end
    for k = 1:length(neighbor_j)
        tmp_value = input_node.value;
        tmp_value(i,neighbor_j(k)) = input_node.value(i,j);
        tmp_value(i,j) = input_node.value(i,neighbor_j(k));
        tmp = node;
        tmp.former = input_node;
        tmp.value = tmp_value;
        queue_of_leaf_node = [queue_of_leaf_node, tmp];
    end
    
    
end