getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()



round_correct = function(x) {trunc(x+0.5)}


CNVs_mean_84_count=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count.txt", as.is=T, header=T)
apply(CNVs_mean_84_count,2,function(x) {any(is.na(x))})

#convert_to_int=apply( CNVs_mean_84_count[,3:ncol(CNVs_mean_84_count)], 2, trunc)

for (i in 1:nrow(CNVs_mean_84_count))
    
    {
        
        CHR=CNVs_mean_84_count[i,1]
        gene=CNVs_mean_84_count[i,2]
        v=CNVs_mean_84_count[i,3:ncol(CNVs_mean_84_count)]
        v2= round_correct(v)
        convert_to_int=data.frame(CHR, gene, v2)
        write.table(convert_to_int, "CNVs_mean_84_count_convert_to_int.txt", append=T, col.names=T, row.names=T)


    }


#convert_to_int=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_convert_to_int.txt", as.is=T, header=T)









#apply(convert_to_int,2,function(x) {any(is.na(x))})

#write.table(convert_to_int, "CNVs_mean_84_count_convert_to_int.txt",col.names=T, row.names=T)

