function [ec, eo] = extract_epochs(S, trig, Fs, epoch_length)

discard = 2 * Fs;
samples = epoch_length * Fs;
N_epochs = 0;

for i = 1:floor((length(trig)-1)/2)
    ec_raw = S(trig(2*i)+discard:trig(2*i+1)-discard,1:16);
    eo_raw = S(trig(2*i+1)+discard:trig(2*i+2)-discard,1:16);

    maxlen = min(length(ec_raw), length(eo_raw));
    N_loop = floor(maxlen / samples);

    for j = 1:N_loop
        N_epochs = N_epochs + 1;
        ec{N_epochs} = ec_raw((j-1)*samples+1:j*samples,:);
        eo{N_epochs} = eo_raw((j-1)*samples+1:j*samples,:);
    end
end
end
