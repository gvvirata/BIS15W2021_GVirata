---
title: "Lab 4 Homework"
author: "Geralin Love Virata"
date: "2021-01-24"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
getwd()
```

```
## [1] "/Users/jmledford/Desktop/BIS15W2021_GVirata/lab4"
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**

```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
Parsed with column specification:
cols(
  .default = col_character(),
  mean.mass.g = col_double(),
  log10.mass = col_double(),
  mean.hra.m2 = col_double(),
  log10.hra = col_double(),
  preymass = col_double(),
  log10.preymass = col_double(),
  PPMR = col_double()
)
```

```
See spec(...) for full column specifications.
```

**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.**  

```r
dim(homerange)
```

```
[1] 569  24
```


```r
colnames(homerange)
```

```
 [1] "taxon"                      "common.name"               
 [3] "class"                      "order"                     
 [5] "family"                     "genus"                     
 [7] "species"                    "primarymethod"             
 [9] "N"                          "mean.mass.g"               
[11] "log10.mass"                 "alternative.mass.reference"
[13] "mean.hra.m2"                "log10.hra"                 
[15] "hra.reference"              "realm"                     
[17] "thermoregulation"           "locomotion"                
[19] "trophic.guild"              "dimension"                 
[21] "preymass"                   "log10.preymass"            
[23] "PPMR"                       "prey.size.reference"       
```


```r
#str(homerange)
```


```r
#summary(homerange)
```

**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  

```r
homerange$taxon <- as.factor(homerange$taxon)
```


```r
class(homerange$taxon)
```

```
[1] "factor"
```


```r
levels(homerange$taxon)
```

```
[1] "birds"         "lake fishes"   "lizards"       "mammals"      
[5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
[9] "turtles"      
```


```r
homerange$order <- as.factor(homerange$order)
```


```r
class(homerange$order)
```

```
[1] "factor"
```


```r
levels(homerange$order)
```

```
 [1] "accipitriformes"    "afrosoricida"       "anguilliformes"    
 [4] "anseriformes"       "apterygiformes"     "artiodactyla"      
 [7] "caprimulgiformes"   "carnivora"          "charadriiformes"   
[10] "columbidormes"      "columbiformes"      "coraciiformes"     
[13] "cuculiformes"       "cypriniformes"      "dasyuromorpha"     
[16] "dasyuromorpia"      "didelphimorphia"    "diprodontia"       
[19] "diprotodontia"      "erinaceomorpha"     "esociformes"       
[22] "falconiformes"      "gadiformes"         "galliformes"       
[25] "gruiformes"         "lagomorpha"         "macroscelidea"     
[28] "monotrematae"       "passeriformes"      "pelecaniformes"    
[31] "peramelemorphia"    "perciformes"        "perissodactyla"    
[34] "piciformes"         "pilosa"             "proboscidea"       
[37] "psittaciformes"     "rheiformes"         "roden"             
[40] "rodentia"           "salmoniformes"      "scorpaeniformes"   
[43] "siluriformes"       "soricomorpha"       "squamata"          
[46] "strigiformes"       "struthioniformes"   "syngnathiformes"   
[49] "testudines"         "tetraodontiformes\xa0" "tinamiformes"      
```

**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  

```r
taxa <- select(homerange, taxon, common.name, class, order, family, genus, species)
```
Birds, lake fishes, lizards, mammals, marine fish, river fishes, snakes, tortoises, and turtles are represented in the 'homerange' data frame.

**5. The variable `taxon` identifies the large, common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  

```r
taxon_counts <- table(homerange$taxon)
```

**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  

```r
trophic_guild_counts <- table(homerange$trophic.guild)
trophic_guild_counts
```

```

carnivore herbivore 
      342       227 
```

**7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.**  

```r
carnivores <- data.frame(subset(homerange, trophic.guild == "carnivore"))
```


```r
herbivores <- data.frame(subset(homerange, trophic.guild == "herbivore"))
```

**8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.**  

