function psd_2hz = compute_psd_2hz(epochs, Fs)

b_bp = band_pass(Fs);

for i = 1:length(epochs)
    for Ei = 1:16
        x = filter(b_bp, 1, epochs{i}(:,Ei));
        [psd, ~] = pwelch(x, [], [], [], Fs);

        N = length(psd)-1;
        temp = reshape(psd(1:N), N/(Fs/4), []);
        psd_2hz(:,i,Ei) = mean(temp,1);
    end
end
end
