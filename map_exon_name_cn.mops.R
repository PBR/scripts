#dir()
getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()




#segments <- read.table("/media/bulk_01/users/goryu003/samples/exon_subset_whole_tomato_nonunique.bed",sep=" ",as.is=TRUE)

#CNVs <- read.table ("/media/bulk_01/users/goryu003/samples/CNV_exons_84_samples.txt", as.is=T) 


#cn.mops_exon_named <- merge (CNVs, segments, by.x=c(1,2,3), by.y=c(1,2,3), all.x=T, all.y=T )



#write.table ( cn.mops_exon_named, "cn.mops_exon_named_final.txt") 
#head(segments)



#head(CNVs)

#CNVs_named=read.table ("/media/bulk_01/users/goryu003/samples/cn.mops_exon_named_final-5.txt", as.is=T, header=F)
#str(CNVs_named)
#ncol (CNVs_named)

#head(CNVs_named)
#apply(CNVs_named,2,function(x) {any (is.na(x))})


#CNVs_named$Exon_name


#names=CNVs_named[1,]
#colnames(CNVs_named) <- names

#write.table (CNVs_named , "cn.mops_exon_named_final-6.txt", row.names=F)



#head(CNVs_named)
#CNVs_named_2= CNVs_named[2:nrow(CNVs_named),-1]



#head(CNVs_named_2)





#write.table (CNVs_named_2 , "cn.mops_exon_named_final-6.txt")

convert_to_int=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_convert_to_int-2.txt", as.is=T, header=T)

apply(convert_to_int,2,function(x) {any(is.na(x))})

head(convert_to_int)



#CNVs_named=read.table ("/media/bulk_01/users/goryu003/samples/cn.mops_exon_named_final-8.txt", as.is=T, header=T)

#head(CNVs_named)
#apply(CNVs_named,2,function(x) {any (is.na(x))})
#head(CNVs_named$seqnames)
#head(CNVs_named$Exon_name)
#head(CNVs_named[,6:89])
#CNVs_mean_84_count=aggregate(CNVs_named[,6:89], by=list(CHR=CNVs_named$seqnames,Gene=CNVs_named$Exon_name), FUN=mean)

#CNVs_most_freq_84_count=aggregate(CNVs_named[,6:89], by=list(CHR=CNVs_named$seqnames,Gene=CNVs_named$Exon_name), FUN=function(x) names(which.max(table(x))) )
#head(CNVs_most_freq_84_count)
#write.table ( CNVs_most_freq_84_count, "CNVs_most_freq_84_count.txt")
#head(CNVs_named[order(CNVs_named$Exon_name),])
#CNVs_named_2=CNVs_named[order(CNVs_named$Exon_name),]


#write.table (CNVs_named_2 , "cn.mops_exon_named_final-8.txt")

#length(CNVs_named[,90])



#CNVs_named$Exon_name


#head (CNVs_named$X84)
#apply(CNVs_named,2,function(x) {any (is.na(x))})


#rownames(CNVs_named) <- seq(1:nrow(CNVs_named))
#head(CNVs_named)

#write.table (CNVs_named , "cn.mops_exon_named_final-7.txt", row.names=F)

#CNVs_named[1,]
#disper=read.table ("/media/bulk_01/users/goryu003/samples/exon_cnv_dispersion_whole_set.txt", as.is=T, header=T)
#head(disper)
#head(disper[,1])
#apply(disper,2,function(x) {any (is.na(x))})



#png( "dispersion_whole_set.png", width = 1980, height = 980)
#hist(disper[,1],col="white",name='Dispersion of CNVs cn.mops predictions for different exons of same gene', breaks=200)
#dev.off()


#table (disper[,1])


