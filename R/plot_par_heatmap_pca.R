library(gplots)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
myCol=c(brewer.pal(12,'Paired'),brewer.pal(6,'Dark2'))

#C Heatmap for wild-type ensemble
OPT.par_scaled = read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/par_wt_scaled.tsv",header = 1)

heatmap.2(as.matrix(OPT.par_scaled[,1:13]),Rowv = NA,Colv = NA,
     density.info = 'none',trace='none',
    dendrogram = 'none',labRow = FALSE,labCol = FALSE)

ensemble_scaled = read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/par_ensemble_scaled.tsv",header=1)
heatmap.2(as.matrix(ensemble_scaled[order(ensemble_scaled$V14),1:13]),Rowv = NA,Colv = NA,
        density.info = 'none',trace='none',
       RowSideColors = myCol[sort(ensemble_scaled$V14)],
      dendrogram = 'none',labRow = FALSE,labCol = FALSE)


sample.groups = ensemble_scaled$V14
pca <- prcomp(ensemble_scaled[,1:13], scale=TRUE)
scores <- data.frame(sample.groups, pca$x[,1:3])
qplot(x=PC1, y=PC2, data=scores, colour=myCol[ensemble_scaled$V14]) +
  theme_bw()+
  labs(colour="Clusters",labels=c(1:18))+
  theme(axis.text.x=element_blank(),
        axis.title.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+
  scale_shape_discrete(labels = c(1:18))
# legend.position="none")

par(pty='s');
plot(pca$x[,1],pca$x[,2],
     col=myCol[ensemble_scaled$V14],
     pch=19,xlab="PC1 43.6%",ylab="PC2 20.9%",cex=0.3)
