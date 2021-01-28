---
title: "Lab 6 Homework"
author: "Geralin Love Virata"
date: "2021-01-27"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

For this assignment we are going to work with a large data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. These data are pretty wild, so we need to do some cleaning. First, load the data.  

Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```

-- Column specification --------------------------------------------------------
cols(
  .default = col_character(),
  `ISSCAAP group#` = col_double(),
  `FAO major fishing area` = col_double()
)
i Use `spec()` for the full column specifications.
```

1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables?  

```r
names(fisheries)
```

```
 [1] "Country"                 "Common name"            
 [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
 [5] "ASFIS species#"          "ASFIS species name"     
 [7] "FAO major fishing area"  "Measure"                
 [9] "1950"                    "1951"                   
[11] "1952"                    "1953"                   
[13] "1954"                    "1955"                   
[15] "1956"                    "1957"                   
[17] "1958"                    "1959"                   
[19] "1960"                    "1961"                   
[21] "1962"                    "1963"                   
[23] "1964"                    "1965"                   
[25] "1966"                    "1967"                   
[27] "1968"                    "1969"                   
[29] "1970"                    "1971"                   
[31] "1972"                    "1973"                   
[33] "1974"                    "1975"                   
[35] "1976"                    "1977"                   
[37] "1978"                    "1979"                   
[39] "1980"                    "1981"                   
[41] "1982"                    "1983"                   
[43] "1984"                    "1985"                   
[45] "1986"                    "1987"                   
[47] "1988"                    "1989"                   
[49] "1990"                    "1991"                   
[51] "1992"                    "1993"                   
[53] "1994"                    "1995"                   
[55] "1996"                    "1997"                   
[57] "1998"                    "1999"                   
[59] "2000"                    "2001"                   
[61] "2002"                    "2003"                   
[63] "2004"                    "2005"                   
[65] "2006"                    "2007"                   
[67] "2008"                    "2009"                   
[69] "2010"                    "2011"                   
[71] "2012"                   
```

```r
dim(fisheries)
```

```
[1] 17692    71
```

```r
anyNA(fisheries)
```

```
[1] TRUE
```

```r
glimpse(fisheries)
```

```
Rows: 17,692
Columns: 71
$ Country                   <chr> "Albania", "Albania", "Albania", "Albania...
$ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic...
$ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 3...
$ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonito...
$ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX",...
$ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena ...
$ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 3...
$ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)",...
$ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
$ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA...
$ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA...
$ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA...
$ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA...
$ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA...
$ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA...
$ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA...
$ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA...
$ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA...
$ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA...
$ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, ...
$ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, ...
$ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "...
$ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", ...
$ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", ...
$ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", ...
$ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", ...
$ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20",...
$ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", ...
$ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84...
$ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", ...
$ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285...
$ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "1...
$ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "1...
$ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", ...
$ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", ...
$ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", ...
$ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228",...
$ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA...
$ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", N...
```

2. Use `janitor` to rename the columns and make them easier to use. As part of this cleaning step, change `country`, `isscaap_group_number`, `asfis_species_number`, and `fao_major_fishing_area` to data class factor. 

```r
fisheries <- janitor::clean_names(fisheries)
```

```r
fisheries$country <- as.factor(fisheries$country)
fisheries$isscaap_group_number <- as.factor(fisheries$isscaap_group_number)
fisheries$asfis_species_number <- as.factor(fisheries$asfis_species_number)
fisheries$fao_major_fishing_area <- as.factor(fisheries$fao_major_fishing_area)
```

```r
fisheries %>% #confirming variables were changed to data class factor
  select(country, isscaap_group_number, asfis_species_number, fao_major_fishing_area) %>%
  glimpse() 
```

```
Rows: 17,692
Columns: 4
$ country                <fct> Albania, Albania, Albania, Albania, Albania,...
$ isscaap_group_number   <fct> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 33, ...
$ asfis_species_number   <fct> 10903XXXXX, 1750100101, 17710001XX, 22802031...
$ fao_major_fishing_area <fct> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, ...
```

We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven't discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!

```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
               values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```

3. How many countries are represented in the data? Provide a count and list their names.

```r
fisheries_tidy %>%
  summarise(distinct_countries = n_distinct(country))
```

```
# A tibble: 1 x 1
  distinct_countries
               <int>
1                203
```


```r
fisheries_tidy %>%
  distinct(country)
```

```
# A tibble: 203 x 1
   country            
   <fct>              
 1 Albania            
 2 Algeria            
 3 American Samoa     
 4 Angola             
 5 Anguilla           
 6 Antigua and Barbuda
 7 Argentina          
 8 Aruba              
 9 Australia          
10 Bahamas            
# ... with 193 more rows
```

4. Refocus the data only to include only: country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch.

```r
fisheries_tidy_new <- fisheries_tidy %>%
  select(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch)
