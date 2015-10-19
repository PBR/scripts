getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()


GO=read.table("ITAG2.3_desc_and_GO.txt", as.is =T,header=T )




list_files=dir (pattern='CNVs_mean_84_count_lm_Lyc_1_VS_Gr_[34][_-].*_BH_signif.txt')

for (i in 1:length(list_files))
    {
        df=read.table (list_files[[i]],as.is=T, header=T, row.names=NULL)
        #print (head(df))
        df_order=df[order(df$t.pval.bh),]
        gene=df_order[1:20,2]
        print (df_order[1:20,])
        #print(gene)
        GO.sub=GO [ GO$Polypeptide.ID %in% gene,]
        #print (list_files[i])
        #print (list_files[[i]])
        #a= (paste(sep="",list_files[i],"_2"))
        write.table (file=paste(sep="",list_files[i],"_2"), GO.sub)
    }
#print (list_files[[i]])
    


#lm_result=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm_Lyc_1_VS_Gr_4_3_5-samples-2.txt", as.is=T, header=T, row.names=NULL)

#head(lm_result)
#apply(lm_result,2,function(x) {any (is.na(x))})



#head(lm_result$t.pval)


#t.pval.bh = p.adjust(lm_result$t.pval, m='BH')

#head(t.pval.bh)

#lm_result_ajust=cbind(lm_result, t.pval.bh)


#lm_result_ajust_sign=lm_result_ajust [lm_result_ajust$t.pval.bh<0.05, ]
#lm_result_ajust_sign_ord=lm_result_ajust_sign[order(lm_result_ajust_sign$dif_mean),]
#table(lm_result_ajust$pv.bh<0.05)

#table(lm_result_ajust$t.pval<0.05)



#write.table(lm_result_ajust,"CNVs_mean_84_count_lm_Lyc_1_VS_Gr_4_3_5-samples-2_BH.txt",row.names=F)

#lm_result_ajust_sign=lm_result_ajust [lm_result_ajust$t.pval.bh<0.05 & lm_result_ajust$dif_mean >=2, ]

#write.table(lm_result_ajust_sign,"CNVs_mean_84_count_lm_Lyc_1_VS_Gr_4_3_5-samples-2_BH_signif.txt",row.names=F)


