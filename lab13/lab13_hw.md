---
title: "Lab 13 Homework"
author: "Geralin Love Virata"
date: "2021-03-03"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Libraries

```r
if (!require("tidyverse")) install.packages('tidyverse')
```

```
Loading required package: tidyverse
```

```
-- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
√ ggplot2 3.3.3     √ purrr   0.3.4
√ tibble  3.1.0     √ dplyr   1.0.4
√ tidyr   1.1.3     √ stringr 1.4.0
√ readr   1.4.0     √ forcats 0.5.1
```

```
-- Conflicts ------------------------------------------ tidyverse_conflicts() --
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()
```


```r
library(tidyverse)
library(shiny)
library(shinydashboard)
library(paletteer)
library(RColorBrewer)
options(scipen=999) #disables scientific notation when printing
```

```r
library("ggsci")
library("ggplot2")
library("gridExtra")

data("diamonds")

p1 = ggplot(subset(diamonds, carat >= 2.2),
       aes(x = table, y = price, colour = cut)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.05, size = 1, span = 1) +
  theme_bw()

p2 = ggplot(subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
       aes(x = depth, fill = cut)) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw()
```

## Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admit <- readr::read_csv("data/UC_admit.csv")
```

```

-- Column specification --------------------------------------------------------
cols(
  Campus = col_character(),
  Academic_Yr = col_double(),
  Category = col_character(),
  Ethnicity = col_character(),
  `Perc FR` = col_character(),
  FilteredCountFR = col_double()
)
```

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**  

```r
dim(UC_admit)
```

```
[1] 2160    6
```

```r
names(UC_admit)
```

```
[1] "Campus"          "Academic_Yr"     "Category"        "Ethnicity"      
[5] "Perc FR"         "FilteredCountFR"
```

```r
glimpse(UC_admit)
```

```
Rows: 2,160
Columns: 6
$ Campus          <chr> "Davis", "Davis", "Davis", "Davis", "Davis", "Davis", ~
$ Academic_Yr     <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2018, ~
$ Category        <chr> "Applicants", "Applicants", "Applicants", "Applicants"~
$ Ethnicity       <chr> "International", "Unknown", "White", "Asian", "Chicano~
$ `Perc FR`       <chr> "21.16%", "2.51%", "18.39%", "30.76%", "22.44%", "0.35~
$ FilteredCountFR <dbl> 16522, 1959, 14360, 24024, 17526, 277, 3425, 78093, 15~
```

```r
summary(UC_admit)
```

```
    Campus           Academic_Yr     Category          Ethnicity        
 Length:2160        Min.   :2010   Length:2160        Length:2160       
 Class :character   1st Qu.:2012   Class :character   Class :character  
 Mode  :character   Median :2014   Mode  :character   Mode  :character  
                    Mean   :2014                                        
                    3rd Qu.:2017                                        
                    Max.   :2019                                        
                                                                        
   Perc FR          FilteredCountFR   
 Length:2160        Min.   :     1.0  
 Class :character   1st Qu.:   447.5  
 Mode  :character   Median :  1837.0  
                    Mean   :  7142.6  
                    3rd Qu.:  6899.5  
                    Max.   :113755.0  
                    NA's   :1         
```

```r
anyNA(UC_admit)
```

```
[1] TRUE
```
Some NA's are represented as "NA", and using the summary() command, there is at least one under the filtered_count_fr column. NA's are also represented by "Unknown", as found under the ethnicity column, and may also even be represented by "All" under the ethnicity column. It is, of course, likely for someone to be of multiple ethnicities, but I am not sure if being of all ethnicities is possible. 

**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to make the app neat and clean.**

```r
UC_admit <- rename(UC_admit, AcademicYear = "Academic_Yr")
UC_admit
```

```
# A tibble: 2,160 x 6
   Campus AcademicYear Category   Ethnicity        `Perc FR` FilteredCountFR
   <chr>         <dbl> <chr>      <chr>            <chr>               <dbl>
 1 Davis          2019 Applicants International    21.16%              16522
 2 Davis          2019 Applicants Unknown          2.51%                1959
 3 Davis          2019 Applicants White            18.39%              14360
 4 Davis          2019 Applicants Asian            30.76%              24024
 5 Davis          2019 Applicants Chicano/Latino   22.44%              17526
 6 Davis          2019 Applicants American Indian  0.35%                 277
 7 Davis          2019 Applicants African American 4.39%                3425
 8 Davis          2019 Applicants All              100.00%             78093
 9 Davis          2018 Applicants International    19.87%              15507
10 Davis          2018 Applicants Unknown          2.83%                2208
# ... with 2,150 more rows
```
I renamed Academic_Yr to AcademicYear as part of my aesthetic preference.

```r
ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions"),
  dashboardSidebar(disable = T),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
  selectInput("x", "Select Grouping Type", choices = c("Campus", "AcademicYear", "Category"), 
              selected = "Campus"),
      hr(),
      helpText("Admissions data collected for the years 2010-2019 for each UC campus. More Information can be found on the University of California Information Center website: https://www.universityofcalifornia.edu/infocenter")
  ),
  box(
  plotOutput("plot", width = "600px", height = "500px")
  ) 
  )
  )
)

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
  UC_admit %>% 
  ggplot(aes_string(x = input$x, y="FilteredCountFR", fill="Ethnicity"))+
  geom_col()+
       scale_fill_futurama(palette = "planetexpress") +
  theme_minimal(base_size = 18)+
      theme(axis.text.x = element_text(angle = 60, hjust = 1))+
      labs(title = "UC Admissions By Ethnicity",x=NULL,y="Number of Individuals")
  })
  
  
  session$onSessionEnded(stopApp)
  }
shinyApp(ui, server)
```


**3. Make an alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "University of California"),
  dashboardSidebar(disable = T),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
  selectInput("x", "Select Grouping Type", choices = c("Campus", "Ethnicity", "Category"), 
              selected = "Campus"),
      hr(),
      helpText("Admissions data collected for the years 2010-2019 for each UC campus. More Information can be found on the University of California Information Center website: https://www.universityofcalifornia.edu/infocenter")
  ),
  box(
  plotOutput("plot", width = "600px", height = "500px")
  ) 
  )
  )
)

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
  UC_admit %>% 
  ggplot(aes_string(x = "AcademicYear", y="FilteredCountFR", fill=input$x))+
  geom_col()+
      scale_fill_futurama(palette = "planetexpress") +
  theme_minimal(base_size = 18)+
      theme(axis.text.x = element_text(angle = 60, hjust = 1))+
      labs(title = "UC Admissions From 2010-2019",x="Academic Year",y="Number of Individuals")
  })
  
  
  session$onSessionEnded(stopApp)
  }
shinyApp(ui, server)
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
