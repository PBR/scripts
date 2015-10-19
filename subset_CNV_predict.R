
df_total=read.table ("28.04_count_table.txt", as.is=T)

for(i in 1:nrow(df_total))
    {
        v=length(unique(unname(unlist(df_total[i,6:ncol(df_total)]))))
        if (v!=1)
            {
                df_CNV=df_total[i,]
                write.table(df_CNV,"28.04_count_table.txt_cnv.txt",append=T,col.names=F, row.names=F)
            }

    }

