getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()





CNVs_mean_84_count=read.table ("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count.txt", as.is=T, header=T)

head(CNVs_mean_84_count)
apply(CNVs_mean_84_count,2,function(x) {any (is.na(x))})


head(CNVs_mean_84_count$CHR)
head(CNVs_mean_84_count$Gene)

head(CNVs_mean_84_count[1,3:86])
head(CNVs_mean_84_count[1,])


v=rep("Lycopersicon",22)
v=c(v,"Eriopersicon")
v=c(v,rep("Lycopersicon",23))
v=c(v,rep("Arcanum",2))
v=c(v,rep("Lycopersicon",3))
v=c(v,rep("Arcanum",4))
v=c(v, rep("Eriopersicon", 12))
v=c(v,rep("Neolycopersicon",2))
v=c(v,"Eriopersicon")
v=c(v,rep("Lycopersicon",14))

length(v)


#results=data.frame(CHR=character(), Gene=character(), F.pvalue=integer(), t.pval=integer(), stringsAsFactors=FALSE)
fact=factor(v)


for (i in 1:nrow(CNVs_mean_84_count)) 
    {
        table_with_CHR_Gene=CNVs_mean_84_count[i,]

        CHR=table_with_CHR_Gene[1,1]
        gene=table_with_CHR_Gene[1,2]
        table_lm=data.frame(as.numeric(CNVs_mean_84_count[i,3:86]),fact)
        table_lm_3=table_lm[order(table_lm$fact),]
        colnames(table_lm_3)<-c("count","type")
        table_lm_3$type=relevel(table_lm_3$type,ref="Lycopersicon")
        Model <- lm(count ~ type, data = table_lm_3)
        f <- summary(Model)$fstatistic
        print(summary(Model))
        p <- pf(f[1],f[2],f[3],lower.tail=F)
        attributes(p) <- NULL
        print(p)
        coef_table=as.data.frame(summary(Model)$coefficients)
        p.val_Arcanum=coef_table[2,4]
        print(p.val_Arcanum)
        p.val_Eriopers=coef_table[3,4]
        print(p.val_Eriopers)
        p.val_Neolycop=coef_table[4,4]
        print(p.val_Neolycop)

        #p.val=coef_table[2,4]
        results=data.frame(CHR=c(CHR),Gene=c(gene),F.pvalue=c(p),t.pval_Arc=c(p.val_Arcanum ), t.pval_Erio=c(p.val_Eriopers), t.pval_Neo=c(p.val_Neolycop))
        write.table(results,"CNVs_mean_84_count_lm_4_groups.txt",append=T,col.names=T, row.names=T)

    }




#x=read.table("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm.txt", as.is=T, header=T)

#x$F.pvalue




