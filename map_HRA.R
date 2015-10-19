getwd()
#setwd('/media/bulk_01/users/goryu003/samples/')
ls()




setwd('/media/bulk_01/users/goryu003/samples/')


function_list = dir (pattern='.*_map_map.txt')


print(function_list)


stat_list = dir (pattern='.*_BH_F-Change_signif.txt')

print (stat_list)






#for (f in 1:length(function_list)) 
#    {
#        for (s in 1: length(stat_list))
#            {
#                if (f==s)
#                    {
#                        df_f=read.table(function_list[[f]],as.is=T, header=T)
#                        df_s=read.table(stat_list[[s]],as.is=T, header=T)
#                        map=merge (df_f, df_s, by.x=c("Polypeptide.ID"), by.y=c("Genes"), all.x=F, all.y=F)
#                    }



#                else if (f!=s)
#                    {
#                        next
#                    }
#            }
#    }


