function [ u_binarray ] = lz77decompress( c_binarray )
% Takes a binary array which contains compressed info and uncompressed the info, returing a binary array of uncompressed data.
i = 1;
u_binarray = [];
while i<length(c_binarray)
    % if a single character, simply add ascii data to uncompressed array
    if c_binarray(i) == 0
        u_binarray = [u_binarray,c_binarray(i+1:i+7)];
        i = i+8;
    % if a repeat marker, convert info to dec and copy data from correct location into uncompressed array
    elseif c_binarray(i) == 1
        matchindx = BinToDec(c_binarray(i+1:i+8))+1;
        matchlen = BinToDec(c_binarray(i+9:i+12))+1;
        j = length(u_binarray) - (matchindx*7);
        while matchlen >0
            u_binarray = [u_binarray, u_binarray(j+1:j+7)];
            j = j+7;
            matchlen = matchlen-1;
        end
        i = i+13;
    end
end
end

