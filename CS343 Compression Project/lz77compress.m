function [ c_binarray ] = lz77compress( u_binarray )
%Takes an uncompressed binary array and returns the compressed binary array.
%Start loop at first element in array
i = 1;
lookbacklength = 256;
c_binarray = [];

while i <= length(u_binarray)
    %% Generate lookback buffer for a given i
    lookback_buffer_start = max(1,i-(lookbacklength*7));
    lookback_buffer_end = max(1,i-1);
    lookback_buffer = u_binarray(lookback_buffer_start:lookback_buffer_end);
    
    %% Convert lookback buffer to string
    if ~mod(length(lookback_buffer),7)
        lookback_buffer_str = BinToStr(lookback_buffer);
        %disp(['lookback when i = ',num2str(i),' ',lookback_buffer_str])
    else
        %disp(['lookback when i = ',num2str(i),' buffer failed'])
        lookback_buffer_str = '';
    end
    
    %% Generate lookahead buffer for a given i
    lookahead_buffer_start = i;
    lookahead_buffer_end = min(length(u_binarray),(i + 7*16 - 1));
    lookahead_buffer = u_binarray(lookahead_buffer_start:lookahead_buffer_end);
    %% Convert lookback buffer to string
    if ~mod(length(lookahead_buffer),7)
        lookahead_buffer_str = BinToStr(lookahead_buffer);
        %disp(['lookahead when i = ',num2str(i),' ',lookahead_buffer_str])
    else
        %disp(['lookahead when i = ',num2str(i),' buffer failed'])
        lookahead_buffer_str = '';
    end
    %% Attempt to match section of lookahead within lookback
    % Find proper # of characters to copy, and proper # of characters to go
    % back and copy from
    
    [matchlen,matchindx] = Matching(lookback_buffer_str, lookahead_buffer_str);
    
    %% If cant find any match, encode individual character and advance i by 7 in c_binarray
    
    if matchlen == 0
        c_binarray = [c_binarray, 0, lookahead_buffer(1:7)];
        i = i+7;
    
    %% If match found, encode match in c_binarray
    else
        %disp('match found!')
        matchlen_bin = StrToBin(matchlen - 1);
        while length(matchlen_bin)<4
            matchlen_bin = [0,matchlen_bin];
        end
        matchindx_bin = StrToBin(matchindx - 1);
        while length(matchindx_bin)<8
            matchindx_bin = [0,matchindx_bin];
        end
        c_binarray = [c_binarray, 1, matchindx_bin, matchlen_bin];
        i = i+(7*matchlen);
    end
end
end

