function [ binarray ] = StrToBin( str )
%Takes a string and converts it to the 1d uncompressed binary array it represents.
bin_str = dec2bin(str);

lin_str = reshape(bin_str',1,[]);
binarray  = double(lin_str) - 48;
end