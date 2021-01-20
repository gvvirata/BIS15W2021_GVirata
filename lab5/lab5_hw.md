---
title: "Lab 5 Homework"
author: "Geralin Love Virata"
date: "2021-01-20"
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
```

## Load the superhero data
These are data taken from comic books and assembled by fans. The include a good mix of categorical and continuous data.  Data taken from: https://www.kaggle.com/claudiodavi/superhero-set  

Check out the way I am loading these data. If I know there are NAs, I can take care of them at the beginning. But, we should do this very cautiously. At times it is better to keep the original columns and data intact.  

```r
superhero_info <- readr::read_csv("data/heroes_information.csv", na = c("", "-99", "-"))
```

```

── Column specification ────────────────────────────────────────────────────────
cols(
  name = col_character(),
  Gender = col_character(),
  `Eye color` = col_character(),
  Race = col_character(),
  `Hair color` = col_character(),
  Height = col_double(),
  Publisher = col_character(),
  `Skin color` = col_character(),
  Alignment = col_character(),
  Weight = col_double()
)
```

```r
superhero_powers <- readr::read_csv("data/super_hero_powers.csv", na = c("", "-99", "-"))
```

```

── Column specification ────────────────────────────────────────────────────────
cols(
  .default = col_logical(),
  hero_names = col_character()
)
ℹ Use `spec()` for the full column specifications.
```

## Data tidy
1. Some of the names used in the `superhero_info` data are problematic so you should rename them here.  

```r
superhero_info <- rename(superhero_info, gender="Gender", eye_color="Eye color", race="Race", hair_color="Hair color", height="Height", publisher="Publisher", skin_color="Skin color", alignment="Alignment", weight="Weight")
names(superhero_info)
```

```
 [1] "name"       "gender"     "eye_color"  "race"       "hair_color"
 [6] "height"     "publisher"  "skin_color" "alignment"  "weight"    