fisheries_tidy_new
```

```
# A tibble: 376,771 x 6
   country isscaap_taxonomic_g~ asfis_species_na~ asfis_species_num~  year catch
   <fct>   <chr>                <chr>             <fct>              <dbl> <dbl>
 1 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          1995    NA
 2 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          1996    53
 3 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          1997    20
 4 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          1998    31
 5 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          1999    30
 6 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          2000    30
 7 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          2001    16
 8 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          2002    79
 9 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          2003     1
10 Albania Sharks, rays, chima~ Squatinidae       10903XXXXX          2004     4
# ... with 376,761 more rows
```

5. Based on the asfis_species_number, how many distinct fish species were caught as part of these data?

```r
fisheries_tidy_new %>%
  summarise(distinct_species = n_distinct(asfis_species_number))
```

```
# A tibble: 1 x 1
  distinct_species
             <int>
1             1551
```
<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

6. Which country had the largest overall catch in the year 2000?

```r
fisheries_tidy_new %>%
  select(country, catch, year) %>%
  filter(year == 2000) %>%
  arrange(desc(catch))
```

```
# A tibble: 8,793 x 3
   country                  catch  year
   <fct>                    <dbl> <dbl>
 1 China                     9068  2000
 2 Peru                      5717  2000
 3 Russian Federation        5065  2000
 4 Viet Nam                  4945  2000
 5 Chile                     4299  2000
 6 China                     3288  2000
 7 China                     2782  2000
 8 United States of America  2438  2000
 9 China                     1234  2000
10 Philippines                999  2000
# ... with 8,783 more rows
```
China has the largest overall catch in 2000.
</div>

7. Which country caught the most sardines (_Sardina pilchardus_) between the years 1990-2000?

```r
fisheries_tidy_new %>%
  filter(asfis_species_name == "Sardina pilchardus" & year >= 1990 & year <= 2000) %>%
  group_by(country) %>%
  summarise(total_sardines = sum(catch, na.rm = T)) %>%
  arrange(desc(total_sardines))
```

```
# A tibble: 37 x 2
   country               total_sardines
   <fct>                          <dbl>
 1 Morocco                         7470
 2 Spain                           3507
 3 Russian Federation              1639
 4 Ukraine                         1030
 5 France                           966
 6 Portugal                         818
 7 Greece                           528
 8 Italy                            507
 9 Serbia and Montenegro            478
10 Denmark                          477
# ... with 27 more rows
```
Morocco caught the most sardines between 1990-2000.

8. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy_new %>%
  filter(asfis_species_name == "Cephalopoda" & year >= 2008 & year <= 2012) %>%
  group_by(country) %>%
  summarise(total_cephalods = sum(catch, na.rm = T)) %>%
  arrange(desc(total_cephalods))
```

```
# A tibble: 16 x 2
   country                  total_cephalods
   <fct>                              <dbl>
 1 India                                570
 2 China                                257
 3 Spain                                198
 4 Algeria                              162
 5 France                               101
 6 Mauritania                            90
 7 TimorLeste                            76
 8 Italy                                 66
 9 Mozambique                            16
10 Cambodia                              15
11 Taiwan Province of China              13
12 Madagascar                            11
13 Croatia                                7
14 Israel                                 0
15 Somalia                                0
16 Viet Nam                               0
```
India, China, Spain, and Algeria caught the most Cephalopods between 2008-2012.

9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)

```r
fisheries_tidy_new %>%
  filter(year >= 2008 & year <= 2012) %>%
  group_by(asfis_species_name) %>%
  summarise(total_catch_per_species = sum(catch, na.rm = T)) %>%
  arrange(desc(total_catch_per_species))
```

```
# A tibble: 1,472 x 2
   asfis_species_name    total_catch_per_species
   <chr>                                   <dbl>
 1 Osteichthyes                           107808
 2 Theragra chalcogramma                   41075
 3 Engraulis ringens                       35523
 4 Katsuwonus pelamis                      32153
 5 Trichiurus lepturus                     30400
 6 Clupea harengus                         28527
 7 Thunnus albacares                       20119
 8 Scomber japonicus                       14723
 9 Gadus morhua                            13253
10 Thunnus alalunga                        12019
# ... with 1,462 more rows
```
Theragra chalcogramma has the highest total catch between 2008-2012.


10. Use the data to do at least one analysis of your choice.

```r
fisheries_tidy_new %>%
  filter(isscaap_taxonomic_group == "Shrimps, prawns" & year == 2006) %>%
  group_by(country) %>%
  summarise(tot_shrimp_prawn_catch = sum(catch, na.rm = T)) %>%
  arrange(desc(tot_shrimp_prawn_catch))
```

```
# A tibble: 107 x 2
   country                  tot_shrimp_prawn_catch
   <fct>                                     <dbl>
 1 China                                      2134
 2 India                                      1108
 3 Greenland                                   819
 4 Canada                                      623
 5 Spain                                       273
 6 Indonesia                                   270
 7 United States of America                    260
 8 Mexico                                      177
 9 Portugal                                    169
10 Thailand                                    169
# ... with 97 more rows
```
China caught the most shrimp and prawns in the year 2006. 


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
