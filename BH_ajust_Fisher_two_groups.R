getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()





Fisher_result=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_convert_to_int-2_F_4_groups-2.txt", as.is=T, header=T, row.names=NULL)

head(Fisher_result)
apply(Fisher_result,2,function(x) {any (is.na(x))})



head(Fisher_result$F.pvalue)


F.pvalue.bh = p.adjust(Fisher_result$F.pvalue, m='BH')

head(F.pvalue.bh)

Fisher_result_ajust=cbind(Fisher_result, F.pvalue.bh)


Fisher_result_ajust_sign= Fisher_result_ajust [Fisher_result_ajust$F.pvalue.bh<0.05, ]

#table(lm_result_ajust$pv.bh<0.05)

#table(lm_result_ajust$t.pval<0.05)



write.table(Fisher_result_ajust_sign,"CNVs_mean_84_count_convert_to_int-2_F_4_groups-2_BH_signif.txt")

