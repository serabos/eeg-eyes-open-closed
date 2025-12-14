clc;
clear;

addpath('src')
addpath('utils')

% EEGLab directory
addpath('/Applications/eeglab2021.1');
addpath('/Applications/eeglab2021.1/plugins/Biosig3.7.9/t200_FileAccess/sload.m');
eeglab nogui;

% input data files
fnames = {
    'data/c30o30_s7_t1.bdf'
    'data/c30o30_s7_t2.bdf'
};

epoch_length = 24;
Fs = 512;

% load data files
[S_all, Fs] = load_eeg_files(fnames);

ec = {}; % eyes closed
eo = {}; % eyes open

for i = 1:length(S_all)
    trig = extract_triggers(S_all{i}, Fs);
    [ec_i, eo_i] = extract_epochs(S_all{i}, trig, Fs, epoch_length);

    ec = [ec ec_i];
    eo = [eo eo_i];
end

eo_psd = compute_psd_2hz(eo, Fs);
ec_psd = compute_psd_2hz(ec, Fs);

% Feature selection
Ei = 2;
features = [
    squeeze(eo_psd(5:6,:,Ei))';
    squeeze(ec_psd(5:6,:,Ei))'
];

classes = [repmat("eyes open", size(eo_psd,2),1);
           repmat("eyes closed", size(ec_psd,2),1)];

results = train_classifiers(features, classes);

fprintf('LDA CV error: %.2f %%\n', results.lda_err*100);
fprintf('NB  CV error: %.2f %%\n', results.nb_err*100);
