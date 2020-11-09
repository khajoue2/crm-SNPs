#empty ind plot
ind_expr = read.table("../DV_modeling/data/expr.tab",row.names = 1)
plot(as.numeric(ind_expr),bg = 'transparent',
     type = 'l',lwd=3,xaxt='n',yaxt='n',ann=F,bty='n')
plot(as.numeric(ind_expr),bg = 'transparent',
     type = 'l',lwd=3,ann=F,bty='n')

######################################################################################
#Helper Function to make trasnparent colors
adjustcolor <- function(col, alpha.f = 1, red.f = 1, green.f = 1, blue.f = 1, 
                        offset = c(0, 0, 0, 0), transform = diag(c(red.f, green.f, 
                                                                   blue.f, alpha.f))) 
{
  stopifnot(exprs = {
    length(offset)%%4L == 0L
    !is.null(d <- dim(transform))
    d == c(4L, 4L)
  })
  x <- col2rgb(col, alpha = TRUE)/255
  x[] <- pmax(0, pmin(1, transform %*% x + matrix(offset, nrow = 4L, 
                                                  ncol = ncol(x))))
  rgb(x[1L, ], x[2L, ], x[3L, ], x[4L, ])
}

#B WT Optimal models 5K

out = read.table("../DV_modeling/data/ind_wt_5k.txt")

par(pty='s')
myCol = c(rep('magenta',nrow(out)))
matplot(t(rbind(out,as.numeric(ind_expr))),
        type='l',lty = 1,lwd = c(rep(1,nrow(out)),3),
        col=c(adjustcolor(myCol,alpha.f = 0.1),1),ylab="",ylim = c(0,1))