getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()




lm_result=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm_4_groups-2.txt", as.is=T, header=T, row.names=NULL)

head(lm_result)
apply(lm_result,2,function(x) {any (is.na(x))})



head(lm_result$F.pvalue)


F.pvalue.bh = p.adjust(lm_result$F.pvalue, m='BH')

head(F.pvalue.bh)

lm_result_ajust=cbind(lm_result, F.pvalue.bh)


lm_result_ajust_sign=lm_result_ajust [lm_result_ajust$F.pvalue.bh<0.05 & (lm_result_ajust$t.pval_Arc<0.05 | lm_result_ajust$t.pval_Erio<0.05 | lm_result_ajust$t.pval_Neo<0.05), ]

#table(lm_result_ajust$pv.bh<0.05)

#table(lm_result_ajust$t.pval<0.05)



write.table(lm_result_ajust_sign,"CNVs_mean_84_count_lm_4_groups-2_BH_sign.txt")

