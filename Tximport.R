# Salmon-quantified transcript-level expression data -> gene-level TPM expression data
# R version 4.0.0 (2020-04-24)
# Reference
# Soneson, C., Love, M.I., and Robinson, M.D. (2016). Differential analyses for RNA-seq: transcript-level estimates improve gene-level inferences. F1000Research 4, 1521.

if(!require("tximport")){
  install.packages("tximport")
}
library(tximport)

# In case of tumor(hg) #
files <- file.path("/DIRECTORY_OF_SALMON-SF_FILES", "quant_hg.sf")
tx.exp <- tximport(files, type = "salmon", txOut = TRUE)

# Tx2gene #
# Retrieve Transcript annotations (TxAnno), GeneID, and Biotype from GENCODE whole transcriptome
# The rownames(tx.exp$counts) corresponds the annotation of the whole transcriptome of human (GENCODE, release 27, GRCh38.p10) or mouse (GENCODE, release M15, GRCm38.p5) 

TxAnno <- rownames(tx.exp$counts) 
tx2gene <- data.frame(TXNAME=TxAnno, 
                      GENEID=sapply(strsplit(TxAnno,"\\|"),'[',6), 
                      Biotype=sapply(strsplit(TxAnno,"\\|"),'[',8))

# Extract protein coding genes if needed
logi <- grepl("protein_coding", tx2gene$Biotype)
tx2gene <- tx2gene[logi, ]

# Transcript to Gene #
gene.exp <- summarizeToGene(tx.exp, tx2gene, countsFromAbundance = "lengthScaledTPM")
d <- data.frame(GeneSymbol=rownames(gene.exp$counts), round(gene.exp$counts, digit=3))
write.table(d, "/DIRECTORY/FILENEME", sep = "\t", col.names=TRUE, row.names = FALSE)


