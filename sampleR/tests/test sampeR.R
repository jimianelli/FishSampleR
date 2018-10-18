## Main code for merging data from obsint.debriefed_age and debriefed_length for sampler code
# Tasks:
#  [ ] make the indices
getwd()
hdr_age <- read.csv("imported/hdr_age.csv",as.is=T)
hdr_len <- read.csv("imported/hdr_len.csv",as.is=T)
setwd("/Users/jim/_mymods/sampler/ebswp")
library(dplyr)
library(tidyr)
library(lubridate)
library(reshape2)
yr <- 2014

Sampler(yr=2014)
