library(RColorBrewer)
tmp = read.table("~/Desktop/myFiles/DV_modeling/data/real_KO_wt.txt")

myCol=unique(c(brewer.pal(12,'Paired'),brewer.pal(6,'Dark2')))
Opt_dl2C= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_dl2C.tsv",header = 1)
Opt_dl3site= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_dl3sites.tsv",header = 1)
Opt_vnd= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_vnd.tsv",header = 1)
Opt_sna= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_sna.tsv",header = 1)
Opt_cic= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_cic.tsv",header = 1)
Opt_zld= read.table("~/Desktop/myFiles/crm-SNPs/DV_modeling/data/Out_Opt_zld.tsv",header = 1)



par(mar=c(2,2,2,2))
par(mfrow=c(2,3))
par(pty='s')
UB = 1.2
E = aggregate(Opt_dl2C,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[3,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[3])


E = aggregate(Opt_vnd,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[7,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[7])

E = aggregate(Opt_sna,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[6,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[6])


E = aggregate(Opt_cic,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[5,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[5])


E = aggregate(Opt_dl3site,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[2,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[2])


E = aggregate(Opt_zld,by=list(ensemble_scaled$V14),mean)
matplot(t(rbind(E[,-c(1:2)],tmp[4,],tmp[1,])),
        type='l',lty = 1,lwd = c(rep(2,18),5,2),
        col=c(myCol,'green','black'),ylab="",ylim = c(0,UB),main= rownames(tmp)[4])
