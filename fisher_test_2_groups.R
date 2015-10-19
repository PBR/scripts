getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()





CNVs_mean_84_count=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_convert_to_int-2.txt", as.is=T, header=T)

head(CNVs_mean_84_count)
apply(CNVs_mean_84_count,2,function(x) {any (is.na(x))})


head(CNVs_mean_84_count$CHR)
head(CNVs_mean_84_count$Gene)

head(CNVs_mean_84_count[1,3:86])
head(CNVs_mean_84_count[1,])



v=rep("S.lycopersicum",22)
v=c(v,"other")
v=c(v,rep("S.lycopersicum",17))
v=c(v,"other","other")
v=c(v,"S.lycopersicum")
v=c(v,rep("other",27))
v=c(v,rep("S.lycopersicum",12))
v=c(v,"other")
v=c(v,"S.lycopersicum")

length(v)
is.character(v)
#results=data.frame(CHR=character(), Gene=character(), F.pvalue=integer(), t.pval=integer(), stringsAsFactors=FALSE)
fact=factor(v)


for (i in 1:nrow(CNVs_mean_84_count)) 
    {
        table_with_CHR_Gene=CNVs_mean_84_count[i,]

        CHR=table_with_CHR_Gene[1,1]
        gene=table_with_CHR_Gene[1,2]
        df=data.frame(as.character(CNVs_mean_84_count[i,3:86]),v)
        colnames(df)<-c("count","type")
        matrix_Fisher=table(df)
        print(matrix_Fisher)
        if (NROW(matrix_Fisher)>1 & NCOL (matrix_Fisher)>1)
            {

                Test=fisher.test(matrix_Fisher)
                results=data.frame(CHR=c(CHR),Gene=c(gene),F.pvalue=Test$p.value)
                write.table(results,"CNVs_mean_84_count_convert_to_int-2_F.txt",append=T,col.names=T, row.names=T)
            }
    }




#x=read.table("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm.txt", as.is=T, header=T)

#x$F.pvalue




