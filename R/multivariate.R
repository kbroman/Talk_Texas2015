load("~/Projects/Attie/GoldStandard/FinalData/aligned_geno_with_pmap.RData")
load("~/Projects/Attie/GoldStandard/FinalData/islet_mlratio_final.RData")
library(lineup)
id <- findCommonID(rownames(islet.mlratio), f2g$pheno$MouseNum)
f2g <- f2g[,id$second]

marker <- "rs8262456"
g <- pull.geno(fill.geno(f2g[6,], err=0.002, map="c-f"))[,marker]

png("../Figs/multivariate.png", height=600, width=1000, pointsize=24)
par(mfrow=c(1,2), las=1, pty="s", bg="#181818", col.axis="white",
    col.lab="white", cex.axis=0.95,
    mar=c(3.1, 4.1, 1.1, 1.1))

# big separation between groups
col <- c("#c71585", "#3cb371", "#007fff")
probes <- c("10003836371", "10002936186")
grayplot(islet.mlratio[,probes[1]],
         islet.mlratio[,probes[2]], cex=0.8,
         pch=21, bg=col[g],
         xlab=paste("gene", "A"),
         ylab=paste("gene", "B"))
coltext <- c("#c71585", "#1c9351", "#007fff")
text(-0.1, -0.5,  "AA", col=col[1], adj=c(0, 0.5))
text(-0.09,  0.02, "AB", col=coltext[2], adj=c(1, 0.5))
text( 0.03,  0.22, "BB", col=col[3], adj=c(1, 0.5))


# first panel: positively correlated within genotype, but not correlated overall
probes <- c("10002906261", "10003835836")
grayplot(islet.mlratio[,probes[1]],
         islet.mlratio[,probes[2]], cex=0.8,
         pch=21, bg=c("#c71585", "#3cb371", "#007fff")[g],
         xlab=paste("gene", "C"),
         ylab=paste("gene", "D"))
dev.off()