```

Yikes! `superhero_powers` has a lot of variables that are poorly named. We need some R superpowers...

```r
head(superhero_powers)
```

```
# A tibble: 6 x 168
  hero_names Agility `Accelerated He… `Lantern Power … `Dimensional Aw…
  <chr>      <lgl>   <lgl>            <lgl>            <lgl>           
1 3-D Man    TRUE    FALSE            FALSE            FALSE           
2 A-Bomb     FALSE   TRUE             FALSE            FALSE           
3 Abe Sapien TRUE    TRUE             FALSE            FALSE           
4 Abin Sur   FALSE   FALSE            TRUE             FALSE           
5 Abominati… FALSE   TRUE             FALSE            FALSE           
6 Abraxas    FALSE   FALSE            FALSE            TRUE            
# … with 163 more variables: `Cold Resistance` <lgl>, Durability <lgl>,
#   Stealth <lgl>, `Energy Absorption` <lgl>, Flight <lgl>, `Danger
#   Sense` <lgl>, `Underwater breathing` <lgl>, Marksmanship <lgl>, `Weapons
#   Master` <lgl>, `Power Augmentation` <lgl>, `Animal Attributes` <lgl>,
#   Longevity <lgl>, Intelligence <lgl>, `Super Strength` <lgl>,
#   Cryokinesis <lgl>, Telepathy <lgl>, `Energy Armor` <lgl>, `Energy
#   Blasts` <lgl>, Duplication <lgl>, `Size Changing` <lgl>, `Density
#   Control` <lgl>, Stamina <lgl>, `Astral Travel` <lgl>, `Audio
#   Control` <lgl>, Dexterity <lgl>, Omnitrix <lgl>, `Super Speed` <lgl>,
#   Possession <lgl>, `Animal Oriented Powers` <lgl>, `Weapon-based
#   Powers` <lgl>, Electrokinesis <lgl>, `Darkforce Manipulation` <lgl>, `Death
#   Touch` <lgl>, Teleportation <lgl>, `Enhanced Senses` <lgl>,
#   Telekinesis <lgl>, `Energy Beams` <lgl>, Magic <lgl>, Hyperkinesis <lgl>,
#   Jump <lgl>, Clairvoyance <lgl>, `Dimensional Travel` <lgl>, `Power
#   Sense` <lgl>, Shapeshifting <lgl>, `Peak Human Condition` <lgl>,
#   Immortality <lgl>, Camouflage <lgl>, `Element Control` <lgl>,
#   Phasing <lgl>, `Astral Projection` <lgl>, `Electrical Transport` <lgl>,
#   `Fire Control` <lgl>, Projection <lgl>, Summoning <lgl>, `Enhanced
#   Memory` <lgl>, Reflexes <lgl>, Invulnerability <lgl>, `Energy
#   Constructs` <lgl>, `Force Fields` <lgl>, `Self-Sustenance` <lgl>,
#   `Anti-Gravity` <lgl>, Empathy <lgl>, `Power Nullifier` <lgl>, `Radiation
#   Control` <lgl>, `Psionic Powers` <lgl>, Elasticity <lgl>, `Substance
#   Secretion` <lgl>, `Elemental Transmogrification` <lgl>,
#   `Technopath/Cyberpath` <lgl>, `Photographic Reflexes` <lgl>, `Seismic
#   Power` <lgl>, Animation <lgl>, Precognition <lgl>, `Mind Control` <lgl>,
#   `Fire Resistance` <lgl>, `Power Absorption` <lgl>, `Enhanced
#   Hearing` <lgl>, `Nova Force` <lgl>, Insanity <lgl>, Hypnokinesis <lgl>,
#   `Animal Control` <lgl>, `Natural Armor` <lgl>, Intangibility <lgl>,
#   `Enhanced Sight` <lgl>, `Molecular Manipulation` <lgl>, `Heat
#   Generation` <lgl>, Adaptation <lgl>, Gliding <lgl>, `Power Suit` <lgl>,
#   `Mind Blast` <lgl>, `Probability Manipulation` <lgl>, `Gravity
#   Control` <lgl>, Regeneration <lgl>, `Light Control` <lgl>,
#   Echolocation <lgl>, Levitation <lgl>, `Toxin and Disease Control` <lgl>,
#   Banish <lgl>, `Energy Manipulation` <lgl>, `Heat Resistance` <lgl>, …
```

## `janitor`
The [janitor](https://garthtarr.github.io/meatR/janitor.html) package is your friend. Make sure to install it and then load the library.  

```r
library("janitor")
```

```

Attaching package: 'janitor'
```

```
The following objects are masked from 'package:stats':

    chisq.test, fisher.test
```

The `clean_names` function takes care of everything in one line! Now that's a superpower!

```r
superhero_powers <- janitor::clean_names(superhero_powers)
```

## `tabyl`
The `janitor` package has many awesome functions that we will explore. Here is its version of `table` which not only produces counts but also percentages. Very handy! Let's use it to explore the proportion of good guys and bad guys in the `superhero_info` data.  

```r
tabyl(superhero_info, alignment)
```

```
 alignment   n     percent valid_percent
       bad 207 0.282016349    0.28473177
      good 496 0.675749319    0.68225585
   neutral  24 0.032697548    0.03301238
      <NA>   7 0.009536785            NA
```

2. Notice that we have some neutral superheros! Who are they?

```r
superhero_info %>%
  filter(alignment == "neutral") %>%
  select(name, alignment)
```

```
# A tibble: 24 x 2
   name         alignment
   <chr>        <chr>    
 1 Bizarro      neutral  
 2 Black Flash  neutral  
 3 Captain Cold neutral  
 4 Copycat      neutral  
 5 Deadpool     neutral  
 6 Deathstroke  neutral  
 7 Etrigan      neutral  
 8 Galactus     neutral  
 9 Gladiator    neutral  
