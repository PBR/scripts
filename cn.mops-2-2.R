getwd()
setwd('/media/bulk_01/users/goryu003/samples')
ls()



library(cn.mops)

#BAMFiles <- list.files(pattern=".bam$")
#BAMFiles




#names=1:length(BAMFiles)
#segments <- read.table("/media/bulk_01/users/goryu003/samples/exon_subset_whole_tomato.bed",sep=" ",as.is=TRUE)
segments <- read.table("ITAG2.3_gene_models_ch04_0-5M-3_test.bed",sep="\t",as.is=TRUE)


gr <- GRanges(segments[,1],IRanges(segments[,2],segments[,3]))
gr[isUnique(gr)]

#count <- getSegmentReadCountsFromBAM(BAMFiles,GR=gr,mode="paired",sampleNames=names, parallel=10)
#resCNMOPS <- cn.mops(count, minWidth=1, parallel=10)
#resCNMOPS <- calcIntegerCopyNumbers(resCNMOPS)
#gr_new_table=as.data.frame(gr_new)
#write.table(gr_new_table, "/media/bulk_01/users/goryu003/samples/gr_new.txt", row.names=F)
