---
#### Preamble ####
# Purpose: Downloads and saves the data from Toronto Opendata
# Author: Yiyi Feng
# Date: 17 January 2024
# Contact: yiyi.feng@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? Nope
---

```{r}
#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(tictoc)
library(tidyverse)
library(tinytex)
library(usethis)

#### Download data ####

# get package from Toronto Opendata
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
head(package)

# get all resources for this package
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")
head(resources)#show the first six lines of package for checking

# load the first datastore resource as a sample
the_raw_data <- filter(resources, row_number()==1) %>% get_resource()
the_raw_data#show the whole raw data for checking


#### Save data ####
write_csv(
  x = the_raw_data,
  file = "../inputs/data/raw_data.csv"
)
```
         
