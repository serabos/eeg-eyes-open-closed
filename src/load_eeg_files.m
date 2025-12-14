function [S_all, Fs] = load_eeg_files(fnames)
Fs = 512;
S_all = {};

for fi = 1:length(fnames)
    [S, ~] = sload(fnames{fi});
    S_all{fi} = S;
end
end
