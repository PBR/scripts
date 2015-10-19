getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()


list_files=dir (pattern='.*lm_Lyc_1_VS_Gr_.*samples-2_BH.txt')

print (list_files)

for (i in 1:length(list_files)) 
    {
        lm_result=read.table (list_files [[i]] , as.is=T, header=T, row.names=NULL)

        head(lm_result)

        apply(lm_result,2,function(x) {any (is.na(x))})

        lm_result_subset =lm_result [lm_result$t.pval.bh<0.05 & abs(lm_result$dif_mean) >=2, ]

        write.table(lm_result_subset,file=paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_F-Change_signif.txt"),row.names=F)

    }


