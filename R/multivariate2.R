load("~/Docs/Papers/IsletChr6/eQTLscans/eqtl_results.RData")
rn <- rownames(maxlodadipose)
maxlod <- maxlod$adipose[,10]
maxpos <- maxpos$adipose[,10]
wh <- rn[maxlod > 80 & maxpos > 48 & maxpos < 58]

load("~/Projects/Attie/GoldStandard/FinalData/adipose_mlratio_final.RData")
load("~/Projects/Attie/GoldStandard/FinalData/aligned_geno_with_pmap.RData")
library(lineup)
id <- findCommonID(f2g$pheno$MouseNum, rownames(adipose.mlratio))
f2g <- f2g[10,id$first]
adipose.mlratio <- adipose.mlratio[id$second,wh]

g <- pull.geno(fill.geno(f2g, err=0.002, map.func="c-f"))
map <- pull.map(f2g)[[1]]
pos <- which(map > 43 & map < 63)
ng <- apply(g[,pos], 1, lenuniq)
nonrec <- (ng==1)
rec <- (ng>1)
gg <- g[,pos[1]]
gg[rec] <- 4

probes <- c("506061", "10003837396")

png("../Figs/multivariate2.png", height=600, width=1000, pointsize=24)
par(mfrow=c(1,2),
    las=1, pty="s", bg="#181818", col.axis="white",
    col.lab="white",cex.axis=0.95,
    mar=c(3.1, 4.1, 1.1, 1.1))

# big separation between groups
col <- c("#c71585", "#3cb371", "#007fff", "#ffff00")
grayplot(adipose.mlratio[,probes[1]],
         adipose.mlratio[,probes[2]], cex=0.8,
         pch=21, bg=col[gg],
         xlab=paste("gene", "E"),
         ylab=paste("gene", "F"))
coltext <- c("#c71585", "#1c9351", "#007fff", "#dfdf00")
#text(-0.1, -0.5,  "AA", col=col[1], adj=c(0, 0.5))
#text(-0.09,  0.02, "AB", col=coltext[2], adj=c(1, 0.5))
#text( 0.03,  0.22, "BB", col=col[3], adj=c(1, 0.5))
dev.off()
