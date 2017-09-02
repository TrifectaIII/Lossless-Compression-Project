function [ l, in ] = Matching(lookback_buffer, lookahead_buffer)
%Finds a substring of the lookahead buffer in the lookback buffer. Returns the legnth of match and the index(from the end of the lookback buffer)
m = length(lookback_buffer);
n = length(lookahead_buffer);
while n > 1
    for i = 1:m-(n-1)
        if strcmp(lookback_buffer(i:i+(n-1)), lookahead_buffer)
            l = n;
            in = abs(i-(m+1));
            return
        end
    end
n = n - 1;
lookahead_buffer = lookahead_buffer(1:n);
end

l = 0;
in = 0;


end