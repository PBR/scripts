library(BiocGenerics, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")


library(AnnotationDbi, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(GO.db, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()

SGN_annotation=read.table ('ITAG2.4.go.csv', as.is=T, header=T)
GOs_universe=SGN_annotation$GOID
Obsolete_L=as.list(GOOBSOLETE) 
v=sapply(Obsolete_L, function(f){f@GOID})
not_obsolete=GOs_universe[!(GOs_universe %in% v)]




#apply(CNVs_mean_84_count,2,function(x) {any (is.na(x))})


#length(v)
#is.character(v)
#results=data.frame(CHR=character(), Gene=character(), F.pvalue=integer(), t.pval=integer(), stringsAsFactors=FALSE)
#GO_terms=c("GO:0008150", "GO:0000012", "GO:1903823")
GO_terms=c('GO:0008150')

parents=c()

distances=c()

GOs=c()

for (i in 1:length(GO_terms)) 
    
    {
        #print (GO_terms[i])
        dist=0
    
    
        if (GO_terms[i]=='GO:0008150' | GO_terms[i]=='GO:0005575' | GO_terms[i]=='GO:0003674')

            {


                GOs=c(GOs,GO_terms[i])
                distances=c(distances,dist)
                next

            }

        else
            {

                if (length(GOBPPARENTS[[GO_terms[i]]])!=0)
            
                    {
                 
                        parents=append(parents,GOBPPARENTS [[GO_terms[i]]])
            
                    }


                if (length(GOCCPARENTS[[GO_terms[i]]])!=0)
            
                    {
                
                        parents=append(parents,GOCCPARENTS[[GO_terms[i]]])
            
                    }


                if (length(GOMFPARENTS[[GO_terms[i]]])!=0)

                    {

                        parents=append(parents,GOMFPARENTS[[GO_terms[i]]] )
                    }
    
                parents=append(parents,"Label")
                #print(parents)
                dist=dist+1 

                while(TRUE)
                                
                    {

                        term=parents[1]
                        print(term)
                        if (term=='GO:0008150' | term=='GO:0005575' | term=='GO:0003674')
                            
                            {
                
                    
                                GOs=c(GOs,GO_terms[i])
                                distances=c(distances,dist)
                                break

                            }
                

                        else if (term=='Label')
                
                            {

                                dist=dist+1
                                parents=append(parents,"Label")
                                parents=tail(parents,-1)


                            }

            
            
                        else
            
                            {
                
                                if (length(GOBPPARENTS[[term]])!=0)
                            
                                    {
                                
                        
                                        parents=append(parents,GOBPPARENTS[[term]])

                                    }


                                if (length(GOCCPARENTS[[term]])!=0)
                            
                                    {
                        
                                        parents=append(parents,GOCCPARENTS[[term]])

                                    }


                                if (length(GOMFPARENTS[[term]])!='NULL')
                            
                                    {
                                
                                        parents=append(parents,GOMFPARENTS[[term]])

                                    }
                
                                parents=tail(parents,-1)
                                #print (parents[1])

                            }
    
                    }    
    
            }
    
    }





df=data.frame(GOs,distances)

write.table (df, "GOs_shortest_dist.txt")


#x=read.table("/media/bulk_01/users/goryu003/samples/CNVs_mean_84_count_lm.txt", as.is=T, header=T)

#x$F.pvalue