10 Indigo       neutral  
# … with 14 more rows
```

## `superhero_info`
3. Let's say we are only interested in the variables name, alignment, and "race". How would you isolate these variables from `superhero_info`?

```r
superhero_info %>%
  select(name, alignment, race)
```

```
# A tibble: 734 x 3
   name          alignment race             
   <chr>         <chr>     <chr>            
 1 A-Bomb        good      Human            
 2 Abe Sapien    good      Icthyo Sapien    
 3 Abin Sur      good      Ungaran          
 4 Abomination   bad       Human / Radiation
 5 Abraxas       bad       Cosmic Entity    
 6 Absorbing Man bad       Human            
 7 Adam Monroe   good      <NA>             
 8 Adam Strange  good      Human            
 9 Agent 13      good      <NA>             
10 Agent Bob     good      Human            
# … with 724 more rows
```

## Not Human
4. List all of the superheros that are not human.

```r
superhero_info %>%
  filter(race != "Human") %>%
  select(name, race)
```

```
# A tibble: 222 x 2
   name         race             
   <chr>        <chr>            
 1 Abe Sapien   Icthyo Sapien    
 2 Abin Sur     Ungaran          
 3 Abomination  Human / Radiation
 4 Abraxas      Cosmic Entity    
 5 Ajax         Cyborg           
 6 Alien        Xenomorph XX121  
 7 Amazo        Android          
 8 Angel        Vampire          
 9 Angel Dust   Mutant           
10 Anti-Monitor God / Eternal    
# … with 212 more rows
```

## Good and Evil
5. Let's make two different data frames, one focused on the "good guys" and another focused on the "bad guys".

```r
good_guys <- filter(superhero_info, alignment == "good")
good_guys
```

```
# A tibble: 496 x 10
   name  gender eye_color race  hair_color height publisher skin_color alignment
   <chr> <chr>  <chr>     <chr> <chr>       <dbl> <chr>     <chr>      <chr>    
 1 A-Bo… Male   yellow    Human No Hair       203 Marvel C… <NA>       good     
 2 Abe … Male   blue      Icth… No Hair       191 Dark Hor… blue       good     
 3 Abin… Male   blue      Unga… No Hair       185 DC Comics red        good     
 4 Adam… Male   blue      <NA>  Blond          NA NBC - He… <NA>       good     
 5 Adam… Male   blue      Human Blond         185 DC Comics <NA>       good     
 6 Agen… Female blue      <NA>  Blond         173 Marvel C… <NA>       good     
 7 Agen… Male   brown     Human Brown         178 Marvel C… <NA>       good     
 8 Agen… Male   <NA>      <NA>  <NA>          191 Marvel C… <NA>       good     
 9 Alan… Male   blue      <NA>  Blond         180 DC Comics <NA>       good     
10 Alex… Male   <NA>      <NA>  <NA>           NA NBC - He… <NA>       good     
# … with 486 more rows, and 1 more variable: weight <dbl>
```

```r
bad_guys <- filter(superhero_info, alignment == "bad")
bad_guys
```

```
# A tibble: 207 x 10
   name  gender eye_color race  hair_color height publisher skin_color alignment
   <chr> <chr>  <chr>     <chr> <chr>       <dbl> <chr>     <chr>      <chr>    
 1 Abom… Male   green     Huma… No Hair       203 Marvel C… <NA>       bad      
 2 Abra… Male   blue      Cosm… Black          NA Marvel C… <NA>       bad      
 3 Abso… Male   blue      Human No Hair       193 Marvel C… <NA>       bad      
 4 Air-… Male   blue      <NA>  White         188 Marvel C… <NA>       bad      
 5 Ajax  Male   brown     Cybo… Black         193 Marvel C… <NA>       bad      
 6 Alex… Male   <NA>      Human <NA>           NA Wildstorm <NA>       bad      
 7 Alien Male   <NA>      Xeno… No Hair       244 Dark Hor… black      bad      
 8 Amazo Male   red       Andr… <NA>          257 DC Comics <NA>       bad      
 9 Ammo  Male   brown     Human Black         188 Marvel C… <NA>       bad      
