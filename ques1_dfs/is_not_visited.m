function y = is_not_visited(value)
	global visited_value;
	
	
    for k=1:3:size(visited_value,2)
		if isequal(visited_value(:,k:k+2), value)
			y=0;
			return
		end
	end
	y=1;
end