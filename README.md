# PDX_RNAseq_quantification

The current repository includes codes that were used to quantify gene-level abundance in the study entitled "Systematic analysis of the cancer-stroma interactome of a diverse collection of patient-derived xenografts unveils the unique homeostasis of renal cell carcinoma".  


# Compute transcript-level abundance (.sf files) by taking seqenced reads data (.fastq) as inputs
# By using Salmon software (version 0.8.1) (Patro et al., 2017)
# Shell version: ZSH_VERSION=5.0.2
salmon.sh


# Summarize transcript-level abundance to gene-level abundance
# R version 4.0.0
# R package "Tximport": (version 1.16.1) (Soneson et al., 2016)  
Tximport.R