10 Ange… Female <NA>      <NA>  <NA>           NA Image Co… <NA>       bad      
# … with 197 more rows, and 1 more variable: weight <dbl>
```

6. For the good guys, use the `tabyl` function to summarize their "race".

```r
tabyl(good_guys$race)
```

```
    good_guys$race   n     percent valid_percent
             Alien   3 0.006048387   0.010752688
             Alpha   5 0.010080645   0.017921147
            Amazon   2 0.004032258   0.007168459
           Android   4 0.008064516   0.014336918
            Animal   2 0.004032258   0.007168459
         Asgardian   3 0.006048387   0.010752688
         Atlantean   4 0.008064516   0.014336918
        Bolovaxian   1 0.002016129   0.003584229
             Clone   1 0.002016129   0.003584229
            Cyborg   3 0.006048387   0.010752688
          Demi-God   2 0.004032258   0.007168459
             Demon   3 0.006048387   0.010752688
           Eternal   1 0.002016129   0.003584229
    Flora Colossus   1 0.002016129   0.003584229
       Frost Giant   1 0.002016129   0.003584229
     God / Eternal   6 0.012096774   0.021505376
            Gungan   1 0.002016129   0.003584229
             Human 148 0.298387097   0.530465950
   Human / Altered   2 0.004032258   0.007168459
    Human / Cosmic   2 0.004032258   0.007168459
 Human / Radiation   8 0.016129032   0.028673835
        Human-Kree   2 0.004032258   0.007168459
     Human-Spartoi   1 0.002016129   0.003584229
      Human-Vulcan   1 0.002016129   0.003584229
   Human-Vuldarian   1 0.002016129   0.003584229
     Icthyo Sapien   1 0.002016129   0.003584229
           Inhuman   4 0.008064516   0.014336918
   Kakarantharaian   1 0.002016129   0.003584229
        Kryptonian   4 0.008064516   0.014336918
           Martian   1 0.002016129   0.003584229
         Metahuman   1 0.002016129   0.003584229
            Mutant  46 0.092741935   0.164874552
    Mutant / Clone   1 0.002016129   0.003584229
            Planet   1 0.002016129   0.003584229
            Saiyan   1 0.002016129   0.003584229
          Symbiote   3 0.006048387   0.010752688
          Talokite   1 0.002016129   0.003584229
        Tamaranean   1 0.002016129   0.003584229
           Ungaran   1 0.002016129   0.003584229
           Vampire   2 0.004032258   0.007168459
    Yoda's species   1 0.002016129   0.003584229
     Zen-Whoberian   1 0.002016129   0.003584229
              <NA> 217 0.437500000            NA
```

7. Among the good guys, Who are the Asgardians?

```r
good_guys %>%
  filter(race == "Asgardian")
```

```
# A tibble: 3 x 10
  name  gender eye_color race  hair_color height publisher skin_color alignment
  <chr> <chr>  <chr>     <chr> <chr>       <dbl> <chr>     <chr>      <chr>    
1 Sif   Female blue      Asga… Black         188 Marvel C… <NA>       good     
2 Thor  Male   blue      Asga… Blond         198 Marvel C… <NA>       good     
3 Thor… Female blue      Asga… Blond         175 Marvel C… <NA>       good     
# … with 1 more variable: weight <dbl>
```

8. Among the bad guys, who are the male humans over 200 inches in height?

```r
bad_guys %>%
  filter(height > 200 & gender == "Male")
