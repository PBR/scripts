getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()


GO=read.table("ITAG2.3_desc_and_GO.txt", as.is =T,header=T )

setwd('/media/bulk_01/users/goryu003/samples/topGO_ITAG2.3')


enrichment_list = dir (pattern='.*_corresponding_overrepresent_.*')


print(enrichment_list)


GOI_list = dir (pattern='.*-Change_signif.txt')

print (GOI_list)






for (i in 1:length(enrichment_list))
    {
        df=read.table (enrichment_list[[i]],as.is=T, header=T)
        print(head(df))
        map=merge (df,GO, by.x=c(2), by.y=c(1),all.x=T, all.y=F)
        write.table(map, paste(sep="",strsplit(enrichment_list [[i]], "\\.")[[1]][1],"HR_annotation.txt"))
    }


