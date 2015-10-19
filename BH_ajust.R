getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()


list_files=dir (pattern='.*lm_Lyc_1_VS_Gr_.*samples-2.txt')

print (list_files)

for (i in 1:length(list_files)) 
    {
        lm_result=read.table (list_files [[i]] , as.is=T, header=T, row.names=NULL)

        head(lm_result)
        apply(lm_result,2,function(x) {any (is.na(x))})



        head(lm_result$t.pval)


        t.pval.bh = p.adjust(lm_result$t.pval, m='BH')

        head(t.pval.bh)

        lm_result_ajust=cbind(lm_result, t.pval.bh)


#lm_result_ajust_sign=lm_result_ajust [lm_result_ajust$t.pval.bh<0.05, ]
#lm_result_ajust_sign_ord=lm_result_ajust_sign[order(lm_result_ajust_sign$dif_mean),]
#table(lm_result_ajust$pv.bh<0.05)

#table(lm_result_ajust$t.pval<0.05)



#write.table(lm_result_ajust,"CNVs_mean_84_count_lm_Lyc_1_VS_Gr_4_3_5-samples-2_BH.txt",row.names=F)

        lm_result_ajust_sign_minus=lm_result_ajust [lm_result_ajust$t.pval.bh<0.05 & abs(lm_result_ajust$dif_mean) >=2, ]

        write.table(lm_result_ajust_sign_minus,file=paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_map.txt"),row.names=F)

    }