```

```
# A tibble: 22 x 10
   name  gender eye_color race  hair_color height publisher skin_color alignment
   <chr> <chr>  <chr>     <chr> <chr>       <dbl> <chr>     <chr>      <chr>    
 1 Abom… Male   green     Huma… No Hair       203 Marvel C… <NA>       bad      
 2 Alien Male   <NA>      Xeno… No Hair       244 Dark Hor… black      bad      
 3 Amazo Male   red       Andr… <NA>          257 DC Comics <NA>       bad      
 4 Apoc… Male   red       Muta… Black         213 Marvel C… grey       bad      
 5 Bane  Male   <NA>      Human <NA>          203 DC Comics <NA>       bad      
 6 Dark… Male   red       New … No Hair       267 DC Comics grey       bad      
 7 Doct… Male   brown     Human Brown         201 Marvel C… <NA>       bad      
 8 Doct… Male   brown     <NA>  Brown         201 Marvel C… <NA>       bad      
 9 Doom… Male   red       Alien White         244 DC Comics <NA>       bad      
10 Kill… Male   red       Meta… No Hair       244 DC Comics green      bad      
# … with 12 more rows, and 1 more variable: weight <dbl>
```

9. OK, so are there more good guys or bad guys that are bald (personal interest)?

```r
good_guys %>%
  filter(hair_color == "No Hair") %>%
  nrow()
```

```
[1] 37
```

```r
bad_guys %>%
  filter(hair_color == "No Hair") %>%
  nrow()
```

```
[1] 35
```
There are more good guys that are bald. 

10. Let's explore who the really "big" superheros are. In the `superhero_info` data, which have a height over 300 or weight over 450?

```r
superhero_info %>%
  filter(height > 300 | weight > 450) %>%
  select(name, height, weight) %>%
  arrange(desc(height))
```

```
# A tibble: 14 x 3
   name          height weight
   <chr>          <dbl>  <dbl>
 1 Fin Fang Foom  975       18
 2 Galactus       876       16
 3 Groot          701        4
 4 MODOK          366      338
 5 Wolfsbane      366      473
 6 Onslaught      305      405
 7 Sasquatch      305      900
 8 Ymir           305.      NA
 9 Juggernaut     287      855
10 Darkseid       267      817
11 Hulk           244      630
12 Bloodaxe       218      495
13 Red Hulk       213      630
14 Giganta         62.5    630
```
11. Just to be clear on the | operator,  have a look at the superheros over 300 in height...

```r
superhero_info %>%
  filter(height > 300) %>%
  select(name, height) %>%
  arrange(desc(height))
```

```
# A tibble: 8 x 2
  name          height
  <chr>          <dbl>
1 Fin Fang Foom   975 
2 Galactus        876 
3 Groot           701 
4 MODOK           366 
5 Wolfsbane       366 
6 Onslaught       305 
7 Sasquatch       305 
8 Ymir            305.
```

12. ...and the superheros over 450 in weight. Bonus question! Why do we not have 16 rows in question #10?

```r
superhero_info %>%
  filter(weight > 450) %>%
  select(name, weight) %>%
  arrange(desc(weight))
```

```
# A tibble: 8 x 2
  name       weight
  <chr>       <dbl>
1 Sasquatch     900
2 Juggernaut    855
3 Darkseid      817
4 Giganta       630
5 Hulk          630
6 Red Hulk      630
7 Bloodaxe      495
8 Wolfsbane     473
```
We do not have 16 rows in question #10 because some superheroes meet both conditions of being over 300 in height and over 450 in weight. Therefore, when filter each condition separately (#11 and #12), these heroes will appear on both tables, but will be duplicated in #10 where we simultaneously filter for both conditions.

## Height to Weight Ratio
13. It's easy to be strong when you are heavy and tall, but who is heavy and short? Which superheros have the lowest height to weight ratio?

```r
superhero_info %>%
  mutate(height_to_weight_ratio = height/weight) %>%
  select(name, height, weight, height_to_weight_ratio) %>%
  arrange(height_to_weight_ratio)
