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

df3=read.table("names_5.txt", as.is=T)

v=df3[,2]
is.vector(v)
length(v)
is.character(v)
v[23]

v[41]
v[47:51]
v[68:69]
v[83]


df=CNVs_mean_84_count[,3:ncol(CNVs_mean_84_count)]

colnames(df) <- v
colnames(df)



#png( "test-9.png", width =6 , height =6,units = 'in',res=600, pointsize = 8 )
pdf( "test-9.pdf", width =100 , height =100 )

#image (cor(df))

heatmap(1-cor(df),distfun=function(x){as.dist(x)},symm=F,Rowv=NULL, Colv=NULL,margins=c(68,68),cexRow=7.5,cexCol=7.5)
dev.off()



