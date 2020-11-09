library(gplots)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
#A TFs expression profiles

#Plotting the TF expressions
TF_hassan = read.table("../DV_modeling/data/TF_expr.txt",row.names = 1)
y=as.data.frame( t(TF_hassan[1:6,]))
y$bins = 1:50
d <- melt(y, id.vars="bins")
colnames(d) = c('bins','TF','Expression')
ggplot(d,aes(x=bins,y=Expression,colour=TF,group=TF)) + 
  geom_line(aes(linetype =TF),size=2)+
  scale_linetype_manual(values=c("solid","solid", "dashed","solid","solid","solid"))+
  theme_classic()+
  scale_color_brewer(palette="Dark2")+
  theme(axis.text.x=element_blank(),
        axis.title.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
  )
