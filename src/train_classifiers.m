function results = train_classifiers(features, classes)

lda = fitcdiscr(features, classes);
nb  = fitcnb(features, classes);

cp = cvpartition(classes,'KFold',5);

results.lda_err = kfoldLoss(crossval(lda,'CVPartition',cp));
results.nb_err  = kfoldLoss(crossval(nb,'CVPartition',cp));

results.lda = lda;
results.nb  = nb;
end
