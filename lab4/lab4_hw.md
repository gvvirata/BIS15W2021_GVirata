---
title: "Lab 4 Homework"
author: "Geralin Love Virata"
date: "2021-01-18"
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
## [1] "/Users/geralinvirata/Desktop/BIS15W2021_GVirata/lab4"
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

── Column specification ────────────────────────────────────────────────────────
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
ℹ Use `spec()` for the full column specifications.
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
str(homerange)
```

```
tibble [569 × 24] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ taxon                     : chr [1:569] "lake fishes" "river fishes" "river fishes" "river fishes" ...
 $ common.name               : chr [1:569] "american eel" "blacktail redhorse" "central stoneroller" "rosyside dace" ...
 $ class                     : chr [1:569] "actinopterygii" "actinopterygii" "actinopterygii" "actinopterygii" ...
 $ order                     : chr [1:569] "anguilliformes" "cypriniformes" "cypriniformes" "cypriniformes" ...
 $ family                    : chr [1:569] "anguillidae" "catostomidae" "cyprinidae" "cyprinidae" ...
 $ genus                     : chr [1:569] "anguilla" "moxostoma" "campostoma" "clinostomus" ...
 $ species                   : chr [1:569] "rostrata" "poecilura" "anomalum" "funduloides" ...
 $ primarymethod             : chr [1:569] "telemetry" "mark-recapture" "mark-recapture" "mark-recapture" ...
 $ N                         : chr [1:569] "16" NA "20" "26" ...
 $ mean.mass.g               : num [1:569] 887 562 34 4 4 ...
 $ log10.mass                : num [1:569] 2.948 2.75 1.531 0.602 0.602 ...
 $ alternative.mass.reference: chr [1:569] NA NA NA NA ...
 $ mean.hra.m2               : num [1:569] 282750 282.1 116.1 125.5 87.1 ...
 $ log10.hra                 : num [1:569] 5.45 2.45 2.06 2.1 1.94 ...
 $ hra.reference             : chr [1:569] "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52 "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52 "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52 "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52 ...
 $ realm                     : chr [1:569] "aquatic" "aquatic" "aquatic" "aquatic" ...
 $ thermoregulation          : chr [1:569] "ectotherm" "ectotherm" "ectotherm" "ectotherm" ...
 $ locomotion                : chr [1:569] "swimming" "swimming" "swimming" "swimming" ...
 $ trophic.guild             : chr [1:569] "carnivore" "carnivore" "carnivore" "carnivore" ...
 $ dimension                 : chr [1:569] "3D" "2D" "2D" "2D" ...
 $ preymass                  : num [1:569] NA NA NA NA NA NA 1.39 NA NA NA ...
 $ log10.preymass            : num [1:569] NA NA NA NA NA ...
 $ PPMR                      : num [1:569] NA NA NA NA NA NA 530 NA NA NA ...
 $ prey.size.reference       : chr [1:569] NA NA NA NA ...
 - attr(*, "spec")=
  .. cols(
  ..   taxon = col_character(),
  ..   common.name = col_character(),
  ..   class = col_character(),
  ..   order = col_character(),
  ..   family = col_character(),
  ..   genus = col_character(),
  ..   species = col_character(),
  ..   primarymethod = col_character(),
  ..   N = col_character(),
  ..   mean.mass.g = col_double(),
  ..   log10.mass = col_double(),
  ..   alternative.mass.reference = col_character(),
  ..   mean.hra.m2 = col_double(),
  ..   log10.hra = col_double(),
  ..   hra.reference = col_character(),
  ..   realm = col_character(),
  ..   thermoregulation = col_character(),
  ..   locomotion = col_character(),
  ..   trophic.guild = col_character(),
  ..   dimension = col_character(),
  ..   preymass = col_double(),
  ..   log10.preymass = col_double(),
  ..   PPMR = col_double(),
  ..   prey.size.reference = col_character()
  .. )
```

```r
summary(homerange)
```

```
    taxon           common.name           class              order          
 Length:569         Length:569         Length:569         Length:569        
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
    family             genus             species          primarymethod     
 Length:569         Length:569         Length:569         Length:569        
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
      N              mean.mass.g        log10.mass     
 Length:569         Min.   :      0   Min.   :-0.6576  
 Class :character   1st Qu.:     50   1st Qu.: 1.6990  
 Mode  :character   Median :    330   Median : 2.5185  
                    Mean   :  34602   Mean   : 2.5947  
                    3rd Qu.:   2150   3rd Qu.: 3.3324  
                    Max.   :4000000   Max.   : 6.6021  
                                                       
 alternative.mass.reference  mean.hra.m2          log10.hra     
 Length:569                 Min.   :0.000e+00   Min.   :-1.523  
 Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
 Mode  :character           Median :3.934e+04   Median : 4.595  
                            Mean   :2.146e+07   Mean   : 4.709  
                            3rd Qu.:1.038e+06   3rd Qu.: 6.016  
                            Max.   :3.551e+09   Max.   : 9.550  
                                                                
 hra.reference         realm           thermoregulation    locomotion       
 Length:569         Length:569         Length:569         Length:569        
 Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                            
                                                                            
                                                                            
                                                                            
 trophic.guild       dimension            preymass         log10.preymass   
 Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
 Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
 Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
                                       Mean   :  3989.88   Mean   : 2.0188  
                                       3rd Qu.:   363.35   3rd Qu.: 2.5603  
                                       Max.   :130233.20   Max.   : 5.1147  
                                       NA's   :502         NA's   :502      
      PPMR         prey.size.reference
 Min.   :  0.380   Length:569         
 1st Qu.:  3.315   Class :character   
 Median :  7.190   Mode  :character   
 Mean   : 31.752                      
 3rd Qu.: 15.966                      
 Max.   :530.000                      
 NA's   :502                          
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
taxa
```

```
# A tibble: 569 x 7
   taxon     common.name       class      order     family    genus    species  
   <fct>     <chr>             <chr>      <fct>     <chr>     <chr>    <chr>    
 1 lake fis… american eel      actinopte… anguilli… anguilli… anguilla rostrata 
 2 river fi… blacktail redhor… actinopte… cyprinif… catostom… moxosto… poecilura
 3 river fi… central stonerol… actinopte… cyprinif… cyprinid… campost… anomalum 
 4 river fi… rosyside dace     actinopte… cyprinif… cyprinid… clinost… funduloi…
 5 river fi… longnose dace     actinopte… cyprinif… cyprinid… rhinich… cataract…
 6 river fi… muskellunge       actinopte… esocifor… esocidae  esox     masquino…
 7 marine f… pollack           actinopte… gadiform… gadidae   pollach… pollachi…
 8 marine f… saithe            actinopte… gadiform… gadidae   pollach… virens   
 9 marine f… lined surgeonfish actinopte… percifor… acanthur… acanthu… lineatus 
10 marine f… orangespine unic… actinopte… percifor… acanthur… naso     lituratus
# … with 559 more rows
```
Birds, lake fishes, lizards, mammals, marine fish, river fishes, snakes, tortoises, and turtles are represented in the 'homerange' data frame.

**5. The variable `taxon` identifies the large, common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  

```r
taxon_counts <- table(homerange$taxon)
taxon_counts
```

```

        birds   lake fishes       lizards       mammals marine fishes 
          140             9            11           238            90 
 river fishes        snakes     tortoises       turtles 
           14            41            12            14 
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
carnivores
```

```
            taxon                      common.name          class
1     lake fishes                     american eel actinopterygii
2    river fishes               blacktail redhorse actinopterygii
3    river fishes              central stoneroller actinopterygii
4    river fishes                    rosyside dace actinopterygii
5    river fishes                    longnose dace actinopterygii
6    river fishes                      muskellunge actinopterygii
7   marine fishes                          pollack actinopterygii
8   marine fishes                           saithe actinopterygii
9   marine fishes                   giant trevally actinopterygii
10    lake fishes                        rock bass actinopterygii
11    lake fishes                      pumpkinseed actinopterygii
12    lake fishes                         bluegill actinopterygii
13   river fishes                  longear sunfish actinopterygii
14   river fishes                  smallmouth bass actinopterygii
15    lake fishes                  largemouth bass actinopterygii
16    lake fishes                    white crappie actinopterygii
17  marine fishes eastern triangular butterflyfish actinopterygii
18  marine fishes          Tahititan butterflyfish actinopterygii
19  marine fishes            chevron butterflyfish actinopterygii
20  marine fishes              melon butterflyfish actinopterygii
21  marine fishes           teardrop butterflyfish actinopterygii
22  marine fishes                         red moki actinopterygii
23  marine fishes              redspotted hawkfish actinopterygii
24  marine fishes                   dwarf hawkfish actinopterygii
25  marine fishes                          cabezon actinopterygii
26  marine fishes              japanese shrimpgoby actinopterygii
27  marine fishes                  bluebanded goby actinopterygii
28  marine fishes                       rusty goby actinopterygii
29  marine fishes                    blackeye goby actinopterygii
30  marine fishes                  longfinned goby actinopterygii
31  marine fishes                  spanish hogfish actinopterygii
32  marine fishes                  humphead wrasse actinopterygii
33  marine fishes     mediterranean rainbow wrasse actinopterygii
34  marine fishes                    slippery dick actinopterygii
35  marine fishes                yellowhead wrasse actinopterygii
36  marine fishes                     clown wrasse actinopterygii
37  marine fishes                  blackear wrasse actinopterygii
38  marine fishes        bluestreak cleaner wrasse actinopterygii
39  marine fishes                    ballan wrasse actinopterygii
40  marine fishes                     maori wrasse actinopterygii
41  marine fishes            california sheepshead actinopterygii
42  marine fishes                           cunner actinopterygii
43  marine fishes                  bluehead wrasse actinopterygii
44  marine fishes                      moon wrasse actinopterygii
45  marine fishes               thumbprint emperor actinopterygii
46  marine fishes                   mutton snapper actinopterygii
47  marine fishes             schoolmaster snapper actinopterygii
48  marine fishes                checkered snapper actinopterygii
49  marine fishes                     gray snapper actinopterygii
50  marine fishes               yellowtail snapper actinopterygii
51  marine fishes                  ocean whitefish actinopterygii
52  marine fishes                 european seabass actinopterygii
53  marine fishes                   white goatfish actinopterygii
54  marine fishes             whitesaddle goatfish actinopterygii
55    lake fishes                     yellow perch actinopterygii
56  marine fishes                    canary damsel actinopterygii
57  marine fishes              whitetail dascyllus actinopterygii
58  marine fishes                     peacock hind actinopterygii
59  marine fishes                          graysby actinopterygii
60  marine fishes                   yellowfin hind actinopterygii
61  marine fishes                       coral hind actinopterygii
62  marine fishes                         red hind actinopterygii
63  marine fishes                    dusky grouper actinopterygii
64  marine fishes                      red grouper actinopterygii
65  marine fishes                   nassau grouper actinopterygii
66  marine fishes                   greasy grouper actinopterygii
67  marine fishes                  redbanded perch actinopterygii
68  marine fishes             half-banded seaperch actinopterygii
69  marine fishes                    black grouper actinopterygii
70  marine fishes                        kelp bass actinopterygii
71  marine fishes                 barred sand bass actinopterygii
72  marine fishes                    coral grouper actinopterygii
73  marine fishes                      coral trout actinopterygii
74  marine fishes                           comber actinopterygii
75  marine fishes                   painted comber actinopterygii
76  marine fishes                gilthead seabream actinopterygii
77   river fishes                  cutthroat trout actinopterygii
78   river fishes                       gila trout actinopterygii
79   river fishes                    rainbow trout actinopterygii
80   river fishes                  atlantic salmon actinopterygii
81    lake fishes                      brown trout actinopterygii
82   river fishes                  mottled sculpin actinopterygii
83   river fishes                   banded sculpin actinopterygii
84   river fishes                          sculpin actinopterygii
85  marine fishes                  copper rockfish actinopterygii
86  marine fishes          japanese black rockfish actinopterygii
87  marine fishes               quillback rockfish actinopterygii
88  marine fishes                   black rockfish actinopterygii
89  marine fishes                    blue rockfish actinopterygii
90    lake fishes                  yellow bullhead actinopterygii
91  marine fishes            long-snouted seahorse actinopterygii
92  marine fishes                    worm pipefish actinopterygii
93  marine fishes        atlantic sharpnose puffer actinopterygii
94          birds                     golden eagle           aves
95          birds                   common buzzard           aves
96          birds           short-toed snake eagle           aves
97          birds                  Bonelli's eagle           aves
98          birds                     booted eagle           aves
99          birds                 Egyptian vulture           aves
100         birds              northern brown kiwi           aves
101         birds                European nightjar           aves
102         birds                    oystercatcher           aves
103         birds                  European roller           aves
104         birds                           hoopoe           aves
105         birds             great spotted cuckoo           aves
106         birds                    common cuckoo           aves
107         birds               greater roadrunner           aves
108         birds             banded ground-cuckoo           aves
109         birds                    Cooper's hawk           aves
110         birds                 Northern goshawk           aves
111         birds             Eurasian sparrowhawk           aves
112         birds               sharp-shinned hawk           aves
113         birds                  red-tailed hawk           aves
114         birds              red-shouldered hawk           aves
115         birds                  Swainson's hawk           aves
116         birds                      hen harrier           aves
117         birds                Montagu's harrier           aves
118         birds                         red kite           aves
119         birds                         caracara           aves
120         birds            red-throated caracara           aves
121         birds                    lanner falcon           aves
122         birds                   prairie falcon           aves
123         birds                 peregrine falcon           aves
124         birds                 American kestrel           aves
125         birds                 European kestrel           aves
126         birds                  brown wood rail           aves
127         birds                        king rail           aves
128         birds                melodious warbler           aves
129         birds                  long-tailed tit           aves
130         birds                         woodlark           aves
131         birds         red-throated ant tanager           aves
132         birds          red-crowned ant tanager           aves
133         birds             Eurasian treecreeper           aves
134         birds         streaked fantail warbler           aves
135         birds                     common raven           aves
136         birds              grasshopper sparrow           aves
137         birds                   indigo bunting           aves
138         birds            American tree sparrow           aves
139         birds                 chipping sparrow           aves
140         birds                 common chaffinch           aves
141         birds                   European serin           aves
142         birds               eastern meadowlark           aves
143         birds               western meadowlard           aves
144         birds             yellow-breasted chat           aves
145         birds                red-backed shrike           aves
146         birds                loggerhead shrike           aves
147         birds               lesser grey shrike           aves
148         birds                  woodchat shrike           aves
149         birds             northern mockingbird           aves
150         birds                    white wagtail           aves
151         birds           western yellow wagtail           aves
152         birds               spotted flycatcher           aves
153         birds                northern wheatear           aves
154         birds                  common redstart           aves
155         birds                         whinchat           aves
156         birds           black-capped chickadee           aves
157         birds               Carolina chickadee           aves
158         birds                     Oak titmouse           aves
159         birds                        marsh tit           aves
160         birds                 mourning warbler           aves
161         birds              common yellowthroat           aves
162         birds             prothonotary warbler           aves
163         birds                         ovenbird           aves
164         birds             Blackburnian warbler           aves
165         birds               Kirtland's warbler           aves
166         birds                 magnolia warbler           aves
167         birds           chestnut-sided warbler           aves
168         birds          American yellow warbler           aves
169         birds                American redstart           aves
170         birds     black-throated green warbler           aves
171         birds                   Canada warbler           aves
172         birds        Western Bonelli's warbler           aves
173         birds                 common firecrest           aves
174         birds                        goldcrest           aves
175         birds                European nuthatch           aves
176         birds                          wrentit           aves
177         birds                Marmora's warbler           aves
178         birds                 Dartford warbler           aves
179         birds                   Berwick's wren           aves
180         birds                    Carolina wren           aves
181         birds                       house wren           aves
182         birds                    Eurasian wren           aves
183         birds                 eastern bluebird           aves
184         birds               eastern wood pewee           aves
185         birds                 least flycatcher           aves
186         birds         American gray flycatcher           aves
187         birds                 eastern kingbird           aves
188         birds               black-capped vireo           aves
189         birds                     Bell's vireo           aves
190         birds                 white-eyed vireo           aves
191         birds                   red-eyed vireo           aves
192         birds                    great bittern           aves
193         birds                    least bittern           aves
194         birds                 black woodpecker           aves
195         birds                 Eurasian wryneck           aves
196         birds          white-backed woodpecker           aves
197         birds       middle spotted woodpeckers           aves
198         birds   Eurasian three-toed woodpecker           aves
199         birds           grey-headed woodpecker           aves
200         birds        European green woodpecker           aves
201         birds                       boreal owl           aves
202         birds                   long-eared owl           aves
203         birds                       little owl           aves
204         birds               Eurasian eagle-owl           aves
205         birds                 great horned owl           aves
206         birds               Eurasian pygmy owl           aves
207         birds                        snowy owl           aves
208         birds                        tawny owl           aves
209         birds                         barn owl           aves
210       mammals                giant golden mole       mammalia
211       mammals              Grant's golden mole       mammalia
212       mammals                       arctic fox       mammalia
213       mammals                   Ethiopian wolf       mammalia
214       mammals                           culpeo       mammalia
215       mammals          South American gray fox       mammalia
216       mammals                          kit fox       mammalia
217       mammals                     Ruppel's fox       mammalia
218       mammals                        swift fox       mammalia
219       mammals                            fossa       mammalia
220       mammals                          cheetah       mammalia
221       mammals                          caracal       mammalia
222       mammals                              cat       mammalia
223       mammals                          wildcat       mammalia
224       mammals                       jaguarundi       mammalia
225       mammals                           ocelot       mammalia
226       mammals                           margay       mammalia
227       mammals                           serval       mammalia
228       mammals                      Canada lynx       mammalia
229       mammals                    Eurasian lynx       mammalia
230       mammals                     Iberian lynx       mammalia
231       mammals                           bobcat       mammalia
232       mammals                   Geoffroy's cat       mammalia
233       mammals                           jaguar       mammalia
234       mammals                          leopard       mammalia
235       mammals                            tiger       mammalia
236       mammals                      leopard cat       mammalia
237       mammals                           cougar       mammalia
238       mammals                     snow leopard       mammalia
239       mammals                   marsh mongoose       mammalia
240       mammals                  yellow mongoose       mammalia
241       mammals            common dwarf mongoose       mammalia
242       mammals                Egyptian mongoose       mammalia
243       mammals            white-tailed mongoose       mammalia
244       mammals                         aardwolf       mammalia
245       mammals                            tayra       mammalia
246       mammals                   greater grison       mammalia
247       mammals                        wolverine       mammalia
248       mammals                  American marten       mammalia
249       mammals                     beech marten       mammalia
250       mammals             European pine marten       mammalia
251       mammals                           fisher       mammalia
252       mammals                            stoat       mammalia
253       mammals               long-tailed weasel       mammalia
254       mammals                           ferret       mammalia
255       mammals                    European mink       mammalia
256       mammals              black-footed ferret       mammalia
257       mammals                     least weasel       mammalia
258       mammals                  Siberian weasel       mammalia
259       mammals                  American badger       mammalia
260       mammals                       sloth bear       mammalia
261       mammals                     common genet       mammalia
262       mammals                       cape genet       mammalia
263       mammals               large indian civet       mammalia
264       mammals                    Western quoll       mammalia
265       mammals                      tiger quoll       mammalia
266       mammals             white-footed dunnart       mammalia
267       mammals                 brown antechinus       mammalia
268       mammals   Northern three-striped opossum       mammalia
269       mammals       elegant fat-tailed opossum       mammalia
270       mammals                European hedgehog       mammalia
271       mammals              long-eared hedgehog       mammalia
272       mammals            rufous elephant shrew       mammalia
273       mammals         four-toed elephant shrew       mammalia
274       mammals     golden-rumped elephant shrew       mammalia
275       mammals            east African mole rat       mammalia
276       mammals                 golden bandicoot       mammalia
277       mammals         Southern brown bandicoot       mammalia
278       mammals       southern grasshopper mouse       mammalia
279       mammals                     cotton mouse       mammalia
280       mammals       greater white-footed shrew       mammalia
281       mammals                     arctic shrew       mammalia
282       mammals                   cinereus shrew       mammalia
283       mammals                    crowned shrew       mammalia
284       mammals                    slender shrew       mammalia
285       mammals                long-clawed shrew       mammalia
286       mammals                  star-nosed mole       mammalia
287       mammals                     eastern mole       mammalia
288       mammals                    European mole       mammalia
289       mammals                       Roman mole       mammalia
290        snakes               western worm snake       reptilia
291        snakes               eastern worm snake       reptilia
292        snakes                            racer       reptilia
293        snakes             yellow bellied racer       reptilia
294        snakes                   ringneck snake       reptilia
295        snakes             eastern indigo snake       reptilia
296        snakes            great plains ratsnake       reptilia
297        snakes                 western ratsnake       reptilia
298        snakes                    hognose snake       reptilia
299        snakes               European whipsnake       reptilia
300        snakes                Eastern kingsnake       reptilia
301        snakes                        milksnake       reptilia
302        snakes                        coachwhip       reptilia
303        snakes                      grass snake       reptilia
304        snakes           copperbelly watersnake       reptilia
305        snakes              Northern watersnake       reptilia
306        snakes               redbacked ratsnake       reptilia
307        snakes                     gopher snake       reptilia
308        snakes                       pine snake       reptilia
309        snakes             butlers garter snake       reptilia
310        snakes              giant garter snakes       reptilia
311        snakes                Aesculapian snake       reptilia
312        snakes                broadheaded snake       reptilia
313        snakes                      tiger snake       reptilia
314        snakes                       blacksnake       reptilia
315        snakes       southwestern carpet python       reptilia
316        snakes                       copperhead       reptilia
317        snakes                      cottonmouth       reptilia
318        snakes              namaqua dwarf adder       reptilia
319        snakes                     fer-de-lance       reptilia
320        snakes              western diamondback       reptilia
321        snakes                       sidewinder       reptilia
322        snakes               timber rattlesnake       reptilia
323        snakes          blacktailed rattlesnake       reptilia
324        snakes         midget faded rattlesnake       reptilia
325        snakes         twin-spotted rattlesnake       reptilia
326        snakes               Mojave rattlesnake       reptilia
327        snakes                tiger rattlesnake       reptilia
328        snakes                chinese pit viper       reptilia
329        snakes                   Armenian viper       reptilia
330        snakes                  snubnosed viper       reptilia
331       turtles       Eastern long-necked turtle       reptilia
332       turtles      Dalh's toad-headed tortoise       reptilia
333       turtles           common snapping turtle       reptilia
334       turtles           midland painted turtle       reptilia
335       turtles                   chicken turtle       reptilia
336       turtles                Blanding's turtle       reptilia
337       turtles             European pond turtle       reptilia
338       turtles       yellow-blotched map turtle       reptilia
339       turtles               Eastern mud turtle       reptilia
340       turtles        stripe-necked musk turtle       reptilia
341       turtles                  stinkpot turtle       reptilia
342       turtles   Eastern spiny softshell turtle       reptilia
                    order           family           genus
1          anguilliformes      anguillidae        anguilla
2           cypriniformes     catostomidae       moxostoma
3           cypriniformes       cyprinidae      campostoma
4           cypriniformes       cyprinidae     clinostomus
5           cypriniformes       cyprinidae     rhinichthys
6             esociformes         esocidae            esox
7              gadiformes          gadidae      pollachius
8              gadiformes          gadidae      pollachius
9             perciformes       carangidae          caranx
10            perciformes    centrarchidae     ambloplites
11            perciformes    centrarchidae         lepomis
12            perciformes    centrarchidae         lepomis
13            perciformes    centrarchidae         lepomis
14            perciformes    centrarchidae     micropterus
15            perciformes    centrarchidae     micropterus
16            perciformes    centrarchidae         pomoxis
17            perciformes   chaetodontidae       chaetodon
18            perciformes   chaetodontidae       chaetodon
19            perciformes   chaetodontidae       chaetodon
20            perciformes   chaetodontidae       chaetodon
21            perciformes   chaetodontidae       chaetodon
22            perciformes cheilodactylidae  cheilodactylus
23            perciformes      cirrhitidae  amblycirrhitus
24            perciformes      cirrhitidae  cirrhitichthys
25            perciformes         cottidae scorpaenichthys
26            perciformes         gobiidae   amblyeleotris
27            perciformes         gobiidae      lythrypnus
28            perciformes         gobiidae       priolepis
29            perciformes         gobiidae    rhinogobiops
30            perciformes         gobiidae    valenciennea
31            perciformes         labridae        bodianus
32            perciformes         labridae        chelinus
33            perciformes         labridae           coris
34            perciformes         labridae     halichoeres
35            perciformes         labridae     halichoeres
36            perciformes         labridae     halichoeres
37            perciformes         labridae     halichoeres
38            perciformes         labridae       labroides
39            perciformes         labridae          labrus
40            perciformes         labridae   opthalmolepis
41            perciformes         labridae   semicossyphus
42            perciformes         labridae   tautogolabrus
43            perciformes         labridae      thalassoma
44            perciformes         labridae      thalassoma
45            perciformes      lethrinidae       lethrinus
46            perciformes       lutjanidae        lutjanus
47            perciformes       lutjanidae        lutjanus
48            perciformes       lutjanidae        lutjanus
49            perciformes       lutjanidae        lutjanus
50            perciformes       lutjanidae         ocyurus
51            perciformes    malacanthidae    caulolatilus
52            perciformes        moronidae   dicentrarchus
53            perciformes         mullidae  mulloidichthys
54            perciformes         mullidae      parupeneus
55            perciformes         percidae           perca
56            perciformes    pomacanthidae       abudefduf
57            perciformes    pomacentridae       dascyllus
58            perciformes       serranidae   cephalopholis
59            perciformes       serranidae   cephalopholis
60            perciformes       serranidae   cephalopholis
61            perciformes       serranidae   cephalopholis
62            perciformes       serranidae     epinephelus
63            perciformes       serranidae     epinephelus
64            perciformes       serranidae     epinephelus
65            perciformes       serranidae     epinephelus
66            perciformes       serranidae     epinephelus
67            perciformes       serranidae  hypoplectrodes
68            perciformes       serranidae  hypoplectrodes
69            perciformes       serranidae    mycteroperca
70            perciformes       serranidae      paralabrax
71            perciformes       serranidae      paralabrax
72            perciformes       serranidae    plectropomus
73            perciformes       serranidae    plectropomus
74            perciformes       serranidae        serranus
75            perciformes       serranidae        serranus
76            perciformes         sparidae          sparus
77          salmoniformes       salmonidae    oncorhynchus
78          salmoniformes       salmonidae    oncorhynchus
79          salmoniformes       salmonidae    oncorhynchus
80          salmoniformes       salmonidae           salmo
81          salmoniformes       salmonidae           salmo
82        scorpaeniformes         cottidae          cottus
83        scorpaeniformes         cottidae          cottus
84        scorpaeniformes         cottidae          cottus
85        scorpaeniformes       sebastidae        sebastes
86        scorpaeniformes       sebastidae        sebastes
87        scorpaeniformes       sebastidae        sebastes
88        scorpaeniformes       sebastidae        sebastes
89        scorpaeniformes       sebastidae        sebastes
90           siluriformes      ictaluridae       ictalurus
91        syngnathiformes     syngnathidae     hippocampus
92        syngnathiformes     syngnathidae        nerophis
93  tetraodontiformes\xa0   tetraodontidae    canthigaster
94        accipitriformes     accipitridae          aquila
95        accipitriformes     accipitridae           buteo
96        accipitriformes     accipitridae       circaetus
97        accipitriformes     accipitridae      hieraaetus
98        accipitriformes     accipitridae      hieraaetus
99        accipitriformes     accipitridae        neophron
100        apterygiformes      apterygidae         apteryx
101      caprimulgiformes    caprimulgidae     caprimulgus
102       charadriiformes   haematopodidae      haematopus
103         coraciiformes       coraciidae        coracias
104         coraciiformes         upupidae           upupa
105          cuculiformes        cuculidae        clamator
106          cuculiformes        cuculidae         cuculus
107          cuculiformes        cuculidae       geococcyx
108          cuculiformes        cuculidae     neopmorphus
109         falconiformes     accipitridae       accipiter
110         falconiformes     accipitridae       accipiter
111         falconiformes     accipitridae       accipiter
112         falconiformes     accipitridae       accipiter
113         falconiformes     accipitridae           buteo
114         falconiformes     accipitridae           buteo
115         falconiformes     accipitridae           buteo
116         falconiformes     accipitridae          circus
117         falconiformes     accipitridae          circus
118         falconiformes     accipitridae          milvus
119         falconiformes       falconidae        caracara
120         falconiformes       falconidae        daptrius
121         falconiformes       falconidae           falco
122         falconiformes       falconidae           falco
123         falconiformes       falconidae           falco
124         falconiformes       falconidae           falco
125         falconiformes       falconidae           falco
126            gruiformes         rallidae        aramides
127            gruiformes         rallidae          rallus
128         passeriformes   acrocephalisae       hippolais
129         passeriformes     aegithalidae      aegithalos
130         passeriformes        alaudidae         lululla
131         passeriformes     cardinalidae           habia
132         passeriformes     cardinalidae           habia
133         passeriformes        certhidae         certhia
134         passeriformes     cisticolidae       cisticola
135         passeriformes         corvidae          corvus
136         passeriformes      emberizidae      ammodramus
137         passeriformes      emberizidae       passerina
138         passeriformes      emberizidae        spizella
139         passeriformes      emberizidae        spizella
140         passeriformes     fringillidae       fringilla
141         passeriformes     fringillidae         serinus
142         passeriformes        icteridae       sturnella
143         passeriformes        icteridae       sturnella
144         passeriformes         incertae         icteria
145         passeriformes         laniidae         laniuis
146         passeriformes         laniidae         laniuis
147         passeriformes         laniidae          lanius
148         passeriformes         laniidae          lanius
149         passeriformes          mimidae           mimus
150         passeriformes     motacillidae       motacilla
151         passeriformes     motacillidae       motacilla
152         passeriformes     muscicapidae       muscicapa
153         passeriformes     muscicapidae        oenanthe
154         passeriformes     muscicapidae     phoenicurus
155         passeriformes     muscicapidae        saxicola
156         passeriformes          paridae           parus
157         passeriformes          paridae           parus
158         passeriformes          paridae           parus
159         passeriformes          paridae           parus
160         passeriformes        parulidae  geothlypis\xa0
161         passeriformes        parulidae      geothylpis
162         passeriformes        parulidae    protonotaria
163         passeriformes        parulidae         seiurus
164         passeriformes        parulidae       setophaga
165         passeriformes        parulidae       setophaga
166         passeriformes        parulidae       setophaga
167         passeriformes        parulidae       setophaga
168         passeriformes        parulidae       setophaga
169         passeriformes        parulidae       setophaga
170         passeriformes        parulidae       setophaga
171         passeriformes        parulidae        wilsonia
172         passeriformes   phylloscopidae    phylloscopus
173         passeriformes        regulidae         regulus
174         passeriformes        regulidae         regulus
175         passeriformes        stittidae           sitta
176         passeriformes         sylvidae         chamaea
177         passeriformes        sylviidae          sylvia
178         passeriformes        sylviidae          sylvia
179         passeriformes    troglodytidae      thryomanes
180         passeriformes    troglodytidae     thryothorus
181         passeriformes    troglodytidae     troglodytes
182         passeriformes    troglodytidae     troglodytes
183         passeriformes         turdidae          sialia
184         passeriformes       tyrannidae        contopus
185         passeriformes       tyrannidae       empidonax
186         passeriformes       tyrannidae       empidonax
187         passeriformes       tyrannidae        tyrannus
188         passeriformes       vireonidae           vireo
189         passeriformes       vireonidae           vireo
190         passeriformes       vireonidae           vireo
191         passeriformes       vireonidae           vireo
192        pelecaniformes         ardeidae        botaurus
193        pelecaniformes         ardeidae      ixobrychus
194            piciformes          picidae       dryocopus
195            piciformes          picidae            jynx
196            piciformes          picidae        picoides
197            piciformes          picidae        picoides
198            piciformes          picidae        picoides
199            piciformes          picidae           picus
200            piciformes          picidae           picus
201          strigiformes        strigidae        aegolius
202          strigiformes        strigidae            asio
203          strigiformes        strigidae          athene
204          strigiformes        strigidae            bubo
205          strigiformes        strigidae            bubo
206          strigiformes        strigidae      glaucidium
207          strigiformes        strigidae          nyctea
208          strigiformes        strigidae           strix
209          strigiformes        tytonidae            tyto
210          afrosoricida  chrysochloridae    chrysospalax
211          afrosoricida  chrysochloridae      eremitalpa
212             carnivora          canidae          alopex
213             carnivora          canidae           canis
214             carnivora          canidae     pseudalopex
215             carnivora          canidae     pseudalopex
216             carnivora          canidae          vulpes
217             carnivora          canidae          vulpes
218             carnivora          canidae          vulpes
219             carnivora       eupleridae    cryptoprocta
220             carnivora          felidae        acinonyx
221             carnivora          felidae         caracal
222             carnivora          felidae           felis
223             carnivora          felidae           felis
224             carnivora          felidae     herpailurus
225             carnivora          felidae       leopardus
226             carnivora          felidae       leopardus
227             carnivora          felidae     leptailurus
228             carnivora          felidae            lynx
229             carnivora          felidae            lynx
230             carnivora          felidae            lynx
231             carnivora          felidae            lynx
232             carnivora          felidae       oncifelis
233             carnivora          felidae        panthera
234             carnivora          felidae        panthera
235             carnivora          felidae        panthera
236             carnivora          felidae    prionailurus
237             carnivora          felidae            puma
238             carnivora          felidae           uncia
239             carnivora      herpestidae          atilax
240             carnivora      herpestidae        cynictis
241             carnivora      herpestidae        helogale
242             carnivora      herpestidae       herpestes
243             carnivora      herpestidae       ichneumia
244             carnivora         hyanidae        proteles
245             carnivora       mustelidae            eira
246             carnivora       mustelidae        galictis
247             carnivora       mustelidae            gulo
248             carnivora       mustelidae          martes
249             carnivora       mustelidae          martes
250             carnivora       mustelidae          martes
251             carnivora       mustelidae          martes
252             carnivora       mustelidae         mustela
253             carnivora       mustelidae         mustela
254             carnivora       mustelidae         mustela
255             carnivora       mustelidae         mustela
256             carnivora       mustelidae         mustela
257             carnivora       mustelidae         mustela
258             carnivora       mustelidae         mustela
259             carnivora       mustelidae         taxidea
260             carnivora          ursidae        melursus
261             carnivora       viverridae         genetta
262             carnivora       viverridae         genetta
263             carnivora       viverridae         viverra
264         dasyuromorpha       dasyuridae        dasyurus
265         dasyuromorpha       dasyuridae        dasyurus
266         dasyuromorpha       dasyuridae     sminthopsis
267         dasyuromorpia       dasyuridae      antechinus
268       didelphimorphia      didelphidae     monodelphis
269       didelphimorphia      didelphidae        thylamys
270        erinaceomorpha      erinaceidae       erinaceus
271        erinaceomorpha      erinaceidae     hemiechinus
272         macroscelidea  macroscelididae    elephantulus
273         macroscelidea  macroscelididae     petrodromus
274         macroscelidea  macroscelididae     rhynchocyon
275          monotrematae   tachyglossidae    tachyoryctes
276       peramelemorphia      peramelidae         isoodon
277       peramelemorphia      peramelidae         isoodon
278                 roden       cricetidae       onychomys
279              rodentia       cricetidae      peromyscus
280          soricomorpha        soricidae       crocidura
281          soricomorpha        soricidae           sorex
282          soricomorpha        soricidae           sorex
283          soricomorpha        soricidae           sorex
284          soricomorpha        soricidae           sorex
285          soricomorpha        soricidae           sorex
286          soricomorpha         talpidae       condylura
287          soricomorpha         talpidae        scalopus
288          soricomorpha         talpidae           talpa
289          soricomorpha         talpidae           talpa
290              squamata       colubridae       carphopis
291              squamata       colubridae       carphopis
292              squamata       colubridae         coluber
293              squamata       colubridae         coluber
294              squamata       colubridae       diadophis
295              squamata       colubridae      drymarchon
296              squamata       colubridae          elaphe
297              squamata       colubridae          elaphe
298              squamata       colubridae       heterodon
299              squamata       colubridae       hierophis
300              squamata       colubridae    lampropeltis
301              squamata       colubridae    lampropeltis
302              squamata       colubridae     masticophis
303              squamata       colubridae          natrix
304              squamata       colubridae         nerodia
305              squamata       colubridae         nerodia
306              squamata       colubridae      oocatochus
307              squamata       colubridae       pituophis
308              squamata       colubridae       pituophis
309              squamata       colubridae      thamnophis
310              squamata       colubridae      thamnophis
311              squamata       colubridae         zamenis
312              squamata         elapidae   hoplocephalus
313              squamata         elapidae        notechis
314              squamata         elapidae      pseudechis
315              squamata       pythonidae         morelia
316              squamata        viperidae     agkistrodon
317              squamata        viperidae     agkistrodon
318              squamata        viperidae           bitis
319              squamata        viperidae        bothrops
320              squamata        viperidae        crotalus
321              squamata        viperidae        crotalus
322              squamata        viperidae        crotalus
323              squamata        viperidae        crotalus
324              squamata        viperidae        crotalus
325              squamata        viperidae        crotalus
326              squamata        viperidae        crotalus
327              squamata        viperidae        crotalus
328              squamata        viperidae        gloydius
329              squamata        viperidae     montivipera
330              squamata        viperidae          vipera
331            testudines         chelidae       chelodina
332            testudines         chelidae     mesoclemmys
333            testudines      chelydridae        chelydra
334            testudines         emydidae       chrysemys
335            testudines         emydidae     deirochelys
336            testudines         emydidae       emydoidea
337            testudines         emydidae            emys
338            testudines         emydidae       graptemys
339            testudines    kinosternidae     kinosternon
340            testudines    kinosternidae    sternotherus
341            testudines    kinosternidae    sternotherus
342            testudines     trionychidae         apalone
                     species      primarymethod    N mean.mass.g  log10.mass
