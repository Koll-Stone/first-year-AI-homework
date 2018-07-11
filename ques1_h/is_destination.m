function y = is_destination(node)
    x = node.value;
    if isequal(x,[1,2,3;8,0,4;7,6,5]) | isequal(x,[8,1,2;7,0,3;6,5,4]) | isequal(x,[7,8,1;6,0,2;5,4,3]) | isequal(x,[6,7,8;5,0,1;4,3,2]) ...
            | isequal(x,[5,6,7;4,0,8;3,2,1]) | isequal(x,[4,5,6;3,0,7;2,1,8]) | isequal(x,[3,4,5;2,0,6;1,8,7]) | isequal(x,[2,3,4;1,0,5;8,7,6]) ...
            | isequal(x,[1,8,7;2,0,6;3,4,5]) | isequal(x,[8,7,6;1,0,5;2,3,4]) | isequal(x,[7,6,5;8,0,4;1,2,3]) | isequal(x,[6,5,4;7,0,3;8,1,2]) ...
            | isequal(x,[5,4,3;6,0,2;7,8,1]) | isequal(x,[4,3,2;5,0,1;6,7,8]) | isequal(x,[3,2,1;4,0,8;5,6,7]) | isequal(x,[2,1,8;3,0,7;4,5,6])
        y = 1;
    else
        y = 0;
    end
end