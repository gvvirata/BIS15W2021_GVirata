---
title: "RMarkdown Practice"
output: 
  html_document: 
    keep_md: yes
---




```r
93472835+43
```

```
## [1] 93472878
```


```r
934283-394712830
```

```
## [1] -393778547
```


```r
20934*23984
```

```
## [1] 502081056
```


```r
9348/91848
```

```
## [1] 0.1017768
```

# This is My First Title

## This is a Smaller Title

### This is an Even Smaller Title

_I am italicizing_

**Now I am making the text bold**

Here is my [email](mailto:gvvirata@ucdavis.edu)


```r
#install.packages("tidyverse")
library("tidyverse")
```


```r
ggplot(mtcars, aes(x = factor(cyl))) +
    geom_bar()
```

![](RMarkdown-Practice_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
