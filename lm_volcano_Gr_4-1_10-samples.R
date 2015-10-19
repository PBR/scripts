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


v=rep("Lycopersicon",37)
v=c(v,rep("Group_4_1_10_samples",10))
#v=c(v,"Eriopersicon")
#v=c(v,rep("Lycopersicon",23))
#v=c(v,rep("Arcanum",2))
#v=c(v,rep("Lycopersicon",3))
#v=c(v,rep("Arcanum",4))
#v=c(v, rep("Eriopersicon", 12))
#v=c(v,rep("Neolycopersicon",2))
#v=c(v,"Eriopersicon")
#v=c(v,rep("Lycopersicon",14))

length(v)


#results=data.frame(CHR=character(), Gene=character(), F.pvalue=integer(), t.pval=integer(), stringsAsFactors=FALSE)
fact=factor(v)


for (i in 1:nrow(CNVs_mean_84_count)) 
    {
        table_with_CHR_Gene=CNVs_mean_84_count[i,]

        CHR=table_with_CHR_Gene[1,1]
        gene=table_with_CHR_Gene[1,2]
        Lycopersicum_v=unname(unlist(table_with_CHR_Gene[,c("X31","X24","X22","X12","X29","X9","X17","X32","X41","X33","X11","X30","X21","X20","X8","X4","X5","X3","X14","X27","X34","X76","X74","X77","X71","X81","X82","X79","X72","X80","X36","X6","X38","X25","X39","X16","X26")]))
        Lycopersicum_v_var=var(as.numeric(Lycopersicum_v)) 
        Lycopersicum_v_mean=mean(as.numeric(Lycopersicum_v))
        Group_4_1_10_samples_v=unname(unlist(table_with_CHR_Gene[,c("X60","X59","X46","X56","X23","X58","X68","X57","X70","X54")]))
        Group_4_1_10_samples_v_var=var(as.numeric( Group_4_1_10_samples_v))
        Group_4_1_10_samples_v_mean=mean(as.numeric( Group_4_1_10_samples_v))
        merged_v=as.numeric(c(Lycopersicum_v,Group_4_1_10_samples_v))
        #print(Lycopersicum_v_mean)
        #print(Group_2_9_samples_v_mean)
        print(merged_v)
        dif_var=abs(Lycopersicum_v_var - Group_4_1_10_samples_v_var)
        dif_mean=(Lycopersicum_v_mean - Group_4_1_10_samples_v_mean)
        #print(dif_mean)
        table_lm=data.frame(merged_v,fact)
        #print(table_lm)
        #print(nrow(table_lm))
        #print(ncol(table_lm))
        #table_lm_3=table_lm[order(table_lm$fact),]
        colnames(table_lm)<-c("count","type")
        table_lm$type=relevel(table_lm$type,ref="Lycopersicon")
        Model <- lm(count ~ type, data = table_lm)
        f <- summary(Model)$fstatistic
        #print(summary(Model))
        p <- pf(f[1],f[2],f[3],lower.tail=F)
        attributes(p) <- NULL
        #print(p)
        coef_table=as.data.frame(summary(Model)$coefficients)
        p.val_Group_4_1_10_samples=coef_table[2,4]
        #print (p.val_Group_2_9_samples)
        F.pvalue=p
        t.pval=p.val_Group_4_1_10_samples
        if (is.na(t.pval))
            {
                t.pval=1
                F.pvalue=1
            }
        #my_df=data.frame(Lycopersicum_v_var,Group_2_9_samples_v_var,dif_var)
        #write.table(my_df,"Variance.txt",append=T,col.names=T, row.names=T)

        results=data.frame(CHR,gene,F.pvalue,t.pval,Lycopersicum_v_var, Group_4_1_10_samples_v_var,dif_var,Lycopersicum_v_mean, Group_4_1_10_samples_v_mean,dif_mean)
        write.table(results,"CNVs_mean_84_count_lm_Lyc_1_VS_Gr_4_1_10-samples.txt",append=T,col.names=T, row.names=T)
         #   }

    }




#x=read.table("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm.txt", as.is=T, header=T)

#x$F.pvalue




