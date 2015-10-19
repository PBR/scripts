getwd()
setwd('/media/bulk_01/users/goryu003/samples')
ls()



#load required packages

library(BiocGenerics, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(AnnotationDbi, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(S4Vectors, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(graph, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(GO.db, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(Rgraphviz, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")

library(topGO, lib.loc="/media/bulk_01/users/goryu003/R/x86_64-pc-linux-gnu-library/3.1/")





#Create list of files to use in loop

list_files=dir (pattern='.*_F-Change_signif.txt')

#Create topGO objects

for (i in 1:length( list_files))

    {
        geneID2GO <- readMappings(file = "GO_2-4.txt",sep="")

        L=lapply(geneID2GO,function(x) {gsub('\"',"",x)})

        geneID2GO=L

        names(geneID2GO)<- gsub('\"',"",names(geneID2GO))

        geneUniverse <- names(geneID2GO)

        tableOfInterest=read.table(list_files[[i]],as.is=T,header=T)

        genesOfInterest=tableOfInterest$gene

        geneList <- factor(as.integer(geneUniverse %in% genesOfInterest))

        names(geneList) <- geneUniverse

        myGOdata_BP <- new("topGOdata", description="My project", ontology="BP", allGenes=geneList,  annot = annFUN.gene2GO, gene2GO = geneID2GO, nodeSize=5)

        print(myGOdata_BP)

        myGOdata_CC <- new("topGOdata", description="My project", ontology="CC", allGenes=geneList,  annot = annFUN.gene2GO, gene2GO = geneID2GO, nodeSize=5)

        print(myGOdata_CC)

        myGOdata_MF <- new("topGOdata", description="My project", ontology="MF", allGenes=geneList,  annot = annFUN.gene2GO, gene2GO = geneID2GO, nodeSize=5)

        print(myGOdata_MF)
        
        #Perform the analysis

        #Biological process

        resultFisher <- runTest(myGOdata_BP, algorithm="weight01", statistic="fisher")

        allRes <- GenTable(myGOdata_BP, weight01Fisher = resultFisher, topNodes = length(resultFisher@score)) 

        print(allRes)

        allRes_2=allRes[as.numeric(allRes$weight01Fisher)<0.05,]

        print(allRes_2)

        write.table(allRes_2,file=paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_BP_enrichment.txt"))

        showSigOfNodes(myGOdata_BP, score(resultFisher), firstSigNodes = 5, useInfo ='all')

        printGraph(myGOdata_BP, resultFisher, firstSigNodes = nrow(allRes_2), fn.prefix = paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_BP_enrichment", useInfo = "all", pdfSW = TRUE))

        myterms=allRes_2[,1]

        mygenes=genesInTerm(myGOdata_BP, myterms)

        mygenes_2=unlist(mygenes)
        
        df=data.frame(gene_name=mygenes_2,GO_term=names(mygenes_2))

        write.table(df, paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"genes_corresponding_overrepresent_BP_GO.txt"))

        rm(resultFisher)

        #Cellular component

        resultFisher <- runTest(myGOdata_CC, algorithm="weight01", statistic="fisher")

        allRes <- GenTable(myGOdata_CC, weight01Fisher = resultFisher, topNodes = length(resultFisher@score))

        print(allRes)

        allRes_2=allRes[as.numeric(allRes$weight01Fisher)<0.05,]

        print(allRes_2)

        write.table(allRes_2,file=paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_CC_enrichment.txt"))

        showSigOfNodes(myGOdata_CC, score(resultFisher), firstSigNodes = 5, useInfo ='all')

        printGraph(myGOdata_CC, resultFisher, firstSigNodes = nrow(allRes_2), fn.prefix = paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_CC_enrichment", useInfo = "all", pdfSW = TRUE))

        myterms=allRes_2[,1]

        mygenes=genesInTerm(myGOdata_CC, myterms)

        mygenes_2=unlist(mygenes)

        df=data.frame(gene_name=mygenes_2,GO_term=names(mygenes_2))

        write.table(df, paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"genes_corresponding_overrepresent_CC_GO.txt"))

        rm(resultFisher)


        #Molecular function

        resultFisher <- runTest(myGOdata_MF, algorithm="weight01", statistic="fisher")

        allRes <- GenTable(myGOdata_MF, weight01Fisher = resultFisher, topNodes = length(resultFisher@score))

        print(allRes)

        allRes_2=allRes[as.numeric(allRes$weight01Fisher)<0.05,]

        print(allRes_2)

        write.table(allRes_2,file=paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_MF_enrichment.txt"))

        showSigOfNodes(myGOdata_MF, score(resultFisher), firstSigNodes = 5, useInfo ='all')

        printGraph(myGOdata_MF, resultFisher, firstSigNodes = nrow(allRes_2), fn.prefix = paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"_MF_enrichment", useInfo = "all", pdfSW = TRUE))

        myterms=allRes_2[,1]

        mygenes=genesInTerm(myGOdata_MF, myterms)

        mygenes_2=unlist(mygenes)

        df=data.frame(gene_name=mygenes_2,GO_term=names(mygenes_2))

        write.table(df, paste(sep="",strsplit(list_files[[i]], "\\.")[[1]][1],"genes_corresponding_overrepresent_MF_GO.txt"))

        rm(resultFisher)



    }   






