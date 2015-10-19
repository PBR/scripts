

library(BiocGenerics, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")


library(AnnotationDbi, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(GO.db, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

getwd()
setwd('/media/bulk_01/users/goryu003/samples/')
ls()









GOs=c()









while(TRUE)
        
    {
        parents=c("GO:0008150")
        term=parents[1]
        print(term)
        if (term=='GO:0008150' | term=='GO:0005575' | term=='GO:0003674')
            {
                #GOs=c(GOs,GO_terms[i])
                #distances=c(distances,dist)
                break
            }
    }
