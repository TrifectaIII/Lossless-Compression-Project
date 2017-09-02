function [comp_ratio] = lz77comptest( inputstr )

inputbin = StrToBin(inputstr);

comp = lz77compress(inputbin);

%disp(['Length of input: ',num2str(length(inputbin))])
%disp(['Length of compressed input: ',num2str(length(comp))])
%disp(['Length of no-match compressed input: ',num2str((8/7)*length(inputbin))])

real_input_len = (8/7)*length(inputbin);
comp_ratio = real_input_len/length(comp);

decomp = lz77decompress(comp);

%disp(['Length of decompressed input: ',num2str(length(decomp))])

decompstr = BinToStr(decomp);
if decompstr ~= inputstr
    disp('FAILURE: NO MATCH')
    disp(['decompressed input: ',decompstr])
    
real_input_len = (8/7)*length(inputbin);
comp_ratio = real_input_len/length(comp);
end