1                   rostrata          telemetry   16      887.00  2.94792362
2                  poecilura     mark-recapture <NA>      562.00  2.74973632
3                   anomalum     mark-recapture   20       34.00  1.53147892
4                funduloides     mark-recapture   26        4.00  0.60205999
5                 cataractae     mark-recapture   17        4.00  0.60205999
6                masquinongy          telemetry    5     3525.00  3.54715912
7                 pollachius          telemetry    2      737.36  2.86767957
8                     virens          telemetry    2      448.61  2.65186895
9                  ignobilis          telemetry    4      726.18  2.86104428
10                 rupestris     mark-recapture   16      196.00  2.29225607
11                  gibbosus          telemetry    4       82.00  1.91381385
12               macrochirus          telemetry    9       79.00  1.89762709
13                 megalotis     mark-recapture <NA>       16.00  1.20411998
14                  dolomieu          telemetry <NA>     1134.00  3.05461305
15                 salmoides          telemetry    9     2125.00  3.32735893
16                 annularis          telemetry   37      423.00  2.62634037
17                 baronessa direct observation <NA>       27.63  1.44138089
18                 trichrous direct observation   28       31.88  1.50351831
19              trifascialis direct observation <NA>       60.54  1.78204242
20              trifasciatus direct observation <NA>       70.45  1.84788100
21              unimaculatus direct observation <NA>       78.12  1.89276223
22              spectrabilis          telemetry    3     1551.13  3.19064820
23                     pinos direct observation <NA>        0.45 -0.34678749
24                     falco     mark-recapture   16       10.45  1.01911629
25                marmoratus     mark-recapture   27     1450.23  3.16143689
26                  japonica direct observation   34        2.70  0.43136376
27                     dalli     mark-recapture   48        0.31 -0.50863831
28                  hipoliti direct observation <NA>        0.22 -0.65757732
29                 nicholsii     mark-recapture  104        4.00  0.60205999
30               longipinnis     mark-recapture   14       71.23  1.85266294
31                     rufus direct observation   47      133.38  2.12509071
32                 undulatus     mark-recapture    1     1644.90  3.21613950
33                     julis     mark-recapture <NA>      119.16  2.07613050
34                bivittatus     mark-recapture    4        7.17  0.85551916
35                   garnoti     mark-recapture    2        6.57  0.81756537
36               maculipinna     mark-recapture    2        9.55  0.98000337
37                     poeyi     mark-recapture    2        7.03  0.84695533
38                dimidiatus direct observation <NA>        3.49  0.54282543
39                  bergylta          telemetry    2      362.30  2.55906833
40                lineolatus     mark-recapture   14       95.54  1.98018524
41                   pulcher          telemetry   16     1484.14  3.17147487
42                 adspersus          telemetry    8      103.47  2.01481445
43               bifasciatum     mark-recapture    2        3.12  0.49415459
44                    lunare direct observation <NA>       84.06  1.92458939
45                     harak          telemetry   21      236.76  2.37430833
46                    analis          telemetry    4     2167.70  3.33599918
47                    apodus          telemetry   15       56.04  1.74849813
48                decussatus          telemetry   58       50.00  1.69897000
49                   griseus          telemetry   14       56.27  1.75027691
50                 chrysurus          telemetry    5     1176.86  3.07072480
51                  princeps          telemetry   17     1940.27  3.28786217
52                    labrax          telemetry    2       85.99  1.93444795
53             flavolineatus          telemetry    4      297.72  2.47380801
54                porphyreus          telemetry   16      191.55  2.28228216
55                flavescens          telemetry    4      134.00  2.12710480
56                   luridus direct observation <NA>       94.58  1.97579931
57                   aruanus     mark-recapture <NA>        3.96  0.59769519
58                     argus     mark-recapture   16      697.00  2.84323278
59                 cruentata          telemetry   10      436.24  2.63972549
60               hemistiktos     mark-recapture    9      119.00  2.07554696
61                   miniata     mark-recapture   19      476.00  2.67760695
62                  guttatus     mark-recapture <NA>      312.30  2.49457198
63                marginatus          telemetry    7      398.51  2.60043922
64                     morio          telemetry   45     2181.15  3.33868553
65                  striatus          telemetry   22     2362.06  3.37329093
66                   tauvina          telemetry   14     3081.08  3.48870297
67                    huntii direct observation    6      119.00  2.07554696
68               maccullochi     mark-recapture   13       24.87  1.39567578
69                    bonaci          telemetry    3     3247.34  3.51152776
70                clathratus          telemetry   12      378.42  2.57797408
71                 nebulifer          telemetry    8     1527.64  3.18402102
72                 areolatus          telemetry   15     1992.23  3.29933948
73                 leopardus          telemetry   39     1753.40  3.24388100
74                  cabrilla          telemetry   15       41.11  1.61394748
75                    scriba          telemetry   15       75.93  1.88041340
76                   auratus          telemetry <NA>      934.20  2.97043986
77                    clarki     mark-recapture   58       99.20  1.99651167
78                     gilae     mark-recapture  129       47.00  1.67209786
79                    mykiss     mark-recapture  125      109.00  2.03742650
80                     salar     mark-recapture  MCP        2.00  0.30103000
81                    trutta          telemetry <NA>      402.00  2.60422605
82                    bairdi     mark-recapture   51        5.00  0.69897000
83                 carolinae     mark-recapture   32        3.00  0.47712126
84                     gobio     mark-recapture <NA>        5.00  0.69897000
85                  caurinus          telemetry    4     1100.33  3.04152295
86                   inermis          telemetry    3       99.25  1.99673052
87                   maliger          telemetry    5     1341.25  3.12750973
88                  melanops          telemetry   23      737.78  2.86792688
89                  mustinus          telemetry   10      780.54  2.89239516
90                   natalis     mark-recapture   27      202.00  2.30535137
91                guttulatus     mark-recapture <NA>        9.55  0.98000337
92            lumbriciformis direct observation <NA>        1.22  0.08635983
93                  rostrata     mark-recapture <NA>        8.96  0.95230801
94                chrysaetos         telemetry* <NA>     3000.00  3.47712126
95                     buteo         telemetry* <NA>      846.00  2.92737036
96                  gallicus         telemetry* <NA>     1699.00  3.23019338
97                 fasciatus         telemetry* <NA>     2049.00  3.31154196
98                  pennatus          telemetry    4      975.00  2.98900462
99              percnopterus         telemetry* <NA>     2203.00  3.34301450
100                australis          telemetry    6     2320.00  3.36548799
101                europaeus         telemetry* <NA>       48.00  1.68124124
102               ostralegus          telemetry    8      521.00  2.71683772
103                 garrulus         telemetry* <NA>      103.00  2.01283723
104                    epops         telemetry* <NA>       67.00  1.82607480
105               glandarius         telemetry* <NA>      151.50  2.18041263
106                  canorus         telemetry* <NA>      128.00  2.10720997
107            californianus          telemetry    9      300.00  2.47712126
108               radiolosus          telemetry    1      433.00  2.63648790
109                 cooperii direct observation <NA>      469.00  2.67117284
110                 gentilis direct observation <NA>      978.00  2.99033886
111                    nisus         telemetry* <NA>      807.00  2.90687353
112                 striatus direct observation <NA>      141.00  2.14921911
113              jamaicensis direct observation <NA>     1126.00  3.05153839
114                 lineatus direct observation <NA>      626.00  2.79657433
115                swainsoni direct observation <NA>      971.00  2.98721923
116                  cyaneus direct observation <NA>      521.00  2.71683772
117                 pygargus         telemetry* <NA>      315.50  2.49899936
118                   milvus         telemetry* <NA>     1033.70  3.01439452
119                 cheriway          telemetry   26     1125.00  3.05115252
120               americanus direct observation    6      625.00  2.79588002
121                biarmicus         telemetry* <NA>      675.00  2.82930377
122                mexicanus direct observation <NA>      721.00  2.85793527
123               peregrinus         telemetry* <NA>      781.50  2.89292898
124               sparverius direct observation <NA>      112.00  2.04921802
125              tinnunculus               <NA> <NA>      200.00  2.30103000
126                    wolfi          telemetry    1      506.00  2.70415052
127                  elegans          telemetry   18      266.00  2.42488164
128               polyglotta         telemetry* <NA>       11.00  1.04139268
129                 caudatus         telemetry* <NA>        8.00  0.90308999
130                  arborea direct observation <NA>       30.00  1.47712125
131               fuscicauda direct observation <NA>       37.70  1.57634135
132                   rubica direct observation <NA>       32.80  1.51587384
133               familiaris         telemetry* <NA>        8.77  0.94299959
134                 juncidis         telemetry* <NA>        9.80  0.99122608
135                    corax         telemetry* <NA>     1410.00  3.14921911
136               savannarum direct observation   54       16.70  1.22271647
137                   cyanea direct observation   10       14.30  1.15533604
138                  arborea direct observation   30       18.10  1.25767857
139                passerina direct observation <NA>       12.20  1.08635983
140                  coelebs         telemetry* <NA>       23.25  1.36642296
141                  serinus         telemetry* <NA>       10.70  1.02938378
142                    magna direct observation <NA>       89.00  1.94939001
143                 neglecta direct observation <NA>       89.00  1.94939001
144                   virens direct observation    8       27.00  1.43136376
145                 collurio direct observation <NA>       30.00  1.47712125
146             ludovicianus direct observation <NA>       48.10  1.68214508
147                    minor         telemetry* <NA>       44.22  1.64561874
148                  senator         telemetry* <NA>       35.00  1.54406804
149              polyglottos direct observation <NA>       50.10  1.69983773
150                     alba         telemetry* <NA>       21.22  1.32674538
151                    flava direct observation <NA>       17.50  1.24303805
152                  striata         telemetry* <NA>       12.80  1.10720997
153                 oenanthe direct observation <NA>       25.20  1.40140054
154              phoenicurus         telemetry* <NA>       15.21  1.18212921
155                  rubetra         telemetry* <NA>       16.48  1.21695721
156             atricapillus direct observation <NA>       11.00  1.04139268
157             carolinensis direct observation <NA>       10.10  1.00432137
158                inornatus direct observation <NA>       16.60  1.22010809
159                palustris direct observation <NA>       11.00  1.04139268
160             philadelphia direct observation <NA>       11.30  1.05307844
161                  trichas direct observation <NA>        9.80  0.99122608
162                   citrea direct observation <NA>       16.10  1.20682588
163             aurocapillus direct observation <NA>       18.90  1.27646180
164                    fusca direct observation <NA>        9.70  0.98677173
165                kirtlandi direct observation <NA>       14.00  1.14612804
166                 magnolia direct observation <NA>        8.60  0.93449845
167             pensylvanica direct observation <NA>        9.60  0.98227123
168                 petechia direct observation    8        9.50  0.97772360
169                ruticilla direct observation <NA>        9.00  0.95424251
170                   virens direct observation <NA>        9.00  0.95424251
171               canadensis direct observation <NA>        9.30  0.96848295
172                  bonelli         telemetry* <NA>        7.50  0.87506126
173             ignicapillus         telemetry* <NA>        5.30  0.72427587
174                  regulus         telemetry* <NA>        5.15  0.71180723
175                 europaea         telemetry* <NA>       18.30  1.26245109
176                 fasciata direct observation <NA>       14.80  1.17026172
177                    sarda         telemetry* <NA>       10.50  1.02118930
178                   undata         telemetry* <NA>        8.80  0.94448267
179                 bewickiI direct observation <NA>       11.00  1.04139268
180             ludovicianus direct observation    6       18.50  1.26717173
181                    aedon direct observation <NA>       11.20  1.04921802
182              troglodytes direct observation <NA>        9.50  0.97772360
183                   sialis direct observation <NA>       30.80  1.48855072
184                   virens direct observation <NA>       13.80  1.13987909
185                  minimus direct observation <NA>        9.90  0.99563519
186                 wrightii direct observation <NA>       12.30  1.08990511
187                 tyrannus direct observation <NA>       40.40  1.60638137
188             atricapillus direct observation <NA>        8.50  0.92941893
189                    belli direct observation <NA>       10.00  1.00000000
190                  griseus direct observation    2       11.40  1.05690485
191                olivaceus direct observation <NA>       17.60  1.24551267
192                stellaris          telemetry    8      900.00  2.95424251
193                   exilis          telemetry   33       67.00  1.82607480
194                  martius         telemetry* <NA>      277.37  2.44305949
195                torquilla         telemetry* <NA>       38.00  1.57978360
196                 leucotos         telemetry* <NA>      109.25  2.03842145
197                   medius         telemetry* <NA>       59.00  1.77085201
198              tridactylus         telemetry* <NA>       65.65  1.81723473
199                    canus         telemetry* <NA>      124.50  2.09516935
200                  viridis         telemetry* <NA>      186.67  2.27107453
201                 funereus         telemetry* <NA>      119.00  2.07554696
202                     otus         telemetry* <NA>      252.00  2.40140054
203                   noctua         telemetry* <NA>      156.50  2.19451434
204                     bubo         telemetry* <NA>     2191.00  3.34064238
205              virginianus direct observation <NA>     1510.00  3.17897695
206               passerinum         telemetry* <NA>       61.32  1.78760215
207                scandiaca direct observation <NA>     1920.00  3.28330123
208                    aluco direct observation   55      519.00  2.71516736
209                     alba         telemetry* <NA>      285.00  2.45484486
210               trevelyani         telemetry* <NA>      436.52  2.64000415
211                   granti         telemetry* <NA>       23.00  1.36172784
212                  lagopus         telemetry* <NA>     4989.53  3.69805964
213                 simensis         telemetry* <NA>    27749.81  4.44326001
214                 culpaeus         telemetry* <NA>     7370.04  3.86746985
215                  griseus         telemetry* <NA>     3989.97  3.60096963
216                  macroti         telemetry* <NA>     4499.97  3.65320962
217                 ruppelli         telemetry* <NA>     3249.97  3.51187935
218                    velox         telemetry* <NA>     2089.30  3.32000080
219                    ferox         telemetry* <NA>     9549.93  3.98000019
220                  jubatus         telemetry* <NA>    50000.00  4.69897000
221                  caracal         telemetry* <NA>    12999.90  4.11394001
222                    catus         telemetry* <NA>     3394.53  3.53077965
223               sylvestris         telemetry* <NA>     4825.03  3.68350002
224             yagouaroundi         telemetry* <NA>     6803.93  3.83275984
225                 pardalis         telemetry* <NA>     9989.64  3.99954984
226                   wiedii         telemetry* <NA>     3628.77  3.55975944
227                   serval         telemetry* <NA>    11999.97  4.07918016
228               canadensis         telemetry* <NA>    10205.87  4.00885003
229                     lynx         telemetry* <NA>    29999.91  4.47711995
230                 pardinus         telemetry* <NA>    11049.94  4.04335992
231                    rufus         telemetry* <NA>    11339.92  4.05460999
232                geoffroyi         telemetry* <NA>     3589.96  3.55508961
233                     onca         telemetry* <NA>    84040.77  4.92449002
234                   pardus         telemetry* <NA>    48374.89  4.68461999
235                   tigris         telemetry* <NA>   112000.51  5.04922000
236              bengalensis         telemetry* <NA>     2500.00  3.39794001
237                 concolor         telemetry* <NA>    89999.48  4.95424000
238                    uncia         telemetry* <NA>    30500.01  4.48429998
239              paludinosus         telemetry* <NA>     3599.98  3.55630009
240              penicillata         telemetry* <NA>      620.00  2.79239169
241                  parvula                 \\ <NA>      281.84  2.45000263
242               inchneumon          telemetry   20     2810.00  3.44870632
243                albicauda         telemetry* <NA>     3599.98  3.55630009
244                cristatus         telemetry* <NA>    10000.00  4.00000000
245                  barbata         telemetry* <NA>     4466.22  3.64994011
246                  vittata         telemetry* <NA>     1750.01  3.24304053
247                     gulo         telemetry* <NA>    21545.67  4.33336000
248                americana         telemetry* <NA>      883.49  2.94620164
249                    foina         telemetry* <NA>     1799.99  3.25527009
250                   martes         telemetry* <NA>     2475.03  3.39358047
251                 pennanti         telemetry* <NA>     3175.19  3.50176972
252                  erminea         telemetry* <NA>      270.54  2.43223149
253                  frenata         telemetry* <NA>      150.19  2.17664102
254                     furo         telemetry* <NA>      808.74  2.90780892
255                 lutreola         telemetry* <NA>      562.34  2.74999898
256                 nigripes         telemetry* <NA>      912.01  2.95999960
257                  nivalis         telemetry* <NA>       88.10  1.94497591
258                 sibirica         telemetry* <NA>      524.81  2.72000210
259                    taxus         telemetry* <NA>     8618.27  3.93542010
260                  ursinus         telemetry* <NA>    97750.73  4.99012001
261                  genetta         telemetry* <NA>     1750.01  3.24304053
262                  tigrina         telemetry* <NA>     2150.01  3.33244048
263                  zibetha         telemetry* <NA>     8000.00  3.90308999
264                geoffroii         telemetry* <NA>     1096.48  3.04000071
265                maculatus          telemetry   19     2810.00  3.44870632
266                 leucopus         telemetry* <NA>       23.00  1.36172784
267                 stuartii         telemetry* <NA>       27.50  1.43933269
268                americana         telemetry* <NA>       19.50  1.29003461
269                  elegans         telemetry* <NA>       29.00  1.46239800
270                europaeus         telemetry* <NA>      800.00  2.90308999
271                  auritus         telemetry* <NA>      296.00  2.47129171
272                rufescens         telemetry* <NA>       58.00  1.76342799
273            tetradactylus         telemetry* <NA>      201.00  2.30319606
274              chrysopygus         telemetry* <NA>      535.20  2.72851611
275                splendens         telemetry* <NA>      257.00  2.40993312
276                  auratus         telemetry* <NA>      390.50  2.59162104
277                 obesulus         telemetry* <NA>      775.00  2.88930170
278                 torridus         telemetry* <NA>       22.00  1.34242268
279               gossypinus         telemetry* <NA>       27.54  1.43996394
280                  russula         telemetry* <NA>       10.00  1.00000000
281                 arcticus         telemetry* <NA>        8.13  0.91009055
282                 cinereus         telemetry* <NA>        4.17  0.62013606
283                coronatus         telemetry* <NA>        9.33  0.96988164
284              gracillimus         telemetry* <NA>        4.37  0.64048144
285             unguiculatus         telemetry* <NA>       14.13  1.15014216
286                 cristata         telemetry* <NA>       47.86  1.67997269
287                aquaticus         telemetry* <NA>      103.50  2.01494035
288                 europaea         telemetry* <NA>       96.50  1.98452731
289                   romana         telemetry* <NA>       81.42  1.91073110
290                   vermis           radiotag    1        3.46  0.53907610
291                  viridis           radiotag   10        3.65  0.56229286
292              constrictor          telemetry   15      556.15  2.74519194
293 constrictor flaviventris          telemetry   12      144.50  2.15986785
294                punctatus     mark-recapture <NA>        9.00  0.95424251
295                  couperi          telemetry    1      450.00  2.65321251
296           guttata emoryi          telemetry   12      256.70  2.40942587
297                 obsoleta          telemetry   18      642.80  2.80807587
298              platirhinos          telemetry    8      147.32  2.16826171
299             viridiflavus          telemetry   32      234.10  2.36940141
300            getula getula          telemetry   12      315.72  2.49930209
301               triangulum          telemetry   10      165.00  2.21748394
302                flagellum          telemetry    4      534.50  2.72794771
303                   natrix          telemetry    4       78.50  1.89486966
304            erythrogaster          telemetry   15      313.24  2.49587722
305                 sipeodon          telemetry   13      190.55  2.28000895
306             rufodorsatus          telemetry   21       62.50  1.79588002
307                catenifer          telemetry    4      375.00  2.57403127
308             melanoleucus          telemetry   12     1004.00  3.00173371
309                  butleri     mark-recapture    1       21.51  1.33264041
310                    gigal          telemetry   11      306.00  2.48572143
311              longissimus          telemetry   32      249.30  2.39672228
312              bungaroides          telemetry   24       48.79  1.68833082
313                 scutatus          telemetry    5      330.00  2.51851394
314             porphyriacus          telemetry   44      479.00  2.68033551
315        spilota imbricata          telemetry   33     1226.85  3.08879147
316               contortrix          telemetry   18      231.12  2.36383753
317              piscivorous          telemetry   15      188.00  2.27415785
318               schneideri          telemetry   11       16.95  1.22916970
319                    asper          telemetry    6      826.23  2.91710096
320                    atrox          telemetry   14      319.90  2.50501424
321                 cerastes          telemetry   25      106.70  2.02816442
322                 horridus          telemetry    6     1020.00  3.00860017
323                 molossus          telemetry    3      414.00  2.61700034
324        oreganus concolor          telemetry   21      138.70  2.14207646
325                   pricei          telemetry    5       67.20  1.82736927
326               scutulatus          telemetry   19      280.30  2.44762310
327                   tigris          telemetry    3      234.70  2.37051309
328              shedaoensis          telemetry   16      196.81  2.29404716
329                   raddei          telemetry   14      162.14  2.20989017
330                 latastei          telemetry    7       97.40  1.98855896
331              longicollis          telemetry   32      691.00  2.83947805
332                    dahli          telemetry    8      595.00  2.77451697
333               serpentina          telemetry    6     4250.00  3.62838893
334          picta marginata          telemetry   18      354.50  2.54961624
335              reticularia          telemetry    7      588.00  2.76937733
336               blandingii          telemetry   10     1294.00  3.11193428
337              orbicularis          telemetry    3      462.00  2.66464198
338            flavimaculata          telemetry    7     1135.00  3.05499586
339                rubrubrum          telemetry   10      154.70  2.18949031
340           minor peltifer          telemetry   14      164.00  2.21484385
341                 odoratus          telemetry   18      190.00  2.27875360
342                spinifera          telemetry   11     2982.33  3.47455570
                                                                                                           alternative.mass.reference
