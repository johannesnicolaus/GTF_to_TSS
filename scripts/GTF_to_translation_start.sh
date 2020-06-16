#!/bin/bash

# extract bed files containing coordinates of TSS translation start site of  genome
# example usage GTF_to_TSS.sh x.GTF y.bed

# g is global (replaces all of semicolon)
cat $1 | awk '$3 == "CDS"' | awk '$7 == "+"' | awk '{print $1, $4-1000, $4+1000, $10, $14}' | sed 's/ /\t/g' | sed 's/;//g' > gtf_forward.bed 

cat $1 | awk '$3 == "CDS"' | awk '$7 == "-"' | awk '{print $1, $5-1000, $5+1000, $10, $14}' | sed 's/ /\t/g' | sed 's/;//g' > gtf_reverse.bed

printf "chr\tstart\tend\tensembl_gene_id\tensembl_transcript_id\n" > header.bed

cat ./header.bed ./gtf_reverse.bed ./gtf_forward.bed > $2

# remove files
rm gtf_reverse.bed 
rm gtf_forward.bed
rm header.bed
