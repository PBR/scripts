setwd('/media/bulk_01/users/goryu003/samples')
library(cn.mops)

X <- read.table("CNV_exons_84_samples_read_count_matrix.txt",sep=" ", header=TRUE, as.is=TRUE)
Xgr <- GRanges(X$seqnames,IRanges(X$start,X$end),values=X[,-(1:5)])
gr <- GRanges(X$seqnames,IRanges(X$start,X$end))
Xgr <- Xgr[isUnique(gr)]

result <- cn.mops(Xgr,parallel=10)
result <- calcIntegerCopyNumbers(result)


count_table=as.data.frame(integerCopyNumber(result))



write.table(count_table, "/media/bulk_01/users/goryu003/new_cn.mops_CNVs_count.txt", row.names=F)