```

```
# A tibble: 734 x 4
   name        height weight height_to_weight_ratio
   <chr>        <dbl>  <dbl>                  <dbl>
 1 Giganta       62.5    630                 0.0992
 2 Utgard-Loki   15.2     58                 0.262 
 3 Darkseid     267      817                 0.327 
 4 Juggernaut   287      855                 0.336 
 5 Red Hulk     213      630                 0.338 
 6 Sasquatch    305      900                 0.339 
 7 Hulk         244      630                 0.387 
 8 Bloodaxe     218      495                 0.440 
 9 Thanos       201      443                 0.454 
10 A-Bomb       203      441                 0.460 
# … with 724 more rows
```

## `superhero_powers`
Have a quick look at the `superhero_powers` data frame.  

```r
head(superhero_powers)
```

```
# A tibble: 6 x 168
  hero_names agility accelerated_hea… lantern_power_r… dimensional_awa…
  <chr>      <lgl>   <lgl>            <lgl>            <lgl>           
1 3-D Man    TRUE    FALSE            FALSE            FALSE           
2 A-Bomb     FALSE   TRUE             FALSE            FALSE           
3 Abe Sapien TRUE    TRUE             FALSE            FALSE           
4 Abin Sur   FALSE   FALSE            TRUE             FALSE           
5 Abominati… FALSE   TRUE             FALSE            FALSE           
6 Abraxas    FALSE   FALSE            FALSE            TRUE            
# … with 163 more variables: cold_resistance <lgl>, durability <lgl>,
#   stealth <lgl>, energy_absorption <lgl>, flight <lgl>, danger_sense <lgl>,
#   underwater_breathing <lgl>, marksmanship <lgl>, weapons_master <lgl>,
#   power_augmentation <lgl>, animal_attributes <lgl>, longevity <lgl>,
#   intelligence <lgl>, super_strength <lgl>, cryokinesis <lgl>,
#   telepathy <lgl>, energy_armor <lgl>, energy_blasts <lgl>,
#   duplication <lgl>, size_changing <lgl>, density_control <lgl>,
#   stamina <lgl>, astral_travel <lgl>, audio_control <lgl>, dexterity <lgl>,
#   omnitrix <lgl>, super_speed <lgl>, possession <lgl>,
#   animal_oriented_powers <lgl>, weapon_based_powers <lgl>,
#   electrokinesis <lgl>, darkforce_manipulation <lgl>, death_touch <lgl>,
#   teleportation <lgl>, enhanced_senses <lgl>, telekinesis <lgl>,
#   energy_beams <lgl>, magic <lgl>, hyperkinesis <lgl>, jump <lgl>,
#   clairvoyance <lgl>, dimensional_travel <lgl>, power_sense <lgl>,
#   shapeshifting <lgl>, peak_human_condition <lgl>, immortality <lgl>,
#   camouflage <lgl>, element_control <lgl>, phasing <lgl>,
#   astral_projection <lgl>, electrical_transport <lgl>, fire_control <lgl>,
#   projection <lgl>, summoning <lgl>, enhanced_memory <lgl>, reflexes <lgl>,
#   invulnerability <lgl>, energy_constructs <lgl>, force_fields <lgl>,
#   self_sustenance <lgl>, anti_gravity <lgl>, empathy <lgl>,
#   power_nullifier <lgl>, radiation_control <lgl>, psionic_powers <lgl>,
#   elasticity <lgl>, substance_secretion <lgl>,
#   elemental_transmogrification <lgl>, technopath_cyberpath <lgl>,
#   photographic_reflexes <lgl>, seismic_power <lgl>, animation <lgl>,
#   precognition <lgl>, mind_control <lgl>, fire_resistance <lgl>,
#   power_absorption <lgl>, enhanced_hearing <lgl>, nova_force <lgl>,
#   insanity <lgl>, hypnokinesis <lgl>, animal_control <lgl>,
#   natural_armor <lgl>, intangibility <lgl>, enhanced_sight <lgl>,
#   molecular_manipulation <lgl>, heat_generation <lgl>, adaptation <lgl>,
#   gliding <lgl>, power_suit <lgl>, mind_blast <lgl>,
#   probability_manipulation <lgl>, gravity_control <lgl>, regeneration <lgl>,
#   light_control <lgl>, echolocation <lgl>, levitation <lgl>,
#   toxin_and_disease_control <lgl>, banish <lgl>, energy_manipulation <lgl>,
#   heat_resistance <lgl>, …
```

14. How many superheros have a combination of accelerated healing, durability, and super strength?

```r
superhero_powers %>%
  filter(accelerated_healing == "TRUE" & durability == "TRUE" & super_strength == "TRUE") %>%
  select(hero_names, accelerated_healing, durability, super_strength)