1                                                                                                                                <NA>
2                                                                                                                                <NA>
3                                                                                                                                <NA>
4                                                                                                                                <NA>
5                                                                                                                                <NA>
6                                                                                                                                <NA>
7                                                                                                                                <NA>
8                                                                                                                                <NA>
9                                                                                                                                <NA>
10                                                                                                                               <NA>
11                                                                                                                               <NA>
12                                                                                                                               <NA>
13                                                                                                                               <NA>
14                                                                                                                               <NA>
15                                                                                                                               <NA>
16                                                                                                                               <NA>
17                                                                                                                               <NA>
18                                                                                                                               <NA>
19                                                                                                                               <NA>
20                                                                                                                               <NA>
21                                                                                                                               <NA>
22                                                                                                                               <NA>
23                                                                                                                               <NA>
24                                                                                                                               <NA>
25                                                                                                                               <NA>
26                                                                                                                               <NA>
27                                                                                                                               <NA>
28                                                                                                                               <NA>
29                                                                                                                               <NA>
30                                                                                                                               <NA>
31                                                                                                                               <NA>
32                                                                                                                               <NA>
33                                                                                                                               <NA>
34                                                                                                                               <NA>
35                                                                                                                               <NA>
36                                                                                                                               <NA>
37                                                                                                                               <NA>
38                                                                                                                               <NA>
39                                                                                                                               <NA>
40                                                                                                                               <NA>
41                                                                                                                               <NA>
42                                                                                                                               <NA>
43                                                                                                                               <NA>
44                                                                                                                               <NA>
45                                                                                                                               <NA>
46                                                                                                                               <NA>
47                                                                                                                               <NA>
48                                                                                                                               <NA>
49                                                                                                                               <NA>
50                                                                                                                               <NA>
51                                                                                                                               <NA>
52                                                                                                                               <NA>
53                                                                                                                               <NA>
54                                                                                                                               <NA>
55                                                                                                                               <NA>
56                                                                                                                               <NA>
57                                                                                                                               <NA>
58                                                                                                                               <NA>
59                                                                                                                               <NA>
60                                                                                                                               <NA>
61                                                                                                                               <NA>
62                                                                                                                               <NA>
63                                                                                                                               <NA>
64                                                                                                                               <NA>
65                                                                                                                               <NA>
66                                                                                                                               <NA>
67                                                                                                                               <NA>
68                                                                                                                               <NA>
69                                                                                                                               <NA>
70                                                                                                                               <NA>
71                                                                                                                               <NA>
72                                                                                                                               <NA>
73                                                                                                                               <NA>
74                                                                                                                               <NA>
75                                                                                                                               <NA>
76                                                                                                                               <NA>
77                                                                                                                               <NA>
78                                                                                                                               <NA>
79                                                                                                                               <NA>
80                                                                                                                               <NA>
81                                                                                                                               <NA>
82                                                                                                                               <NA>
83                                                                                                                               <NA>
84                                                                                                                               <NA>
85                                                                                                                               <NA>
86                                                                                                                               <NA>
87                                                                                                                               <NA>
88                                                                                                                               <NA>
89                                                                                                                               <NA>
90                                                                                                                               <NA>
91                                                                                                                               <NA>
92                                                                                                                               <NA>
93                                                                                                                               <NA>
94                                                                                                                               <NA>
95                                                                                                                               <NA>
96                                                                                                                               <NA>
97                                                                                                                               <NA>
98                                                                                                                               <NA>
99                                                                                                                               <NA>
100                                                                                                                              <NA>
101                                                                                                                              <NA>
102                                                                                                                              <NA>
103                                                                                                                              <NA>
104                                                                                                                              <NA>
105                                                                                                                              <NA>
106                                                                                                                              <NA>
107                                                                    Weight calculated from telemetry backpack (10g = 3% body mass)
108                                                                                                                              <NA>
109                                                                                                                              <NA>
110                                                                                                                              <NA>
111                                                                                                                              <NA>
112                                                                                                                              <NA>
113                                                                                                                              <NA>
114                                                                                                                              <NA>
115                                                                                                                              <NA>
116                                                                                                                              <NA>
117                                                                                                                              <NA>
118                                                                                                                              <NA>
119                                                                                                                              <NA>
120                                                                                                                              <NA>
121                                                                                                                              <NA>
122                                                                                                                              <NA>
123                                                                                                                              <NA>
124                                                                                                                              <NA>
125                                                                                                                              <NA>
126                                                                                                                              <NA>
127                                                                                                                              <NA>
128                                                                                                                              <NA>
129                                                                                                                              <NA>
130                                                                                                                              <NA>
131                                                                                                                              <NA>
132                                                                                                                              <NA>
133                                                                                                                              <NA>
134                                                                                                                              <NA>
135                                                                                                                              <NA>
136                                                                                                                              <NA>
137                                                                                                                              <NA>
138                                                                                                                              <NA>
139                                                                                                                              <NA>
140                                                                                                                              <NA>
141                                                                                                                              <NA>
142                                                                                                                              <NA>
143                                                                                                                              <NA>
144                                                                                                                              <NA>
145                                                                                                                              <NA>
146                                                                                                                              <NA>
147                                                                                                                              <NA>
148                                                                                                                              <NA>
149                                                                                                                              <NA>
150                                                                                                                              <NA>
151                                                                                                                              <NA>
152                                                                                                                              <NA>
153                                                                                                                              <NA>
154                                                                                                                              <NA>
155                                                                                                                              <NA>
156                                                                                                                              <NA>
157                                                                                                                              <NA>
158                                                                                                                              <NA>
159                                                                                                                              <NA>
160                                                                                                                              <NA>
161                                                                                                                              <NA>
162                                                                                                                              <NA>
163                                                                                                                              <NA>
164                                                                                                                              <NA>
165                                                                                                                              <NA>
166                                                                                                                              <NA>
167                                                                                                                              <NA>
168                                                                                                                              <NA>
169                                                                                                                              <NA>
170                                                                                                                              <NA>
171                                                                                                                              <NA>
172                                                                                                                              <NA>
173                                                                                                                              <NA>
174                                                                                                                              <NA>
175                                                                                                                              <NA>
176                                                                                                                              <NA>
177                                                                                                                              <NA>
178                                                                                                                              <NA>
179                                                                                                                              <NA>
180                                                                                                                              <NA>
181                                                                                                                              <NA>
182                                                                                                                              <NA>
183                                                                                                                              <NA>
184                                                                                                                              <NA>
185                                                                                                                              <NA>
186                                                                                                                              <NA>
187                                                                                                                              <NA>
188                                                                                                                              <NA>
189                                                                                                                              <NA>
190                                                                                                                              <NA>
191                                                                                                                              <NA>
192                                                                                                                              <NA>
193                                                                                                                              <NA>
194                                                                                                                              <NA>
195                                                                                                                              <NA>
196                                                                                                                              <NA>
197                                                                                                                              <NA>
198                                                                                                                              <NA>
199                                                                                                                              <NA>
200                                                                                                                              <NA>
201                                                                                                                              <NA>
202                                                                                                                              <NA>
203                                                                                                                              <NA>
204                                                                                                                              <NA>
205                                                                                                                              <NA>
206                                                                                                                              <NA>
207                                                                                                                              <NA>
208                                                                                                                              <NA>
209                                                                                                                              <NA>
210                                                                                                                              <NA>
211                                                                                                                              <NA>
212                                                                                                                              <NA>
213                                                                                                                              <NA>
214                                                                                                                              <NA>
215                                                                                                                              <NA>
216                                                                                                                              <NA>
217                                                                                                                              <NA>
218                                                                                                                              <NA>
219                                                                                                                              <NA>
220                                                                                                                              <NA>
221                                                                                                                              <NA>
222                                                                                                                              <NA>
223                                                                                                                              <NA>
224                                                                                                                              <NA>
225                                                                                                                              <NA>
226                                                                                                                              <NA>
227                                                                                                                              <NA>
228                                                                                                                              <NA>
229                                                                                                                              <NA>
230                                                                                                                              <NA>
231                                                                                                                              <NA>
232                                                                                                                              <NA>
233                                                                                                                              <NA>
234                                                                                                                              <NA>
235                                                                                                                              <NA>
236                                                                                                                              <NA>
237                                                                                                                              <NA>
238                                                                                                                              <NA>
239                                                                                                                              <NA>
240                                                                                                                              <NA>
241                                                                                                                              <NA>
242                                                                                                                              <NA>
243                                                                                                                              <NA>
244                                                                                                                              <NA>
245                                                                                                                              <NA>
246                                                                                                                              <NA>
247                                                                                                                              <NA>
248                                                                                                                              <NA>
249                                                                                                                              <NA>
250                                                                                                                              <NA>
251                                                                                                                              <NA>
252                                                                                                                              <NA>
253                                                                                                                              <NA>
254                                                                                                                              <NA>
255                                                                                                                              <NA>
256                                                                                                                              <NA>
257                                                                                                                              <NA>
258                                                                                                                              <NA>
259                                                                                                                              <NA>
260                                                                                                                              <NA>
261                                                                                                                              <NA>
262                                                                                                                              <NA>
263                                                                                                                              <NA>
264                                                                                                                              <NA>
265                                                                                                                              <NA>
266                                                                                                                              <NA>
267                                                                                                                              <NA>
268                                                                                                                              <NA>
269                                                                                                                              <NA>
270                                                                                                                              <NA>
271                                                                                                                              <NA>
272                                                                                                                              <NA>
273                                                                                                                              <NA>
274                                                                                                                              <NA>
275                                                                                                                              <NA>
276                                                                                                                              <NA>
277                                                                                                                              <NA>
278                                                                                                                              <NA>
279                                                                                                                              <NA>
280                                                                                                                              <NA>
281                                                                                                                              <NA>
282                                                                                                                              <NA>
283                                                                                                                              <NA>
284                                                                                                                              <NA>
285                                                                                                                              <NA>
286                                                                                                                              <NA>
287                                                                                                                              <NA>
288                                                                                                                              <NA>
289                                                                                                                              <NA>
290                                                                                                                              <NA>
291                                                                                                                              <NA>
292                                                                                                                              <NA>
293                                                                                                                              <NA>
294                                                                                                                              <NA>
295                                                                                                                              <NA>
296                                                                                                                              <NA>
297                                                                                                                              <NA>
298                                                                                                                              <NA>
299                                                                                                                              <NA>
300                                                                                                                              <NA>
301                                                                                                                              <NA>
302                                                                                                                              <NA>
303                                                                                                                              <NA>
304                                                                                                                              <NA>
305                                                                                                                              <NA>
306                                                                                                                              <NA>
307                                                                                                                              <NA>
308                                                                                                                              <NA>
309                                                                                                                              <NA>
310                                                                                                                              <NA>
311                                                                                                                              <NA>
312                                                                                                                              <NA>
313                                                                                                                              <NA>
314                                                                                                                              <NA>
315                                                                                                                              <NA>
316                                                                                                                              <NA>
317                                                                                                                              <NA>
318                                                                                                                              <NA>
319                                                                                                                              <NA>
320                                                                                                                              <NA>
321                                                                                                                              <NA>
322                                                                                                                              <NA>
323                                                                                                                              <NA>
324                                                                                                                              <NA>
325                                                                                                                              <NA>
326                                                                                                                              <NA>
327                                                                                                                              <NA>
328                                                                                                                              <NA>
329                                                                                                                              <NA>
330                                                                                                                              <NA>
331                                                                                                                              <NA>
332                                                                                                                              <NA>
333                                                                                                                              <NA>
334 Snow JE. 1984. Feeding Ecology of Juvenile Turtles (Chrysemys) under experimental conditions. PhD Thesis, University of Oklahoma.
335                                                                                                                              <NA>
336                                                                                                                              <NA>
337                                                                                                                              <NA>
338                                                                                                                              <NA>
339                                                                                                                              <NA>
340                                                                                                                              <NA>
341                                                                                                                              <NA>
342                                                                                                                              <NA>
     mean.hra.m2   log10.hra
1      282750.00  5.45140261
2         282.10  2.45040309
3         116.11  2.06486963
4         125.50  2.09864373
5          87.10  1.94001815
6       39343.50  4.59487299
7        9056.41  3.95695608
8       44516.15  4.64851760
9       52773.00  4.72241178
10      10406.90  4.01732138
11       4950.00  3.69460520
12       4420.00  3.64542227
13         97.50  1.98900462
14       1936.50  3.28701750
15      34403.33  4.53660048
16     158000.00  5.19865709
17         63.24  1.80099186
18         59.50  1.77451697
19         64.91  1.81231161
20        220.93  2.34425469
21        274.94  2.43923793
22       2046.67  3.31104782
23          2.54  0.40483372
24         46.20  1.66464198
25       3303.11  3.51892304
26         28.27  1.45132581
27          0.50 -0.30103000
28          0.03 -1.52287875
29          0.32 -0.49485002
30         61.50  1.78887512
31        517.80  2.71416205
32      50000.00  4.69897000
33        227.60  2.35717226
34        142.50  2.15381486
35        128.50  2.10890313
36        158.40  2.19975518
37        163.70  2.21404868
38         33.16  1.52061452
39       4028.59  3.60515307
40        856.00  2.93247377
41      15134.00  4.17995373
42       1368.11  3.13612102
43        103.30  2.01410032
44         11.87  1.07445072
45       1988.10  3.29843822
46    7640000.00  6.88309336
47       6660.00  3.82347423
48       1340.60  3.12729921
49      35384.00  4.54880693
50    4172000.00  6.62034430
51      35474.00  4.54991016
52      17712.35  4.24827618
53       5400.00  3.73239376
54      19200.00  4.28330123
55      11400.00  4.05690485
56         27.00  1.43136376
57          1.10  0.04139268
58       1300.00  3.11394335
59       2120.00  3.32633586
60         12.00  1.07918125
61        217.00  2.33645973
62       1243.40  3.09461086
63       5312.00  3.72525807
64    2087500.00  6.31962648
65      18305.00  4.26256973
66     299000.00  5.47567119
67          2.19  0.34044411
68          6.83  0.83442070
69    1435000.00  6.15685190
70       3760.25  3.57521672
71      10002.71  4.00011768
72     168000.00  5.22530928
73      18796.00  4.27406544
74     761666.67  5.88176495
75    1107500.00  6.04434373
76      29754.81  4.47355718
77        101.25  2.00539503
78        343.70  2.53617953
79        174.00  2.24054925
80         45.00  1.65321251
81      15288.40  4.18436204
82         83.90  1.92376196
83         47.00  1.67209786
84         48.13  1.68241586
85       2157.75  3.33400112
86        815.40  2.91137071
87       1571.00  3.19617619
88     250000.00  5.39794001
89      34692.40  4.54023435
90       6145.74  3.78857418
91         19.90  1.29885308
92         12.60  1.10037055
93        151.50  2.18041263
94   27550000.00  7.44012160
95   50240000.00  7.70104963
96   78500000.00  7.89486966
97   19620000.00  7.29269900
98  117300000.00  8.06929801
99   63570000.00  7.80325221
100    463900.00  5.66642437
101    785000.00  5.89486966
102   2460000.00  6.39093511
103   1000000.00  6.00000000
104  12560000.00  7.09898964
105  12560000.00  7.09898964
106  38460000.00  7.58500928
107    550000.00  5.74036269
108    499000.00  5.69810055
109   2254095.45  6.35297230
110  40000000.00  7.60205999
111   7100000.00  6.85125835
112    995525.10  5.99805221
113   4249192.50  6.62830641
114    639402.30  5.80577419
115   2464531.65  6.39173440
116   2521187.55  6.40160515
117 200980000.00  8.30315284
118  19625000.00  7.29280967
119 241000000.00  8.38201704
120    666000.00  5.82347423
121  50000000.00  7.69897000
122  25778434.50  7.41125654
123 153860000.00  8.18712573
124   1416397.50  6.15118515
125   3000000.00  6.47712126
126     90000.00  4.95424251
127     44000.00  4.64345268
128     30000.00  4.47712126
129     42000.00  4.62324929
130     82960.43  4.91887099
131     60702.75  4.78320837
132     48562.20  4.68629835
133     47000.00  4.67209786
134     14400.00  4.15836249
135  28000000.00  7.44715803
136     10926.50  4.03848107
137      1052.18  3.02209004
138     16996.77  4.23036640
139     30756.06  4.48793070
140     42000.00  4.62324929
141     10000.00  4.00000000
142     30351.38  4.48217844
143     30351.38  4.48217844
144      1335.46  3.12563088
145     15782.72  4.19818185
146     75676.10  4.87895874
147    635800.00  5.80332052
148     80000.00  4.90308999
149      4046.85  3.60711711
150    785000.00  5.89486966
151     10117.13  4.00505733
152     10000.00  4.00000000
153     15378.03  4.18690070
154      4500.00  3.65321251
155      7300.00  3.86332286
156     14568.66  4.16341961
157     14973.35  4.17531898
158     24281.10  4.38526836
159     22662.36  4.35530513
160      7689.02  3.88587099
161      5260.91  3.72106087
162     14973.35  4.17531898
163     10117.13  4.00505733
164      5260.91  3.72106087
165     33993.54  4.53139639
166      7284.33  3.86238961
167      6070.28  3.78320872
168      1699.68  3.23036716
169      1942.49  3.28835879
170      6474.96  3.81123709
171     10117.13  4.00505733
172     35000.00  4.54406804
173     16500.00  4.21748394
174     19900.00  4.29885308
175     21000.00  4.32221930
176      3237.48  3.51020709
177      3300.00  3.51851394
178      2800.00  3.44715803
179      4856.22  3.68629835
180      1214.06  3.08424015
181      4046.85  3.60711711
182     10117.13  4.00505733
183     10117.13  4.00505733
184     44029.73  4.64374602
185      1780.61  3.25056881
186     15782.72  4.19818185
187     83769.80  4.92308748
188     14973.35  4.17531898
189     11735.87  4.06951529
190      1335.46  3.12563088
191      7284.33  3.86238961
192    193000.00  5.28555731
193     97000.00  4.98677173
194   3500000.00  6.54406804
195   1038100.00  6.01623919
196   5306600.00  6.72481635
197    141500.00  5.15075644
198    350000.00  5.54406804
199   4521600.00  6.65529214
200   1850000.00  6.26717173
201   3140000.00  6.49692965
202  19620000.00  7.29269900
203    500000.00  5.69897000
204  16000000.00  7.20411998
205   2124596.25  6.32727641
206   1250000.00  6.09691001
207   4937157.00  6.69347694
208    356932.17  5.55258569
209   1500000.00  6.17609126
210       616.60  2.79000352
211     46299.89  4.66557996
212  28499024.85  7.45483000
213   5393739.90  6.73189000
214   4928672.94  6.69273000
215   2000000.02  6.30103000
216   8772835.78  6.94314000
217  30399749.15  7.48287000
218   5495408.74  6.74000000
219    891250.94  5.95000000
220 815060787.90  8.91119000
221 376634414.00  8.57592000
222   1472448.11  6.16804000
223   2794988.34  6.44638000
224  67079528.30  7.82659000
225   6849360.11  6.83565000
226  10949896.14  7.03941000
227   2390011.55  6.37840000
228  82748475.24  7.91776000
229 181042275.70  8.25778000
230   9499921.14  6.97772000
231  39877690.65  7.60073000
232   7126724.98  6.85289000
233  82735138.83  7.91769000
234 504940260.80  8.70324000
235  53583367.03  7.72903000
236   2406855.40  6.38145000
237 312003883.70  8.49416000
238  17353217.10  7.23938000
239   2219984.80  6.34635000
240    592570.46  5.77274000
241    281838.29  5.44999999
242   3100000.00  6.49136169
243    387266.56  5.58801000
244   3799968.53  6.57978000
245  14617395.58  7.16487000
246   4150018.19  6.61805000
247 361917847.30  8.55861000
248   7066103.59  6.84918000
249   4356522.89  6.63914000
250   9093477.57  6.95873000
251  16755600.61  7.22416000
252   1323244.20  6.12164000
253    176750.24  5.24736001
254    899994.80  5.95424000
255    208929.61  5.31999999
256   1000000.00  6.00000000
257    648858.50  5.81215000
258   4073802.78  6.61000000
259   3808816.06  6.58079000
260  10000000.00  7.00000000
261   7809981.41  6.89265000
262     57500.29  4.75967004
263  11999965.57  7.07918000
264   2290867.65  6.36000000
265  11595000.00  7.06427075
266     11410.11  4.05728983
267     35000.16  4.54407003
268       467.74  2.67000451
269       707.94  2.84999645
270    194236.12  5.28832999
271     40377.55  4.60613996
272      3393.13  3.53060050
273     11999.97  4.07918016
274     29000.13  4.46239994
275       100.00  2.00000000
276    116834.20  5.06756999
277     21133.43  4.32496999
278     25945.38  4.41406004
279      5011.87  3.69999980
280       234.42  2.36999466
281      4786.30  3.67999992
282      5011.87  3.69999980
283       371.54  2.57000558
284       275.42  2.43999547
285        77.62  1.88997364
286      3630.78  3.55999993
287      7428.65  3.87090990
288      3004.35  3.47775053
289      2828.59  3.45157000
290       700.00  2.84509804
291       253.00  2.40312052
292    151000.00  5.17897695
293    114500.00  5.05880549
294      6476.00  3.81130684
295   1853000.00  6.26787542
296    150600.00  5.17782497
297     46000.00  4.66275783
298    516375.00  5.71296521
299    110900.00  5.04493155
300    495000.00  5.69460520
301    240400.00  5.38093446
302    429300.00  5.63276089
303     99000.00  4.99563520
304    131000.00  5.11727130
305     40000.00  4.60205999
306     15400.00  4.18752072
307     17400.00  4.24054925
308    701000.00  5.84571802
309       600.00  2.77815125
310    374800.00  5.57379958
311     77400.00  4.88874096
312     27379.00  4.43741758
313     38800.00  4.58883173
314     96000.00  4.98227123
315    171600.00  5.23451728
316    119288.89  5.07660000
317     10655.00  4.02755345
318       200.00  2.30103000
319     60700.00  4.78318869
320     54200.00  4.73399929
321     28000.00  4.44715803
322   2579600.00  6.41155237
323     34900.00  4.54282543
324   1178000.00  6.07114529
325     22900.00  4.35983548
326    316000.00  5.49968708
327     34800.00  4.54157924
328      2613.69  3.41725408
329    245928.57  5.39080898
330      2400.00  3.38021124
331    142000.00  5.15228834
332    115500.00  5.06258198
333     65300.00  4.81491318
334     31500.00  4.49831055
335     23800.00  4.37657696
336     33000.00  4.51851394
337     35160.00  4.54604887
338     57500.00  4.75966785
339    186000.00  5.26951294
340      5180.00  3.71432976
341     28000.00  4.44715803
342   1800000.00  6.25527250
                                                                                                                                                                                                                                                                    hra.reference
