# EEG Eyes Open/Closed Classification

A MATLAB project for classifying EEG signals to distinguish between eyes-open and eyes-closed states using alpha band power features.

## Features

- Load and process BDF/EDF EEG files
- Extract epochs based on experimental triggers
- Compute power spectral density (PSD) features
- Train and evaluate LDA and Naive Bayes classifiers
- Cross-validation for model assessment

## Requirements

- MATLAB R2019b or later
- EEGLAB (tested with version 2021.1)
- Biosig plugin (version 3.7.9 or later)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/serabostan/eeg-eyes-open-closed
cd eeg-classification
```

2. Install EEGLAB:
   - Download from [EEGLAB website](https://sccn.ucsd.edu/eeglab/download.php)
   - Install to `/Applications/eeglab2021.1` (Mac) or update the path in `main.m`

3. Ensure Biosig plugin is installed within EEGLAB plugins folder

4. Add your EEG data files (.bdf format) to the `data/` directory

## Project Structure

```
eeg-classification/
├── main.m                 # Main analysis script
├── src/
│   ├── load_eeg_files.m
│   ├── extract_triggers.m
│   ├── extract_epochs.m
│   ├── compute_psd_2hz.m
│   └── train_classifiers.m
├── utils/                 # Utility functions
├── data/                  # EEG data files (.bdf)
│   ├── c30o30_s7_t1.bdf
│   └── c30o30_s7_t2.bdf
├── results/               # Output results and figures
├── README.md
├── LICENSE
└── .gitignore
```

## Usage

1. Update the file paths in `main.m`:
```matlab
addpath('/Applications/eeglab2021.1');  % Update to your EEGLAB path

fnames = {
    'data/your_file1.bdf'
    'data/your_file2.bdf'
};
```

2. Run the main script:
```matlab
main
```

3. Results will display classification accuracy:
```
LDA CV error: 0.00 %
NB  CV error: 0.00 %
```

## Parameters

Key parameters you can adjust in `main.m`:

- `epoch_length`: Duration of each epoch in seconds (default: 24)
- `Fs`: Sampling frequency in Hz (default: 512)
- `Ei`: Electrode index for feature extraction (default: 2)

## Algorithm Overview

1. **Data Loading**: Load BDF files using Biosig's `pop_biosig` function
2. **Trigger Extraction**: Identify experimental condition markers
3. **Epoch Extraction**: Segment continuous data into eyes-open and eyes-closed epochs
4. **Feature Extraction**: Compute alpha band (8-12 Hz) power spectral density
5. **Classification**: Train LDA and Naive Bayes classifiers with cross-validation

## Results

The classifiers achieve excellent performance distinguishing eyes-open from eyes-closed states using alpha band power features, as alpha rhythms are strongly modulated by eye state.
