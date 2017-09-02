function [ str ] = BinToStr( binarray )
%Takes an uncompressed binary array and returns a string that represents that data.
binarray = binarray + 48;
B_div = char(reshape(binarray,7,[])');
[m,~] = size(B_div);
dec = zeros(1,m);
for i = 1:m
dec(i) = bin2dec(B_div(i,:)); 
end
str = char(dec);

end