1                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
2                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
3                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
4                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
5                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
6                                                                                                                                      Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
7                                                                                               Sarno B, Glass CW, Smith GW, et al. 1994. A comparison of the movements of two species of gadoid in the vicinity of an underwater reef. Journal of Fisheries Biology 45, 811-817.
8                                                                                               Sarno B, Glass CW, Smith GW, et al. 1994. A comparison of the movements of two species of gadoid in the vicinity of an underwater reef. Journal of Fisheries Biology 45, 811-817.
9                                                                    Wetherbee BM, Holland KN, Meyer CG, et al. 2004. Use of a marine reserve in Kaneohe Bay, Hawaii by the giant trevally, Caranx ignobilis. Fisheries Research 67, 253-263. (doi:10.1016/j.fishres.2003.11.004)
10                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
11                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
12                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
13                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
14                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
15                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
16                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
17                                                                                                                                                                                Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
18                                                                                                             Reavis RH, Copus JM. 2011. Monogamy in a feeding generalist, Chaetodon trichrous, the endemic Tahitian Butterflyfish. Environmental Biology of Fishes 92, 167-179.
19                                                                                                                                                                                Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
20                                                                                                                                             Sutton M. 1985. Patterns of spacing in a coral reef fish in two habitats on the Great Barrier Reef. Animal Behavior 33, 1332-1337.
21                                                                                                                                                                                Reese ES. 1973. Duration of Residence by Coral Reef Fishes on "Home" Reefs. Copeia, 1, 145-149.
22                                                                                             Buxton CD, Semmens JM, Forbes E, et al. 2010. Spatial Management of Reef Fisheries And Ecosystems: Understanding The Importance of Movement. FRDC Final Report - Project 2004/002.
23                                                                                                                                                         Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
24                                                                                    Kadota T, Osato J, Hashimoto H, et al. 2011. Harem structure and female territoriality in the dwarf hawkfish Cirrhitichthys falco (Cirrhitidae). Environmental Biology of Fishes 92, 79-88.
25                                                                        Mireles C, Nakamura R, Wendt DE. 2012. A collaborative approach to investigate site fidelity, home range, and homing behavior of cabezon (Scorpaenichthys marmoratus). Fisheries Research 113, 133-142.
26                                                                                                                                 Yanagisawa Y. 1982. Social Behaviour and Mating System of the Gobiid Fish Amblyeleotris japonica. Japanese Journal of Ichthyology 28: 401-422.
27                                               St. Mary CM. 1994. Sex allocation in a simultaneous hermaphrodite, the blue-banded goby (Lythrypnus dalli): the effects of body size and behavioral gender and the consequences for reproduction. Behavioral Ecology 5, 304-313.
28                                                                                                                                                         Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
29                                                    Kroon FJ, de Graff M, Liley NR. 2000. Social organisation and competition for refuges and nest sites in Coryphopterus nicholsii (Gobiidae), a temperate protogynous reef fish. Environmental Biology of Fishes 57, 401-411.
30                                                                                     Takegaki T. 2001. Environmental factors affecting the spawning burrow selection by the gobiid Valenciennea longipinnis. Journal of Fish Biology. 58, 222-229. (doi:10.1006/jfbi.2000.1438)
31                                                                                                                                                 Hoffman SG. 1983. Sex-Related Foraging Behavior in Sequentially Hermaphroditic Hogfishes (Bodianus Spp.). Ecology 64, 798-808.
32                                                                       Chateau O, Wantiez L. 2007. Site fidelity and activity patterns of a humphead wrasse, Cheilinus undulatus (Labridae), as determined by acoustic telemetry. Environmental Biology of Fishes 808, 503-508.
33                                      Palmer M, Balle S, March D, et al. 2011. Size estimation of circular home range from fish mark-release-(single)-recapture data: case study of a small labrid targeted by recreational fishing. Marine Ecology Progress Series 430, 87-97.
34                                                                                                                               Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
35                                                                                                                               Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
36                                                                                                                               Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
37                                                                                                                               Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
38                                                                                    Robertson DR. 1974. A Study of the Ethology and Reproductive Biology of the Labrid Fish, Labroides dimidiatus, at Heron Island, Great Barrier Reef. Ph.D. thesis. University of Queensland.
39                                                                                                               Pita P, Freire J. 2011. Movements of three large coastal predatory fishes in the northeast Atlantic: a preliminary telemetry study. Scientia Marina 75, 759-770.
40  Kingsford MJ, Carlson IJ. 2010. Patterns of distribution and movement of fishes, Ophthalmolepis lineolatus and Hypoplectrodes maccullochi, on temperate rocky reefs of south eastern Australia. Environmental Biology of Fishes 88, 105-118. (doi: 10.1007/s10641-010-9621-1)
41                                                                 Topping DT, Lowe CG, Caselle JE. 2005. Home range and habitat utilization of adult California sheephead, Semicossyphus pulcher (Labridae), in a temperate no-take marine reserve. Marine Biology 147, 301-311.
42                                                                                Bradbury C, Green JM, Bruce-Lockhart. 1995. Home ranges of female cunner, Tautogolabrus adspersus (Labridae), as determined by ultrasonic telemetry. Canadian Journal of Zoology 73, 1268-1279.
43                                                                                                                               Jones KMM. 2005. Home range areas and activity centres in six species of Caribbean wrasses (Labridae). Journal of Fisheries Biology 66, 150-166.
44                 Robertson DR, Choat JH. 1974. Protogynous Hermaphroditism and Social Systems in Labrid Fish. In: Proc. Int. Coral Reef Symp., 2nd ed. (Cameron, A.M., B.M. Cambell, A.B. Cribb, R.Endean, J.S. Jell, O.A. Jones, P. Mather and F.H. Talbot, eds.), 1, 217-226.
45                                                                                             Nanami A, Yamada H. 2009. Site fidelity, size, and spatial arrangement of daytime home range of thumbprint emperor Lethrinus harak (Lethrinidae). Fisheries Science 75, 1109-1116.
46                                                                                                                                 Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
47                                                                                                            Hammerschlag-Peyer CM, Layman CA. 2010. Intrapopulation variation in habitat use by two abundant coastal fish species. Marine Ecology Progress Series 415, 211-220.
48                                                  Nanami A, Yamada H. 2008. Size and spatial arrangement of home range of checkered snapper Lutjanus decussatus (Lutjanidae) in an Okinawan coral reef determined using a portable GPS receiver. Marine Biology 153, 1103-1111.
49                                                                                                            Hammerschlag-Peyer CM, Layman CA. 2010. Intrapopulation variation in habitat use by two abundant coastal fish species. Marine Ecology Progress Series 415, 211-220.
50                                                                                                                                 Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
51                                                                                        Bellquist LF, Lowe CG, Caselle JE. 2008. Fine-scale movement patterns, site fidelity, and habitat selection of ocean whitefish (Caulolatilus princeps). Fisheries Research 91, 325-335.
52                                                                                                               Pita P, Freire J. 2011. Movements of three large coastal predatory fishes in the northeast Atlantic: a preliminary telemetry study. Scientia Marina 75, 759-770.
53                                                                Holland KN, Peterson JD, Lowe CG, et al. 1993. Movements, Distribution and Growth Rates of The White Goatfish Mulloides flavolineatus in a Fisheries Conservation Zone. Bulletin of Marine Science 52: 982-992.
54                                   Meyer CG, Holland KN, Wetherbee BM, et al. 2000. Movement patterns, habitat utilization, home range size and site fidelity of whitesaddle goatfish, Parupeneus porphyreus, in a marine reserve. Environmental Biology of Fishes 59, 235-242.
55                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
56                                                                                                            Mapstone GM, Wood EM. 1975. The ethology of Abudefduf luridus and Chromis chromis (Pisces: Pomacentridae) from the Azores. Journal of Zoology, London 175, 179-199.
57                                                                                                                                                  Sale PF. 1971. Extremely Limited Home Range in a Coral Reef Fish, Dascyllus aruanus (Pisces; Pomacentridae). Copeia, 324-327.
58                                                                Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
59                                                                                         Popple ID, Hunte W. 2005. Movement patterns of Cephalopholis cruentata in a marine reserve in St Lucia, W.I., obtained from ultrasonic telemetry. Journal of Fish Biology 67, 981-992.
60                                                                Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
61                                                                Shpigel M, Fishelson L. 1991. Territoriality and associated behaviour in three species of the genus Cephalopholis (Pisces: Serranidae) in the Gulf of Aqaba, Red Sea. Journal of Fisheries Biology 38, 887-896.
62                                                                               Shapiro DY, Garcia-Moliner G, Sadovy Y. 1994. Social system of an inshore stock of the red hind grouper, Ephephelus guttatus (Pisces : Serranidae). Environmental Biology of Fishes 41, 415-422.
63                                   Lembo G, Spedicato MT, \xd8kland F, et al. 2002. A wireless communication system for determining site fidelity of juvenile dusky groupers Epinephelus marginatus (Lowe, 1834) using coded acoustic transmitters. Hydrobiologia 483, 249-257.
64                                                                                                                                 Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
65                                                                    Bolden SK. 2001. Using Ultrasonic Telemetry to Determine Home Range of a Coral-Reef Fish. In: Sibert JR, Nielsen JL, eds. Electronic Tagging and Tracking in Marine Fisheries New York, NY: Springer. 484p.
66                                                                   Kaunda-Arara B, Rose GA. 2004. Homing and site fidelity in the greasy grouper Epinephelus tauvina (Serranidae) within a marine protected area in coastal Kenya. Marine Ecology Progress Series 277, 245-251.
67                                                                                               Jones GP. 1980. Contribution to the biology of the redbanded perch, Ellerkeidia huntii (Hector), with a discussion on hermaphroditism. Journal of Fisheries Biology 17, 197-207.
68  Kingsford MJ, Carlson IJ. 2010. Patterns of distribution and movement of fishes, Ophthalmolepis lineolatus and Hypoplectrodes maccullochi, on temperate rocky reefs of south eastern Australia. Environmental Biology of Fishes 88, 105-118. (doi: 10.1007/s10641-010-9621-1)
69                                                                                                                                 Farmer NA, Ault JS. 2011. Grouper and snapper movements and habitat use in Dry Tortugas, Florida. Marine Ecology Progress Series 433, 169-184.
70                                             Lowe CG, Topping DT, Cartamil DP, et al. 2003. Movement patterns, home range, and habitat utilization of adult kelp bass Paralabrax clathratus in a temperate no-take marine reserve. Marine Ecology Progress Series 256, 205-216.
71                                                                                                    Mason TJ, Lowe CG. 2010. Home range, habitat use, and site fidelity of barred sand bass within a southern California marine protected area. Fisheries Research 106, 93-101.
72                                                                                                                            Hutchinson N, Rhodes KL. 2010. Home range estimates for squaretail coralgrouper, Plectropomus areolatus (R\xfcppell 1830). Coral Reefs 29: 511-519.
73                                                                                                                          Zeller DC. 1997. Home range and activity patterns of the coral trout Plectropomus leopardus (Serranidae). Marine Ecology Progress Series. 154, 65-77.
74                                                 Al\xf3s J, March D, Palmer M, Grau A, Morales-Nin. 2011. Spatial and temporal patterns in Serranus cabrilla habitat use in the NW Mediterranean revealed by acoustic telemetry. Marine Ecology Progress Series 427, 173 - 186.
75                                                           March D, Palmer M, Al\xf3s J, et al. 2010. Short-term residence, home range size and diel patterns of the painted comber Serranus scriba in a temperate marine reserve. Marine Ecology Progress Series 400, 195-206.
76                                                                             Parsons DM, Babcock RC, Hankin RKS, et al. 2003. Snapper Pagrus auratus (Sparidae) home range dynamics: acoustic tagging studies in a marine reserve. Marine Ecology Progress Series 262, 253-265.
77                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
78                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
79                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
80                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
81                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
82                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
83                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
84                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
85                     Tolimieri N, Andrews K, Williams G, et al. 2009. Home range size and patterns of space use by lingcod, copper rockfish and quillback rockfish in relation to diel and tidal cycles. Marine Ecology Progress Series. 380, 229-243. (doi: 10.3354/meps07930)
86                                                                Mitamura H, Uchida K, Miyamoto Y, et al. 2009. Preliminary study on homing, site fidelity, and diel movement of black rockfish Sebastes inermis measured by acoustic telemetry. Fisheries Science 75, 113-1140.
87                     Tolimieri N, Andrews K, Williams G, et al. 2009. Home range size and patterns of space use by lingcod, copper rockfish and quillback rockfish in relation to diel and tidal cycles. Marine Ecology Progress Series. 380, 229-243. (doi: 10.3354/meps07930)
88                                                                                                                            Green KM, Starr RM. 2011. Movements of small adult black rockfish: implications for the design of MPAs. Marine Ecology Progress Series 14, 219-230.
89                                                                                          Jorgensen SJ, Kaplan DM, Klimley AP, et al. 2006. Limited movement in blue rockfish Sebastes mystinus: internal structure of home range. Marine Ecology Progress Series 327, 157-170.
90                                                                                                                                     Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aquatic Sciences 52:1499-1508.
91                                                                                  Curtis JMR, Vincent CJ. 2006. Life history of an unusual marine fish: survival, growth and movement patterns of Hippocampus guttulatus Cuvier 1829. Journal of Fisheries Biology 68, 707-733.
92                                  Monteiro NM, da Natividade Viera M, Almada V. 2005. Homing behaviour and individual identification of the pipefish Nerophis lumbriciformis (Pisces; Syngnathidae): a true intertidal resident? Estuarine and Coastal Shelf Science 63, 93-99.
93                                                                                                       Sikkel PC. 1990. Social organization and spawning in the Atlantic sharpnose puffer, Canthigaster rostrata (Tetraodontidae). Environmental Biology of Fishes 27, 243-254.
94                                                                                         Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
95                                                                                         Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
96                                                                                         Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
97                                                                                         Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
98                                                                     Martinez JE, Pagan I, Palazon JA, Calvo JF. 2007. Habitat use of booted eagles (Hieraaetus pennatus) in a Special Protection Area: implications for conservation. Biodiversity Conservation 16, 3481-3488.
99                                                                                         Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
100                                                                   Miles JRG Miles, Potter MA, Fordham RA. 1997. Northern brown kiwi (Apteryx australis mantelli) in Tongariro National Park and Tongariro Forest \x97 ecology and threats. Science for Conservation 51, 1-23.
101                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
102                                                          Schwemmer P, Garthe S. 2011. Spatial and temporal patterns of habitat use by Eurasian oystercatchers (Haematopus ostralegus) in the eastern Wadden Sea revealed using GPS data loggers. Marine Biology 158, 541-550.
103                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
104                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
105                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
106                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
107                                                 Kelley SW, Ransom D, Butcher JA, Schulz GG, Surber BW, Punchak WE, Santamaria CA, Hurtado LA. 2011. Home range dynamics, habitat selection, and survival of Greater Roadrunners. Journal of Field Ornithology 82(2), 165-174.
108                                                                                                                               Karubuan J, Carrasco L. 2008. Home Range and Habitat Preferences of the Banded Ground-cuckoo. The Wilson Journal of Ornithology 120(1):205-209.
109                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
110                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
111                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
112                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
113                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
114                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
115                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
116                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
117                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
118                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
119                                                                                                                Dwyer JF, Fraser JD, Morrison JL. 2013. Range sizes and habitat use of non-breeding Crested Caracaras in Florida. Journal of Field Ornithology 84(3), 223-233.
120                                                                                                   Thiollay J-M. 2008. Foraging, home range use and social behaviour of a group-living rainforest raptor, the Red-throated Caracara Daptrius americanus. Ibis 133(4), 382-393.
121                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
122                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
123                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
124                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
125                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
126                    Karubian J, Carrasco L, Mena P, Olivio J, Cabrera D, Castillo F, Duraes R, El Ksabi N. 2011. nesting Biology, Home Range, and Habitat Use of the Brown Wood Rail (Aramides wolfi) in Northwest Ecuador. The Wilson Journal or Ornithology 123(1), 137-141.
127                                                                                                                Pickens BA, King SL. 2013. Microhabitat Selection, Demography and Correlates of Home Range Size for the King Rail (Rallus elegans). Waterbirds 36(3), 319-329.
128                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
129                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
130                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
131                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
132                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
133                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
134                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
135                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
136                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
137                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
138                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
139                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
140                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
141                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
142                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
143                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
144                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
145                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
146                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
147                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
148                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
149                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
150                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
151                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
152                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
153                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
154                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
155                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
156                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
157                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
158                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
159                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
160                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
161                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
162                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
163                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
164                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
165                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
166                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
167                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
168                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
169                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
170                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
171                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
172                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
173                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
174                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
175                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
176                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
177                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
178                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
179                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
180                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
181                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
182                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
183                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
184                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
185                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
186                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
187                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
188                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
189                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
190                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
191                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
192                                                                                                                        Gilbert G, Tyler G, Smith KW. 2005. Behaviour, home-range size and habitat use by male Great Bittern Botaurus stellaris in Britain. Ibis 147, 533-543.
193                                                                                                                                Bogner HE, Baldassarre GA. 2002. Home Range, Movement, and Nesting of Least Bitterns in Western New York. The Wilson Bulletin 114(3), 297-308.
194                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
195                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
196                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
197                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
198                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
199                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
200                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
201                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
202                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
203                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
204                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
205                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
206                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
207                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
208                                                                                                                                                                                           Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
209                                                                                        Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
210                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
211                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
212                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
213                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
214                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
215                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
216                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
217                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
218                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
219                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
220                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
221                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
222                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
223                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
224                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
225                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
226                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
227                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
228                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
229                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
230                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
231                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
232                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
233                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
234                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
235                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
236                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
237                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
238                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
239                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
240                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
241                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
242                                                                                                                                Palomares F. 1994. Site fidelity and effects of body mass on home-range size of Egyptian mongooses. Canadian Journal of Zoology 72, 465 - 469.
243                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
244                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
245                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
246                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
247                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
248                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
249                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
250                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
251                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
252                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
253                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
254                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
255                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
256                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
257                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
258                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
259                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
260                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
261                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
262                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
263                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
264                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
265                                                    Belcher CA, Darrant JP. 2004. Home range and spatial organization of the marsupial carnivore, Dasyurus maculatus maculatus (Marsupialia: Dasyuridae) in south-eastern Australia. Journal of Zoology (London) 262, 271-280.
266                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
267                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
268                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
269                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
270                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
271                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
272                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
273                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
274                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
275                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
276                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
277                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
278                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
279                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
280                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
281                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
282                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
283                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
284                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
285                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
286                                                                                    Tucker, M. A., T. J. Ord, and T. L. Rogers. 2014. Evolutionary predictors of mammalian home range size: body mass, diet and the environment. Global Ecology and Biogeography 23:1105-1114.
287                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
288                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
289                                        Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
290                                                                                                               Clark DR. 1970. Age-Specific "Reproductive Effort" in the Worm Snake Carphophis vermis (Kennicott). Transactions of the Kansas Academy of Science 73(1), 20-24.
291                                                                                                                Barbour RW, Harvey MJ, and Hardin JW. 1969. Home Range, Movements, and Activity of the Eastern Worm Snake, Carphophis Amoenus Amoenus. Ecology 50(3), 470-476.
292                                                                         Carfagno GLF, Weatherhead PJ. 2008. Energetics and space use: intraspecific and interspecific comparisons of movements and home ranges of two Colubrid snakes. Journal of Animal Ecology 77, 416-424.
293                                Klug PE, Fill J, With KA. 2011. Spatial ecology of Eastern yellow-bellies racer (Coluber constrictor flaviventris) and great plains rat snake (Pantherophis emoryi) in a contiguous tallgrass-prairie landscape. Herpetologica 67(4), 428-439.
294                                                                                                   Fitch HS. 1975. A Demographic Study of the Ringneck Snake (Diadophis punctatus) in Kansas. University of Kansas Museum of Natural History Miscellaneous Publication No. 62.
295                                                                                                                                  Dodd CK, Barichivich WJ. 2007. Movements of large snakes (Drymarchon, Masticophis_ in North-central Florida. Florida Scientist 70(1), 83-94.
296                                Klug PE, Fill J, With KA. 2011. Spatial ecology of Eastern yellow-bellies racer (Coluber constrictor flaviventris) and great plains rat snake (Pantherophis emoryi) in a contiguous tallgrass-prairie landscape. Herpetologica 67(4), 428-439.
297                                                                         Carfagno GLF, Weatherhead PJ. 2008. Energetics and space use: intraspecific and interspecific comparisons of movements and home ranges of two Colubrid snakes. Journal of Animal Ecology 77, 416-424.
298                                                                                                       Plummer MV, Mills NE. 2000. Spatial Ecology and Survivorship of Resident and Translocated Hognose Snakes (Heterodonplatirhinos). Journal of Herpetology 34(4), 565-575.
299                                                                                  Herbe L, Moreau C, Blouin-Demers G, Bonnet X, Lourdais O. 2012. Two Syntopic Colubrid Snakes Differ In Their Energetic Requirements and In Their Use of Space. Herpetologica 68(3), 358-364.
300                                                    Linehan JM, Smith LL, Steen DA. 2010. Ecology of the Eastern kingsnake (Lampropeltis getula getula) in a longleaf pine (Pinus palustris) forest in Southwestern Georgia. Herpetological Conservation Biology 5(1), 94-101.
301                                                                                                                                                    Row JR, Blouin-Demers G. 2006. Kernels are not Accurate Estimators of Home-Range Size For Herpetofauna. Copeia 4, 797-802.
302                                                                                                                                  Dodd CK, Barichivich WJ. 2007. Movements of large snakes (Drymarchon, Masticophis_ in North-central Florida. Florida Scientist 70(1), 83-94.
303                                                                                                                               Madsen T. 1984. Movements, Home Range Size and Habitat Use of Radio-Tracked Grass Snakes (Natrix natrix) in Southern Sweden. Copeia 3, 707-713.
304                                                                                            Roe JH, Kingsbury BA, Herbert NR. 2004. Comparative water snake ecology: conservation of mobile animals that use temporally dynamic resources. Biological Conservation 118, 79-89.
305                                                                                            Roe JH, Kingsbury BA, Herbert NR. 2004. Comparative water snake ecology: conservation of mobile animals that use temporally dynamic resources. Biological Conservation 118, 79-89.
306                                                                                              Lee H-J, Lee J-H, Park D. 2011. Habitat Use and Movement Patterns of the Viviparous Aquatic Snake, Oocatochus rufodorsatus, from Northeast Asia. Zoological Science 28, 593-599.
307                                                                                                                                           Rodriguez-Robles JA. 2003. Home Ranges of Gopher Snakes (Pituophis catenifer, Colubridae) in Central California. Copeia 2, 391-396.
308                                                                                                          Miller GJ, Smith LL, Johnson SA, Franz R. 2012. Home Range Size and Habitat Selection in the Florida Pine Snake (Pituophis melanoleucus mugitus). Copeia 4, 706-713.
309                                                                                                                                     Freedman B, Catling PM. 1979. Movements of sympatric species of snakes at Amherstburg, Ontatio. Canadian Field-Naturalist 93(4): 399-404.
310                           Wylie G, Amarello M. 2006.  For the Bank Protection Project on the Left Bank of the Colusa Basin Drainage Canal in Reclamation District. Progress report for the U.S. Army Corps of Engineers.\nSacramento River Bank Protection Project, Phase II.
311                                                                                  Herbe L, Moreau C, Blouin-Demers G, Bonnet X, Lourdais O. 2012. Two Syntopic Colubrid Snakes Differ In Their Energetic Requirements and In Their Use of Space. Herpetologica 68(3), 358-364.
312                                                                                                         Webb JK, Shine R. 1997. A Field Study of Spatial Ecology and Movements of a Threatened Snake Species, Hoplocephalus bungaroides. Biological Conservation 82, 203-217.
313                                                                                          Butler H, Malone B, Clemann N. 2005. The effects of translocation on the spatial ecology of tiger snakes (Notechis scutatus) in a suburban landscape. Wildlife Research 32, 165-171.
314                                                                                   Shine R. 1987. Intraspecific Variation in Thermoregulation, Movements and Habitat Use by Australian Blacksnakes, Pseudechis porphyriacus (Elapidae). Journal of Herpetology 21(3), 165-177.
315                                                                                        Pearson D, Shine R, Williams A. 2005. Spatial ecology of a threatened python (Morelia spilota imbricata) and the effects of anthropogenic habitat change. Austral Ecology 30, 261-274.
316                                                               Smith CF, Schuett GW, Early RL, Schwenk K. 2009. The Spatial and Resproductive Ecology of the Copperhead (Agkistrodon contortrix) at the Northeastern Extrme of its Range. Herpetological Monographs 23, 45-73.
317                                                                                                                                    Roth ED. 2005. Spatial Ecology of a Cottonmouth (Agkistrodon piscivorus) Population in East Texas. Journal of Herpetology  39(2), 308-312.
318                                                                                                                                         Maritz B, Alexander GJ. 2012. Dwarfs on the Move: Spatial Ecology of the World's Smallest Viper, Bitis schneideri. Copeia 1, 115-120.
319                                                               Wasko DK, Sasa M. 2012. Food resources influence spatial ecology, habitat selection, and foraging behavior in an ambush-hunting snake (Viperidae: Bothrops asper): an experimental study. Zoology 115, 179-187.
320                                                                                                                                    Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
321                                                                                                                                             Secor SM. 1994. Ecological Significance of Movements and Activity Range for the Sidewinder, Crotalus cerastes. Copeia 3, 631-645.
322                        Bauder JM, Blodgett D, Briggs KV, Jenkins CL. 2011. The Ecology of Timber Rattlesnakes (Crotalus horridus) in Vermont: A First Year Progress Report Submitted to the Vermont Department of Fish and Wildlife. Vermont Department of Fish and Wildlife.
323                                                                                                                                    Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
324                                                                                                                  Parker JM, Anderson SH. 2007. Ecology and Behavior of the Midget Faded Rattlesnake (Crotalus Oreganus Concolor) in Wyoming. Journal of Herpetology 1, 41-51.
325                                                                                  Prival DB, Goode MJ, Swann DE, Schwalbe CR, Schroff MJ. 2002. Natural History of a Northern Population of Twin-Spotted Rattlesnakes, Crotalus pricei. Journal of Herpetology 36(4), 598-607.
326                                                                                                                                                                            Cardwell MD. 2008. The reproductive ecology of Mohave rattlesnakes. Journal of Zoology 274, 65-76.
327                                                                                                                                    Beck DD. 1995. Ecology and Energetics of Three Sympatric Rattlesnake Species in the Sonoran Desert. Journal of Herpetology 29(2), 211-223.
328                                                                                                                  Shine R, Sun L-X. 2003. Attack strategy of an ambush predator: which attributes of the prey trigger a pit-viper\x92s strike? Functional Ecology 17, 340-348.
329                                                                                                                Ettling JA, Aghasyan LA, Aghasyan AL, Parker PG. 2013. Spatial Ecology of Armenian Vipers, Montivipera raddei, in a Human-Modified Landscape. Copeia 1, 64-71.
330                                                                                                             Brito JC. 2003. Seasonal Variation in Movements, Home Range, and Habitat Use by Male Vipera latastei in Northern Portugal. Journal of Herpetology 37(1), 155-160.
331                                                                Roe JH, Georges A. 2008. Terrestrial activity, movements and spatial ecology of an Australian freshwater turtle, Chelodina longicollis, in a temporally dynamic wetland system. Austral Ecology 33, 1045-1056.
332                       Forero-Medina G, Cardenas-Arevalo G, Castano-Mora OV. 2011. Abundance, Home Range, and Movement Patterns of the Endemic Species Dahl\x92s Toad-Headed Turtle (Mesoclemmys dahli) in Cesar, Colombia. Chelonian Conservation and Biology 10(2), 228-236.
333                                                                          Brown GP, Bishop CA, Brooka RJ. 1994. Growth Rate, Reproductive Output, and Temperature Selection of Snapping Turtles inHabitats of Different Productivities. Journal of Herpetology 28(4), 405-410.
334                                             Rowe JW, Dalgarn SF. 2010. Home Range Size and Daily Movements of Midland Painted turtles (Cyrusemys picta marginata) in Relation to Bosy Size, Sex, and Weather Patterns. Herpetological Conservation and Biology 5(3), 461-473.
335                                                                                                             Buhlmann KA. 1995. Habitat Use, Terrestrial Movements, and Conservation of the Turtle, Deirochelys reticulariain Virginia. Journal of Herpetology 29(2), 173-181.
336                                                                                                         Innes RJ, Babbitt KJ, Kanter JJ. 2008. Home Range and Movement of Blanding's Turtles (Emydoidea blandingii) in New Hampshire. Northeastern Naturalist 15(3), 431-444.
337                                                P\xe9rez-Santigosa N, Hidalgo-Vila J, D\xedaz-Paniagua C. 2013. Comparing Activity Patterns and Aquatic Home Range Areas Among Exotic and Native Turtles in Southern Spain. Chelonian Conservation and Biology 12(2), 313-319.
338                                                                                                                                               Jones RL. 1996. Home Range and Seasonal Movements of the Turtle Graptemys flavimaculata. Journal of Herpetology 30(3), 376-385.
339                                                        Cordero GA, Reeves R, Swarth CW. 2012. Home-Range Size of an Eastern Mud Turtle, Kinosternon subrubrum, Population in the Mid-Atlantic Region of the United States. Chelonian Conservation and Biology 11(1), 121-124.
340                                                                     Ennen JR, Scott AF. 2013. Home-Range Size of an Eastern Mud Turtle, Kinosternon subrubrum, Population in the Mid-Atlantic Region of the United States. Chelonian Conservation and Biology 12(1), 199-203.
341                                                          Rowe JW, Lehr GC, McCarthy PM, Converse PM. 2009. Activity, Movements and Activity Area Size in Stinkpot Turtles (Sternotherus odoratus) in Southwestern Michigan Lake. American Midland Naturalist 162(2), 266-275.
342                   Galois P, Leveille M, Bouthillier L, Daigle C, Parren S. 2002. Movement Patterns, Activity, and Home Range of the Eastern Spiny Softshell Turtle (Apalone spinifers) in Northern Lake Champlain, Qu\xe9bec, Vermont. Journal of Herpetology 36(3), 402-411.
          realm thermoregulation locomotion trophic.guild dimension  preymass
1       aquatic        ectotherm   swimming     carnivore        3D        NA
2       aquatic        ectotherm   swimming     carnivore        2D        NA
3       aquatic        ectotherm   swimming     carnivore        2D        NA
4       aquatic        ectotherm   swimming     carnivore        2D        NA
5       aquatic        ectotherm   swimming     carnivore        2D        NA
6       aquatic        ectotherm   swimming     carnivore        2D        NA
7       aquatic        ectotherm   swimming     carnivore        2D      1.39
8       aquatic        ectotherm   swimming     carnivore        2D        NA
9       aquatic        ectotherm   swimming     carnivore        2D        NA
10      aquatic        ectotherm   swimming     carnivore        3D        NA
11      aquatic        ectotherm   swimming     carnivore        3D        NA
12      aquatic        ectotherm   swimming     carnivore        3D        NA
13      aquatic        ectotherm   swimming     carnivore        2D        NA
14      aquatic        ectotherm   swimming     carnivore        2D        NA
15      aquatic        ectotherm   swimming     carnivore        3D        NA
16      aquatic        ectotherm   swimming     carnivore        3D        NA
17      aquatic        ectotherm   swimming     carnivore        2D        NA
18      aquatic        ectotherm   swimming     carnivore        2D        NA
19      aquatic        ectotherm   swimming     carnivore        2D        NA
20      aquatic        ectotherm   swimming     carnivore        2D        NA
21      aquatic        ectotherm   swimming     carnivore        2D        NA
22      aquatic        ectotherm   swimming     carnivore        2D        NA
23      aquatic        ectotherm   swimming     carnivore        2D        NA
24      aquatic        ectotherm   swimming     carnivore        2D        NA
25      aquatic        ectotherm   swimming     carnivore        2D        NA
26      aquatic        ectotherm   swimming     carnivore        2D        NA
27      aquatic        ectotherm   swimming     carnivore        2D        NA
28      aquatic        ectotherm   swimming     carnivore        2D        NA
29      aquatic        ectotherm   swimming     carnivore        2D        NA
30      aquatic        ectotherm   swimming     carnivore        2D        NA
31      aquatic        ectotherm   swimming     carnivore        2D        NA
32      aquatic        ectotherm   swimming     carnivore        2D        NA
33      aquatic        ectotherm   swimming     carnivore        2D        NA
34      aquatic        ectotherm   swimming     carnivore        2D        NA
35      aquatic        ectotherm   swimming     carnivore        2D        NA
36      aquatic        ectotherm   swimming     carnivore        2D        NA
37      aquatic        ectotherm   swimming     carnivore        2D        NA
38      aquatic        ectotherm   swimming     carnivore        2D        NA
39      aquatic        ectotherm   swimming     carnivore        2D        NA
40      aquatic        ectotherm   swimming     carnivore        2D        NA
41      aquatic        ectotherm   swimming     carnivore        2D        NA
42      aquatic        ectotherm   swimming     carnivore        2D        NA
43      aquatic        ectotherm   swimming     carnivore        2D        NA
44      aquatic        ectotherm   swimming     carnivore        2D        NA
45      aquatic        ectotherm   swimming     carnivore        2D        NA
46      aquatic        ectotherm   swimming     carnivore        2D        NA
47      aquatic        ectotherm   swimming     carnivore        2D      4.69
48      aquatic        ectotherm   swimming     carnivore        2D        NA
49      aquatic        ectotherm   swimming     carnivore        2D        NA
50      aquatic        ectotherm   swimming     carnivore        2D        NA
51      aquatic        ectotherm   swimming     carnivore        2D        NA
52      aquatic        ectotherm   swimming     carnivore        2D        NA
53      aquatic        ectotherm   swimming     carnivore        2D        NA
54      aquatic        ectotherm   swimming     carnivore        2D        NA
55      aquatic        ectotherm   swimming     carnivore        3D        NA
56      aquatic        ectotherm   swimming     carnivore        2D        NA
57      aquatic        ectotherm   swimming     carnivore        2D        NA
58      aquatic        ectotherm   swimming     carnivore        2D      6.50
59      aquatic        ectotherm   swimming     carnivore        2D        NA
60      aquatic        ectotherm   swimming     carnivore        2D        NA
61      aquatic        ectotherm   swimming     carnivore        2D        NA
62      aquatic        ectotherm   swimming     carnivore        2D        NA
63      aquatic        ectotherm   swimming     carnivore        2D      4.48
64      aquatic        ectotherm   swimming     carnivore        2D        NA
65      aquatic        ectotherm   swimming     carnivore        2D     13.26
66      aquatic        ectotherm   swimming     carnivore        2D        NA
67      aquatic        ectotherm   swimming     carnivore        2D        NA
68      aquatic        ectotherm   swimming     carnivore        2D        NA
69      aquatic        ectotherm   swimming     carnivore        2D        NA
70      aquatic        ectotherm   swimming     carnivore        2D        NA
71      aquatic        ectotherm   swimming     carnivore        2D        NA
72      aquatic        ectotherm   swimming     carnivore        2D        NA
73      aquatic        ectotherm   swimming     carnivore        2D     49.01
74      aquatic        ectotherm   swimming     carnivore        2D        NA
75      aquatic        ectotherm   swimming     carnivore        2D        NA
76      aquatic        ectotherm   swimming     carnivore        2D        NA
77      aquatic        ectotherm   swimming     carnivore        2D        NA
78      aquatic        ectotherm   swimming     carnivore        2D        NA
79      aquatic        ectotherm   swimming     carnivore        2D        NA
80      aquatic        ectotherm   swimming     carnivore        2D        NA
81      aquatic        ectotherm   swimming     carnivore        3D      1.96
82      aquatic        ectotherm   swimming     carnivore        2D        NA
83      aquatic        ectotherm   swimming     carnivore        2D        NA
84      aquatic        ectotherm   swimming     carnivore        2D        NA
85      aquatic        ectotherm   swimming     carnivore        2D      6.80
86      aquatic        ectotherm   swimming     carnivore        2D      0.67
87      aquatic        ectotherm   swimming     carnivore        2D      7.80
88      aquatic        ectotherm   swimming     carnivore        2D        NA
89      aquatic        ectotherm   swimming     carnivore        2D        NA
90      aquatic        ectotherm   swimming     carnivore        3D        NA
91      aquatic        ectotherm   swimming     carnivore        2D        NA
92      aquatic        ectotherm   swimming     carnivore        2D        NA
93      aquatic        ectotherm   swimming     carnivore        2D        NA
94  terrestrial        endotherm     flying     carnivore        3D    636.94
95  terrestrial        endotherm     flying     carnivore        3D    275.84
96  terrestrial        endotherm     flying     carnivore        3D    164.95
97  terrestrial        endotherm     flying     carnivore        3D        NA
98  terrestrial        endotherm     flying     carnivore        3D    365.17
99  terrestrial        endotherm     flying     carnivore        3D        NA
100 terrestrial        endotherm    walking     carnivore        2D        NA
101 terrestrial        endotherm     flying     carnivore        3D        NA
102 terrestrial        endotherm    walking     carnivore        2D        NA
103 terrestrial        endotherm     flying     carnivore        3D        NA
104 terrestrial        endotherm     flying     carnivore        3D        NA
105 terrestrial        endotherm     flying     carnivore        3D        NA
106 terrestrial        endotherm     flying     carnivore        3D        NA
107 terrestrial        endotherm    walking     carnivore        2D        NA
108 terrestrial        endotherm    walking     carnivore        2D        NA
109 terrestrial        endotherm     flying     carnivore        3D     88.99
110 terrestrial        endotherm     flying     carnivore        3D    327.00
111 terrestrial        endotherm     flying     carnivore        3D        NA
112 terrestrial        endotherm     flying     carnivore        3D     41.96
113 terrestrial        endotherm     flying     carnivore        3D    198.94
114 terrestrial        endotherm     flying     carnivore        3D     43.99
115 terrestrial        endotherm     flying     carnivore        3D    344.33
116 terrestrial        endotherm     flying     carnivore        3D     49.01
117 terrestrial        endotherm     flying     carnivore        3D        NA
118 terrestrial        endotherm     flying     carnivore        3D    527.40
119 terrestrial        endotherm    walking     carnivore        2D        NA
120 terrestrial        endotherm    walking     carnivore        2D        NA
121 terrestrial        endotherm     flying     carnivore        3D        NA
122 terrestrial        endotherm     flying     carnivore        3D     55.00
123 terrestrial        endotherm     flying     carnivore        3D    165.90
124 terrestrial        endotherm     flying     carnivore        3D     32.00
125 terrestrial        endotherm     flying     carnivore        3D     16.81
126 terrestrial        endotherm    walking     carnivore        2D        NA
127 terrestrial        endotherm    walking     carnivore        2D        NA
128 terrestrial        endotherm     flying     carnivore        3D        NA
129 terrestrial        endotherm     flying     carnivore        3D        NA
130 terrestrial        endotherm     flying     carnivore        3D        NA
131 terrestrial        endotherm     flying     carnivore        3D        NA
132 terrestrial        endotherm     flying     carnivore        3D        NA
133 terrestrial        endotherm     flying     carnivore        3D        NA
134 terrestrial        endotherm     flying     carnivore        3D        NA
135 terrestrial        endotherm     flying     carnivore        3D        NA
136 terrestrial        endotherm     flying     carnivore        3D        NA
137 terrestrial        endotherm     flying     carnivore        3D        NA
138 terrestrial        endotherm     flying     carnivore        3D        NA
139 terrestrial        endotherm     flying     carnivore        3D        NA
140 terrestrial        endotherm     flying     carnivore        3D        NA
141 terrestrial        endotherm     flying     carnivore        3D        NA
142 terrestrial        endotherm     flying     carnivore        3D        NA
143 terrestrial        endotherm     flying     carnivore        3D        NA
144 terrestrial        endotherm     flying     carnivore        3D        NA
145 terrestrial        endotherm     flying     carnivore        3D        NA
146 terrestrial        endotherm     flying     carnivore        3D        NA
147 terrestrial        endotherm     flying     carnivore        3D        NA
148 terrestrial        endotherm     flying     carnivore        3D        NA
149 terrestrial        endotherm     flying     carnivore        3D        NA
150 terrestrial        endotherm     flying     carnivore        3D        NA
151 terrestrial        endotherm     flying     carnivore        3D        NA
152 terrestrial        endotherm     flying     carnivore        3D        NA
153 terrestrial        endotherm     flying     carnivore        3D        NA
154 terrestrial        endotherm     flying     carnivore        3D        NA
155 terrestrial        endotherm     flying     carnivore        3D        NA
156 terrestrial        endotherm     flying     carnivore        3D        NA
157 terrestrial        endotherm     flying     carnivore        3D        NA
158 terrestrial        endotherm     flying     carnivore        3D        NA
159 terrestrial        endotherm     flying     carnivore        3D        NA
160 terrestrial        endotherm     flying     carnivore        3D        NA
161 terrestrial        endotherm     flying     carnivore        3D        NA
162 terrestrial        endotherm     flying     carnivore        3D        NA
163 terrestrial        endotherm     flying     carnivore        3D        NA
164 terrestrial        endotherm     flying     carnivore        3D        NA
165 terrestrial        endotherm     flying     carnivore        3D        NA
166 terrestrial        endotherm     flying     carnivore        3D        NA
167 terrestrial        endotherm     flying     carnivore        3D        NA
168 terrestrial        endotherm     flying     carnivore        3D        NA
169 terrestrial        endotherm     flying     carnivore        3D        NA
170 terrestrial        endotherm     flying     carnivore        3D        NA
171 terrestrial        endotherm     flying     carnivore        3D        NA
172 terrestrial        endotherm     flying     carnivore        3D        NA
173 terrestrial        endotherm     flying     carnivore        3D        NA
174 terrestrial        endotherm     flying     carnivore        3D        NA
175 terrestrial        endotherm     flying     carnivore        3D        NA
176 terrestrial        endotherm     flying     carnivore        3D        NA
177 terrestrial        endotherm     flying     carnivore        3D        NA
178 terrestrial        endotherm     flying     carnivore        3D        NA
179 terrestrial        endotherm     flying     carnivore        3D        NA
180 terrestrial        endotherm     flying     carnivore        3D        NA
181 terrestrial        endotherm     flying     carnivore        3D        NA
182 terrestrial        endotherm     flying     carnivore        3D        NA
183 terrestrial        endotherm     flying     carnivore        3D        NA
184 terrestrial        endotherm     flying     carnivore        3D        NA
185 terrestrial        endotherm     flying     carnivore        3D        NA
186 terrestrial        endotherm     flying     carnivore        3D        NA
187 terrestrial        endotherm     flying     carnivore        3D        NA
188 terrestrial        endotherm     flying     carnivore        3D        NA
189 terrestrial        endotherm     flying     carnivore        3D        NA
190 terrestrial        endotherm     flying     carnivore        3D        NA
191 terrestrial        endotherm     flying     carnivore        3D        NA
192 terrestrial        endotherm    walking     carnivore        2D        NA
193 terrestrial        endotherm    walking     carnivore        2D        NA
194 terrestrial        endotherm     flying     carnivore        3D        NA
195 terrestrial        endotherm     flying     carnivore        3D        NA
196 terrestrial        endotherm     flying     carnivore        3D        NA
197 terrestrial        endotherm     flying     carnivore        3D        NA
198 terrestrial        endotherm     flying     carnivore        3D        NA
199 terrestrial        endotherm     flying     carnivore        3D        NA
200 terrestrial        endotherm     flying     carnivore        3D        NA
201 terrestrial        endotherm     flying     carnivore        3D        NA
202 terrestrial        endotherm     flying     carnivore        3D     32.98
203 terrestrial        endotherm     flying     carnivore        3D     20.66
204 terrestrial        endotherm     flying     carnivore        3D    375.00
205 terrestrial        endotherm     flying     carnivore        3D    279.11
206 terrestrial        endotherm     flying     carnivore        3D     16.99
207 terrestrial        endotherm     flying     carnivore        3D        NA
208 terrestrial        endotherm     flying     carnivore        3D     29.61
209 terrestrial        endotherm     flying     carnivore        3D     19.39
210 terrestrial        endotherm    walking     carnivore        2D        NA
211 terrestrial        endotherm    walking     carnivore        2D        NA
212 terrestrial        endotherm    walking     carnivore        2D        NA
213 terrestrial        endotherm    walking     carnivore        2D        NA
214 terrestrial        endotherm    walking     carnivore        2D    427.68
215 terrestrial        endotherm    walking     carnivore        2D        NA
216 terrestrial        endotherm    walking     carnivore        2D        NA
217 terrestrial        endotherm    walking     carnivore        2D        NA
218 terrestrial        endotherm    walking     carnivore        2D        NA
219 terrestrial        endotherm    walking     carnivore        2D        NA
220 terrestrial        endotherm    walking     carnivore        2D        NA
221 terrestrial        endotherm    walking     carnivore        2D  18055.42
222 terrestrial        endotherm    walking     carnivore        2D        NA
223 terrestrial        endotherm    walking     carnivore        2D        NA
224 terrestrial        endotherm    walking     carnivore        2D        NA
225 terrestrial        endotherm    walking     carnivore        2D   1527.47
226 terrestrial        endotherm    walking     carnivore        2D   1109.72
227 terrestrial        endotherm    walking     carnivore        2D        NA
228 terrestrial        endotherm    walking     carnivore        2D  10521.52
229 terrestrial        endotherm    walking     carnivore        2D   4065.03
230 terrestrial        endotherm    walking     carnivore        2D   3890.80
231 terrestrial        endotherm    walking     carnivore        2D        NA
232 terrestrial        endotherm    walking     carnivore        2D    361.53
233 terrestrial        endotherm    walking     carnivore        2D        NA
234 terrestrial        endotherm    walking     carnivore        2D  30234.31
235 terrestrial        endotherm    walking     carnivore        2D 130233.20
236 terrestrial        endotherm    walking     carnivore        2D        NA
237 terrestrial        endotherm    walking     carnivore        2D        NA
238 terrestrial        endotherm    walking     carnivore        2D  57547.19
239 terrestrial        endotherm    walking     carnivore        2D        NA
240 terrestrial        endotherm    walking     carnivore        2D        NA
241 terrestrial        endotherm    walking     carnivore        2D        NA
242 terrestrial        endotherm    walking     carnivore        2D    143.37
243 terrestrial        endotherm    walking     carnivore        2D        NA
244 terrestrial        endotherm    walking     carnivore        2D        NA
245 terrestrial        endotherm    walking     carnivore        2D        NA
246 terrestrial        endotherm    walking     carnivore        2D        NA
247 terrestrial        endotherm    walking     carnivore        2D        NA
248 terrestrial        endotherm    walking     carnivore        2D     23.15
249 terrestrial        endotherm    walking     carnivore        2D        NA
250 terrestrial        endotherm    walking     carnivore        2D     95.19
251 terrestrial        endotherm    walking     carnivore        2D    656.03
252 terrestrial        endotherm    walking     carnivore        2D     47.55
253 terrestrial        endotherm    walking     carnivore        2D     14.58
254 terrestrial        endotherm    walking     carnivore        2D        NA
255 terrestrial        endotherm    walking     carnivore        2D        NA
256 terrestrial        endotherm    walking     carnivore        2D        NA
257 terrestrial        endotherm    walking     carnivore        2D     30.59
258 terrestrial        endotherm    walking     carnivore        2D        NA
259 terrestrial        endotherm    walking     carnivore        2D        NA
260 terrestrial        endotherm    walking     carnivore        2D        NA
261 terrestrial        endotherm    walking     carnivore        2D     42.00
262 terrestrial        endotherm    walking     carnivore        2D        NA
263 terrestrial        endotherm    walking     carnivore        2D        NA
264 terrestrial        endotherm    walking     carnivore        2D        NA
265 terrestrial        endotherm    walking     carnivore        2D        NA
266 terrestrial        endotherm    walking     carnivore        2D        NA
267 terrestrial        endotherm    walking     carnivore        2D        NA
268 terrestrial        endotherm    walking     carnivore        2D        NA
269 terrestrial        endotherm    walking     carnivore        2D        NA
270 terrestrial        endotherm    walking     carnivore        2D        NA
271 terrestrial        endotherm    walking     carnivore        2D        NA
272 terrestrial        endotherm    walking     carnivore        2D        NA
273 terrestrial        endotherm    walking     carnivore        2D        NA
274 terrestrial        endotherm    walking     carnivore        2D        NA
275 terrestrial        endotherm    walking     carnivore        2D        NA
276 terrestrial        endotherm    walking     carnivore        2D        NA
277 terrestrial        endotherm    walking     carnivore        2D        NA
278 terrestrial        endotherm    walking     carnivore        2D        NA
279 terrestrial        endotherm    walking     carnivore        2D        NA
280 terrestrial        endotherm    walking     carnivore        2D        NA
281 terrestrial        endotherm    walking     carnivore        2D        NA
282 terrestrial        endotherm    walking     carnivore        2D        NA
283 terrestrial        endotherm    walking     carnivore        2D        NA
284 terrestrial        endotherm    walking     carnivore        2D        NA
285 terrestrial        endotherm    walking     carnivore        2D        NA
286 terrestrial        endotherm    walking     carnivore        2D        NA
287 terrestrial        endotherm    walking     carnivore        2D        NA
288 terrestrial        endotherm    walking     carnivore        2D        NA
289 terrestrial        endotherm    walking     carnivore        2D        NA
290 terrestrial        ectotherm   crawling     carnivore        2D        NA
291 terrestrial        ectotherm   crawling     carnivore        2D        NA
292 terrestrial        ectotherm   crawling     carnivore        2D    617.94
293 terrestrial        ectotherm   crawling     carnivore        2D    160.56
294 terrestrial        ectotherm   crawling     carnivore        2D        NA
295 terrestrial        ectotherm   crawling     carnivore        2D        NA
296 terrestrial        ectotherm   crawling     carnivore        2D        NA
297 terrestrial        ectotherm   crawling     carnivore        2D     71.50
298 terrestrial        ectotherm   crawling     carnivore        2D        NA
299 terrestrial        ectotherm   crawling     carnivore        2D     40.78
300 terrestrial        ectotherm   crawling     carnivore        2D        NA
301 terrestrial        ectotherm   crawling     carnivore        2D        NA
302 terrestrial        ectotherm   crawling     carnivore        2D        NA
303 terrestrial        ectotherm   crawling     carnivore        2D     13.99
304 terrestrial        ectotherm   crawling     carnivore        2D        NA
305 terrestrial        ectotherm   crawling     carnivore        2D     97.72
306 terrestrial        ectotherm   crawling     carnivore        2D        NA
307 terrestrial        ectotherm   crawling     carnivore        2D        NA
308 terrestrial        ectotherm   crawling     carnivore        2D     53.75
309 terrestrial        ectotherm   crawling     carnivore        2D        NA
310 terrestrial        ectotherm   crawling     carnivore        2D        NA
311 terrestrial        ectotherm    walking     carnivore        2D        NA
312 terrestrial        ectotherm   crawling     carnivore        2D        NA
313 terrestrial        ectotherm   crawling     carnivore        2D     45.90
314 terrestrial        ectotherm   crawling     carnivore        2D        NA
315 terrestrial        ectotherm   crawling     carnivore        2D        NA
316 terrestrial        ectotherm   crawling     carnivore        2D        NA
317 terrestrial        ectotherm   crawling     carnivore        2D     51.93
318 terrestrial        ectotherm   crawling     carnivore        2D        NA
319 terrestrial        ectotherm   crawling     carnivore        2D    165.25
320 terrestrial        ectotherm   crawling     carnivore        2D     12.80
321 terrestrial        ectotherm   crawling     carnivore        2D        NA
322 terrestrial        ectotherm   crawling     carnivore        2D   2684.21
323 terrestrial        ectotherm   crawling     carnivore        2D        NA
324 terrestrial        ectotherm   crawling     carnivore        2D     51.56
325 terrestrial        ectotherm   crawling     carnivore        2D        NA
326 terrestrial        ectotherm   crawling     carnivore        2D        NA
327 terrestrial        ectotherm   crawling     carnivore        2D        NA
328 terrestrial        ectotherm   crawling     carnivore        2D     14.00
329 terrestrial        ectotherm   crawling     carnivore        2D        NA
330 terrestrial        ectotherm   crawling     carnivore        2D      8.97
331 terrestrial        ectotherm    walking     carnivore        2D        NA
332 terrestrial        ectotherm    walking     carnivore        2D        NA
333 terrestrial        ectotherm    walking     carnivore        2D        NA
334 terrestrial        ectotherm    walking     carnivore        2D        NA
335 terrestrial        ectotherm    walking     carnivore        2D        NA
336 terrestrial        ectotherm    walking     carnivore        2D        NA
337 terrestrial        ectotherm    walking     carnivore        2D        NA
338 terrestrial        ectotherm    walking     carnivore        2D        NA
339 terrestrial        ectotherm    walking     carnivore        2D        NA
340 terrestrial        ectotherm    walking     carnivore        2D        NA
341 terrestrial        ectotherm    walking     carnivore        2D        NA
342 terrestrial        ectotherm    walking     carnivore        2D        NA
    log10.preymass       PPMR
1               NA         NA
2               NA         NA
3               NA         NA
4               NA         NA
5               NA         NA
6               NA         NA
7        0.1430148 530.000000
8               NA         NA
9               NA         NA
10              NA         NA
11              NA         NA
12              NA         NA
13              NA         NA
14              NA         NA
15              NA         NA
16              NA         NA
17              NA         NA
18              NA         NA
19              NA         NA
20              NA         NA
21              NA         NA
22              NA         NA
23              NA         NA
24              NA         NA
25              NA         NA
26              NA         NA
27              NA         NA
28              NA         NA
29              NA         NA
30              NA         NA
31              NA         NA
32              NA         NA
33              NA         NA
34              NA         NA
35              NA         NA
36              NA         NA
37              NA         NA
38              NA         NA
39              NA         NA
40              NA         NA
41              NA         NA
42              NA         NA
43              NA         NA
44              NA         NA
45              NA         NA
46              NA         NA
47       0.6711728  11.950000
48              NA         NA
49              NA         NA
50              NA         NA
51              NA         NA
52              NA         NA
53              NA         NA
54              NA         NA
55              NA         NA
56              NA         NA
57              NA         NA
58       0.8129134 107.230000
59              NA         NA
60              NA         NA
61              NA         NA
62              NA         NA
63       0.6512780  88.950000
64              NA         NA
65       1.1225435 178.134238
66              NA         NA
67              NA         NA
68              NA         NA
69              NA         NA
70              NA         NA
71              NA         NA
72              NA         NA
73       1.6902847  35.780000
74              NA         NA
75              NA         NA
76              NA         NA
77              NA         NA
78              NA         NA
79              NA         NA
80              NA         NA
81       0.2922561 205.100000
82              NA         NA
83              NA         NA
84              NA         NA
85       0.8325089 161.810000
86      -0.1739252 148.130000
87       0.8920946 171.960000
88              NA         NA
89              NA         NA
90              NA         NA
91              NA         NA
92              NA         NA
93              NA         NA
94       2.8040985   4.710000
95       2.4406572   3.067000
96       2.2173523  10.300000
97              NA         NA
98       2.5624951   2.560000
99              NA         NA
100             NA         NA
101             NA         NA
102             NA         NA
103             NA         NA
104             NA         NA
105             NA         NA
106             NA         NA
107             NA         NA
108             NA         NA
109      1.9493412   5.270000
110      2.5145478   2.990000
111             NA         NA
112      1.6228355   3.360000
113      2.2987221   5.660000
114      1.6433540  14.230000
115      2.5369749   2.820000
116      1.6902847  10.630000
117             NA         NA
118      2.7221401   1.960000
119             NA         NA
120             NA         NA
121             NA         NA
122      1.7403627  13.110000
123      2.2198464   4.710000
124      1.5051500   3.500000
125      1.2255677  11.900000
126             NA         NA
127             NA         NA
128             NA         NA
129             NA         NA
130             NA         NA
131             NA         NA
132             NA         NA
133             NA         NA
134             NA         NA
135             NA         NA
136             NA         NA
137             NA         NA
138             NA         NA
139             NA         NA
140             NA         NA
141             NA         NA
142             NA         NA
143             NA         NA
144             NA         NA
145             NA         NA
146             NA         NA
147             NA         NA
148             NA         NA
149             NA         NA
150             NA         NA
151             NA         NA
152             NA         NA
153             NA         NA
154             NA         NA
155             NA         NA
156             NA         NA
157             NA         NA
158             NA         NA
159             NA         NA
160             NA         NA
161             NA         NA
162             NA         NA
163             NA         NA
164             NA         NA
165             NA         NA
166             NA         NA
167             NA         NA
168             NA         NA
169             NA         NA
170             NA         NA
171             NA         NA
172             NA         NA
173             NA         NA
174             NA         NA
175             NA         NA
176             NA         NA
177             NA         NA
178             NA         NA
179             NA         NA
180             NA         NA
181             NA         NA
182             NA         NA
183             NA         NA
184             NA         NA
185             NA         NA
186             NA         NA
187             NA         NA
188             NA         NA
189             NA         NA
190             NA         NA
191             NA         NA
192             NA         NA
193             NA         NA
194             NA         NA
195             NA         NA
196             NA         NA
197             NA         NA
198             NA         NA
199             NA         NA
200             NA         NA
201             NA         NA
202      1.5182507   7.640000
203      1.3151303   7.575700
204      2.5740313   5.842667
205      2.4457754   5.410000
206      1.2301934   3.610000
207             NA         NA
208      1.4714384  17.530000
209      1.2875778  14.700000
210             NA         NA
211             NA         NA
212             NA         NA
213             NA         NA
214      2.6311189  17.232480
215             NA         NA
216             NA         NA
217             NA         NA
218             NA         NA
219             NA         NA
220             NA         NA
221      4.2566076   0.720000
222             NA         NA
223             NA         NA
224             NA         NA
225      3.1839727   6.540000
226      3.0452134   3.270000
227             NA         NA
228      4.0220785   0.970000
229      3.6090638   7.380000
230      3.5900389   2.840000
231             NA         NA
232      2.5581443   9.930000
233             NA         NA
234      4.4805001   1.600000
235      5.1147217   0.860000
236             NA         NA
237             NA         NA
238      4.7600241   0.530000
239             NA         NA
240             NA         NA
241             NA         NA
242      2.1564583  19.600000
243             NA         NA
244             NA         NA
245             NA         NA
246             NA         NA
247             NA         NA
248      1.3645510  38.170000
249             NA         NA
250      1.9785913  26.000000
251      2.8169237   4.840000
252      1.6771505   5.690000
253      1.1637575  10.300000
254             NA         NA
255             NA         NA
256             NA         NA
257      1.4855795   2.880000
258             NA         NA
259             NA         NA
260             NA         NA
261      1.6232493  41.670000
262             NA         NA
263             NA         NA
264             NA         NA
265             NA         NA
266             NA         NA
267             NA         NA
268             NA         NA
269             NA         NA
270             NA         NA
271             NA         NA
272             NA         NA
273             NA         NA
274             NA         NA
275             NA         NA
276             NA         NA
277             NA         NA
278             NA         NA
279             NA         NA
280             NA         NA
281             NA         NA
282             NA         NA
283             NA         NA
284             NA         NA
285             NA         NA
286             NA         NA
287             NA         NA
288             NA         NA
289             NA         NA
290             NA         NA
291             NA         NA
292      2.7909463   0.900000
293      2.2056374   0.900000
294             NA         NA
295             NA         NA
296             NA         NA
297      1.8543060   8.990000
298             NA         NA
299      1.6104472   5.740000
300             NA         NA
301             NA         NA
302             NA         NA
303      1.1458177   5.610000
304             NA         NA
305      1.9899835  14.630000
306             NA         NA
307             NA         NA
308      1.7303785  18.680000
309             NA         NA
310             NA         NA
311             NA         NA
312             NA         NA
313      1.6618127   7.190000
314             NA         NA
315             NA         NA
316             NA         NA
317      1.7154183   3.620000
318             NA         NA
319      2.2181415   5.000000
320      1.1072100  25.000000
321             NA         NA
322      3.4288165   0.380000
323             NA         NA
324      1.7123129   2.690000
325             NA         NA
326             NA         NA
327             NA         NA
328      1.1461280  14.060000
329             NA         NA
330      0.9527924  10.860000
331             NA         NA
332             NA         NA
333             NA         NA
334             NA         NA
335             NA         NA
336             NA         NA
337             NA         NA
338             NA         NA
339             NA         NA
340             NA         NA
341             NA         NA
342             NA         NA
                                                                                                                                                                                                                                                                               prey.size.reference
1                                                                                                                                                                                                                                                                                             <NA>
2                                                                                                                                                                                                                                                                                             <NA>
3                                                                                                                                                                                                                                                                                             <NA>
4                                                                                                                                                                                                                                                                                             <NA>
5                                                                                                                                                                                                                                                                                             <NA>
6                                                                                                                                                                                                                                                                                             <NA>
7                                                                                                                                                                                                            Brose U, et al. 2005b. Body sizes of consumers and their resources. Ecology 86, 2545.
8                                                                                                                                                                                                                                                                                             <NA>
9                                                                                                                                                                                                                                                                                             <NA>
10                                                                                                                                                                                                                                                                                            <NA>
11                                                                                                                                                                                                                                                                                            <NA>
12                                                                                                                                                                                                                                                                                            <NA>
13                                                                                                                                                                                                                                                                                            <NA>
14                                                                                                                                                                                                                                                                                            <NA>
15                                                                                                                                                                                                                                                                                            <NA>
16                                                                                                                                                                                                                                                                                            <NA>
17                                                                                                                                                                                                                                                                                            <NA>
18                                                                                                                                                                                                                                                                                            <NA>
19                                                                                                                                                                                                                                                                                            <NA>
20                                                                                                                                                                                                                                                                                            <NA>
21                                                                                                                                                                                                                                                                                            <NA>
22                                                                                                                                                                                                                                                                                            <NA>
23                                                                                                                                                                                                                                                                                            <NA>
24                                                                                                                                                                                                                                                                                            <NA>
25                                                                                                                                                                                                                                                                                            <NA>
26                                                                                                                                                                                                                                                                                            <NA>
27                                                                                                                                                                                                                                                                                            <NA>
28                                                                                                                                                                                                                                                                                            <NA>
29                                                                                                                                                                                                                                                                                            <NA>
30                                                                                                                                                                                                                                                                                            <NA>
31                                                                                                                                                                                                                                                                                            <NA>
32                                                                                                                                                                                                                                                                                            <NA>
33                                                                                                                                                                                                                                                                                            <NA>
34                                                                                                                                                                                                                                                                                            <NA>
35                                                                                                                                                                                                                                                                                            <NA>
36                                                                                                                                                                                                                                                                                            <NA>
37                                                                                                                                                                                                                                                                                            <NA>
38                                                                                                                                                                                                                                                                                            <NA>
39                                                                                                                                                                                                                                                                                            <NA>
40                                                                                                                                                                                                                                                                                            <NA>
41                                                                                                                                                                                                                                                                                            <NA>
42                                                                                                                                                                                                                                                                                            <NA>
43                                                                                                                                                                                                                                                                                            <NA>
44                                                                                                                                                                                                                                                                                            <NA>
45                                                                                                                                                                                                                                                                                            <NA>
46                                                                                                                                                                                                                                                                                            <NA>
47                                                                                                                               Rooker JR. 1995. Feeding Ecology of the Schoolmaster Snapper Lutjanus apodus (Walbaum), From Southwestern Puerto Rico. Bulletin of Marine Science 56(3), 881-894.
48                                                                                                                                                                                                                                                                                            <NA>
49                                                                                                                                                                                                                                                                                            <NA>
50                                                                                                                                                                                                                                                                                            <NA>
51                                                                                                                                                                                                                                                                                            <NA>
52                                                                                                                                                                                                                                                                                            <NA>
53                                                                                                                                                                                                                                                                                            <NA>
54                                                                                                                                                                                                                                                                                            <NA>
55                                                                                                                                                                                                                                                                                            <NA>
56                                                                                                                                                                                                                                                                                            <NA>
57                                                                                                                                                                                                                                                                                            <NA>
58                                                                                                         Dierking J, Williams ID, Walsh W. 2009. Diet composition and prey selection of the introduced grouper species peacock hind (Cephalopholis argus) in Hawaii. Fish. Bull. 107:464\x96476.
59                                                                                                                                                                                                                                                                                            <NA>
60                                                                                                                                                                                                                                                                                            <NA>
61                                                                                                                                                                                                                                                                                            <NA>
62                                                                                                                                                                                                                                                                                            <NA>
63                                                                                                                                                   Linde M, Grau AM, Riera F, Massuti-Pascual E. 2004. Analysis of Trophic Ontogeny in Epinephelus Marginatus (Serranidae). Cybium 28(1): 27-35.
64                                                                                                                                                                                                                                                                                            <NA>
65                                                                                             Sadovy Y, Eklund A-M. 1999. Synopsis of Biological Data on the Nassau Grouper, Epinephelus striatus (Bloch, 1792), and the Jewfish, E. itajara (Lichtenstein 1822). NOAA Technical Report NMFS 146.
66                                                                                                                                                                                                                                                                                            <NA>
67                                                                                                                                                                                                                                                                                            <NA>
68                                                                                                                                                                                                                                                                                            <NA>
69                                                                                                                                                                                                                                                                                            <NA>
70                                                                                                                                                                                                                                                                                            <NA>
71                                                                                                                                                                                                                                                                                            <NA>
72                                                                                                                                                                                                                                                                                            <NA>
73                                                                                        St John J. 1999. Ontogenetic changes in the diet of the coral reef grouper Plectropomus leopardus (Serranidae): patterns in taxa, size and habitat of prey. Marine Ecology Progress Series 180, 233-246.
74                                                                                                                                                                                                                                                                                            <NA>
75                                                                                                                                                                                                                                                                                            <NA>
76                                                                                                                                                                                                                                                                                            <NA>
77                                                                                                                                                                                                                                                                                            <NA>
78                                                                                                                                                                                                                                                                                            <NA>
79                                                                                                                                                                                                                                                                                            <NA>
80                                                                                                                                                                                                                                                                                            <NA>
81                                                                                                                                     Hyvarinen P, Huusko A. 2006. Diet of brown trout in relation to variation in abundance and size of pelagic fish prey. Journal of Fish Biology 68, 87\x9698.
82                                                                                                                                                                                                                                                                                            <NA>
83                                                                                                                                                                                                                                                                                            <NA>
84                                                                                                                                                                                                                                                                                            <NA>
85                                                                                                          Murie DJ. 1995. Comparative feeding ecology of two sympatric rockfish congeners, Sebastes caurinus (copper rockfish) and S. maliger (quillback rockfish). Marine Biology 124: 341-353.
86                                                              Honda H, Masatoshi K. 1997. Size selective feeding and its limitations for the black rockfish, Sebastes inermis, in a demersal fish assemblage of Onagawa Bay, northeastern Japan. Environmental Biology of Fishes 50: 183\x96193.
87                                                                                                          Murie DJ. 1995. Comparative feeding ecology of two sympatric rockfish congeners, Sebastes caurinus (copper rockfish) and S. maliger (quillback rockfish). Marine Biology 124: 341-353.
88                                                                                                                                                                                                                                                                                            <NA>
89                                                                                                                                                                                                                                                                                            <NA>
90                                                                                                                                                                                                                                                                                            <NA>
91                                                                                                                                                                                                                                                                                            <NA>
92                                                                                                                                                                                                                                                                                            <NA>
93                                                                                                                                                                                                                                                                                            <NA>
94                                                                                                                              Gliwicz J. 2008. Body Size Relationships between Avian Predators and Their Rodent Prey in a North-American Sagebrush Community. Acta Ornithologica, 43(2):151-158.
95                                            Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
96                                            Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
97                                                                                                                                                                                                                                                                                            <NA>
98                                            Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
99                                                                                                                                                                                                                                                                                            <NA>
100                                                                                                                                                                                                                                                                                           <NA>
101                                                                                                                                                                                                                                                                                           <NA>
102                                                                                                                                                                                                                                                                                           <NA>
103                                                                                                                                                                                                                                                                                           <NA>
104                                                                                                                                                                                                                                                                                           <NA>
105                                                                                                                                                                                                                                                                                           <NA>
106                                                                                                                                                                                                                                                                                           <NA>
107                                                                                                                                                                                                                                                                                           <NA>
108                                                                                                                                                                                                                                                                                           <NA>
109                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
110                                                                                                                                                                                                           Schoener TW. 1968. Sizes of Feeding Territories among Birds. Ecology 49(1), 123-141.
111                                                                                                                                                                                                                                                                                           <NA>
112                                                                                                                                                                                                           Schoener TW. 1968. Sizes of Feeding Territories among Birds. Ecology 49(1), 123-141.
113                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
114                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
115                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
116                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
117                                                                                                                                                                                                                                                                                           <NA>
118                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
119                                                                                                                                                                                                                                                                                           <NA>
120                                                                                                                                                                                                                                                                                           <NA>
121                                                                                                                                                                                                                                                                                           <NA>
122                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
123                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
124                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
125                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
126                                                                                                                                                                                                                                                                                           <NA>
127                                                                                                                                                                                                                                                                                           <NA>
128                                                                                                                                                                                                                                                                                           <NA>
129                                                                                                                                                                                                                                                                                           <NA>
130                                                                                                                                                                                                                                                                                           <NA>
131                                                                                                                                                                                                                                                                                           <NA>
132                                                                                                                                                                                                                                                                                           <NA>
133                                                                                                                                                                                                                                                                                           <NA>
134                                                                                                                                                                                                                                                                                           <NA>
135                                                                                                                                                                                                                                                                                           <NA>
136                                                                                                                                                                                                                                                                                           <NA>
137                                                                                                                                                                                                                                                                                           <NA>
138                                                                                                                                                                                                                                                                                           <NA>
139                                                                                                                                                                                                                                                                                           <NA>
140                                                                                                                                                                                                                                                                                           <NA>
141                                                                                                                                                                                                                                                                                           <NA>
142                                                                                                                                                                                                                                                                                           <NA>
143                                                                                                                                                                                                                                                                                           <NA>
144                                                                                                                                                                                                                                                                                           <NA>
145                                                                                                                                                                                                                                                                                           <NA>
146                                                                                                                                                                                                                                                                                           <NA>
147                                                                                                                                                                                                                                                                                           <NA>
148                                                                                                                                                                                                                                                                                           <NA>
149                                                                                                                                                                                                                                                                                           <NA>
150                                                                                                                                                                                                                                                                                           <NA>
151                                                                                                                                                                                                                                                                                           <NA>
152                                                                                                                                                                                                                                                                                           <NA>
153                                                                                                                                                                                                                                                                                           <NA>
154                                                                                                                                                                                                                                                                                           <NA>
155                                                                                                                                                                                                                                                                                           <NA>
156                                                                                                                                                                                                                                                                                           <NA>
157                                                                                                                                                                                                                                                                                           <NA>
158                                                                                                                                                                                                                                                                                           <NA>
159                                                                                                                                                                                                                                                                                           <NA>
160                                                                                                                                                                                                                                                                                           <NA>
161                                                                                                                                                                                                                                                                                           <NA>
162                                                                                                                                                                                                                                                                                           <NA>
163                                                                                                                                                                                                                                                                                           <NA>
164                                                                                                                                                                                                                                                                                           <NA>
165                                                                                                                                                                                                                                                                                           <NA>
166                                                                                                                                                                                                                                                                                           <NA>
167                                                                                                                                                                                                                                                                                           <NA>
168                                                                                                                                                                                                                                                                                           <NA>
169                                                                                                                                                                                                                                                                                           <NA>
170                                                                                                                                                                                                                                                                                           <NA>
171                                                                                                                                                                                                                                                                                           <NA>
172                                                                                                                                                                                                                                                                                           <NA>
173                                                                                                                                                                                                                                                                                           <NA>
174                                                                                                                                                                                                                                                                                           <NA>
175                                                                                                                                                                                                                                                                                           <NA>
176                                                                                                                                                                                                                                                                                           <NA>
177                                                                                                                                                                                                                                                                                           <NA>
178                                                                                                                                                                                                                                                                                           <NA>
179                                                                                                                                                                                                                                                                                           <NA>
180                                                                                                                                                                                                                                                                                           <NA>
181                                                                                                                                                                                                                                                                                           <NA>
182                                                                                                                                                                                                                                                                                           <NA>
183                                                                                                                                                                                                                                                                                           <NA>
184                                                                                                                                                                                                                                                                                           <NA>
185                                                                                                                                                                                                                                                                                           <NA>
186                                                                                                                                                                                                                                                                                           <NA>
187                                                                                                                                                                                                                                                                                           <NA>
188                                                                                                                                                                                                                                                                                           <NA>
189                                                                                                                                                                                                                                                                                           <NA>
190                                                                                                                                                                                                                                                                                           <NA>
191                                                                                                                                                                                                                                                                                           <NA>
192                                                                                                                                                                                                                                                                                           <NA>
193                                                                                                                                                                                                                                                                                           <NA>
194                                                                                                                                                                                                                                                                                           <NA>
195                                                                                                                                                                                                                                                                                           <NA>
196                                                                                                                                                                                                                                                                                           <NA>
197                                                                                                                                                                                                                                                                                           <NA>
198                                                                                                                                                                                                                                                                                           <NA>
199                                                                                                                                                                                                                                                                                           <NA>
200                                                                                                                                                                                                                                                                                           <NA>
201                                                                                                                                                                                                                                                                                           <NA>
202                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
203                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
204                                                                                                                                            Marchesi L, Sergio F, Pedrini P. 2002. Costs and benefits of breeding in human-altered landscapes for the Eagle Owl Bubo bubo. Ibis 144, E164-E177.
205                                                                                                                                    Jaksic FM, Carothers JH. 1985. Ecological, Morphological, and Bioenergetic Correlates of Hunting Mode in Hawks and Owls. Ornis Scandinavica 16(3), 165-172.
206                                                                                                                              Slagsvold T, Sonerud GA. 2007. Prey size and ingestion rate in raptors: importance for sex roles and reversed sexual size dimorphism. J. Avian Biol. 38: 650 661.
207                                                                                                                                                                                                                                                                                           <NA>
208                                                                                                                            Galeotti P, Morimando F, Violani C. 2009. Feeding ecology of the tawny owls (Strix aluco) in urban habitats (northern Italy). Bolletino di zoologia 58(2), 143-150.
209                                            Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, andConsequences. Oecologia 71(3), 461-472.
210                                                                                                                                                                                                                                                                                           <NA>
211                                                                                                                                                                                                                                                                                           <NA>
212                                                                                                                                                                                                                                                                                           <NA>
213                                                                                                                                                                                                                                                                                           <NA>
214                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
215                                                                                                                                                                                                                                                                                           <NA>
216                                                                                                                                                                                                                                                                                           <NA>
217                                                                                                                                                                                                                                                                                           <NA>
218                                                                                                                                                                                                                                                                                           <NA>
219                                                                                                                                                                                                                                                                                           <NA>
220                                                                                                                                                                                                                                                                                           <NA>
221                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
222                                                                                                                                                                                                                                                                                           <NA>
223                                                                                                                                                                                                                                                                                           <NA>
224                                                                                                                                                                                                                                                                                           <NA>
225                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
226                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
227                                                                                                                                                                                                                                                                                           <NA>
228                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
229                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
230                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
231                                                                                                                                                                                                                                                                                           <NA>
232                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
233                                                                                                                                                                                                                                                                                           <NA>
234                                                                                                        Radloff FG, Du Toit JT. 2004. Large predators and their prey in a southern African savanna: a predator\x92s size determines its prey size range. Journal of Animal Ecology 73, 410-423.
235                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
236                                                                                                                                                                                                                                                                                           <NA>
237                                                                                                                                                                                                                                                                                           <NA>
238                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
239                                                                                                                                                                                                                                                                                           <NA>
240                                                                                                                                                                                                                                                                                           <NA>
241                                                                                                                                                                                                                                                                                           <NA>
242                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
243                                                                                                                                                                                                                                                                                           <NA>
244                                                                                                                                                                                                                                                                                           <NA>
245                                                                                                                                                                                                                                                                                           <NA>
246                                                                                                                                                                                                                                                                                           <NA>
247                                                                                                                                                                                                                                                                                           <NA>
248                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
249                                                                                                                                                                                                                                                                                           <NA>
250                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
251                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
252                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
253                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
254                                                                                                                                                                                                                                                                                           <NA>
255                                                                                                                                                                                                                                                                                           <NA>
256                                                                                                                                                                                                                                                                                           <NA>
257                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
258                                                                                                                                                                                                                                                                                           <NA>
259                                                                                                                                                                                                                                                                                           <NA>
260                                                                                                                                                                                                                                                                                           <NA>
261                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
262                                                                                                                                                                                                                                                                                           <NA>
263                                                                                                                                                                                                                                                                                           <NA>
264                                                                                                                                                                                                                                                                                           <NA>
265                                                                                                                                                                                                                                                                                           <NA>
266                                                                                                                                                                                                                                                                                           <NA>
267                                                                                                                                                                                                                                                                                           <NA>
268                                                                                                                                                                                                                                                                                           <NA>
269                                                                                                                                                                                                                                                                                           <NA>
270                                                                                                                                                                                                                                                                                           <NA>
271                                                                                                                                                                                                                                                                                           <NA>
272                                                                                                                                                                                                                                                                                           <NA>
273                                                                                                                                                                                                                                                                                           <NA>
274                                                                                                                                                                                                                                                                                           <NA>
275                                                                                                                                                                                                                                                                                           <NA>
276                                                                                                                                                                                                                                                                                           <NA>
277                                                                                                                                                                                                                                                                                           <NA>
278                                                                                                                                                                                                                                                                                           <NA>
279                                                                                                                                                                                                                                                                                           <NA>
280                                                                                                                                                                                                                                                                                           <NA>
281                                                                                                                                                                                                                                                                                           <NA>
282                                                                                                                                                                                                                                                                                           <NA>
283                                                                                                                                                                                                                                                                                           <NA>
284                                                                                                                                                                                                                                                                                           <NA>
285                                                                                                                                                                                                                                                                                           <NA>
286                                                                                                                                                                                                                                                                                           <NA>
287                                                                                                                                                                                                                                                                                           <NA>
288                                                                                                                                                                                                                                                                                           <NA>
289                                                                                                                                                                                                                                                                                           <NA>
290                                                                                                                                                                                                                                                                                           <NA>
291                                                                                                                                                                                                                                                                                           <NA>
292                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
293                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
294                                                                                                                                                                                                                                                                                           <NA>
295                                                                                                                                                                                                                                                                                           <NA>
296                                                                                                                                                                                                                                                                                           <NA>
297                                                                                                              Weatherhead PJ, Blouin-Demers G, Cavey KM. 2003. Seasonal and Prey-size Dietary Patterns of Black Ratsnakes (Elaphe obsoleta obsoleta). American Midland Naturalist 150, 275-281.
298                                                                                                                                                                                                                                                                                           <NA>
299                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
300                                                                                                                                                                                                                                                                                           <NA>
301                                                                                                                                                                                                                                                                                           <NA>
302                                                                                                                                                                                                                                                                                           <NA>
303                                                                                                                               Gregory PT, Isaac LA. 2004. Food Habits of the Grass Snake in Southeastern England: Is Natrix natrix a Generalist Predator? Journal of Herpetology 38(1): 88-95.
304                                                                                                                                                                                                                                                                                           <NA>
305                                                                                                                                                                             King RB. 2002. Predicted and Observed Maximum Prey Size - Snake Size Allometry. Functional Ecology 16(6), 766-772.
306                                                                                                                                                                                                                                                                                           <NA>
307                                                                                                                                                                                                                                                                                           <NA>
308                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
309                                                                                                                                                                                                                                                                                           <NA>
310                                                                                                                                                                                                                                                                                           <NA>
311                                                                                                                                                                                                                                                                                           <NA>
312                                                                                                                                                                                                                                                                                           <NA>
313                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
314                                                                                                                                                                                                                                                                                           <NA>
315                                                                                                                                                                                                                                                                                           <NA>
316                                                                                                                                                                                                                                                                                           <NA>
317                                                                                                                   Vincent SW, Herrel A, Irschick DJ. 2004. Sexual dimorphism in head shape and diet in the cottonmouth. Journal of Zoology, London 264, 53-59.\nsnake (Agkistrodon piscivorus)
318                                                                                                                                                                                                                                                                                           <NA>
319 Martins M, Marques OAV, Sazima I. 2002. Ecological and phylogenetic correlates of feeding habits in Neotropical pitvipers of the genus Bothrops. In G. W. Schuett, M. E. Douglas, M. H\xf6ggren, and H. W. Greene (eds.), Biology of the Vipers. Eagle Mountain Publishing, Eagle Mountain, UT
320                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
321                                                                                                                                                                                                                                                                                           <NA>
322                                                                                                                                                                                      Clark RW. 2002. Diet of the timber rattlesnake, Crotalus horridus. Journal of Herpetology 36(3), 494-499.
323                                                                                                                                                                                                                                                                                           <NA>
324                                                                                            Carbone C, Daryl C, Conrad S, Marcus C, Belby J. 2014. Geometric factors influencing the diet of vertebrate predators in marine and terrestrial environments. Ecology Letters 17(12): 1553\x961559.
325                                                                                                                                                                                                                                                                                           <NA>
326                                                                                                                                                                                                                                                                                           <NA>
327                                                                                                                                                                                                                                                                                           <NA>
328                                                                                                                                   Shine R, Sun L-X. 2003. Attack strategy of an ambush predator: which attributes of the prey trigger a pit-viper\x92s strike? Functional Ecology 17, 340-348.
329                                                                                                                                                                                                                                                                                           <NA>
330                                           Jaksic FM, Delibes M.1987. A Comparative Analysis of Food-Niche Relationships and Trophic Guild Structure in TwoAssemblages of Vertebrate Predators Differing in Species Richness: Causes, Correlations, and Consequences. Oecologia 71(3), 461-472.
331                                                                                                                                                                                                                                                                                           <NA>
332                                                                                                                                                                                                                                                                                           <NA>
333                                                                                                                                                                                                                                                                                           <NA>
334                                                                                                                                                                                                                                                                                           <NA>
335                                                                                                                                                                                                                                                                                           <NA>
336                                                                                                                                                                                                                                                                                           <NA>
337                                                                                                                                                                                                                                                                                           <NA>
338                                                                                                                                                                                                                                                                                           <NA>
339                                                                                                                                                                                                                                                                                           <NA>
340                                                                                                                                                                                                                                                                                           <NA>
341                                                                                                                                                                                                                                                                                           <NA>
342                                                                                                                                                                                                                                                                                           <NA>
```

```r
herbivores <- data.frame(subset(homerange, trophic.guild == "herbivore"))
herbivores
```

```
            taxon                    common.name          class
1   marine fishes              lined surgeonfish actinopterygii
2   marine fishes        orangespine unicornfish actinopterygii
3   marine fishes          bluespine unicornfish actinopterygii
4   marine fishes                  redlip blenny actinopterygii
5   marine fishes                   bermuda chub actinopterygii
6   marine fishes                     cherubfish actinopterygii
7   marine fishes                     damselfish actinopterygii
8   marine fishes            twinspot damselfish actinopterygii
9   marine fishes                   wards damsel actinopterygii
10  marine fishes             australian gregory actinopterygii
11  marine fishes             bicolor damselfish actinopterygii
12  marine fishes               cocoa damselfish actinopterygii
13  marine fishes           steephead parrotfish actinopterygii
14  marine fishes             striped parrotfish actinopterygii
15  marine fishes           rivulated parrotfish actinopterygii
16  marine fishes             redband parrotfish actinopterygii
17  marine fishes             redtail parrotfish actinopterygii
18  marine fishes              redfin parrotfish actinopterygii
19  marine fishes           stoplight parrotfish actinopterygii
20  marine fishes                         salema actinopterygii
21          birds                        gadwall           aves
22          birds                      inca dove           aves
23          birds             common wood pigeon           aves
24          birds           European turtle dove           aves
25          birds                   hazel grouse           aves
26          birds                    sage grouse           aves
27          birds                   dusky grouse           aves
28          birds               willow ptarmigan           aves
29          birds                 grey partridge           aves
30          birds                   black grouse           aves
31          birds           western capercaillie           aves
32          birds        greater prairie-chicken           aves
33          birds                      corncrake           aves
34          birds             spotted nutcracker           aves
35          birds           Peruvian plantcutter           aves
36          birds                 Abert's towhee           aves
37          birds                  canyon towhee           aves
38          birds                  common linnet           aves
39          birds         tooth-billed bowerbird           aves
40          birds                         kakapo           aves
41          birds                   greater rhea           aves
42          birds                    lesser rhea           aves
43          birds                        ostrich           aves
44          birds                 ornate tinamou           aves
45        mammals                      pronghorn       mammalia
46        mammals                         impala       mammalia
47        mammals                     hartebeest       mammalia
48        mammals                  barbary sheep       mammalia
49        mammals                 American bison       mammalia
50        mammals                 European bison       mammalia
51        mammals                           goat       mammalia
52        mammals                   Spanish ibex       mammalia
53        mammals                 Peter's dukier       mammalia
54        mammals                     bay dikier       mammalia
55        mammals               mountain gazelle       mammalia
56        mammals           G\xfcnther's dik-dik       mammalia
57        mammals                  mountain goat       mammalia
58        mammals                         argali       mammalia
59        mammals                  bighorn sheep       mammalia
60        mammals                       steenbok       mammalia
61        mammals                        chamois       mammalia
62        mammals                   common eland       mammalia
63        mammals                       bushbuck       mammalia
64        mammals                   greater kudu       mammalia
65        mammals                          moose       mammalia
66        mammals                         chital       mammalia
67        mammals                       roe deer       mammalia
68        mammals                       red deer       mammalia
69        mammals                      sika deer       mammalia
70        mammals                    fallow deer       mammalia
71        mammals               Reeves's muntjac       mammalia
72        mammals                      mule deer       mammalia
73        mammals              white-tailed deer       mammalia
74        mammals                    pampas deer       mammalia
75        mammals                           pudu       mammalia
76        mammals                       reindeer       mammalia
77        mammals                        giraffe       mammalia
78        mammals                          okapi       mammalia
79        mammals                 desert warthog       mammalia
80        mammals                Chacoan peccary       mammalia
81        mammals               collared peccary       mammalia
82        mammals           white-lipped peccary       mammalia
83        mammals               water chevrotain       mammalia
84        mammals                      red panda       mammalia
85        mammals thick-tailed three-toed jerboa       mammalia
86        mammals                       kinkajou       mammalia
87        mammals                    giant panda       mammalia
88        mammals       Lumholtz's tree-kangaroo       mammalia
89        mammals            antilopine kangaroo       mammalia
90        mammals          black-striped wallaby       mammalia
91        mammals          Western grey kangaroo       mammalia
92        mammals          Eastern grey kangaroo       mammalia
93        mammals                common wallaroo       mammalia
94        mammals             red-necked wallaby       mammalia
95        mammals                   red kangaroo       mammalia
96        mammals            allied rock-wallaby       mammalia
97        mammals                eastern bettong       mammalia
98        mammals            long-footed potoroo       mammalia
99        mammals                 greater glider       mammalia
100       mammals      bridled nail-tail wallaby       mammalia
101       mammals           red-legged pademelon       mammalia
102       mammals           red-necked pademelon       mammalia
103       mammals                  swamp wallaby       mammalia
104       mammals        common brushtail possum       mammalia
105       mammals    northern hairy-nosed wombat       mammalia
106       mammals                  common wombat       mammalia
107       mammals                   pygmy rabbit       mammalia
108       mammals                  snowshoe hare       mammalia
109       mammals                    Arctic hare       mammalia
110       mammals        black-tailed jackrabbit       mammalia
111       mammals                      cape hare       mammalia
112       mammals                  European hare       mammalia
113       mammals                    Indian hare       mammalia
114       mammals                  mountain hare       mammalia
115       mammals                European rabbit       mammalia
116       mammals                   swamp rabbit       mammalia
117       mammals             eastern cottontail       mammalia
118       mammals                   marsh rabbit       mammalia
119       mammals                   plateau pika       mammalia
120       mammals                  American pika       mammalia
121       mammals                          horse       mammalia
122       mammals               white rhinoceros       mammalia
123       mammals               black rhinoceros       mammalia
124       mammals                    maned sloth       mammalia
125       mammals                 Asian elephant       mammalia
126       mammals          African bush elephant       mammalia
127       mammals                mountain beaver       mammalia
128       mammals             cape dune mole rat       mammalia
129       mammals            Damaraland mole rat       mammalia
130       mammals                common mole rat       mammalia
131       mammals                  cape mole rat       mammalia
132       mammals               silvery mole rat       mammalia
133       mammals                 naked mole rat       mammalia
134       mammals                Patagonian mara       mammalia
135       mammals                plains viscacha       mammalia
136       mammals        western red-backed vole       mammalia
137       mammals          large-headed rice rat       mammalia
138       mammals         Siberian brown lemming       mammalia
139       mammals                     field vole       mammalia
140       mammals                California vole       mammalia
141       mammals                   montane vole       mammalia
142       mammals                   prairie vole       mammalia
143       mammals                    meadow vole       mammalia
144       mammals                  woodland vole       mammalia
145       mammals                     water vole       mammalia
146       mammals                   wood lemming       mammalia
147       mammals           bushy-tailed woodrat       mammalia
148       mammals           dusky-footed woodrat       mammalia
149       mammals                 desert woodrat       mammalia
150       mammals        Southern plains woodrat       mammalia
151       mammals                        muskrat       mammalia
152       mammals       salt marsh harvest mouse       mammalia
153       mammals           southern bog lemming       mammalia
154       mammals        dwarf fat-tailed jerboa       mammalia
155       mammals             Cuvier's spiny rat       mammalia
156       mammals               Tome's spiny rat       mammalia
157       mammals            Brazilian porcupine       mammalia
158       mammals       North American porcupine       mammalia
159       mammals          Botta's pocket gopher       mammalia
160       mammals            spectacled dormouse       mammalia
161       mammals                 hazel dormouse       mammalia
162       mammals             giant kangaroo rat       mammalia
163       mammals         Merriam's kangaroo rat       mammalia
164       mammals             Ord's kangaroo rat       mammalia
165       mammals     banner-tailed kangaroo rat       mammalia
166       mammals         Stephen's kangaroo rat       mammalia
167       mammals                 cape porcupine       mammalia
168       mammals       Indian crested porcupine       mammalia
169       mammals African brush-tailed porcupine       mammalia
170       mammals            yellow-necked mouse       mammalia
171       mammals                     wood mouse       mammalia
172       mammals             Indian desert jird       mammalia
173       mammals            broad-toothed mouse       mammalia
174       mammals             Malagasy giant rat       mammalia
175       mammals       White-bellied\xa0nesomys       mammalia
176       mammals                   island mouse       mammalia
177       mammals                         coruro       mammalia
178       mammals              Siberian chipmunk       mammalia
179       mammals         Northern parl squirrel       mammalia
180       mammals       Northern flying squirrel       mammalia
181       mammals       Southern flying squirrel       mammalia
182       mammals          yellow-bellied marmot       mammalia
183       mammals                      groundhog       mammalia
184       mammals              red bush squirrel       mammalia
185       mammals               Abert's squirrel       mammalia
186       mammals          eastern gray squirrel       mammalia
187       mammals              Japanese squirrel       mammalia
188       mammals                   fox squirrel       mammalia
189       mammals                   red squirrel       mammalia
190       mammals     California ground squirrel       mammalia
191       mammals      Columbian ground squirrel       mammalia
192       mammals     Franklin's ground squirrel       mammalia
193       mammals         arctic ground squirrel       mammalia
194       mammals        spotted ground squirrel       mammalia
195       mammals thirteen-lined ground squirrel       mammalia
196       mammals                  rock squirrel       mammalia
197       mammals           yellow-pine chipmunk       mammalia
198       mammals                 least chipmunk       mammalia
199       mammals              Colorado chipmunk       mammalia
200       mammals                 Uinta chipmunk       mammalia
201       mammals          American red squirrel       mammalia
202       mammals        striped ground squirrel       mammalia
203       lizards              spiny tail lizard       reptilia
204       lizards          Galapagos land iguana       reptilia
205       lizards         Bahamian Andros iguana       reptilia
206       lizards                    blue iguana       reptilia
207       lizards          Anegada ground iguana       reptilia
208       lizards        Angel island chuckwalla       reptilia
209       lizards              common chuckwalla       reptilia
210       lizards                  desert iguana       reptilia
211       lizards                Tenerife lizard       reptilia
212       lizards           High Mountain Lizard       reptilia
213       lizards                    land mullet       reptilia
214       turtles              ornate box turtle       reptilia
215       turtles            Spanish pond turtle       reptilia
216     tortoises            red-footed tortoise       reptilia
217     tortoises                desert tortoise       reptilia
218     tortoises                gopher tortoise       reptilia
219     tortoises            travancore tortoise       reptilia
220     tortoises  Speke's hinge-backed tortoise       reptilia
221     tortoises             impressed tortoise       reptilia
222     tortoises      bushmanland tent tortoise       reptilia
223     tortoises               leopard tortoise       reptilia
224     tortoises          spur-thighed tortoise       reptilia
225     tortoises         mediterranean tortoise       reptilia
226     tortoises        Russian steppe tortoise       reptilia
227     tortoises              Egyptian tortoise       reptilia
               order            family           genus          species
1        perciformes      acanthuridae      acanthurus         lineatus
2        perciformes      acanthuridae            naso        lituratus
3        perciformes      acanthuridae            naso        unicornis
4        perciformes         blennidae   ophioblennius       atlanticus
5        perciformes        kyphosidae        kyphosus        sectatrix
6        perciformes     pomacanthidae      centropyge             argi
7        perciformes     pomacentridae         chromis          chromis
8        perciformes     pomacentridae     chrysiptera       biocellata
9        perciformes     pomacentridae     pomacentrus            wardi
10       perciformes     pomacentridae       stegastes         apicalis
11       perciformes     pomacentridae       stegastes         partitus
12       perciformes     pomacentridae       stegastes       variabilis
13       perciformes          scaridae       chlorurus      microrhinos
14       perciformes          scaridae          scarus            iseri
15       perciformes          scaridae          scarus        rivulatus
16       perciformes          scaridae       sparisoma     aurofrenatum
17       perciformes          scaridae       sparisoma     chrysopterum
18       perciformes          scaridae       sparisoma       rubripinne
19       perciformes          scaridae       sparisoma           viride
20       perciformes          sparidae           sarpa            salpa
21      anseriformes          anatidae            anas         strepera
22     columbidormes        columbidae     scardafella             inca
23     columbiformes        columbidae         columba         palumbus
24     columbiformes        columbidae    streptopelia           turtur
25       galliformes       phasianidae          bonasa          bonasia
26       galliformes       phasianidae    centrocercus     urophasianus
27       galliformes       phasianidae     dendragapus         obscurus
28       galliformes       phasianidae         lagopus          lagopus
29       galliformes       phasianidae          perdix           perdix
30       galliformes       phasianidae          tetrao           tetrix
31       galliformes       phasianidae          tetrao        urogallus
32       galliformes       phasianidae     typmanuchus  cupido pinnatus
33        gruiformes          rallidae            crex             crex
34     passeriformes          corvidae       nucifraga    caryocatactes
35     passeriformes        cotingidae       phytotoma        raimondii
36     passeriformes       emberizidae          pipilo           aberti
37     passeriformes       emberizidae          pipilo           fuscus
38     passeriformes      fringillidae       carduelis        cannabina
39     passeriformes ptilonorhynchidae    scenopoeetes     dentirostris
40    psittaciformes       strigopidae        strigops      habroptilus
41        rheiformes           rheidae            rhea        americana
42        rheiformes           rheidae            rhea          pennata
43  struthioniformes     struthionidae        struthio          camelus
44      tinamiformes         tinamidae     nothoprocta           ornata
45      artiodactyla    antilocapridae     antilocapra        americana
46      artiodactyla           bovidae       aepyceros         melampus
47      artiodactyla           bovidae      alcelaphus       buselaphus
48      artiodactyla           bovidae      ammotragus           lervia
49      artiodactyla           bovidae           bison            bison
50      artiodactyla           bovidae           bison          bonasus
51      artiodactyla           bovidae           capra           hircus
52      artiodactyla           bovidae           capra        pyrenaica
53      artiodactyla           bovidae     cephalophus       callipygus
54      artiodactyla           bovidae     cephalophus         dorsalis
55      artiodactyla           bovidae         gazella          gazella
56      artiodactyla           bovidae         madoqua        guentheri
57      artiodactyla           bovidae        oreamnos       americanus
58      artiodactyla           bovidae            ovis            ammon
59      artiodactyla           bovidae            ovis       canadensis
60      artiodactyla           bovidae      raphicerus       campestris
61      artiodactyla           bovidae       rupicapra        rupicapra
62      artiodactyla           bovidae     taurotragus             oryx
63      artiodactyla           bovidae     tragelaphus         scriptus
64      artiodactyla           bovidae     tragelaphus     strepsiceros
65      artiodactyla          cervidae           alces            alces
66      artiodactyla          cervidae            axis             axis
67      artiodactyla          cervidae       capreolus        capreolus
68      artiodactyla          cervidae          cervus          elaphus
69      artiodactyla          cervidae          cervus           nippon
70      artiodactyla          cervidae            dama             dama
71      artiodactyla          cervidae       muntiacus          reevesi
72      artiodactyla          cervidae      odocoileus         hemionus
73      artiodactyla          cervidae      odocoileus      virginianus
74      artiodactyla          cervidae      ozotoceros      bezoarticus
75      artiodactyla          cervidae            pudu             puda
76      artiodactyla          cervidae        rangifer         tarandus
77      artiodactyla        giraffidae         giraffa   camelopardalis
78      artiodactyla        giraffidae          okapia        johnstoni
79      artiodactyla            suidae    phacochoerus      aethiopicus
80      artiodactyla       tayassuidae       catagonus          wagneri
81      artiodactyla       tayassuidae          pecari           tajacu
82      artiodactyla       tayassuidae         tayassu           pecari
83      artiodactyla        tragulidae      hyemoschus        aquaticus
84         carnivora         ailuridae         ailurus          fulgens
85         carnivora         dipodidae      stylodipus            telum
86         carnivora       procyonidae           potos           flavus
87         carnivora           ursidae      ailuropoda      melanoleuca
88       diprodontia      macropodidae     dendrolagus        lumholtzi
89       diprodontia      macropodidae        macropus      antilopinus
90       diprodontia      macropodidae        macropus         dorsalis
91       diprodontia      macropodidae        macropus      fuliginosus
92       diprodontia      macropodidae        macropus        giganteus
93       diprodontia      macropodidae        macropus         robustus
94       diprodontia      macropodidae        macropus      rufogriseus
95       diprodontia      macropodidae        macropus            rufus
96       diprodontia      macropodidae       petrogale        assimilis
97       diprodontia        potoroidae       bettongia         gaimardi
98       diprodontia        potoroidae        potorous         longipes
99       diprodontia   pseudocheiridae     petauroides           volans
100    diprotodontia      macropodidae     onychogalea         fraenata
101    diprotodontia      macropodidae       thylogale       stigmatica
102    diprotodontia      macropodidae       thylogale           thetis
103    diprotodontia      macropodidae        wallabia          bicolor
104    diprotodontia     phalangeridae     trichosurus        vulpecula
105    diprotodontia        vombatidae     lasiorhinus         krefftii
106    diprotodontia        vombatidae        vombatus          ursinus
107       lagomorpha         leporidae     brachylagus       idahoensis
108       lagomorpha         leporidae           lepus       americanus
109       lagomorpha         leporidae           lepus         arcticus
110       lagomorpha         leporidae           lepus     californicus
111       lagomorpha         leporidae           lepus         capensis
112       lagomorpha         leporidae           lepus        europaeus
113       lagomorpha         leporidae           lepus      nigricollis
114       lagomorpha         leporidae           lepus          timidus
115       lagomorpha         leporidae     oryctolagus        cuniculus
116       lagomorpha         leporidae      sylvilagus        aquaticus
117       lagomorpha         leporidae      sylvilagus       floridanus
118       lagomorpha         leporidae      sylvilagus        palustris
119       lagomorpha       ochotonidae        ochotona        curzoniae
120       lagomorpha       ochotonidae        ochotona         princeps
121   perissodactyla           equidae           equus         caballus
122   perissodactyla    rhinocerotidae   ceratotherium            simum
123   perissodactyla    rhinocerotidae         diceros         bicornis
124           pilosa      bradypodidae        bradypus        torquatus
125      proboscidea      elephantidae         elephas          maximus
126      proboscidea      elephantidae       loxodonta         africana
127         rodentia     aplodontiidae      aplodontia             rufa
128         rodentia      bathyergidae      bathyergus          suillus
129         rodentia      bathyergidae       cryptomys       damarensis
130         rodentia      bathyergidae       cryptomys      hottentotus
131         rodentia      bathyergidae       georychus         capensis
132         rodentia      bathyergidae    heliophobius argenteocinereus
133         rodentia      bathyergidae  heterocephalus           glaber
134         rodentia          caviidae      dolichotus        patagonus
135         rodentia     chinchillidae      lagostomus          maximus
136         rodentia        cricetidae   clethrionomys     californicus
137         rodentia        cricetidae       hylaeamys     megacephalus
138         rodentia        cricetidae          lemmus        sibiricus
139         rodentia        cricetidae        microtus         agrestis
140         rodentia        cricetidae        microtus     californicus
141         rodentia        cricetidae        microtus         montanus
142         rodentia        cricetidae        microtus      ochrogaster
143         rodentia        cricetidae        microtus   pennsylvanicus
144         rodentia        cricetidae        microtus        pinetorum
145         rodentia        cricetidae        microtus      richardsoni
146         rodentia        cricetidae          myopus     schisticolor
147         rodentia        cricetidae         neotoma          cinerea
148         rodentia        cricetidae         neotoma         fuscipes
149         rodentia        cricetidae         neotoma           lepida
150         rodentia        cricetidae         neotoma         micropus
151         rodentia        cricetidae         ondatra        zibethica
152         rodentia        cricetidae reithrodontomys      raviventris
153         rodentia        cricetidae      synaptomys          cooperi
154         rodentia         dipodidae      pygeretmus          pumilio
155         rodentia        echimyidae      proechimys          cuvieri
156         rodentia        echimyidae      proechimys     semispinosus
157         rodentia    erethizontidae         coendou      prehensilis
158         rodentia    erethizontidae       erethizon         dorsatum
159         rodentia         geomyidae        thomomys           bottae
160         rodentia          gliridae      graphiurus         ocularis
161         rodentia          gliridae     muscardinus     avellanarius
162         rodentia      heteromyidae       dipodomys           ingens
163         rodentia      heteromyidae       dipodomys         merriami
164         rodentia      heteromyidae       dipodomys            ordii
165         rodentia      heteromyidae       dipodomys      spectabilis
166         rodentia      heteromyidae       dipodomys        stephensi
167         rodentia       hystricidae         hystrix africaeaustralis
168         rodentia       hystricidae         hystrix           indica
169         rodentia       hystridicae       atherurus        africanus
170         rodentia           muridae        apodemus      flavicollis
171         rodentia           muridae        apodemus       sylvaticus
172         rodentia           muridae        meriones        hurrianae
173         rodentia           muridae       pseudomys           fuscus
174         rodentia        nesomyidae      hypogeomys         antimena
175         rodentia        nesomyidae         nesomys        audeberti
176         rodentia        nesomyidae         nesomys            rufus
177         rodentia      octodontidae      spalacopus           cyanus
178         rodentia         sciuridae        eutamias        sibiricus
179         rodentia         sciuridae      funambulus         pennanti
180         rodentia         sciuridae       glaucomys         sabrinus
181         rodentia         sciuridae       glaucomys           volans
182         rodentia         sciuridae         marmota     flaviventris
183         rodentia         sciuridae         marmota            monax
184         rodentia         sciuridae       paraxerus        palliatus
185         rodentia         sciuridae         sciurus           aberti
186         rodentia         sciuridae         sciurus     carolinensis
187         rodentia         sciuridae         sciurus              lis
188         rodentia         sciuridae         sciurus            niger
189         rodentia         sciuridae         sciurus         vulgaris
190         rodentia         sciuridae    spermophilus         beecheyi
191         rodentia         sciuridae    spermophilus      columbianus
192         rodentia         sciuridae    spermophilus       franklinii
193         rodentia         sciuridae    spermophilus          parryii
194         rodentia         sciuridae    spermophilus        spilosoma
195         rodentia         sciuridae    spermophilus tridecemlineatus
196         rodentia         sciuridae    spermophilus       variegatus
197         rodentia         sciuridae          tamias          amoenus
198         rodentia         sciuridae          tamias          minimus
199         rodentia         sciuridae          tamias   quadrivittatus
200         rodentia         sciuridae          tamias         umbrinus
201         rodentia         sciuridae    tamiasciurus       hudsonicus
202         rodentia         sciuridae           xerus       erythropus
203         squamata          agamidae       uromastyx        aegyptius
204         squamata         iguanidae      conolophus         pallidus
205         squamata         iguanidae         cyclura          cyclura
206         squamata         iguanidae         cyclura           lewisi
207         squamata         iguanidae         cyclura          pinguis
208         squamata         iguanidae      sauromalus         hispidua
209         squamata         iguanidae      sauromalus           obesus
210         squamata        lacertilia     dipsosaurus         dorsalis
211         squamata        lacertilia        gallotia          galloti
212         squamata       liolaemidae      phymaturus      flagellifer
213         squamata         scincidae         egernia            major
214       testudines          emydidae       terrapene           ornata
215       testudines       geoemydidae        mauremys          leprosa
216       testudines      testudinidae      geochelone       carbonaria
217       testudines      testudinidae        gopherus        agassizii
218       testudines      testudinidae        gopherus       polyphemus
219       testudines      testudinidae     indotestudo     travancorica
220       testudines      testudinidae         kinixys           spekii
221       testudines      testudinidae        manouria         impressa
222       testudines      testudinidae     psammobates        tentorius
223       testudines      testudinidae    stigmochelys         pardalis
224       testudines      testudinidae         testudo           graeca
225       testudines      testudinidae         testudo         hermanii
226       testudines      testudinidae         testudo       horsfieldi
227       testudines      testudinidae         testudo       kleinmanni
         primarymethod    N mean.mass.g log10.mass
1   direct observation <NA>      109.04  2.0375858
2            telemetry    8      772.16  2.8877073
3            telemetry    7      151.84  2.1813862
4   direct observation   20        6.20  0.7923917
5            telemetry   11     1086.71  3.0361137
6   direct observation <NA>        2.50  0.3979400
7   direct observation <NA>       28.41  1.4534712
8   direct observation   18        9.19  0.9633155
9   direct observation <NA>       10.49  1.0207755
10  direct observation <NA>       45.30  1.6560982
11  direct observation <NA>        6.64  0.8221681
12  direct observation   10       39.00  1.5910646
13           telemetry    7     1668.11  3.2222247
14  direct observation   25      171.42  2.2340615
15           telemetry   18      289.40  2.4614985
16  direct observation   25      250.64  2.3990504
17  direct observation   17      388.84  2.5897709
18  direct observation   17      523.80  2.7191655
19  direct observation   27      521.16  2.7169711
20           telemetry <NA>      731.58  2.8642618
21           telemetry    3      719.00  2.8567289
22  direct observation <NA>       47.70  1.6785184
23          telemetry* <NA>      150.00  2.1760913
24          telemetry* <NA>      140.33  2.1471505
25          telemetry* <NA>      410.00  2.6127839
26           telemetry    5     1750.00  3.2430380
27  direct observation    3     1050.00  3.0211893
28  direct observation <NA>      620.00  2.7923917
29          telemetry* <NA>      381.50  2.5814945
30          telemetry* <NA>     1139.00  3.0565237
31          telemetry* <NA>     2936.00  3.4677561
32           telemetry   71      900.00  2.9542425
33           telemetry   20      165.00  2.2174839
34  direct observation <NA>      130.00  2.1139434
35      mark-recapture    6       42.00  1.6232493
36  direct observation <NA>       46.30  1.6655810
37  direct observation   34       44.70  1.6503075
38          telemetry* <NA>     1550.00  3.1903317
39           telemetry    4      158.00  2.1986571
40           telemetry   13     1941.00  3.2880255
41           telemetry   10    25000.00  4.3979400
42           telemetry    7    15000.00  4.1760913
43           telemetry    1    88250.00  4.9457147
44  direct observation   14      622.00  2.7937904
45          telemetry* <NA>    46099.90  4.6637000
46          telemetry* <NA>    63503.84  4.8028000
47          telemetry* <NA>   136000.34  5.1335400
48          telemetry* <NA>   167498.14  5.2240100
49          telemetry* <NA>   629999.20  5.7993400
50          telemetry* <NA>   628000.52  5.7979600
51          telemetry* <NA>    50999.98  4.7075700
52          telemetry* <NA>    69499.23  4.8419800
53          telemetry* <NA>    18143.87  4.2587299
54          telemetry* <NA>    20411.74  4.3098800
55          telemetry* <NA>    21474.84  4.3319299
56          telemetry* <NA>     4600.02  3.6627597
57          telemetry* <NA>   629999.20  5.7993400
58          telemetry* <NA>   113998.73  5.0569000
59          telemetry* <NA>    90719.36  4.9577000
60          telemetry* <NA>    11300.04  4.0530800
61          telemetry* <NA>    30999.88  4.4913600
62          telemetry* <NA>   635038.42  5.8028000
63          telemetry* <NA>    54431.46  4.7358500
64          telemetry* <NA>   197314.95  5.2951600
65          telemetry* <NA>   307227.44  5.4874600
66          telemetry* <NA>    62823.19  4.7981200
67          telemetry* <NA>    24050.27  4.3811200
68          telemetry* <NA>   234757.78  5.3706200
69          telemetry* <NA>    29450.32  4.4690900
70          telemetry* <NA>    71449.63  4.8540000
71          telemetry* <NA>    13499.88  4.1303299
72          telemetry* <NA>    53864.17  4.7313000
73          telemetry* <NA>    87884.04  4.9439100
74          telemetry* <NA>    35000.16  4.5440700
75          telemetry* <NA>     7499.98  3.8750601
76          telemetry* <NA>   102058.69  5.0088500
77          telemetry* <NA>  1339985.19  6.1271000
78          telemetry* <NA>   230001.15  5.3617300
79          telemetry* <NA>    80513.74  4.9058700
80          telemetry* <NA>    34700.04  4.5403300
81          telemetry* <NA>    23205.98  4.3655999
82          telemetry* <NA>    20250.23  4.3064300
83          telemetry* <NA>    10850.01  4.0354301
84          telemetry* <NA>     5399.95  3.7323897
85          telemetry* <NA>       60.00  1.7781513
86          telemetry* <NA>     2887.62  3.4605400
87          telemetry* <NA>    87500.39  4.9420100
88          telemetry* <NA>     6649.97  3.8228197
89          telemetry* <NA>    27250.22  4.4353700
90          telemetry* <NA>    11249.93  4.0511498
91          telemetry* <NA>    22124.83  4.3448799
92          telemetry* <NA>    10375.05  4.0159902
93          telemetry* <NA>    21250.05  4.3273600
94          telemetry* <NA>    16850.00  4.2265999
95          telemetry* <NA>    46249.82  4.6651100
96          telemetry* <NA>     4646.01  3.6670801
97          telemetry* <NA>     1660.01  3.2201107
98          telemetry* <NA>     1899.98  3.2787490
99          telemetry* <NA>     1299.99  3.1139400
100         telemetry* <NA>     5000.00  3.6989700
101         telemetry* <NA>     4649.97  3.6674502
102         telemetry* <NA>     5399.95  3.7323897
103         telemetry* <NA>    14999.96  4.1760901
104         telemetry* <NA>     2875.01  3.4586394
105         telemetry* <NA>    25499.99  4.4065400
106         telemetry* <NA>    25999.80  4.4149700
107         telemetry* <NA>      340.20  2.5317343
108         telemetry* <NA>     1360.79  3.1337911
109         telemetry* <NA>     4050.05  3.6074604
110         telemetry* <NA>     2267.98  3.3556392
111         telemetry* <NA>     3549.11  3.5501195
112         telemetry* <NA>     5250.01  3.7201601
113         telemetry* <NA>     3129.97  3.4955402
114         telemetry* <NA>     2825.01  3.4510200
115         telemetry* <NA>     1600.00  3.2041200
116         telemetry* <NA>     2150.01  3.3324405
117         telemetry* <NA>     1360.79  3.1337911
118         telemetry* <NA>     1349.99  3.1303306
119         telemetry* <NA>      155.30  2.1911715
120         telemetry* <NA>      146.50  2.1658376
121         telemetry* <NA>   427996.29  5.6314400
122         telemetry* <NA>  2249986.95  6.3521800
123         telemetry* <NA>  1050001.69  6.0211900
124         telemetry* <NA>     3899.96  3.5910602
125         telemetry* <NA>  4000000.08  6.6020600
126         telemetry* <NA>  4000000.08  6.6020600
127         telemetry* <NA>     1133.99  3.0546092
128         telemetry* <NA>      625.00  2.7958800
129         telemetry* <NA>      148.00  2.1702617
130         telemetry* <NA>       65.00  1.8129134
131         telemetry* <NA>      242.00  2.3838154
132         telemetry* <NA>      155.00  2.1903317
133         telemetry* <NA>       39.00  1.5910646
134         telemetry* <NA>     8000.00  3.9030900
135         telemetry* <NA>     5190.03  3.7151699
136         telemetry* <NA>       22.57  1.3535316
137         telemetry* <NA>       66.30  1.8215135
138         telemetry* <NA>       92.14  1.9644482
139         telemetry* <NA>       38.00  1.5797836
140         telemetry* <NA>       70.87  1.8504624
141         telemetry* <NA>       56.70  1.7535831
142         telemetry* <NA>       35.44  1.5494937
143         telemetry* <NA>       49.61  1.6955692
144         telemetry* <NA>       29.50  1.4698220
145         telemetry* <NA>       85.50  1.9319661
146         telemetry* <NA>       30.00  1.4771213
147         telemetry* <NA>      395.48  2.5971245
148         telemetry* <NA>      308.30  2.4889735
149         telemetry* <NA>      132.29  2.1215270
150         telemetry* <NA>      255.15  2.4067956
151         telemetry* <NA>     1360.79  3.1337911
152         telemetry* <NA>       11.05  1.0433623
153         telemetry* <NA>       38.27  1.5828585
154         telemetry* <NA>       52.50  1.7201593
155         telemetry* <NA>      350.00  2.5440680
156         telemetry* <NA>      428.00  2.6314438
157         telemetry* <NA>     4250.01  3.6283900
158         telemetry* <NA>     8618.27  3.9354201
159         telemetry* <NA>      160.18  2.2046083
160         telemetry* <NA>       68.80  1.8375884
161         telemetry* <NA>       31.00  1.4913617
162         telemetry* <NA>      153.56  2.1862781
163         telemetry* <NA>       41.82  1.6213840
164         telemetry* <NA>       56.70  1.7535831
165         telemetry* <NA>      144.58  2.1601082
166         telemetry* <NA>       76.20  1.8819550
167         telemetry* <NA>    17000.04  4.2304499
168         telemetry* <NA>    14999.96  4.1760901
169         telemetry* <NA>     2749.98  3.4393295
170         telemetry* <NA>       31.60  1.4996871
171         telemetry* <NA>       21.20  1.3263359
172         telemetry* <NA>       88.30  1.9459607
173         telemetry* <NA>      122.00  2.0863598
174         telemetry* <NA>     1185.00  3.0737184
175         telemetry* <NA>      215.60  2.3336488
176         telemetry* <NA>      165.45  2.2186668
177         telemetry* <NA>      100.86  2.0037190
178         telemetry* <NA>       95.80  1.9813655
179         telemetry* <NA>      102.50  2.0107239
180         telemetry* <NA>      148.84  2.1727197
181         telemetry* <NA>       64.50  1.8095597
182         telemetry* <NA>     3401.97  3.5317305
183         telemetry* <NA>     3401.97  3.5317305
184         telemetry* <NA>      375.00  2.5740313
185         telemetry* <NA>      793.80  2.8997111
186         telemetry* <NA>      532.98  2.7267109
187         telemetry* <NA>      264.30  2.4220972
188         telemetry* <NA>      952.99  2.9790883
189          telemetry <NA>      327.50  2.5152113
190         telemetry* <NA>      725.75  2.8607870
191         telemetry* <NA>      578.34  2.7621832
192         telemetry* <NA>      637.87  2.8047322
193         telemetry* <NA>      794.49  2.9000884
194         telemetry* <NA>      106.00  2.0253059
195         telemetry* <NA>      198.45  2.2976511
196         telemetry* <NA>      748.43  2.8741512
197         telemetry* <NA>       26.93  1.4302364
198         telemetry* <NA>       42.52  1.6285933
199         telemetry* <NA>       42.52  1.6285933
200         telemetry* <NA>       42.52  1.6285933
201         telemetry* <NA>      223.96  2.3501705
202         telemetry* <NA>      502.00  2.7007037
203     mark-recapture   20     2500.00  3.3979400
204     mark-recapture <NA>     7000.00  3.8450980
205          telemetry   15     3780.00  3.5774918
206          telemetry    5     3200.00  3.5051500
207          telemetry    9     4223.33  3.6256550
208     mark-recapture    6      927.00  2.9670797
209     mark-recapture <NA>      210.00  2.3222193
210     mark-recapture   51       59.00  1.7708520
211     mark-recapture   10       40.00  1.6020600
212     mark-recapture   12       28.00  1.4471580
213          telemetry    7      638.00  2.8048207
214          telemetry   10      211.00  2.3242825
215          telemetry    6      720.60  2.8576943
216          telemetry   13     6166.60  3.7900458
217          telemetry   29     2000.00  3.3010300
218          telemetry   22      335.00  2.5250448
219          telemetry    4      232.00  2.3654880
220    thread-trailing    7      620.00  2.7923917
221          telemetry   10     3000.00  3.4771213
222          telemetry    4      500.00  2.6989700
223          telemetry   14    10600.00  4.0253059
224          telemetry   10      400.00  2.6020600
225          telemetry   24     1522.00  3.1824147
226          telemetry   29     1018.00  3.0077478
227          telemetry    9      222.00  2.3463530
                                                                                                                                                                                      alternative.mass.reference
1                                                                                                                                                                                                           <NA>
2                                                                                                                                                                                                           <NA>
3                                                                                                                                                                                                           <NA>
4                                                                                                                                                                                                           <NA>
5                                                                                                                                                                                                           <NA>
6                                                                                                                                                                                                           <NA>
7                                                                                                                                                                                                           <NA>
8                                                                                                                                                                                                           <NA>
9                                                                                                                                                                                                           <NA>
10                                                                                                                                                                                                          <NA>
11                                                                                                                                                                                                          <NA>
12                                                                                                                                                                                                          <NA>
13                                                                                                                                                                                                          <NA>
14                                                                                                                                                                                                          <NA>
15                                                                                                                                                                                                          <NA>
16                                                                                                                                                                                                          <NA>
17                                                                                                                                                                                                          <NA>
18                                                                                                                                                                                                          <NA>
19                                                                                                                                                                                                          <NA>
20                                                                                                                                                                                                          <NA>
21                                                                                                                                                                                                          <NA>
22                                                                                                                                                                                                          <NA>
23                                                                                                                                                                                                          <NA>
24                                                                                                                                                                                                          <NA>
25                                                                                                                                                                                                          <NA>
26                                                                                                                         Beck TDI, Brain CE. 1978. Weights of Colorado Sage Grouse. The Condor 80(2), 241-243.
27                                                                                                                                                                                                          <NA>
28                                                                                                                                                                                                          <NA>
29                                                                                                                                                                                                          <NA>
30                                                                                                                                                                                                          <NA>
31                                                                                                                                                                                                          <NA>
32                                                                                                                                                                                                          <NA>
33                                        Keiss O, Granats J, Mednis A. 2004. Use of biometrical data to study Corncrake Crex crex population in Latvia. Acta Universitatis Latviensis, Biology 676, 119\x96126.
34                                                                                                                                                                                                          <NA>
35  Sabat P, Ramirez-Otatola , Barcelo G, Salinas J, Bozinovic F. Comparative basal metabolic rate among passerines and the food habit hypothesis. Comparative Biochemistry and Physiology Part A 157, 35\x9640.
36                                                                                                                                                                                                          <NA>
37                                                                                                                                                                                                          <NA>
38                                                                                                                                                                                                          <NA>
39                                                     Frith CB, Frith DW. 2001. Morphology, Moult and Survival in Three Sympatric Bowerbirds in Australian Wet Tropics Upland Rainforest. Corella 25(3): 41-60.
40                                                                                                                                                                                                          <NA>
41                                             Forsyth DM, Wilmhurst JM, Allen RB, Coomes DA. Impacts of introduced deer and extinct moa on New Zealand ecosystems. New Zealand Journal of Ecology 34(1), 48-65.
42                                             Forsyth DM, Wilmhurst JM, Allen RB, Coomes DA. Impacts of introduced deer and extinct moa on New Zealand ecosystems. New Zealand Journal of Ecology 34(1), 48-65.
43                                                                                                                                                                                                          <NA>
44                                                                                                                                                                                                          <NA>
45                                                                                                                                                                                                          <NA>
46                                                                                                                                                                                                          <NA>
47                                                                                                                                                                                                          <NA>
48                                                                                                                                                                                                          <NA>
49                                                                                                                                                                                                          <NA>
50                                                                                                                                                                                                          <NA>
51                                                                                                                                                                                                          <NA>
52                                                                                                                                                                                                          <NA>
53                                                                                                                                                                                                          <NA>
54                                                                                                                                                                                                          <NA>
55                                                                                                                                                                                                          <NA>
56                                                                                                                                                                                                          <NA>
57                                                                                                                                                                                                          <NA>
58                                                                                                                                                                                                          <NA>
59                                                                                                                                                                                                          <NA>
60                                                                                                                                                                                                          <NA>
61                                                                                                                                                                                                          <NA>
62                                                                                                                                                                                                          <NA>
63                                                                                                                                                                                                          <NA>
64                                                                                                                                                                                                          <NA>
65                                                                                                                                                                                                          <NA>
66                                                                                                                                                                                                          <NA>
67                                                                                                                                                                                                          <NA>
68                                                                                                                                                                                                          <NA>
69                                                                                                                                                                                                          <NA>
70                                                                                                                                                                                                          <NA>
71                                                                                                                                                                                                          <NA>
72                                                                                                                                                                                                          <NA>
73                                                                                                                                                                                                          <NA>
74                                                                                                                                                                                                          <NA>
75                                                                                                                                                                                                          <NA>
76                                                                                                                                                                                                          <NA>
77                                                                                                                                                                                                          <NA>
78                                                                                                                                                                                                          <NA>
79                                                                                                                                                                                                          <NA>
80                                                                                                                                                                                                          <NA>
81                                                                                                                                                                                                          <NA>
82                                                                                                                                                                                                          <NA>
83                                                                                                                                                                                                          <NA>
84                                                                                                                                                                                                          <NA>
85                                                                                                                                                                                                          <NA>
86                                                                                                                                                                                                          <NA>
87                                                                                                                                                                                                          <NA>
88                                                                                                                                                                                                          <NA>
89                                                                                                                                                                                                          <NA>
90                                                                                                                                                                                                          <NA>
91                                                                                                                                                                                                          <NA>
92                                                                                                                                                                                                          <NA>
93                                                                                                                                                                                                          <NA>
94                                                                                                                                                                                                          <NA>
95                                                                                                                                                                                                          <NA>
96                                                                                                                                                                                                          <NA>
97                                                                                                                                                                                                          <NA>
98                                                                                                                                                                                                          <NA>
99                                                                                                                                                                                                          <NA>
100                                                                                                                                                                                                         <NA>
101                                                                                                                                                                                                         <NA>
102                                                                                                                                                                                                         <NA>
103                                                                                                                                                                                                         <NA>
104                                                                                                                                                                                                         <NA>
105                                                                                                                                                                                                         <NA>
106                                                                                                                                                                                                         <NA>
107                                                                                                                                                                                                         <NA>
108                                                                                                                                                                                                         <NA>
109                                                                                                                                                                                                         <NA>
110                                                                                                                                                                                                         <NA>
111                                                                                                                                                                                                         <NA>
112                                                                                                                                                                                                         <NA>
113                                                                                                                                                                                                         <NA>
114                                                                                                                                                                                                         <NA>
115                                                                                                                                                                                                         <NA>
116                                                                                                                                                                                                         <NA>
117                                                                                                                                                                                                         <NA>
118                                                                                                                                                                                                         <NA>
119                                                                                                                                                                                                         <NA>
120                                                                                                                                                                                                         <NA>
121                                                                                                                                                                                                         <NA>
122                                                                                                                                                                                                         <NA>
123                                                                                                                                                                                                         <NA>
124                                                                                                                                                                                                         <NA>
125                                                                                                                                                                                                         <NA>
126                                                                                                                                                                                                         <NA>
127                                                                                                                                                                                                         <NA>
128                                                                                                                                                                                                         <NA>
129                                                                                                                                                                                                         <NA>
130                                                                                                                                                                                                         <NA>
131                                                                                                                                                                                                         <NA>
132                                                                                                                                                                                                         <NA>
133                                                                                                                                                                                                         <NA>
134                                                                                                                                                                                                         <NA>
135                                                                                                                                                                                                         <NA>
136                                                                                                                                                                                                         <NA>
137                                                                                                                                                                                                         <NA>
138                                                                                                                                                                                                         <NA>
139                                                                                                                                                                                                         <NA>
140                                                                                                                                                                                                         <NA>
141                                                                                                                                                                                                         <NA>
142                                                                                                                                                                                                         <NA>
143                                                                                                                                                                                                         <NA>
144                                                                                                                                                                                                         <NA>
145                                                                                                                                                                                                         <NA>
146                                                                                                                                                                                                         <NA>
147                                                                                                                                                                                                         <NA>
148                                                                                                                                                                                                         <NA>
149                                                                                                                                                                                                         <NA>
150                                                                                                                                                                                                         <NA>
151                                                                                                                                                                                                         <NA>
152                                                                                                                                                                                                         <NA>
153                                                                                                                                                                                                         <NA>
154                                                                                                                                                                                                         <NA>
155                                                                                                                                                                                                         <NA>
156                                                                                                                                                                                                         <NA>
157                                                                                                                                                                                                         <NA>
158                                                                                                                                                                                                         <NA>
159                                                                                                                                                                                                         <NA>
160                                                                                                                                                                                                         <NA>
161                                                                                                                                                                                                         <NA>
162                                                                                                                                                                                                         <NA>
163                                                                                                                                                                                                         <NA>
164                                                                                                                                                                                                         <NA>
165                                                                                                                                                                                                         <NA>
166                                                                                                                                                                                                         <NA>
167                                                                                                                                                                                                         <NA>
168                                                                                                                                                                                                         <NA>
169                                                                                                                                                                                                         <NA>
170                                                                                                                                                                                                         <NA>
171                                                                                                                                                                                                         <NA>
172                                                                                                                                                                                                         <NA>
173                                                                                                                                                                                                         <NA>
174                                                                                                                                                                                                         <NA>
175                                                                                                                                                                                                         <NA>
176                                                                                                                                                                                                         <NA>
177                                                                                                                                                                                                         <NA>
178                                                                                                                                                                                                         <NA>
179                                                                                                                                                                                                         <NA>
180                                                                                                                                                                                                         <NA>
181                                                                                                                                                                                                         <NA>
182                                                                                                                                                                                                         <NA>
183                                                                                                                                                                                                         <NA>
184                                                                                                                                                                                                         <NA>
185                                                                                                                                                                                                         <NA>
186                                                                                                                                                                                                         <NA>
187                                                                                                                                                                                                         <NA>
188                                                                                                                                                                                                         <NA>
189                                                                                                                                                                                                         <NA>
190                                                                                                                                                                                                         <NA>
191                                                                                                                                                                                                         <NA>
192                                                                                                                                                                                                         <NA>
193                                                                                                                                                                                                         <NA>
194                                                                                                                                                                                                         <NA>
195                                                                                                                                                                                                         <NA>
196                                                                                                                                                                                                         <NA>
197                                                                                                                                                                                                         <NA>
198                                                                                                                                                                                                         <NA>
199                                                                                                                                                                                                         <NA>
200                                                                                                                                                                                                         <NA>
201                                                                                                                                                                                                         <NA>
202                                                                                                                                                                                                         <NA>
203                                                                                                                                                                                                         <NA>
204                                                                                                                                                                                                         <NA>
205                                                                                                                                                                                                         <NA>
206                                                                                                                                                                                                         <NA>
207                                                                                                                                                                                                         <NA>
208                                                                                                                                                                                                         <NA>
209                                                                                                                                                                                                         <NA>
210                                                                                                                                                                                                         <NA>
211                                                                                                                                                                                                         <NA>
212                                                                                                                                                                                                         <NA>
213                                                                                                                                                                                                         <NA>
214                                                                                                                                                                                                         <NA>
215                                                                                                                                                                                                         <NA>
216                                                                                                                                                                                                         <NA>
217                                                                                                                                                                                                         <NA>
218                                                                                                                                                                                                         <NA>
219                                                                                                                                                                                                         <NA>
220                                                                                                                                                                                                         <NA>
221                                                                                                                                                                                                         <NA>
222                                                                                                                                                                                                         <NA>
223                                                                                                                                                                                                         <NA>
224                                                                                                                                                                                                         <NA>
225                                                                                                                                                                                                         <NA>
226                                                                                                                                                                                                         <NA>
227                                                                                                                                                                                                         <NA>
     mean.hra.m2   log10.hra
1   1.113000e+01  1.04649516
2   3.209286e+04  4.50640842
3   1.790000e+04  4.25285303
4   5.200000e-01 -0.28399666
5   3.442300e+04  4.53684872
6   1.130000e+00  0.05307844
7   1.850000e+01  1.26717173
8   2.580000e+00  0.41161971
9   5.400000e-01 -0.26760624
10  2.250000e+00  0.35218252
11  5.000000e-02 -1.30103000
12  7.400000e+00  0.86923172
13  7.830000e+03  3.89376176
14  1.720000e+02  2.23552845
15  2.444278e+04  4.38815060
16  2.870000e+02  2.45788190
17  1.650000e+02  2.21748394
18  1.750000e+02  2.24303805
19  7.200000e+01  1.85733250
20  4.948214e+04  4.69444847
21  4.591200e+07  7.66192621
22  2.589980e+03  3.41329641
23  2.540000e+06  6.40483372
24  6.358500e+07  7.80335468
25  1.030000e+05  5.01283723
26  1.815822e+07  7.25907318
27  1.699677e+04  4.23036640
28  2.589984e+04  4.41329708
29  6.200000e+04  4.79239169
30  1.975000e+06  6.29556710
31  5.500000e+06  6.74036269
32  1.203000e+07  7.08026563
33  4.300000e+04  4.63346846
34  1.323320e+05  5.12166488
35  3.090000e+04  4.48995848
36  1.618740e+04  4.20917710
37  2.589984e+04  4.41329708
38  3.140000e+06  6.49692965
39  9.500000e+04  4.97772361
40  1.950000e+05  5.29003461
41  2.450000e+06  6.38916608
42  2.388000e+07  7.37803432
43  8.430000e+07  7.92582757
44  2.428110e+04  4.38526836
45  1.012535e+07  7.00541000
46  3.224482e+06  6.50846000
47  2.176858e+06  6.33783000
48  9.050030e+06  6.95665000
49  2.657786e+08  8.42452000
50  1.014051e+07  7.00606000
51  6.452827e+07  7.80975000
52  7.000032e+05  5.84510000
53  4.161693e+05  5.61927000
54  3.570015e+05  5.55267000
55  1.872837e+06  6.27250000
56  2.733317e+04  4.43669000
57  2.328574e+07  7.36709000
58  5.882474e+06  6.76956000
59  2.754482e+07  7.44004000
60  6.199976e+05  5.79239000
61  3.408003e+06  6.53250000
62  5.239984e+07  7.71933000
63  3.710906e+04  4.56947995
64  1.070040e+09  9.02940000
65  9.382531e+07  7.97232000
66  3.647707e+06  6.56202000
67  6.746368e+05  5.82907000
68  7.486520e+07  7.87428000
69  8.514909e+05  5.93018000
70  9.850086e+05  5.99344000
71  1.620541e+05  5.20966000
72  3.507276e+07  7.54497000
73  2.488342e+06  6.39591000
74  7.900053e+06  6.89763000
75  1.976651e+05  5.29593000
76  3.550831e+09  9.55033000
77  1.365369e+08  8.13525000
78  5.899973e+06  6.77085000
79  1.742007e+06  6.24105000
80  1.097994e+07  7.04060000
81  2.486223e+06  6.39554000
82  1.459990e+07  7.16435000
83  1.919995e+05  5.28330001
84  1.024991e+06  6.01072000
85  4.487040e+03  3.65195994
86  2.792480e+05  5.44598999
87  4.135043e+06  6.61648000
88  1.930012e+04  4.28556001
89  6.413277e+05  5.80708000
90  9.149977e+05  5.96142000
91  3.236533e+06  6.51008000
92  6.133382e+06  6.78770000
93  9.709123e+05  5.98718000
94  1.630009e+05  5.21219000
95  7.739983e+06  6.88874000
96  1.190008e+05  5.07554999
97  4.566674e+05  5.65960000
98  3.732759e+05  5.57203000
99  1.545468e+04  4.18906002
100 4.250010e+05  5.62839000
101 3.566646e+04  4.55226001
102 1.385639e+05  5.14165000
103 1.527601e+05  5.18400999
104 5.013488e+04  4.70013998
105 2.500000e+05  5.39794001
106 1.079991e+05  5.03342002
107 4.858810e+03  3.68652992
108 3.271674e+04  4.51477002
109 2.900013e+06  6.46240000
110 1.592759e+06  6.20215000
111 5.300050e+05  5.72428000
112 2.866157e+05  5.45730001
113 1.389985e+04  4.14301011
114 4.532418e+05  5.65633000
115 6.299992e+04  4.79934000
116 1.829995e+04  4.26244990
117 2.892011e+04  4.46119994
118 3.960044e+04  4.59770001
119 1.376000e+03  3.13861843
120 1.866340e+03  3.27099076
121 2.229513e+07  7.34821000
122 1.591256e+07  7.20174000
123 4.206588e+07  7.62393000
124 4.499974e+04  4.65321001
125 1.099993e+08  8.04139000
126 1.753759e+09  9.24397000
127 1.037410e+03  3.01595043
128 2.685840e+03  3.42908014
129 1.299990e+04  4.11394001
130 1.582010e+03  3.19920922
131 2.720000e+02  2.43456890
132 1.720000e+02  2.23552845
133 5.400950e+03  3.73247016
134 9.769897e+05  5.98989000
135 1.000000e+04  4.00000000
136 1.596980e+03  3.20329948
137 7.738910e+03  3.88867980
138 8.322040e+03  3.92022980
139 7.004200e+02  2.84535854
140 8.550000e+01  1.93196612
141 1.516000e+02  2.18069920
142 6.744700e+02  2.82896264
143 4.117400e+02  2.61462306
144 3.667000e+01  1.56431091
145 4.192000e+02  2.62242127
146 9.821300e+02  2.99216898
147 4.761678e+04  4.67776002
148 2.537000e+03  3.40432047
149 5.330000e+02  2.72672721
150 5.805500e+02  2.76383963
151 5.995010e+03  3.77778991
152 2.132900e+03  3.32897049
153 4.549990e+03  3.65801044
154 3.127810e+03  3.49524036
155 5.788150e+03  3.76253978
156 1.038510e+03  3.01641068
157 1.866680e+05  5.27106999
158 3.615014e+05  5.55811000
159 7.114000e+01  1.85211386
160 1.093000e+05  5.03862000
161 4.369990e+03  3.64048044
162 4.317000e+02  2.63518205
163 7.374800e+03  3.86775025
164 1.769987e+04  4.24797008
165 3.008500e+03  3.47835002
166 1.480440e+03  3.17039081
167 1.689779e+06  6.22783000
168 1.411985e+06  6.14983000
169 1.511785e+05  5.17949000
170 7.574950e+03  3.87937977
171 1.305209e+04  4.11568006
172 1.327000e+02  2.12287092
173 6.300000e+02  2.79934055
174 3.500016e+04  4.54407003
175 9.499920e+03  3.97771995
176 5.000000e+03  3.69897000
177 4.030000e+01  1.60530505
178 1.932810e+03  3.28618916
179 1.799990e+03  3.25527009
180 7.900053e+04  4.89763000
181 2.919577e+04  4.46531993
182 5.696394e+04  4.75560002
183 1.653903e+05  5.21851001
184 2.749983e+04  4.43933001
185 1.308881e+05  5.11690000
186 4.900040e+03  3.69019962
187 1.708205e+05  5.23253999
188 1.282655e+05  5.10810999
189 7.490831e+04  4.87453000
190 5.188400e+02  2.71503345
191 5.355000e+02  2.72875947
192 1.684380e+05  5.22644000
193 3.010925e+04  4.47869994
194 1.504181e+04  4.17730010
195 1.559983e+04  4.19311987
196 4.250500e+04  4.62844002
197 8.163190e+03  3.91185991
198 1.490219e+04  4.17325010
199 5.325005e+04  4.72632002
200 3.246011e+04  4.51134999
201 4.753350e+03  3.67699979
202 1.239995e+05  5.09342000
203 1.176068e+04  4.07043243
204 8.594300e+03  3.93421051
205 7.066000e+04  4.84917363
206 1.280000e+05  5.10720997
207 3.477778e+04  4.54130186
208 2.350000e+03  3.37106786
209 5.656000e+03  3.75250940
210 5.850000e+02  2.76715587
211 5.750000e+01  1.75966785
212 1.350000e+02  2.13033377
213 1.464800e+04  4.16577833
214 8.727000e+03  3.94086498
215 3.418000e+04  4.53377206
216 1.384160e+06  6.14118629
217 1.685000e+05  5.22659990
218 5.200000e+03  3.71600334
219 7.200000e+04  4.85733250
220 1.900000e+04  4.27875360
221 9.640000e+04  4.98407703
222 3.197000e+05  5.50474264
223 2.050000e+06  6.31175386
224 1.710000e+04  4.23299611
225 3.790000e+04  4.57863921
226 5.700000e+05  5.75587486
227 1.417000e+05  5.15136985
                                                                                                                                                                                                                                                                                                                  hra.reference
1                                                                                                                                                                                  Nursall JR. 1974. Some Territorial Behavioral Attributes of the Surgeonfish Acanthurus lineatus at Heron Island, Queensland. Copeia 950-959.
2                                                                                                                         Marshell A, Mills JS, Rhodes KL, et al. 2011. Passive acoustic telemetry reveals highly variable home range and movement patterns among unicornfish within a marine reserve. Coral Reefs 30, 631-642.
3                                                                                                                         Marshell A, Mills JS, Rhodes KL, et al. 2011. Passive acoustic telemetry reveals highly variable home range and movement patterns among unicornfish within a marine reserve. Coral Reefs 30, 631-642.
4                                                                                                                                                                                Nursall JR. 1977. Territoriality in Redlip blennies (Ophioblennius atlanticus - Pisces : Blenniidae). Journal of Zoology, London 182, 205-223.
5                                                                                   Eristhee N, Oxenford HA. 2001. Home range size and use of space by Bermuda chub Kyphosus sectatrix (L.) in two marine reserves in the Soufri\xe8re Marine Management Area, St Lucia, West Indies. Journal of Fisheries Biology 59, 129-151.
6                                                                                                                                                                                                        Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
7                                                                                                                                                           Mapstone GM, Wood EM. 1975. The ethology of Abudefduf luridus and Chromis chromis (Pisces: Pomacentridae) from the Azores. Journal of Zoology, London 175, 179-199.
8                                                                                                                                                                           Keenleyside MHA. 1972. The Behaviour of Abudefduf zonatus (Pisces, Pomacentridae) at Heron Island, Great Barrier Reef. Animal Behavior 20, 763-774.
9                                                                                                                          Sale PF. 1974. Mechanisms of co-existence in a guild of territorial fishes at Heron Island. pp. 193-206. In: Proc. Second Intern. Symp. Coral Reefs, Vol. 1, Great Barrier Reef Committee. Brisbane.
10                                                                                                                                                                                                  Sale PF. 1978. Coexistence of coral reef fishes - a lottery for living space. Environmental Biology of Fishes 3(1), 85-102.
11                                                                                                                                                                                                       Luckhurst BE, Luckhurst K. 1978. Diurnal Space Utilization in Coral Reef Fish Communities. Marine Biology 49, 325-332.
12                                                                                                                                                                         Gronell A. 1980. Space utilization by the cocoa damselfish Eupomacentrus variabilis (Pisces: Pomacentridae). Bulletin of Marine Science 30, 237-251.
13                                                                                                                            Welsh JQ, Bellwood DR. 2011. Spatial ecology of the steephead parrotfish (Chlorurus microrhinos): an evaluation using acoustic telemetry. Coral Reefs 31, 55-65. (doi: 10.1007/s00338-011-0813-8)
14                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
15                                                                                                                                                  Welsh JQ, Bellwood DR. .2012. How far do schools of roving herbivores rove? A case study using Scarus rivulatus. Coral Reefs 31, 991-1003. (doi: 10.1007/s00338-012-0922-z)
16                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
17                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
18                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
19                                                                                                                                     Mumby PJ, Wabnitz CCC. 2002. Spatial patterns of aggression, territory size, and harem size in five sympatric Caribbean parrotfish species. Environmental Biology of Fishes 63, 265-279.
20                                                                                                            Jadot C, Donnay A, Acolas ML, et al. 2006. Activity patterns, home-range size, and habitat utilization of Sarpa salpa (Teleostei: Sparidae) in the Mediterranean Sea. ICES Journal of Marine Science 63, 128-139.
21                                                                                                            Namgail T, Takekawa JY, Balachandran S, Sathiyaselvam P, Mundkur T, Newman SH. 2014. Space use of wintering waterbirds in India: Influence of trophic ecology on home-range size. Current Zoology 60(5), 616-621.
22                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
23                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
24                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
25                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
26                                                                                                                                                                            Eng RL, Schladweiler P. 1972. Sage Grouse Winter Movements and Habitat Use in Central Montana. The Journal of Wildlife Management 36(1), 141-146.
27                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
28                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
29                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
30                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
31                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
32  Patten, M. A., C. L. Pruett, and D. H. Wolfe. 2011. Home range size and movements of Greater Prairie-Chickens. Pp. 51\x9662 in B. K. Sandercock, K. Martin, and G. Segelbacher (editors). Ecology, conservation, and management of grouse. Studies in Avian Biology (no. 39), University of California Press, Berkeley, CA.
33                                                                                                                                                                      Grabovsky VI. 1993.Spatial Distribution and Spacing Behaviour of Males in a Russion Corncrake (Crex crex) Population. Gibier Faune Sauvage 10, 259-279.
34                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
35                        Nolazco S, Sanchez AM, Roper JJ. 2014. Tama\xf1o poblacional, distribuci\xf3n y \xe1mbito de hogar de la Cortarrama Peruana (Phytotoma raimondii) en el Santuario Hist\xf3rico Bosque de P\xf3mac, Lambayeque, Per\xfa. Bolet\xedn de la Uni\xf3n de Ornit\xf3logos del Per\xfa (UNOP), 9 (2): 5-19 .
36                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
37                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
38                                                                                                                                       Ottaviani, D., S. C. Cairns, M. Oliverio, and L. Boitani. 2006. Body mass as a predictive variable of home-range size among Italian mammals and birds. Journal of Zoology 269:317-330.
39                                                                                                                                                                    Frith CB, Frith DW. 2001. Morphology, Moult, and Survival in Three Sympatric Bowerirds in Australian Wet Tropics Upland Rainforest. Corella 25(3), 41-60.
40                                                                                                                                                                                                       Farrimond M, Clout MN. 2006. Home range size of kakapo (Strigops habroptilus) on Codfish Island. Notornis 53, 150-152.
41                                                                                                                                            Bellis LM, Martella MB, Navarro JL, Vignolo PE. 2004. Home range of greater and lesser rhea in Argentina: relevance to conservation. Biodiversity and Conservation 13, 2589-2598.
42                                                                                                                                            Bellis LM, Martella MB, Navarro JL, Vignolo PE. 2004. Home range of greater and lesser rhea in Argentina: relevance to conservation. Biodiversity and Conservation 13, 2589-2598.
43                                                                                                                Williams JB, Siegfried WR, Milton SJ, Adams NJ, Dean WRT, du Plessis MA, Jackson S. 1993. Field Metabolism, Water Requirements, and Foraging Behavior of Wild Ostriches in the Namib. Ecology 74(2), 390-404.
44                                                                                                                                                                                                                                          Schoener, T. W. 1968. Sizes of feeding territories among birds. Ecology 49:123-141.
45                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
46                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
47                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
48                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
49                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
50                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
51                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
52                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
53                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
54                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
55                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
56                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
57                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
58                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
59                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
60                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
61                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
62                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
63                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
64                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
65                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
66                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
67                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
68                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
69                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
70                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
71                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
72                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
73                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
74                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
75                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
76                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
77                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
78                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
79                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
80                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
81                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
82                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
83                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
84                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
85                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
86                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
87                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
88                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
89                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
90                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
91                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
92                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
93                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
94                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
95                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
96                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
97                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
98                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
99                                                                                       Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
100                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
101                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
102                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
103                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
104                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
105                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
106                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
107                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
108                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
109                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
110                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
111                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
112                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
113                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
114                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
115                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
116                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
117                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
118                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
119                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
120                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
121                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
122                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
123                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
124                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
125                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
126                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
127                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
128                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
129                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
130                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
131                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
132                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
133                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
134                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
135                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
136                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
137                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
138                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
139                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
140                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
141                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
142                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
143                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
144                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
145                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
146                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
147                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
148                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
149                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
150                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
151                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
152                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
153                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
154                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
155                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
156                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
157                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
158                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
159                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
160                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
161                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
162                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
163                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
164                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
165                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
166                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
167                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
168                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
169                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
170                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
171                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
172                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
173                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
174                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
175                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
176                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
177                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
178                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
179                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
180                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
181                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
182                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
183                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
184                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
185                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
186                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
187                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
188                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
189                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
190                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
191                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
192                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
193                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
194                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
195                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
196                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
197                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
198                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
199                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
200                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
201                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
202                                                                                      Kelt, D. A., and D. Van Vuren. 1999. Energetic constraints and the relationship between body size and home range area in mammals. Ecology 80:337-340; Kelt, D. A., and D. Van Vuren. In press. Home ranges of recent mammals. Ecology.
203                                                                                                          Cunningham P. 2000. Daily activity pattern and diet of a population of the Spinytailed Lizard, Uromastyx aegyptius microlepis, during summer in the United Arab Emirates. Zoology in the Middle East 21(1), 37-46.
204                                                                                                                                                     Christian KA, Tracy CR. 1985. Physical and biotic determinants of space utilization by the Galapagos land iguana (Conolophus pallidus). Oecologia (Berlin) 66, 132-140.
205                                                                                                                                                                       Knapp CR, Owens AK. 2005. Home range and habitat associations of a Bahamian iguana: implications for conservation. Animal Conservation 8(3), 269-278.
206                                                                                                                                        Goodman RM, Echternact AC, Burton FJ. 2005. Spatial Ecology of the Endangered Iguana, Cyclura lewisi, in a Disturbed Setting on Grand Cayman. Journal of Herpetology 39(3), 402-408.
207                                                                                                                                 Mitchell NC. 1999. Effect of Introduced Ungulates on Density, Dietary Preferences, Home Range, and PhysicalCondition of the Iguana (Cyclura pinguis) on Anegada. Herpetologica 55(1), 7-17.
208                                                                                                                                                                                  Smits AW. 1985. Behavioral and Dietary Responses to Aridity in the Chuckwalla, Sauromalus hispidus. Journal of Herpetology 19(4), 441-449.
209                                                                                                                                                                    Johnson SR. 1965. An Ecological Study of the Chuckwalla, Sauromalus obesus Baird, in the Western Mojave Desert. American Midland Naturalist 73(1), 1-29.
210                                                                                                                                                                                                   Alberts AC. 1993. Relationship of Space Use to Population Density in an Herbivorous Lizard. Herpetologica 49(4), 469-479.
211                                                                                                                                                                                Borja MM. 1985. Spatial and Temporal behaviour of Gallotia galloti in a Natural Population of Tenerife. Bonn. Zool. Beitr. 36(3/4), 541-552.
212                                                                                                               D\xedaz SA. 2007. Relevant autecological aspects for phymaturus flagellifer (reptilia, Tropiduridae) conservation in the altos de lircay national reserve, Maule region. Thesis, University of Chile, 41pp.\n
213                                                                                                                                       Osterwalder K, Klingenbock A, Shine R. 2004. Field studies on a social lizard: Home range and social organization in an Australian skink, Egernia major. Austral Ecology 29, 241-249.
214                                                                                                                               Bernstein NP, Richtsmeier RJ., Black RW, Montgomery BJ. 2007. Home Range and Philopatry in the Ornate Box Turtle, Terrapene ornata ornata, in Iowa. American Midland Naturalist 157, 162-174.
215                                                                                              P\xe9rez-Santigosa N, Hidalgo-Vila J, D\xedaz-Paniagua C. 2013. Comparing Activity Patterns and Aquatic Home Range Areas Among Exotic and Native Turtles in Southern Spain. Chelonian Conservation and Biology 12(2), 313-319.
216                                                  Monta\xf1o RR, Cu\xe9llar E, Fitzgerald LA, Soria F, Mendoza F, Pe\xf1a R, Dosapey T, Deem SL, Noss AJ. 2013. Ranging patterns by the red-footed tortoise - Geochelone carbonaria (Testudines: Testudinidae) - in the Bolivian Chaco. Ecolog\xeda en Bolivia 48(1), 17-30.
217                                                                                                                                                                   Duda JJ, Krzysik AJ, Freilich JE. 1999. Effects of Drought on Desert Tortoise Movement and Activity. The Journal of Wildlife Management 63(4), 1181-1192.
218                                                                                                                                                                                   Diemer JE. 1992. Home Range and Movements of the Tortoise Gopherus polyphemus in Northern Florida. Journal of Herpetology 26(2), 158-165.
219                                                                                                                                                                    Vasudevan, K., Pandav, B & Deepak, V. 2010.Ecology of two endemic turtles in the Western Ghats. Final Technical Report, Wildlife Institute of India 74p.
220                                                                                                                                  Hailey A, Coulson IM. 1996. Home Range Use and Seasonal Movements of the Egyptian Tortoise (Testudo kleinmanni) in the Northwestern Negev, Israel. Canadian Journal of Zoology 74, 97-102.
221                                                                                      Wanchai P, Stanford CB, Thirakhupt K, Thankhikorn S. 2012. Home Range of the Impressed Tortoise, Manouria impressa (G\xfcnther,1882) at Phu Luang Wildlife Sanctuary, Loei Province, Thailand. Tropical Natural History 12(2), 165-174
222                                                                                                                                             Cunningham PL, Sumang A. 2008. Ecology of the Bushmanland Tent Tortoise (Psammobates tentorius verroxii) in Southern Namibia. Chelonian Conservation and biology 7(1), 119-124.
223                                                                                                                                             McMaster MK, Downs CT. 2009. Home Range and Daily Movement of Leopard Tortoises (Stigmochelys pardalis) in the Nama-Karoo, South Africa. Journal of Herpetology 43(4), 561-569.
224                                                                               Anadon JD, Gimenez A, Perez I, Martinez M, Esteve MA. 2006. Habitat selection by the spur-thighed tortoise Testudo graeca in a multisuccessional landscape: implications for habitat management. Biodiversity and Conservation 15, 2287-2299.
225                                                                                                                                   Rozylowicz L, Popescue VD. 2013. Habitat selection and movement ecology of eastern Hermann\x92s tortoises in a rural Romanian landscape. European Journal of Wildlife Research 59, 47-55.
226                                                                                                                      Lagarde F, Bonnet X, Henen B, Legrand A, Borbin J, Nagy K, Naulleau G. 2003. Sex divergence in space utilisation in the steppe tortoise (Testudo horsfieldi). Canadian Journal of Zoology 81, 380-387.
227                                                                                                                                         Geffen E, Mendelssohn H. 1988. Home Range Use and Seasonal Movements of the Egyptian Tortoise (Testudo kleinmanni) in the Northwestern Negev, Israel. Herpetologica 44(3), 354-359.
          realm thermoregulation locomotion trophic.guild dimension preymass
1       aquatic        ectotherm   swimming     herbivore        2D       NA
2       aquatic        ectotherm   swimming     herbivore        2D       NA
3       aquatic        ectotherm   swimming     herbivore        2D       NA
4       aquatic        ectotherm   swimming     herbivore        2D       NA
5       aquatic        ectotherm   swimming     herbivore        2D       NA
6       aquatic        ectotherm   swimming     herbivore        2D       NA
7       aquatic        ectotherm   swimming     herbivore        2D       NA
8       aquatic        ectotherm   swimming     herbivore        2D       NA
9       aquatic        ectotherm   swimming     herbivore        2D       NA
10      aquatic        ectotherm   swimming     herbivore        2D       NA
11      aquatic        ectotherm   swimming     herbivore        2D       NA
12      aquatic        ectotherm   swimming     herbivore        2D       NA
13      aquatic        ectotherm   swimming     herbivore        2D       NA
14      aquatic        ectotherm   swimming     herbivore        2D       NA
15      aquatic        ectotherm   swimming     herbivore        2D       NA
16      aquatic        ectotherm   swimming     herbivore        2D       NA
17      aquatic        ectotherm   swimming     herbivore        2D       NA
18      aquatic        ectotherm   swimming     herbivore        2D       NA
19      aquatic        ectotherm   swimming     herbivore        2D       NA
20      aquatic        ectotherm   swimming     herbivore        2D       NA
21  terrestrial        endotherm    walking     herbivore        2D       NA
22  terrestrial        endotherm     flying     herbivore        3D       NA
23  terrestrial        endotherm     flying     herbivore        3D       NA
24  terrestrial        endotherm     flying     herbivore        3D       NA
25  terrestrial        endotherm    walking     herbivore        2D       NA
26  terrestrial        endotherm    walking     herbivore        2D       NA
27  terrestrial        endotherm    walking     herbivore        2D       NA
28  terrestrial        endotherm    walking     herbivore        2D       NA
29  terrestrial        endotherm    walking     herbivore        2D       NA
30  terrestrial        endotherm    walking     herbivore        2D       NA
31  terrestrial        endotherm    walking     herbivore        2D       NA
32  terrestrial        endotherm    walking     herbivore        2D       NA
33  terrestrial        endotherm    walking     herbivore        2D       NA
34  terrestrial        endotherm     flying     herbivore        3D       NA
35  terrestrial        endotherm     flying     herbivore        3D       NA
36  terrestrial        endotherm     flying     herbivore        3D       NA
37  terrestrial        endotherm     flying     herbivore        3D       NA
38  terrestrial        endotherm     flying     herbivore        3D       NA
39  terrestrial        endotherm    walking     herbivore        3D       NA
40  terrestrial        endotherm    walking     herbivore        2D       NA
41  terrestrial        endotherm    walking     herbivore        2D       NA
42  terrestrial        endotherm    walking     herbivore        2D       NA
43  terrestrial        endotherm    walking     herbivore        2D       NA
44  terrestrial        endotherm    walking     herbivore        2D       NA
45  terrestrial        endotherm    walking     herbivore        2D       NA
46  terrestrial        endotherm    walking     herbivore        2D       NA
47  terrestrial        endotherm    walking     herbivore        2D       NA
48  terrestrial        endotherm    walking     herbivore        2D       NA
49  terrestrial        endotherm    walking     herbivore        2D       NA
50  terrestrial        endotherm    walking     herbivore        2D       NA
51  terrestrial        endotherm    walking     herbivore        2D       NA
52  terrestrial        endotherm    walking     herbivore        2D       NA
53  terrestrial        endotherm    walking     herbivore        2D       NA
54  terrestrial        endotherm    walking     herbivore        2D       NA
55  terrestrial        endotherm    walking     herbivore        2D       NA
56  terrestrial        endotherm    walking     herbivore        2D       NA
57  terrestrial        endotherm    walking     herbivore        2D       NA
58  terrestrial        endotherm    walking     herbivore        2D       NA
59  terrestrial        endotherm    walking     herbivore        2D       NA
60  terrestrial        endotherm    walking     herbivore        2D       NA
61  terrestrial        endotherm    walking     herbivore        2D       NA
62  terrestrial        endotherm    walking     herbivore        2D       NA
63  terrestrial        endotherm    walking     herbivore        2D       NA
64  terrestrial        endotherm    walking     herbivore        2D       NA
65  terrestrial        endotherm    walking     herbivore        2D       NA
66  terrestrial        endotherm    walking     herbivore        2D       NA
67  terrestrial        endotherm    walking     herbivore        2D       NA
68  terrestrial        endotherm    walking     herbivore        2D       NA
69  terrestrial        endotherm    walking     herbivore        2D       NA
70  terrestrial        endotherm    walking     herbivore        2D       NA
71  terrestrial        endotherm    walking     herbivore        2D       NA
72  terrestrial        endotherm    walking     herbivore        2D       NA
73  terrestrial        endotherm    walking     herbivore        2D       NA
74  terrestrial        endotherm    walking     herbivore        2D       NA
75  terrestrial        endotherm    walking     herbivore        2D       NA
76  terrestrial        endotherm    walking     herbivore        2D       NA
77  terrestrial        endotherm    walking     herbivore        2D       NA
78  terrestrial        endotherm    walking     herbivore        2D       NA
79  terrestrial        endotherm    walking     herbivore        2D       NA
80  terrestrial        endotherm    walking     herbivore        2D       NA
81  terrestrial        endotherm    walking     herbivore        2D       NA
82  terrestrial        endotherm    walking     herbivore        2D       NA
83  terrestrial        endotherm    walking     herbivore        2D       NA
84  terrestrial        endotherm    walking     herbivore        2D       NA
85  terrestrial        endotherm    walking     herbivore        2D       NA
86  terrestrial        endotherm    walking     herbivore        2D       NA
87  terrestrial        endotherm    walking     herbivore        2D       NA
88  terrestrial        endotherm    walking     herbivore        2D       NA
89  terrestrial        endotherm    walking     herbivore        2D       NA
90  terrestrial        endotherm    walking     herbivore        2D       NA
91  terrestrial        endotherm    walking     herbivore        2D       NA
92  terrestrial        endotherm    walking     herbivore        2D       NA
93  terrestrial        endotherm    walking     herbivore        2D       NA
94  terrestrial        endotherm    walking     herbivore        2D       NA
95  terrestrial        endotherm    walking     herbivore        2D       NA
96  terrestrial        endotherm    walking     herbivore        2D       NA
97  terrestrial        endotherm    walking     herbivore        2D       NA
98  terrestrial        endotherm    walking     herbivore        2D       NA
99  terrestrial        endotherm    walking     herbivore        2D       NA
100 terrestrial        endotherm    walking     herbivore        2D       NA
101 terrestrial        endotherm    walking     herbivore        2D       NA
102 terrestrial        endotherm    walking     herbivore        2D       NA
103 terrestrial        endotherm    walking     herbivore        2D       NA
104 terrestrial        endotherm    walking     herbivore        2D       NA
105 terrestrial        endotherm    walking     herbivore        2D       NA
106 terrestrial        endotherm    walking     herbivore        2D       NA
107 terrestrial        endotherm    walking     herbivore        2D       NA
108 terrestrial        endotherm    walking     herbivore        2D       NA
109 terrestrial        endotherm    walking     herbivore        2D       NA
110 terrestrial        endotherm    walking     herbivore        2D       NA
111 terrestrial        endotherm    walking     herbivore        2D       NA
112 terrestrial        endotherm    walking     herbivore        2D       NA
113 terrestrial        endotherm    walking     herbivore        2D       NA
114 terrestrial        endotherm    walking     herbivore        2D       NA
115 terrestrial        endotherm    walking     herbivore        2D       NA
116 terrestrial        endotherm    walking     herbivore        2D       NA
117 terrestrial        endotherm    walking     herbivore        2D       NA
118 terrestrial        endotherm    walking     herbivore        2D       NA
119 terrestrial        endotherm    walking     herbivore        2D       NA
120 terrestrial        endotherm    walking     herbivore        2D       NA
121 terrestrial        endotherm    walking     herbivore        2D       NA
122 terrestrial        endotherm    walking     herbivore        2D       NA
123 terrestrial        endotherm    walking     herbivore        2D       NA
124 terrestrial        endotherm    walking     herbivore        2D       NA
125 terrestrial        endotherm    walking     herbivore        2D       NA
126 terrestrial        endotherm    walking     herbivore        2D       NA
127 terrestrial        endotherm    walking     herbivore        2D       NA
128 terrestrial        endotherm    walking     herbivore        2D       NA
129 terrestrial        endotherm    walking     herbivore        2D       NA
130 terrestrial        endotherm    walking     herbivore        2D       NA
131 terrestrial        endotherm    walking     herbivore        2D       NA
132 terrestrial        endotherm    walking     herbivore        2D       NA
133 terrestrial        endotherm    walking     herbivore        2D       NA
134 terrestrial        endotherm    walking     herbivore        2D       NA
135 terrestrial        endotherm    walking     herbivore        2D       NA
136 terrestrial        endotherm    walking     herbivore        2D       NA
137 terrestrial        endotherm    walking     herbivore        2D       NA
138 terrestrial        endotherm    walking     herbivore        2D       NA
139 terrestrial        endotherm    walking     herbivore        2D       NA
140 terrestrial        endotherm    walking     herbivore        2D       NA
141 terrestrial        endotherm    walking     herbivore        2D       NA
142 terrestrial        endotherm    walking     herbivore        2D       NA
143 terrestrial        endotherm    walking     herbivore        2D       NA
144 terrestrial        endotherm    walking     herbivore        2D       NA
145 terrestrial        endotherm    walking     herbivore        2D       NA
146 terrestrial        endotherm    walking     herbivore        2D       NA
147 terrestrial        endotherm    walking     herbivore        2D       NA
148 terrestrial        endotherm    walking     herbivore        2D       NA
149 terrestrial        endotherm    walking     herbivore        2D       NA
150 terrestrial        endotherm    walking     herbivore        2D       NA
151 terrestrial        endotherm    walking     herbivore        2D       NA
152 terrestrial        endotherm    walking     herbivore        2D       NA
153 terrestrial        endotherm    walking     herbivore        2D       NA
154 terrestrial        endotherm    walking     herbivore        2D       NA
155 terrestrial        endotherm    walking     herbivore        2D       NA
156 terrestrial        endotherm    walking     herbivore        2D       NA
157 terrestrial        endotherm    walking     herbivore        2D       NA
158 terrestrial        endotherm    walking     herbivore        2D       NA
159 terrestrial        endotherm    walking     herbivore        2D       NA
160 terrestrial        endotherm    walking     herbivore        2D       NA
161 terrestrial        endotherm    walking     herbivore        2D       NA
162 terrestrial        endotherm    walking     herbivore        2D       NA
163 terrestrial        endotherm    walking     herbivore        2D       NA
164 terrestrial        endotherm    walking     herbivore        2D       NA
165 terrestrial        endotherm    walking     herbivore        2D       NA
166 terrestrial        endotherm    walking     herbivore        2D       NA
167 terrestrial        endotherm    walking     herbivore        2D       NA
168 terrestrial        endotherm    walking     herbivore        2D       NA
169 terrestrial        endotherm    walking     herbivore        2D       NA
170 terrestrial        endotherm    walking     herbivore        2D       NA
171 terrestrial        endotherm    walking     herbivore        2D       NA
172 terrestrial        endotherm    walking     herbivore        2D       NA
173 terrestrial        endotherm    walking     herbivore        2D       NA
174 terrestrial        endotherm    walking     herbivore        2D       NA
175 terrestrial        endotherm    walking     herbivore        2D       NA
176 terrestrial        endotherm    walking     herbivore        2D       NA
177 terrestrial        endotherm    walking     herbivore        2D       NA
178 terrestrial        endotherm    walking     herbivore        2D       NA
179 terrestrial        endotherm    walking     herbivore        2D       NA
180 terrestrial        endotherm    walking     herbivore        2D       NA
181 terrestrial        endotherm    walking     herbivore        2D       NA
182 terrestrial        endotherm    walking     herbivore        2D       NA
183 terrestrial        endotherm    walking     herbivore        2D       NA
184 terrestrial        endotherm    walking     herbivore        2D       NA
185 terrestrial        endotherm    walking     herbivore        2D       NA
186 terrestrial        endotherm    walking     herbivore        2D       NA
187 terrestrial        endotherm    walking     herbivore        2D       NA
188 terrestrial        endotherm    walking     herbivore        2D       NA
189 terrestrial        endotherm    walking     herbivore        2D       NA
190 terrestrial        endotherm    walking     herbivore        2D       NA
191 terrestrial        endotherm    walking     herbivore        2D       NA
192 terrestrial        endotherm    walking     herbivore        2D       NA
193 terrestrial        endotherm    walking     herbivore        2D       NA
194 terrestrial        endotherm    walking     herbivore        2D       NA
195 terrestrial        endotherm    walking     herbivore        2D       NA
196 terrestrial        endotherm    walking     herbivore        2D       NA
197 terrestrial        endotherm    walking     herbivore        2D       NA
198 terrestrial        endotherm    walking     herbivore        2D       NA
199 terrestrial        endotherm    walking     herbivore        2D       NA
200 terrestrial        endotherm    walking     herbivore        2D       NA
201 terrestrial        endotherm    walking     herbivore        2D       NA
202 terrestrial        endotherm    walking     herbivore        2D       NA
203 terrestrial        ectotherm    walking     herbivore        2D       NA
204 terrestrial        ectotherm    walking     herbivore        2D       NA
205 terrestrial        ectotherm    walking     herbivore        2D       NA
206 terrestrial        ectotherm    walking     herbivore        2D       NA
207 terrestrial        ectotherm    walking     herbivore        2D       NA
208 terrestrial        ectotherm    walking     herbivore        2D       NA
209 terrestrial        ectotherm    walking     herbivore        2D       NA
210 terrestrial        ectotherm    walking     herbivore        2D       NA
211 terrestrial        ectotherm    walking     herbivore        2D       NA
212 terrestrial        ectotherm    walking     herbivore        2D       NA
213 terrestrial        ectotherm    walking     herbivore        2D       NA
214 terrestrial        ectotherm    walking     herbivore        2D       NA
215 terrestrial        ectotherm    walking     herbivore        2D       NA
216 terrestrial        ectotherm    walking     herbivore        2D       NA
217 terrestrial        ectotherm    walking     herbivore        2D       NA
218 terrestrial        ectotherm    walking     herbivore        2D       NA
219 terrestrial        ectotherm    walking     herbivore        2D       NA
220 terrestrial        ectotherm    walking     herbivore        2D       NA
221 terrestrial        ectotherm    walking     herbivore        2D       NA
222 terrestrial        ectotherm    walking     herbivore        2D       NA
223 terrestrial        ectotherm    walking     herbivore        2D       NA
224 terrestrial        ectotherm    walking     herbivore        2D       NA
225 terrestrial        ectotherm    walking     herbivore        2D       NA
226 terrestrial        ectotherm    walking     herbivore        2D       NA
227 terrestrial        ectotherm    walking     herbivore        2D       NA
    log10.preymass PPMR prey.size.reference
1               NA   NA                <NA>
2               NA   NA                <NA>
3               NA   NA                <NA>
4               NA   NA                <NA>
5               NA   NA                <NA>
6               NA   NA                <NA>
7               NA   NA                <NA>
8               NA   NA                <NA>
9               NA   NA                <NA>
10              NA   NA                <NA>
11              NA   NA                <NA>
12              NA   NA                <NA>
13              NA   NA                <NA>
14              NA   NA                <NA>
15              NA   NA                <NA>
16              NA   NA                <NA>
17              NA   NA                <NA>
18              NA   NA                <NA>
19              NA   NA                <NA>
20              NA   NA                <NA>
21              NA   NA                <NA>
22              NA   NA                <NA>
23              NA   NA                <NA>
24              NA   NA                <NA>
25              NA   NA                <NA>
26              NA   NA                <NA>
27              NA   NA                <NA>
28              NA   NA                <NA>
29              NA   NA                <NA>
30              NA   NA                <NA>
31              NA   NA                <NA>
32              NA   NA                <NA>
33              NA   NA                <NA>
34              NA   NA                <NA>
35              NA   NA                <NA>
36              NA   NA                <NA>
37              NA   NA                <NA>
38              NA   NA                <NA>
39              NA   NA                <NA>
40              NA   NA                <NA>
41              NA   NA                <NA>
42              NA   NA                <NA>
43              NA   NA                <NA>
44              NA   NA                <NA>
45              NA   NA                <NA>
46              NA   NA                <NA>
47              NA   NA                <NA>
48              NA   NA                <NA>
49              NA   NA                <NA>
50              NA   NA                <NA>
51              NA   NA                <NA>
52              NA   NA                <NA>
53              NA   NA                <NA>
54              NA   NA                <NA>
55              NA   NA                <NA>
56              NA   NA                <NA>
57              NA   NA                <NA>
58              NA   NA                <NA>
59              NA   NA                <NA>
60              NA   NA                <NA>
61              NA   NA                <NA>
62              NA   NA                <NA>
63              NA   NA                <NA>
64              NA   NA                <NA>
65              NA   NA                <NA>
66              NA   NA                <NA>
67              NA   NA                <NA>
68              NA   NA                <NA>
69              NA   NA                <NA>
70              NA   NA                <NA>
71              NA   NA                <NA>
72              NA   NA                <NA>
73              NA   NA                <NA>
74              NA   NA                <NA>
75              NA   NA                <NA>
76              NA   NA                <NA>
77              NA   NA                <NA>
78              NA   NA                <NA>
79              NA   NA                <NA>
80              NA   NA                <NA>
81              NA   NA                <NA>
82              NA   NA                <NA>
83              NA   NA                <NA>
84              NA   NA                <NA>
85              NA   NA                <NA>
86              NA   NA                <NA>
87              NA   NA                <NA>
88              NA   NA                <NA>
89              NA   NA                <NA>
90              NA   NA                <NA>
91              NA   NA                <NA>
92              NA   NA                <NA>
93              NA   NA                <NA>
94              NA   NA                <NA>
95              NA   NA                <NA>
96              NA   NA                <NA>
97              NA   NA                <NA>
98              NA   NA                <NA>
99              NA   NA                <NA>
100             NA   NA                <NA>
101             NA   NA                <NA>
102             NA   NA                <NA>
103             NA   NA                <NA>
104             NA   NA                <NA>
105             NA   NA                <NA>
106             NA   NA                <NA>
107             NA   NA                <NA>
108             NA   NA                <NA>
109             NA   NA                <NA>
110             NA   NA                <NA>
111             NA   NA                <NA>
112             NA   NA                <NA>
113             NA   NA                <NA>
114             NA   NA                <NA>
115             NA   NA                <NA>
116             NA   NA                <NA>
117             NA   NA                <NA>
118             NA   NA                <NA>
119             NA   NA                <NA>
120             NA   NA                <NA>
121             NA   NA                <NA>
122             NA   NA                <NA>
123             NA   NA                <NA>
124             NA   NA                <NA>
125             NA   NA                <NA>
126             NA   NA                <NA>
127             NA   NA                <NA>
128             NA   NA                <NA>
129             NA   NA                <NA>
130             NA   NA                <NA>
131             NA   NA                <NA>
132             NA   NA                <NA>
133             NA   NA                <NA>
134             NA   NA                <NA>
135             NA   NA                <NA>
136             NA   NA                <NA>
137             NA   NA                <NA>
138             NA   NA                <NA>
139             NA   NA                <NA>
140             NA   NA                <NA>
141             NA   NA                <NA>
142             NA   NA                <NA>
143             NA   NA                <NA>
144             NA   NA                <NA>
145             NA   NA                <NA>
146             NA   NA                <NA>
147             NA   NA                <NA>
148             NA   NA                <NA>
149             NA   NA                <NA>
150             NA   NA                <NA>
151             NA   NA                <NA>
152             NA   NA                <NA>
153             NA   NA                <NA>
154             NA   NA                <NA>
155             NA   NA                <NA>
156             NA   NA                <NA>
157             NA   NA                <NA>
158             NA   NA                <NA>
159             NA   NA                <NA>
160             NA   NA                <NA>
161             NA   NA                <NA>
162             NA   NA                <NA>
163             NA   NA                <NA>
164             NA   NA                <NA>
165             NA   NA                <NA>
166             NA   NA                <NA>
167             NA   NA                <NA>
168             NA   NA                <NA>
169             NA   NA                <NA>
170             NA   NA                <NA>
171             NA   NA                <NA>
172             NA   NA                <NA>
173             NA   NA                <NA>
174             NA   NA                <NA>
175             NA   NA                <NA>
176             NA   NA                <NA>
177             NA   NA                <NA>
178             NA   NA                <NA>
179             NA   NA                <NA>
180             NA   NA                <NA>
181             NA   NA                <NA>
182             NA   NA                <NA>
183             NA   NA                <NA>
184             NA   NA                <NA>
185             NA   NA                <NA>
186             NA   NA                <NA>
187             NA   NA                <NA>
188             NA   NA                <NA>
189             NA   NA                <NA>
190             NA   NA                <NA>
191             NA   NA                <NA>
192             NA   NA                <NA>
193             NA   NA                <NA>
194             NA   NA                <NA>
195             NA   NA                <NA>
196             NA   NA                <NA>
197             NA   NA                <NA>
198             NA   NA                <NA>
199             NA   NA                <NA>
200             NA   NA                <NA>
201             NA   NA                <NA>
202             NA   NA                <NA>
203             NA   NA                <NA>
204             NA   NA                <NA>
205             NA   NA                <NA>
206             NA   NA                <NA>
207             NA   NA                <NA>
208             NA   NA                <NA>
209             NA   NA                <NA>
210             NA   NA                <NA>
211             NA   NA                <NA>
212             NA   NA                <NA>
213             NA   NA                <NA>
214             NA   NA                <NA>
215             NA   NA                <NA>
216             NA   NA                <NA>
217             NA   NA                <NA>
218             NA   NA                <NA>
219             NA   NA                <NA>
220             NA   NA                <NA>
221             NA   NA                <NA>
222             NA   NA                <NA>
223             NA   NA                <NA>
224             NA   NA                <NA>
225             NA   NA                <NA>
226             NA   NA                <NA>
227             NA   NA                <NA>
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
