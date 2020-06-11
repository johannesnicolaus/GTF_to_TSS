# GTF_to_TSS
Extract TSS from ENSEMBL GTF FILE

Contains 2 scripts:
GTF_to_TSS.sh: extract transcription start site
GTF_to_translation_start.sh: extract translation start site

This shell script takes ENSEMBL GTF file as input, filters GTF for transcript/coding sequence, and then scans if the start site is at the forward or reverse strand. The start coordinates will be extracted for forward strand the end coordinates will be extracted for the reverse strand for the determination of start site. Start and end of the start site is then calculated by subtracting and adding 1000bp respectively, resulting in the 2kb width of the start site.

## Usage
./GTF_to_TSS.sh xxx.GTF yyy.bed

./GTF_to_translation_start.sh xxx.GTF yyy.bed


## Output
The output of the file is a tab delimited bed file consisting of 5 columns:
1. Chromosome number (chr)
2. Calculated start position (start)
3. Calculated end position (end)
4. ENSEMBL gene id (ensembl_gene_id)
5. ENSEMBL transcript id (ensembl_transcript_id)
