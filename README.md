# PDX_RNAseq_quantification

The current repository includes codes that were used to quantify gene-level abundance in the study entitled "Systematic analysis of the cancer-stroma interactome of a diverse collection of patient-derived xenografts unveils the unique homeostasis of renal cell carcinoma".  


# salmon.sh
 1. Compute transcript-level abundance (.sf files) by taking mixed seqenced reads data (.fastq) of PDXs as inputs by using Salmon software (version 0.8.1) (Patro et al., 2017) on shell (ZSH_VERSION=5.0.2)
 2. Allocate mixed transcript-level abundance to human or to mouse transcriptomes.


# Tximport.R
 Summarize transcript-level abundance to gene-level abundance by using Tximport (version 1.16.1) (Soneson et al., 2016) package in R (4.0.0)
