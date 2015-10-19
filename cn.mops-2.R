#dir()
getwd()
setwd('/media/bulk_01/users/kaauw001/projects/Tomato_150/reseq/mapped/Heinz')
ls()



library(cn.mops)

BAMFiles <- list.files(pattern=".bam$")
#str(BAMFiles)
#is.list(BAMFiles)
#is.vector(BAMFiles)
BAMFiles




#names=c("Moneymaker","S. Arcanum","S. habrochaites f. glabratum","S. pennellii")
names=1:length(BAMFiles)
segments <- read.table("/media/bulk_01/users/goryu003/samples/exon_subset_whole_tomato_unique.bed",sep=" ",as.is=TRUE)
#segments


gr <- GRanges(segments[,1],IRanges(segments[,2],segments[,3]))
#gr

count <- getSegmentReadCountsFromBAM(BAMFiles,GR=gr,mode="paired",sampleNames=names, parallel=10)
resCNMOPS <- cn.mops(count, minWidth=1, parallel=10)
resCNMOPS <- calcIntegerCopyNumbers(resCNMOPS)
#resCNMOPS
count_table=as.data.frame(integerCopyNumber(resCNMOPS))
#count_table_2=count_table[,c(1:4,6:9)]
write.table(count_table, "/media/bulk_01/users/goryu003/samples/CNV_exons_84_samples.txt", row.names=F)
#source("subset_CNV_predict.R")
#head(count_table_2)
#head(count_table_2[,5])
#head(count_table_2[,5:8])
#source("subset_CNV_predict.R")
#ls()
#bed
#ls()
#dir()
#CNV=read.table("named_cnv.txt",as.is=T)
#CNV_final = merge(CNV,bed,by.x=c(1,2,3),by.y=c(1,2,3),all.x=T,all.y=F)
#head(CNV_final)
#write.table(CNV_final,"CNV_final.txt",row.names=F)
#write.table(CNV_final,"CNV_final.txt",row.names=F,col.names=F)