```r
mean(carnivores$mean.hra.m2, na.rm = TRUE)
```

```
[1] 13039918
```


```r
mean(herbivores$mean.hra.m2, na.rm = TRUE)
```

```
[1] 34137012
```
Herbivores have, on average, a larger 'mean.hra.m2'.

**9. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer? What is its common name?** 

```r
deer_finder <- filter(homerange, family == "cervidae")
deer <- select(deer_finder, mean.mass.g, log10.mass, family, genus, species)
deer_arranged <- arrange(deer, desc(log10.mass))
deer_arranged
```

```
# A tibble: 12 x 5
   mean.mass.g log10.mass family   genus      species    
         <dbl>      <dbl> <chr>    <chr>      <chr>      
 1     307227.       5.49 cervidae alces      alces      
 2     234758.       5.37 cervidae cervus     elaphus    
 3     102059.       5.01 cervidae rangifer   tarandus   
 4      87884.       4.94 cervidae odocoileus virginianus
 5      71450.       4.85 cervidae dama       dama       
 6      62823.       4.80 cervidae axis       axis       
 7      53864.       4.73 cervidae odocoileus hemionus   
 8      35000.       4.54 cervidae ozotoceros bezoarticus
 9      29450.       4.47 cervidae cervus     nippon     
10      24050.       4.38 cervidae capreolus  capreolus  
11      13500.       4.13 cervidae muntiacus  reevesi    
12       7500.       3.88 cervidae pudu       puda       
```


```r
alces <- filter(homerange, species == "alces")
alces_name <- alces$common.name
alces_name
```

```
[1] "moose"
```
The alces (common name: moose) is the largest deer.

**10. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!** **Snake is found in taxon column**    

```r
snake_finder <- filter(homerange, taxon == "snakes")
snake_finder #creating a new data frame only containing animals in the snake taxon
```

```
# A tibble: 41 x 24
   taxon common.name class order family genus species primarymethod N    
   <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>         <chr>
 1 snak… western wo… rept… squa… colub… carp… vermis  radiotag      1    
 2 snak… eastern wo… rept… squa… colub… carp… viridis radiotag      10   
 3 snak… racer       rept… squa… colub… colu… constr… telemetry     15   
 4 snak… yellow bel… rept… squa… colub… colu… constr… telemetry     12   
 5 snak… ringneck s… rept… squa… colub… diad… puncta… mark-recaptu… <NA> 
 6 snak… eastern in… rept… squa… colub… drym… couperi telemetry     1    
 7 snak… great plai… rept… squa… colub… elap… guttat… telemetry     12   
 8 snak… western ra… rept… squa… colub… elap… obsole… telemetry     18   
 9 snak… hognose sn… rept… squa… colub… hete… platir… telemetry     8    
10 snak… European w… rept… squa… colub… hier… viridi… telemetry     32   
# … with 31 more rows, and 15 more variables: mean.mass.g <dbl>,
#   log10.mass <dbl>, alternative.mass.reference <chr>, mean.hra.m2 <dbl>,
#   log10.hra <dbl>, hra.reference <chr>, realm <chr>, thermoregulation <chr>,
#   locomotion <chr>, trophic.guild <chr>, dimension <chr>, preymass <dbl>,
#   log10.preymass <dbl>, PPMR <dbl>, prey.size.reference <chr>
```


```r
smallest_hra <- min(snake_finder$mean.hra.m2) #determining the smallest 'mean.hra.m2' value
smallest_hra
```

```
[1] 200
```


```r
snake_identity <- filter(snake_finder, mean.hra.m2 == 200) #identifying the snake species with homerange of 200
snake_identity$species
```

```
[1] "schneideri"
```
The schneideri species has the smallest homerange. It is venomous and native to a small coastal region bordering Namibia and South Africa. [source]:(https://en.wikipedia.org/wiki/Bitis_schneideri#:~:text=Bitis%20schneideri%20is%20a%20species,possibly%20the%20world's%20smallest%20viper.)

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
