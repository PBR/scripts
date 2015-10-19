getwd()
#setwd('/media/bulk_01/users/goryu003/samples/')
ls()


#GO=read.table("ITAG2.3_desc_and_GO.txt", as.is =T,header=T )

setwd('/media/bulk_01/users/goryu003/samples/topGO_ITAG2.3/GOs_compare')


enrichment_list = dir (pattern='.+_name-2.txt')


print(enrichment_list)


#for (i in 1:length(GOI_list)) 
#    {
#        n=0
#        print(z)
#        print(n)
#        while (n<3)
#            {
#                ROI_df=read.table (GOI_list[[i]],as.is=T, header=T)
#                df=read.table (enrichment_list[[z]],as.is=T, header=T)
#                print (GOI_list[[i]])
#                print (enrichment_list[[z]])
#                #print(head (ROI_df))
#                #print(head (df))
                
#                map=merge (ROI_df, df, by.x=c("Polypeptide.ID"), by.y=c("Genes"), all.x=F, all.y=F)
#                print(map)
#                write.table(map, paste(sep="",strsplit(enrichment_list [[z]], "\\.")[[1]][1],"HR_annotation.txt"))
#                n=n+1
#                z=z+1
#            }
        



#    }


