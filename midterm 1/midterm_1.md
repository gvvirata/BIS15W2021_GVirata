---
title: "Midterm 1"
author: "Geralin Love Virata"
date: "2021-01-27"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Be sure to **add your name** to the author header above. You may use any resources to answer these questions (including each other), but you may not post questions to Open Stacks or external help sites. There are 12 total questions.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

This exam is due by **12:00p on Thursday, January 28**.  

## Load the tidyverse
If you plan to use any other libraries to complete this assignment then you should load them here.

```r
library(tidyverse)
```

## Questions
**1. (2 points) Briefly explain how R, RStudio, and GitHub work together to make work flows in data science transparent and repeatable. What is the advantage of using RMarkdown in this context?**  

RStudio is a GUI (graphical user interface) that makes using R (an open source, scripting language) easier. GitHub Desktop keeps track of all the changes saved on RStudio and, when the programmer has completed and knitted their code, the file can be pushed to GitHub origins for storing and managing the data. GitHub can also make your work public to make collaboration with other programmers easier.


**2. (2 points) What are the three types of `data structures` that we have discussed? Why are we using data frames for BIS 15L?**

We have discussed data matrices, data frames, and vectors. We use data frames because it the most common way of organizing data in R, storing data of many different classes.

In the midterm 1 folder there is a second folder called `data`. Inside the `data` folder, there is a .csv file called `ElephantsMF`. These data are from Phyllis Lee, Stirling University, and are related to Lee, P., et al. (2013), "Enduring consequences of early experiences: 40-year effects on survival and success among African elephants (Loxodonta africana)," Biology Letters, 9: 20130011. [kaggle](https://www.kaggle.com/mostafaelseidy/elephantsmf).  

**3. (2 points) Please load these data as a new object called `elephants`. Use the function(s) of your choice to get an idea of the structure of the data. Be sure to show the class of each variable.**

```r
elephants <- readr::read_csv("data/ElephantsMF.csv")
```

```

── Column specification ────────────────────────────────────────────────────────
cols(
  Age = col_double(),
  Height = col_double(),
  Sex = col_character()
)
```

```r
elephants %>%
  glimpse()
```

```
Rows: 288
Columns: 3
$ Age    <dbl> 1.40, 17.50, 12.75, 11.17, 12.67, 12.67, 12.25, 12.17, 28.17, …
$ Height <dbl> 120.00, 227.00, 235.00, 210.00, 220.00, 189.00, 225.00, 204.00…
$ Sex    <chr> "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M…
```

```r
elephants %>%
  summary()
```

```
      Age            Height           Sex           
 Min.   : 0.01   Min.   : 75.46   Length:288        
 1st Qu.: 4.58   1st Qu.:160.75   Class :character  
 Median : 9.46   Median :200.00   Mode  :character  
 Mean   :10.97   Mean   :187.68                     
 3rd Qu.:16.50   3rd Qu.:221.09                     
 Max.   :32.17   Max.   :304.06                     
```

**4. (2 points) Change the names of the variables to lower case and change the class of the variable `sex` to a factor.**

```r
elephants <- janitor::clean_names(elephants)
```

```r
elephants$sex <- as.factor(elephants$sex)
elephants
```

```
# A tibble: 288 x 3
     age height sex  
   <dbl>  <dbl> <fct>
 1   1.4   120  M    
 2  17.5   227  M    
 3  12.8   235  M    
 4  11.2   210  M    
 5  12.7   220  M    
 6  12.7   189  M    
 7  12.2   225  M    
 8  12.2   204  M    
 9  28.2   266. M    
10  11.7   233  M    
# … with 278 more rows
```

**5. (2 points) How many male and female elephants are represented in the data?**

```r
elephants %>%
  count(sex, na.rm = T)
```

```
# A tibble: 2 x 3
  sex   na.rm     n
  <fct> <lgl> <int>
1 F     TRUE    150
2 M     TRUE    138
```

**6. (2 points) What is the average age all elephants in the data?**

```r
elephants %>%
  summarise(mean_age = mean(age, na.rm = T),
            total_counts = n())
```

```
# A tibble: 1 x 2
  mean_age total_counts
     <dbl>        <int>
1     11.0          288
```

**7. (2 points) How does the average age and height of elephants compare by sex?**

```r
elephants %>%
  group_by(sex) %>%
  summarise(mean_age = mean(age, na.rm = TRUE),
            mean_height = mean(height, na.rm = TRUE),
            total_count = n())
```

```
# A tibble: 2 x 4
  sex   mean_age mean_height total_count
  <fct>    <dbl>       <dbl>       <int>
1 F        12.8         190.         150
2 M         8.95        185.         138
```

**8. (2 points) How does the average height of elephants compare by sex for individuals over 25 years old. Include the min and max height as well as the number of individuals in the sample as part of your analysis.**

```r
elephants %>%
  filter(age > 25) %>%
  group_by(sex) %>%
  summarise(mean_height = mean(height, na.rm = TRUE),
            min_height = min(height, na.rm = TRUE),
            max_height = max(height, na.rm = TRUE),
            total_count = n())
```

```
# A tibble: 2 x 5
  sex   mean_height min_height max_height total_count
  <fct>       <dbl>      <dbl>      <dbl>       <int>
1 F            233.       206.       278.          25
2 M            273.       237.       304.           8
```

For the next series of questions, we will use data from a study on vertebrate community composition and impacts from defaunation in [Gabon, Africa](https://en.wikipedia.org/wiki/Gabon). One thing to notice is that the data include 24 separate transects. Each transect represents a path through different forest management areas.  

Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016. This paper, along with a description of the variables is included inside the midterm 1 folder.  

**9. (2 points) Load `IvindoData_DryadVersion.csv` and use the function(s) of your choice to get an idea of the overall structure. Change the variables `HuntCat` and `LandUse` to factors.**

```r
vertebrate <- readr::read_csv("data/IvindoData_DryadVersion.csv")
```

```

── Column specification ────────────────────────────────────────────────────────
cols(
  .default = col_double(),
  HuntCat = col_character(),
  LandUse = col_character()
)
ℹ Use `spec()` for the full column specifications.
```

```r
summary(vertebrate)
```

```
   TransectID       Distance        HuntCat          NumHouseholds  
 Min.   : 1.00   Min.   : 2.700   Length:24          Min.   :13.00  
 1st Qu.: 5.75   1st Qu.: 5.668   Class :character   1st Qu.:24.75  
 Median :14.50   Median : 9.720   Mode  :character   Median :29.00  
 Mean   :13.50   Mean   :11.879                      Mean   :37.88  
 3rd Qu.:20.25   3rd Qu.:17.683                      3rd Qu.:54.00  
 Max.   :27.00   Max.   :26.760                      Max.   :73.00  
   LandUse             Veg_Rich       Veg_Stems       Veg_liana     
 Length:24          Min.   :10.88   Min.   :23.44   Min.   : 4.750  
 Class :character   1st Qu.:13.10   1st Qu.:28.69   1st Qu.: 9.033  
 Mode  :character   Median :14.94   Median :32.45   Median :11.940  
                    Mean   :14.83   Mean   :32.80   Mean   :11.040  
                    3rd Qu.:16.54   3rd Qu.:37.08   3rd Qu.:13.250  
                    Max.   :18.75   Max.   :47.56   Max.   :16.380  
    Veg_DBH        Veg_Canopy    Veg_Understory     RA_Apes      
 Min.   :28.45   Min.   :2.500   Min.   :2.380   Min.   : 0.000  
 1st Qu.:40.65   1st Qu.:3.250   1st Qu.:2.875   1st Qu.: 0.000  
 Median :43.90   Median :3.430   Median :3.000   Median : 0.485  
 Mean   :46.09   Mean   :3.469   Mean   :3.020   Mean   : 2.045  
 3rd Qu.:50.58   3rd Qu.:3.750   3rd Qu.:3.167   3rd Qu.: 3.815  
 Max.   :76.48   Max.   :4.000   Max.   :3.880   Max.   :12.930  
    RA_Birds      RA_Elephant       RA_Monkeys      RA_Rodent    
 Min.   :31.56   Min.   :0.0000   Min.   : 5.84   Min.   :1.060  
 1st Qu.:52.51   1st Qu.:0.0000   1st Qu.:22.70   1st Qu.:2.047  
 Median :57.90   Median :0.3600   Median :31.74   Median :3.230  
 Mean   :58.64   Mean   :0.5450   Mean   :31.30   Mean   :3.278  
 3rd Qu.:68.17   3rd Qu.:0.8925   3rd Qu.:39.88   3rd Qu.:4.093  
 Max.   :85.03   Max.   :2.3000   Max.   :54.12   Max.   :6.310  
  RA_Ungulate     Rich_AllSpecies Evenness_AllSpecies Diversity_AllSpecies
 Min.   : 0.000   Min.   :15.00   Min.   :0.6680      Min.   :1.966       
 1st Qu.: 1.232   1st Qu.:19.00   1st Qu.:0.7542      1st Qu.:2.248       
 Median : 2.545   Median :20.00   Median :0.7760      Median :2.317       
 Mean   : 4.166   Mean   :20.21   Mean   :0.7699      Mean   :2.310       
 3rd Qu.: 5.157   3rd Qu.:22.00   3rd Qu.:0.8083      3rd Qu.:2.429       
 Max.   :13.860   Max.   :24.00   Max.   :0.8330      Max.   :2.566       
 Rich_BirdSpecies Evenness_BirdSpecies Diversity_BirdSpecies Rich_MammalSpecies
 Min.   : 8.00    Min.   :0.5590       Min.   :1.162         Min.   : 6.000    
 1st Qu.:10.00    1st Qu.:0.6825       1st Qu.:1.603         1st Qu.: 9.000    
 Median :11.00    Median :0.7220       Median :1.680         Median :10.000    
 Mean   :10.33    Mean   :0.7137       Mean   :1.661         Mean   : 9.875    
 3rd Qu.:11.00    3rd Qu.:0.7722       3rd Qu.:1.784         3rd Qu.:11.000    
 Max.   :13.00    Max.   :0.8240       Max.   :2.008         Max.   :12.000    
 Evenness_MammalSpecies Diversity_MammalSpecies
 Min.   :0.6190         Min.   :1.378          
 1st Qu.:0.7073         1st Qu.:1.567          
 Median :0.7390         Median :1.699          
 Mean   :0.7477         Mean   :1.698          
 3rd Qu.:0.7847         3rd Qu.:1.815          
 Max.   :0.8610         Max.   :2.065          
```

```r
glimpse(vertebrate)
```

```
Rows: 24
Columns: 26
$ TransectID              <dbl> 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 16,…
$ Distance                <dbl> 7.14, 17.31, 18.32, 20.85, 15.95, 17.47, 24.0…
$ HuntCat                 <chr> "Moderate", "None", "None", "None", "None", "…
$ NumHouseholds           <dbl> 54, 54, 29, 29, 29, 29, 29, 54, 25, 73, 46, 5…
$ LandUse                 <chr> "Park", "Park", "Park", "Logging", "Park", "P…
$ Veg_Rich                <dbl> 16.67, 15.75, 16.88, 12.44, 17.13, 16.50, 14.…
$ Veg_Stems               <dbl> 31.20, 37.44, 32.33, 29.39, 36.00, 29.22, 31.…
$ Veg_liana               <dbl> 5.78, 13.25, 4.75, 9.78, 13.25, 12.88, 8.38, …
$ Veg_DBH                 <dbl> 49.57, 34.59, 42.82, 36.62, 41.52, 44.07, 51.…
$ Veg_Canopy              <dbl> 3.78, 3.75, 3.43, 3.75, 3.88, 2.50, 4.00, 4.0…
$ Veg_Understory          <dbl> 2.89, 3.88, 3.00, 2.75, 3.25, 3.00, 2.38, 2.7…
$ RA_Apes                 <dbl> 1.87, 0.00, 4.49, 12.93, 0.00, 2.48, 3.78, 6.…
$ RA_Birds                <dbl> 52.66, 52.17, 37.44, 59.29, 52.62, 38.64, 42.…
$ RA_Elephant             <dbl> 0.00, 0.86, 1.33, 0.56, 1.00, 0.00, 1.11, 0.4…
$ RA_Monkeys              <dbl> 38.59, 28.53, 41.82, 19.85, 41.34, 43.29, 46.…
$ RA_Rodent               <dbl> 4.22, 6.04, 1.06, 3.66, 2.52, 1.83, 3.10, 1.2…
$ RA_Ungulate             <dbl> 2.66, 12.41, 13.86, 3.71, 2.53, 13.75, 3.10, …
$ Rich_AllSpecies         <dbl> 22, 20, 22, 19, 20, 22, 23, 19, 19, 19, 21, 2…
$ Evenness_AllSpecies     <dbl> 0.793, 0.773, 0.740, 0.681, 0.811, 0.786, 0.8…
$ Diversity_AllSpecies    <dbl> 2.452, 2.314, 2.288, 2.006, 2.431, 2.429, 2.5…
$ Rich_BirdSpecies        <dbl> 11, 10, 11, 8, 8, 10, 11, 11, 11, 9, 11, 11, …
$ Evenness_BirdSpecies    <dbl> 0.732, 0.704, 0.688, 0.559, 0.799, 0.771, 0.8…
$ Diversity_BirdSpecies   <dbl> 1.756, 1.620, 1.649, 1.162, 1.660, 1.775, 1.9…
$ Rich_MammalSpecies      <dbl> 11, 10, 11, 11, 12, 12, 12, 8, 8, 10, 10, 11,…
$ Evenness_MammalSpecies  <dbl> 0.736, 0.705, 0.650, 0.619, 0.736, 0.694, 0.7…
$ Diversity_MammalSpecies <dbl> 1.764, 1.624, 1.558, 1.484, 1.829, 1.725, 1.9…
```


```r
vertebrate$HuntCat <- as.factor(vertebrate$HuntCat)
vertebrate$LandUse <- as.factor(vertebrate$LandUse)
is.factor(vertebrate$HuntCat)
```

```
[1] TRUE
```

```r
is.factor(vertebrate$LandUse)
```

```
[1] TRUE
```


**10. (4 points) For the transects with high and moderate hunting intensity, how does the average diversity of birds and mammals compare?**

```r
vertebrate %>%
  filter(HuntCat == "High" | HuntCat == "Moderate") %>%
  summarise(mean_bird_diversity = mean(Diversity_BirdSpecies, na.rm = T),
            mean_mammal_diversity = mean(Diversity_MammalSpecies, na.rm = T),
            total_count = n())
```

```
# A tibble: 1 x 3
  mean_bird_diversity mean_mammal_diversity total_count
                <dbl>                 <dbl>       <int>
1                1.64                  1.71          15
```
Mammals, on average, have a greater diversity than birds in transects with high and moderate hunting intensity.

**11. (4 points) One of the conclusions in the study is that the relative abundance of animals drops off the closer you get to a village. Let's try to reconstruct this (without the statistics). How does the relative abundance (RA) of apes, birds, elephants, monkeys, rodents, and ungulates compare between sites that are less than 5km from a village to sites that are greater than 20km from a village? The variable `Distance` measures the distance of the transect from the nearest village. Hint: try using the `across` operator.**  

```r
vertebrate %>%
  filter(Distance <= 5) %>%
  summarise(across(contains("RA"), mean, na.rm = T))
```

```
# A tibble: 1 x 7
  TransectID RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate
       <dbl>   <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl>
1       19.7    0.08     70.4      0.0967       24.1      3.66        1.59
```

```r
vertebrate %>%
  filter(Distance >= 20) %>%
  summarise(across(contains("RA"), mean, na.rm = T))
```

```
# A tibble: 1 x 7
  TransectID RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent RA_Ungulate
       <dbl>   <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl>
1         11    7.21     44.5       0.557       40.1      2.68        4.98
```
The relative abundance of apes, elephants, monkeys, and ungulates increases when they are farther away from a village. However, the relative abundance of birds and rodents are greater when they are closer to the village than when they are farther away.

**12. (4 points) Based on your interest, do one exploratory analysis on the `gabon` data of your choice. This analysis needs to include a minimum of two functions in `dplyr.`**

```r
vertebrate %>%
  filter(LandUse != "Neither") %>%
  group_by(LandUse, HuntCat) %>%
  summarise(across(contains("RA"), mean, na.rm = T))
```

```
# A tibble: 5 x 9
# Groups:   LandUse [2]
  LandUse HuntCat TransectID RA_Apes RA_Birds RA_Elephant RA_Monkeys RA_Rodent
  <fct>   <fct>        <dbl>   <dbl>    <dbl>       <dbl>      <dbl>     <dbl>
1 Logging High         19.3     0.08     69.6       0           23.3      4.44
2 Logging Modera…      19       1.07     65.2       0.319       27.8      3.08
3 Logging None          9.33    6.54     50.2       1.10        34.8      2.34
4 Park    Modera…       1       1.87     52.7       0           38.6      4.22
5 Park    None          7.17    2.61     42.5       0.717       42.6      2.64
# … with 1 more variable: RA_Ungulate <dbl>
```
Here, I analyzed the relative abundance of apes, birds, elephants, monkeys, rodents, and ungulates in areas where land with none to high hunting intensity was used for parks and logging. It appears that the relative abundance of birds and monkeys remain significantly high compared to other animals, regardless of land use and hunting intensity. In contrast, ape and elephant abundance drop significantly with increased hunting and when land is used for logging.

