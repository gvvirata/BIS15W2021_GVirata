---
title: "Importing Data Frames"
date: "2021-01-12"
output:
  html_document: 
    theme: spacelab
    toc: yes
    toc_float: yes
    keep_md: yes
  pdf_document:
    toc: yes
---

## Breakout Rooms  
Please take 5-8 minutes to check over your answers to HW 2 in your group. If you are stuck, please remember that you can check the key in [Joel's repository](https://github.com/jmledford3115/BIS15LW2021_jledford).  

## Learning Goals
*At the end of this exercise, you will be able to:*    
1. Import .csv files as data frames using `read_csv()`.  
2. Use summary functions to explore the dimensions, structure, and contents of a data frame.  
3. Use the `select()` command of dplyr to sort data frames.  

## Review
At this point, you should have familiarity in RStudio, GitHub, and basic operations in R. You understand how to do arithmetic, assign values to objects, and work with vectors, data matrices, and data frames. If you are confused or need some extra help, please [email me](mailto: jmledford@ucdavis.edu).  

## Load the tidyverse

```r
library("tidyverse")
```

## Data Frames
For the remainder of the course, we will work exclusively with data frames. Recall that data frames store multiple classes of data. Last time, you were shown how to build data frames using the `data.frame()` command. However, scientists often make their data available as supplementary material associated with a publication. This is excellent scientific practice as it insures repeatability by showing exactly how analyses were performed. As data scientists, we capitalize on this by importing data directly into R.  

## Importing Data
R allows us to import a wide variety of data types. The most common type of file is a .csv file which stands for comma separated values. Spreadsheets are often developed in Excel then saved as .csv files for use in R. There are packages that allow you to open excel files and many other formats directly but .csv is the most common.  

An opinionated word about excel. It is fine to use excel for data entry and basic analysis. But, it often adds formatting that makes excel files difficult to work with in any program besides excel. R can read excel files, but I know of no R programmers that routinely use them. Instead they save copies of their excel files as .csv which strips away formatting but makes them easier to use in a variety of programs. We won't work with excel files in BIS 15L, but we will learn to import them.  

To import any file, first make sure that you are in the correct working directory. If you are not in the correct directory, R will not "see" the file.

```r
getwd()
```

```
## [1] "/Users/geralinvirata/Desktop/BIS15W2021_GVirata/lab3"
```

## Load the data
Here we open a .csv file. Since we are using the tidyverse, we open the file using `read_csv()`. `readr` is included in the tidyverse set of packages. We specify the package and function with the `::` symbol. This becomes important if you have multiple packages loaded that contain functions with the same name.  

In the previous part of the lab, you exported a `.csv` of hot springs data. Let's try to reload that `.csv`.  

```r
hot_springs <- readr::read_csv("hsprings_data.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   temp_C = col_double(),
##   scientist = col_character(),
##   spring = col_character(),
##   depth_fit = col_double()
## )
```

Use the `str()` function to get an idea of the data structure of `hot_springs`.  

```r
str(hot_springs)
```

```
## tibble [9 × 4] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ temp_C   : num [1:9] 36.2 35.4 35.3 35.1 35.4 ...
##  $ scientist: chr [1:9] "Jill" "Susan" "Steve" "Jill" ...
##  $ spring   : chr [1:9] "Buckeye" "Buckeye" "Buckeye" "Benton" ...
##  $ depth_fit: num [1:9] 4.15 4.13 4.12 3.21 3.23 3.2 5.67 5.65 5.66
##  - attr(*, "spec")=
##   .. cols(
##   ..   temp_C = col_double(),
##   ..   scientist = col_character(),
##   ..   spring = col_character(),
##   ..   depth_fit = col_double()
##   .. )
```

```r
glimpse(hot_springs) #another way to see structure of data frame
```

```
## Rows: 9
## Columns: 4
## $ temp_C    <dbl> 36.25, 35.40, 35.30, 35.15, 35.35, 33.35, 30.70, 29.65, 29.…
## $ scientist <chr> "Jill", "Susan", "Steve", "Jill", "Susan", "Steve", "Jill",…
## $ spring    <chr> "Buckeye", "Buckeye", "Buckeye", "Benton", "Benton", "Bento…
## $ depth_fit <dbl> 4.15, 4.13, 4.12, 3.21, 3.23, 3.20, 5.67, 5.65, 5.66
```

What is the class of the scientist column? Change it to factor and then show the levels of that factor.  

```r
class(hot_springs$scientist)
```

```
## [1] "character"
```


```r
hot_springs$scientist <- as.factor(hot_springs$scientist) #changes class from character to factor
class(hot_springs$scientist)
```

```
## [1] "factor"
```
Character vs. factor:
"17": character (takes each individual characters from a string) = 1, 7; factor (takes whole string as one) = 17


```r
levels(hot_springs$scientist)
```

```
## [1] "Jill"  "Steve" "Susan"
```

## Practice
1. In your lab 3 folder there is another folder titled `data`. Inside the `data` folder there is a `.csv` titled `Gaeta_etal_CLC_data.csv`. Open this data and store them as an object called `fish`.  

The data are from: Gaeta J., G. Sass, S. Carpenter. 2012. Biocomplexity at North Temperate Lakes LTER: Coordinated Field Studies: Large Mouth Bass Growth 2006. Environmental Data Initiative.  [link](https://portal.edirepository.org/nis/mapbrowse?scope=knb-lter-ntl&identifier=267)  

```r
fish <- readr::read_csv("Gaeta_etal_CLC_data.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   lakeid = col_character(),
##   fish_id = col_double(),
##   annnumber = col_character(),
##   length = col_double(),
##   radii_length_mm = col_double(),
##   scalelength = col_double()
## )
```

```r
#if csv is in a different folder use "(folder it is in)/(file name).csv"
```

2. What is the structure of these data?

```r
str(fish)
```

```
## tibble [4,033 × 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ lakeid         : chr [1:4033] "AL" "AL" "AL" "AL" ...
##  $ fish_id        : num [1:4033] 299 299 299 300 300 300 300 301 301 301 ...
##  $ annnumber      : chr [1:4033] "EDGE" "2" "1" "EDGE" ...
##  $ length         : num [1:4033] 167 167 167 175 175 175 175 194 194 194 ...
##  $ radii_length_mm: num [1:4033] 2.7 2.04 1.31 3.02 2.67 ...
##  $ scalelength    : num [1:4033] 2.7 2.7 2.7 3.02 3.02 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   lakeid = col_character(),
##   ..   fish_id = col_double(),
##   ..   annnumber = col_character(),
##   ..   length = col_double(),
##   ..   radii_length_mm = col_double(),
##   ..   scalelength = col_double()
##   .. )
```

Notice that when the data are imported, you are presented with a message that tells you how R interpreted the column classes. This is also where error messages will appear if there are problems.  

## Summary functions
Once data have been uploaded, you may want to get an idea of its structure, contents, and dimensions. I routinely run one or more of these commands when data are first imported.  

We can summarize our data frame with the`summary()` function.  

```r
summary(fish) #treatment of NA data in summary functions can lead to some problems, so don't always trust it
```

```
##     lakeid             fish_id       annnumber             length     
##  Length:4033        Min.   :  1.0   Length:4033        Min.   : 58.0  
##  Class :character   1st Qu.:156.0   Class :character   1st Qu.:253.0  
##  Mode  :character   Median :267.0   Mode  :character   Median :299.0  
##                     Mean   :258.3                      Mean   :293.3  
##                     3rd Qu.:376.0                      3rd Qu.:342.0  
##                     Max.   :478.0                      Max.   :420.0  
##  radii_length_mm    scalelength     
##  Min.   : 0.4569   Min.   : 0.6282  
##  1st Qu.: 2.3252   1st Qu.: 4.2596  
##  Median : 3.5380   Median : 5.4062  
##  Mean   : 3.6589   Mean   : 5.3821  
##  3rd Qu.: 4.8229   3rd Qu.: 6.4145  
##  Max.   :11.0258   Max.   :11.0258
```

`glimpse()` is another useful summary function.

```r
glimpse(fish)
```

```
## Rows: 4,033
## Columns: 6
## $ lakeid          <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL",…
## $ fish_id         <dbl> 299, 299, 299, 300, 300, 300, 300, 301, 301, 301, 301…
## $ annnumber       <chr> "EDGE", "2", "1", "EDGE", "3", "2", "1", "EDGE", "3",…
## $ length          <dbl> 167, 167, 167, 175, 175, 175, 175, 194, 194, 194, 194…
## $ radii_length_mm <dbl> 2.697443, 2.037518, 1.311795, 3.015477, 2.670733, 2.1…
## $ scalelength     <dbl> 2.697443, 2.697443, 2.697443, 3.015477, 3.015477, 3.0…
```

`nrow()` gives the numbers of rows.

```r
nrow(fish) #the number of rows or observations
```

```
## [1] 4033
```

`ncol` gives the number of columns.

```r
ncol(fish) #the number of columns or variables
```

```
## [1] 6
```

`dim()` gives the dimensions.

```r
dim(fish) #total dimensions
```

```
## [1] 4033    6
```

`names` gives the column names.

```r
names(fish) #column names
```

```
## [1] "lakeid"          "fish_id"         "annnumber"       "length"         
## [5] "radii_length_mm" "scalelength"
```

`head()` prints the first n rows of the data frame.

```r
head(fish, n = 10)
```

```
## # A tibble: 10 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167            2.70        2.70
##  2 AL         299 2            167            2.04        2.70
##  3 AL         299 1            167            1.31        2.70
##  4 AL         300 EDGE         175            3.02        3.02
##  5 AL         300 3            175            2.67        3.02
##  6 AL         300 2            175            2.14        3.02
##  7 AL         300 1            175            1.23        3.02
##  8 AL         301 EDGE         194            3.34        3.34
##  9 AL         301 3            194            2.97        3.34
## 10 AL         301 2            194            2.29        3.34
```

`tail()` prinst the last n rows of the data frame.

```r
tail(fish, n = 10)
```

```
## # A tibble: 10 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 WS         180 10           403            8.15        11.0
##  2 WS         180 9            403            7.49        11.0
##  3 WS         180 8            403            6.97        11.0
##  4 WS         180 7            403            6.24        11.0
##  5 WS         180 6            403            5.41        11.0
##  6 WS         180 5            403            4.98        11.0
##  7 WS         180 4            403            4.22        11.0
##  8 WS         180 3            403            3.04        11.0
##  9 WS         180 2            403            2.03        11.0
## 10 WS         180 1            403            1.19        11.0
```

`table()` is useful when you have a limited number of categorical variables. It produces fast counts of the number of observations in a variable. We will come back to this later... 

```r
table(fish$lakeid)
```

```
## 
##  AL  AR  BO  BR  CR  DY  FD  JN  LC  LJ  LR LSG  MN  RD  UB  WS 
## 383 262 197 291 343 355 302 238 173 181 292 143 293 135 191 254
```

We can also click on the `fish` data frame in the Environment tab or type View(fish).

```r
view(fish) #brings up csv excel sheet
```

## Subset
Subset is a way of pulling out observations that meet specific criteria in a variable.  

```r
little_fish <- subset(fish, length<=100) #pulls out only fish with lengths less than or equal to 100
little_fish #new data frame with only fish with less than or equal to 100 length
```

```
## # A tibble: 5 x 6
##   lakeid fish_id annnumber length radii_length_mm scalelength
##   <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
## 1 LSG         58 EDGE          92           1.15        1.15 
## 2 LSG         59 EDGE          64           0.773       0.773
## 3 WS         151 EDGE          58           0.628       0.628
## 4 WS         152 EDGE          74           0.832       0.832
## 5 WS         153 EDGE          78           0.637       0.637
```

## Practice
1. Load the data `mammal_lifehistories_v2.csv` and place it into a new object called `mammals`.

```r
mammals <- readr::read_csv("data/mammal_lifehistories_v2.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   order = col_character(),
##   family = col_character(),
##   Genus = col_character(),
##   species = col_character(),
##   mass = col_double(),
##   gestation = col_double(),
##   newborn = col_double(),
##   weaning = col_double(),
##   `wean mass` = col_double(),
##   AFR = col_double(),
##   `max. life` = col_double(),
##   `litter size` = col_double(),
##   `litters/year` = col_double()
## )
```

2. Provide the dimensions of the data frame.

```r
dim(mammals)
```

```
## [1] 1440   13
```

3. Check the column names in the data frame. 

```r
colnames(mammals)
```

```
##  [1] "order"        "family"       "Genus"        "species"      "mass"        
##  [6] "gestation"    "newborn"      "weaning"      "wean mass"    "AFR"         
## [11] "max. life"    "litter size"  "litters/year"
```

4. Use `str()` to show the structure of the data frame and its individual columns; compare this to `glimpse()`. 

```r
str(mammals)
```

```
## tibble [1,440 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ order       : chr [1:1440] "Artiodactyla" "Artiodactyla" "Artiodactyla" "Artiodactyla" ...
##  $ family      : chr [1:1440] "Antilocapridae" "Bovidae" "Bovidae" "Bovidae" ...
##  $ Genus       : chr [1:1440] "Antilocapra" "Addax" "Aepyceros" "Alcelaphus" ...
##  $ species     : chr [1:1440] "americana" "nasomaculatus" "melampus" "buselaphus" ...
##  $ mass        : num [1:1440] 45375 182375 41480 150000 28500 ...
##  $ gestation   : num [1:1440] 8.13 9.39 6.35 7.9 6.8 5.08 5.72 5.5 8.93 9.14 ...
##  $ newborn     : num [1:1440] 3246 5480 5093 10167 -999 ...
##  $ weaning     : num [1:1440] 3 6.5 5.63 6.5 -999 ...
##  $ wean mass   : num [1:1440] 8900 -999 15900 -999 -999 ...
##  $ AFR         : num [1:1440] 13.5 27.3 16.7 23 -999 ...
##  $ max. life   : num [1:1440] 142 308 213 240 -999 251 228 255 300 324 ...
##  $ litter size : num [1:1440] 1.85 1 1 1 1 1.37 1 1 1 1 ...
##  $ litters/year: num [1:1440] 1 0.99 0.95 -999 -999 2 -999 1.89 1 1 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   order = col_character(),
##   ..   family = col_character(),
##   ..   Genus = col_character(),
##   ..   species = col_character(),
##   ..   mass = col_double(),
##   ..   gestation = col_double(),
##   ..   newborn = col_double(),
##   ..   weaning = col_double(),
##   ..   `wean mass` = col_double(),
##   ..   AFR = col_double(),
##   ..   `max. life` = col_double(),
##   ..   `litter size` = col_double(),
##   ..   `litters/year` = col_double()
##   .. )
```


```r
glimpse(mammals)
```

```
## Rows: 1,440
## Columns: 13
## $ order          <chr> "Artiodactyla", "Artiodactyla", "Artiodactyla", "Artio…
## $ family         <chr> "Antilocapridae", "Bovidae", "Bovidae", "Bovidae", "Bo…
## $ Genus          <chr> "Antilocapra", "Addax", "Aepyceros", "Alcelaphus", "Am…
## $ species        <chr> "americana", "nasomaculatus", "melampus", "buselaphus"…
## $ mass           <dbl> 45375.0, 182375.0, 41480.0, 150000.0, 28500.0, 55500.0…
## $ gestation      <dbl> 8.13, 9.39, 6.35, 7.90, 6.80, 5.08, 5.72, 5.50, 8.93, …
## $ newborn        <dbl> 3246.36, 5480.00, 5093.00, 10166.67, -999.00, 3810.00,…
## $ weaning        <dbl> 3.00, 6.50, 5.63, 6.50, -999.00, 4.00, 4.04, 2.13, 10.…
## $ `wean mass`    <dbl> 8900, -999, 15900, -999, -999, -999, -999, -999, 15750…
## $ AFR            <dbl> 13.53, 27.27, 16.66, 23.02, -999.00, 14.89, 10.23, 20.…
## $ `max. life`    <dbl> 142, 308, 213, 240, -999, 251, 228, 255, 300, 324, 300…
## $ `litter size`  <dbl> 1.85, 1.00, 1.00, 1.00, 1.00, 1.37, 1.00, 1.00, 1.00, …
## $ `litters/year` <dbl> 1.00, 0.99, 0.95, -999.00, -999.00, 2.00, -999.00, 1.8…
```

5. . Try the `table()` command to produce counts of mammal order, family, and genus.  

```r
table(mammals$order)
```

```
## 
##   Artiodactyla      Carnivora        Cetacea     Dermoptera     Hyracoidea 
##            161            197             55              2              4 
##    Insectivora     Lagomorpha  Macroscelidea Perissodactyla      Pholidota 
##             91             42             10             15              7 
##       Primates    Proboscidea       Rodentia     Scandentia        Sirenia 
##            156              2            665              7              5 
##  Tubulidentata      Xenarthra 
##              1             20
```

```r
table(mammals$family)
```

```
## 
##     Abrocomidae       Agoutidae    Anomaluridae  Antilocapridae    Aplodontidae 
##               2               1               4               1               1 
##      Balaenidae Balaenopteridae    Bathyergidae         Bovidae    Bradypodidae 
##               3               6               8             103               3 
##  Callitrichidae       Camelidae         Canidae     Capromyidae      Castoridae 
##              18               6              31               6               2 
##        Caviidae         Cebidae Cercopithecidae        Cervidae  Cheirogaleidae 
##               9              27              58              30               6 
##   Chinchillidae Chrysochloridae Ctenodactylidae     Ctenomyidae  Cynocephalidae 
##               5               5               3               5               2 
##     Dasypodidae   Dasyproctidae  Daubentoniidae     Delphinidae      Dinomyidae 
##              12               4               1              23               1 
##       Dipodidae      Dugongidae      Echimyidae    Elephantidae         Equidae 
##              19               2               8               2               6 
##  Erethizontidae     Erinaceidae  Eschrichtiidae         Felidae     Galagonidae 
##               4              11               1              31               8 
##       Geomyidae      Giraffidae     Herpestidae    Heteromyidae  Hippopotamidae 
##              14               2              17              38               2 
##       Hominidae       Hyaenidae  Hydrochaeridae     Hylobatidae     Hystricidae 
##               4               4               1               7               7 
##        Indridae       Lemuridae       Leporidae         Loridae Macroscelididae 
##               5               9              31               5              10 
##         Manidae   Megaladapidae  Megalonychidae    Monodontidae       Moschidae 
##               7               3               2               2               3 
##         Muridae      Mustelidae   Myocastoridae        Myoxidae Myrmecophagidae 
##             376              46               1               9               3 
##   Neobalaenidae     Ochotonidae    Octodontidae      Odobenidae Orycteropodidae 
##               1              11               3               1               1 
##       Otariidae       Pedetidae    Petromuridae        Phocidae     Phocoenidae 
##              12               1               1              18               4 
##    Physeteridae   Platanistidae     Procaviidae     Procyonidae  Rhinocerotidae 
##               3               5               4               8               5 
##       Sciuridae  Solenodontidae       Soricidae          Suidae        Talpidae 
##             130               2              51               7              12 
##       Tapiridae       Tarsiidae     Tayassuidae      Tenrecidae   Thryonomyidae 
##               4               5               3              10               2 
##      Tragulidae    Trichechidae       Tupaiidae         Ursidae      Viverridae 
##               4               3               7               9              20 
##       Ziphiidae 
##               7
```

```r
table(mammals$genus)
```

```
## Warning: Unknown or uninitialised column: `genus`.
```

```
## < table of extent 0 >
```

## Wrap-up
Please review the learning goals and be sure to use the code here as a reference when completing the homework.  
-->[Home](https://jmledford3115.github.io/datascibiol/)
