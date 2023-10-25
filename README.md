# Functions for Efficiently Subsetting "dist" Objects

### UPDATE: We will soon change the name of the package to simpleDist and provide more features, including expanding a "dist" object, converting a "dist" object to a numeric matrix, create "dist" objects in R (allowing many more "methods"), etc.

### Description
<p align="justify"> 
The package provides functions for efficiently subsetting "dist" objects in R, commonly used in dissimilarity-based clustering. Users may be interested in extracting a sub-distance matrix of class "dist" from a "dist" object, or they may want to extract pair-wise distances of units in two groups; however, we can't use 2D indexes directly to subset a "dist" object. A simple method to do this involves back-and-forth conversion between numeric matrices and "dist" objects using as.dist and as.matrix functions. However, it can be extremely slow, especially for large "dist" objects. The package allows us to efficiently extract values directly from a "dist" object with simple syntax.</p> 

 ### Installation

 To download the package, use the following R code: 

```
library(devtools)
install_github("edelweiss611428/DistExtraction") 
```
