# External Validation of Predictive Models for SSI after Open Lower Extremity Revascularization in NSQIP and VQI national data sets.

## Description
This code was developed for a research project for the external validation of previously published groin surgical site infections after open lower extremity revascularization. The publication is in the process of submission and will be made available once it has completed peer review.

## Structure
The analysis is contained across 4 different .rmd files.  Below are the purpose of each of the files.

1. pad-grnssi-nsip-1select.rmd - This file generates the patient cohort from the original data source file provided by NSQIP.
2. pad-grnssi-nsqip-2val.rmd - This file maps the variables from the previously published models and evaluates model discrimination and calibration within the NSQIP cohort.
3. pad-grnssi-vqi-1select.rmd - This file generates the patient cohort from the original data source file provided by VQI.
4. pad-grnssi-vqi-2val.rmd - This file maps the variables from the previously published models and evaluates model discrimination and calibration within the VQI cohort.
5. Code folder contains scripts that are used across analysis files.  NOTE: Cleaning files that include specific variable names and definitions have been removed and will not be published publicly due to SVS PSO DUA.

## Data
Data for this project was received through a data use agreement with the clinical registry owners and cannot be made publically available.

### National Surgical Quality Imrovement Program (NSQIP)
NSQIP is a clinical registry for outcomes following surgical procedures across many specialties and is managed by the American College of Surgeons.  Data is available for free to any participating center.  Information about accessing national NSQIP data can be found here: https://www.facs.org/quality-programs/data-and-registries/acs-nsqip/participant-use-data-file/

### Vascular Quality Initiative (VQI)
vQI is a clinical registry for outcomes following vascular surgery surgical procedures and is managed by the Society for Vascular Surgery.  Data is available for free to any participating center for projects approved by the Research Advisory Council.  Information about accessing national VQI data can be found here: https://www.vqi.org/svs-vqi-national-arterial-rac-schedule/


## Publications
This analysis has not been published, but we will include relevant publications here.

## Support
For questions related to this code and its use, please contact the senior auther, Dr. Adam Johnson at adam.johnson@duke.edu.

## Session Info
R version 4.4.2 (2024-10-31 ucrt)
Platform: x86_64-w64-mingw32/x64
Running under: Windows 10 x64 (build 19045)

Matrix products: default


locale:
[1] LC_COLLATE=English_United States.utf8  LC_CTYPE=English_United States.utf8   
[3] LC_MONETARY=English_United States.utf8 LC_NUMERIC=C                          
[5] LC_TIME=English_United States.utf8    

time zone: America/New_York
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] Metrics_0.1.4     dbscan_1.2.2      mice_3.17.0       nephro_1.5       
 [5] finalfit_1.0.8    reticulate_1.40.0 lubridate_1.9.4   forcats_1.0.0    
 [9] stringr_1.5.1     dplyr_1.1.4       purrr_1.0.2       readr_2.1.5      
[13] tidyr_1.3.1       tibble_3.2.1      ggplot2_3.5.1     tidyverse_2.0.0  

loaded via a namespace (and not attached):
 [1] gtable_0.3.6      shape_1.4.6.1     bslib_0.9.0       xfun_0.50        
 [5] lattice_0.22-6    tzdb_0.4.0        vctrs_0.6.5       tools_4.4.2      
 [9] Rdpack_2.6.2      generics_0.1.3    pan_1.9           pkgconfig_2.0.3  
[13] jomo_2.7-6        Matrix_1.7-1      lifecycle_1.0.4   compiler_4.4.2   
[17] munsell_0.5.1     codetools_0.2-20  sass_0.4.9        htmltools_0.5.8.1
[21] yaml_2.3.10       glmnet_4.1-8      jquerylib_0.1.4   crayon_1.5.3     
[25] pillar_1.10.1     nloptr_2.1.1      MASS_7.3-61       cachem_1.1.0     
[29] reformulas_0.4.0  iterators_1.0.14  rpart_4.1.23      boot_1.3-31      
[33] foreach_1.5.2     mitml_0.4-5       nlme_3.1-166      tidyselect_1.2.1 
[37] digest_0.6.37     stringi_1.8.4     splines_4.4.2     fastmap_1.2.0    
[41] grid_4.4.2        colorspace_2.1-1  cli_3.6.3         magrittr_2.0.3   
[45] survival_3.7-0    broom_1.0.7       withr_3.0.2       scales_1.3.0     
[49] backports_1.5.0   timechange_0.3.0  rmarkdown_2.29    nnet_7.3-19      
[53] lme4_1.1-36       png_0.1-8         hms_1.1.3         evaluate_1.0.3   
[57] knitr_1.49        rbibutils_2.3     rlang_1.1.4       Rcpp_1.0.13-1    
[61] glue_1.8.0        renv_1.1.4        rstudioapi_0.17.1 minqa_1.2.8      
[65] jsonlite_1.9.0    R6_2.6.1 
