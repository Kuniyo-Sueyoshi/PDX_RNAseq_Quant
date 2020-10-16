#!/bin/zsh
# Environment; zsh 5.0.2 (x86_64-redhat-linux-gnu)
# Reference:
# Patro, R., Duggal, G., Love, M.I., Irizarry, R.A., and Kingsford, C. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nat. Methods 14, 417–419.
# ref.hg.fa: the human whole transcriptome (GENCODE, release 27, GRCh38.p10)
# ref.mm.fa: the mouse whole transcriptome (GENCODE, release M15, GRCm38.p5) 


### ref-index
cat ref.hg.fa ref.mm.fa > allo.fa
salmon index -t allo.fa -i idx.allo.salmon --type quasi -k 31

### quant
dirs=`find /DIRECTORY_TO_PDX_SEQDATA/ -type d`
for dir in $dirs
do
    outdir="./SET_DIRECTORY_NAME_FOR_OUTPUT"
    files_R1=`find ${dir} -type f -name "*R1*fastq.gz"
    files_R2=`find ${dir} -type f -name "*R2*fastq.gz" 

    ### Execution
    salmon quant -i idx.allo.salmon -l A -1 $files_R1 -2 $files_R2 -o ${outdir}

    ### split human - mouse transcriptome
    head -n1 ${outdir}/quant.sf > header
    # human(tumor)
    grep "ENST" ${outdir}/quant.sf > hg.quant.sf
    cat header hg.quant.sf > ${outdir}/quant_hg.sf
    # mouse(stroma)
    grep "ENSMUST" ${outdir}/quant.sf > mm.quant.sf
    cat header mm.quant.sf > ${outdir}/quant_mm.sf
done
