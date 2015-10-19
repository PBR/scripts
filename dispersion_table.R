
setwd('/media/bulk_01/users/goryu003/samples/')

CNVs_named=read.table ("/media/bulk_01/users/goryu003/samples/cn.mops_exon_named_final-8.txt", as.is=T, header=T)

head(CNVs_named)

head (CNVs_named$Exon_name)
head (CNVs_named$X84)
CNVs_named[1,]
CNVs_named[1,6:89 ]
is.numeric( CNVs_named[1,6:89 ])
as.numeric(CNVs_named[1,6:89 ])



gene_name=CNVs_named$Exon_name[1]
df_total=CNVs_named[1,]
for(i in 2:nrow(CNVs_named))
    {
        if (gene_name==CNVs_named$Exon_name[i])
            {
                df_1=CNVs_named[i,]
                df_total=rbind(df_total,df_1)
            }
        else if (gene_name!=CNVs_named$Exon_name[i])
            {
                CNV_only=df_total[,6:89 ]
                max_value_1=apply(CNV_only,2,max)
                min_value_1=apply(CNV_only,2,min)
                max_value_2=as.numeric(max_value_1)
                min_value_2=as.numeric(min_value_1)
                disper= max_value_2-min_value_2 
                df_CNV_dispersion=data.frame(disper)
                df_CNV_dispersion$exon_number=nrow<-nrow(CNV_only)
                df_CNV_dispersion$gene<-gene_name
                write.table(df_CNV_dispersion,"exon_cnv_dispersion_whole_set.txt",append=T,col.names=F, row.names=F)
                df_total=CNVs_named[i,]
                gene_name=CNVs_named$Exon_name[i]

            }
  
    }
CNV_only=df_total[,6:89]
max_value_1=apply(CNV_only,2,max)
min_value_1=apply(CNV_only,2,min)
max_value_2=as.numeric(max_value_1)
min_value_2=as.numeric(min_value_1)
disper= max_value_2-min_value_2
df_CNV_dispersion=data.frame(disper)
df_CNV_dispersion$exon_number=nrow<-nrow(CNV_only)
df_CNV_dispersion$gene<-gene_name
write.table(df_CNV_dispersion,"exon_cnv_dispersion_whole_set.txt",append=T,col.names=F, row.names=F)
