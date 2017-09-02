function [ dec ] = BinToDec( bin_array )
%Takes abinary array and returns the decimal number that binary string represents.
bin_str = num2str(bin_array);
dec = bin2dec(bin_str);
end