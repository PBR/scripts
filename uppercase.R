getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()


res_list = dir(pattern = ".*_annotation.txt")

enrich_list = dir (pattern = ".*_GOHR_annotation.txt")



z=1


for (r in 1: length (res_list))
    {
        Stat_df=read.table ( res_list[[r]],as.is=T, header=T)
        
        n=0
        
        while (n<3)
            {
                BP_df=read.table ( enrich_list[[z]],as.is=T, header=T)
                
                z=z+1

                n=n+1
                
                CC_df=read.table ( enrich_list[[z]],as.is=T, header=T)

                z=z+1
                
                n=n+1

                MF_df=read.table ( enrich_list[[z]],as.is=T, header=T)

                BP_v = BP_df$Polypeptide.ID

                CC_v = CC_df$Polypeptide.ID

                MF_v = MF_df$Polypeptide.ID

                GO_v = unique (c (BP_v, CC_v, MF_v))

                for (i in 1:length(GO_v))
                    
                    {
                        Stat_df[Stat_df==GO_v[i]<- toupper(GO_v[i])

                    }

                write.table (Stat_df, paste (sep="", strsplit (res_list[[r]], "\\."), "_upper.txt"))
                
                
                z=z+1
                
                n=n+1

            }

    }





