#!/bin/bash

# Genotyping
#
# 2017-06-06, M. van Iterson <m.van_iterson@lumc.nl>
RSCRIPT=/usr/lib64/microsoft-r/3.3/lib64/R/bin/Rscript
COHORTS=(PAN LL LLS RS CODAM NTR)
TYPES=(DNAm RNA HRC GoNL)
OUT=/virdir/Backup/RP3_analysis/SwapDetection/

##intra
##$RSCRIPT genotyping.R --typex HRC --cohort ALL --out ${OUT} --filex ${OUT}/HighQualPositions.GCRh37.bed
##$RSCRIPT genotyping.R --typex GoNL --cohort ALL --out ${OUT} --filex ${OUT}/HighQualPositions.GCRh37.bed

##inter
##$RSCRIPT genotyping.R --typex RNA --typey HRC --cohort ALL --out ${OUT} --filex ${OUT}/output.vcf
$RSCRIPT genotyping.R --typex RNA --typey GoNL --cohort ALL --out ${OUT} --filex ${OUT}/output.vcf
##$RSCRIPT genotyping.R --typex DNAm --typey HRC --cohort ALL --out ${OUT}
##$RSCRIPT genotyping.R --typex DNAm --typey GoNL --cohort ALL --out ${OUT} 

for cohort in "${COHORTS[@]}"
do
    echo $cohort
    $RSCRIPT genotyping.R --typex DNAm --cohort $cohort --out ${OUT}
    $RSCRIPT genotyping.R --typex RNA --cohort $cohort --out ${OUT} --filex ${OUT}/output.vcf
done

