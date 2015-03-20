library(broman)
library(magrittr)

load("~/Projects/Attie/GoldStandard/FinalData/hypo_mlratio_final_old.RData")

hypo.mlratio <- t(hypo.mlratio)
med <- apply(hypo.mlratio, 2, median, na.rm=TRUE)
o <- med %>% order %>% rev
hypo.mlratio <- hypo.mlratio[,o]
med <- med[o]

png("../Figs/many_boxplots.png", height=600, width=900, pointsize=20)
par(mar=c(4.1, 4.1, 0.6, 0.6))
linecol <- brocolors("crayons")[c("Denim", "Bittersweet", "Shamrock", "Blush")]
manyboxplot(hypo.mlratio, probs=c(0.01, 0.05, 0.1, 0.25), ylim=c(-1,1), dotcol=NULL,
            xlab="Array", ylab="mlratio", yat=c(-1, -0.5, 0, 0.5, 1),
            xat=c(1, 100, 200, 300, 400),
            vlines.col="gray70", vlines.lwd=3,
            linecol=linecol, yaxs="i")
lines(med, col="black")
dev.off()
