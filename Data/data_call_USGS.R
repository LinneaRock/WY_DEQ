
library(tidyverse)
library(dataRetrieval)

# What data are available at each site? ####
muddycrkparams <- whatNWISdata(siteNumber = "06258000")
fivemilecrkparams <- whatNWISdata(siteNumber = "06253000")
windrvrparams <- whatNWISdata(siteNumber = "06236100")
windrvroutletparams <- whatNWISdata(siteNumber = '06259000')

# Load site data ####
sitedata <- readNWISsite(siteNumbers = c("06258000", "06253000", "06236100", '06259000'))
                         
# Load parameters we want ####
discharge <- readNWISdata(siteNumbers = c("06258000", "06253000", "06236100", '06259000'),
                           parameterCd = '00060',
                           startDate = '2002-01-01')
# chemdat <- readNWISqw(siteNumbers = c("06258000", "06253000", "06236100", '06259000'),
#                           parameterCd = c('00600', '00605', '00608', '00631', '00665','00671'),
#                           startDate = '2002-01-01') #|> readNWISqw will be removed. Need to use the code below to get water qual data from wqp:
#https://cran.r-project.org/web/packages/dataRetrieval/vignettes/qwdata_changes.html
  # mutate(parameter = case_when(param_cd == '00600' ~ 'TN_mgL', 
  #                         param_cd == '00605' ~ 'TON_mgL', 
  #                         param_cd == '00613' ~ 'Wind River Inlet', 
  #                         param_cd == '00631' ~ 'Wind River Outlet',
  #                         param_cd == '00665',
  #                         param_cd == '00671'))


site_ids <- c("06258000", "06253000", "06236100", '06259000')
parameterCd <- c('00010', '00095', '00400','00600', '00605', '00608', '00631', '00665','00671')

chemdata <- readWQPqw(paste0("USGS-", site_ids), parameterCd,
                     startDate = '2002-01-01')