```

```
# A tibble: 97 x 4
   hero_names   accelerated_healing durability super_strength
   <chr>        <lgl>               <lgl>      <lgl>         
 1 A-Bomb       TRUE                TRUE       TRUE          
 2 Abe Sapien   TRUE                TRUE       TRUE          
 3 Angel        TRUE                TRUE       TRUE          
 4 Anti-Monitor TRUE                TRUE       TRUE          
 5 Anti-Venom   TRUE                TRUE       TRUE          
 6 Aquaman      TRUE                TRUE       TRUE          
 7 Arachne      TRUE                TRUE       TRUE          
 8 Archangel    TRUE                TRUE       TRUE          
 9 Ardina       TRUE                TRUE       TRUE          
10 Ares         TRUE                TRUE       TRUE          
# … with 87 more rows
```
superhero_powers %>% 
  select(hero_names, contains("kinesis")) %>% 
  filter_all(any_vars(.== "TRUE"))

## `kinesis`
15. We are only interested in the superheros that do some kind of "kinesis". How would we isolate them from the `superhero_powers` data?

```r
superhero_powers %>%
  select(hero_names, contains("kinesis")) %>%
  filter_all(any_vars(.== "TRUE"))
```

```
# A tibble: 112 x 10
   hero_names cryokinesis electrokinesis telekinesis hyperkinesis hypnokinesis
   <chr>      <lgl>       <lgl>          <lgl>       <lgl>        <lgl>       
 1 Alan Scott FALSE       FALSE          FALSE       FALSE        TRUE        
 2 Amazo      TRUE        FALSE          FALSE       FALSE        FALSE       
 3 Apocalypse FALSE       FALSE          TRUE        FALSE        FALSE       
 4 Aqualad    TRUE        FALSE          FALSE       FALSE        FALSE       
 5 Beyonder   FALSE       FALSE          TRUE        FALSE        FALSE       
 6 Bizarro    TRUE        FALSE          FALSE       FALSE        TRUE        
 7 Black Abb… FALSE       FALSE          TRUE        FALSE        FALSE       
 8 Black Adam FALSE       FALSE          TRUE        FALSE        FALSE       
 9 Black Lig… FALSE       TRUE           FALSE       FALSE        FALSE       
10 Black Mam… FALSE       FALSE          FALSE       FALSE        TRUE        
# … with 102 more rows, and 4 more variables: thirstokinesis <lgl>,
#   biokinesis <lgl>, terrakinesis <lgl>, vitakinesis <lgl>
```

16. Pick your favorite superhero and let's see their powers!

```r
superhero_powers %>%
  filter(hero_names == "Batman") %>%
  select_if(any_vars(.== "TRUE"))
```

```
# A tibble: 1 x 17
  agility durability stealth underwater_brea… marksmanship weapons_master
  <lgl>   <lgl>      <lgl>   <lgl>            <lgl>        <lgl>         
1 TRUE    TRUE       TRUE    TRUE             TRUE         TRUE          
# … with 11 more variables: intelligence <lgl>, super_strength <lgl>,
#   stamina <lgl>, super_speed <lgl>, weapon_based_powers <lgl>,
#   peak_human_condition <lgl>, reflexes <lgl>, gliding <lgl>,
#   power_suit <lgl>, vision_night <lgl>, vision_infrared <lgl>
```
