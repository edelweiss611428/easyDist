# Functions for Efficiently Subsetting "dist" Objects

### Description
<p align="justify"> 
The package provides functions for efficiently subsetting "dist" objects commonly used in dissimilarity-based clustering. We cannot use the squared brackets operator to extract units in a "dist" object as we usually do with regular numeric matrices. A simple method to do this involves as.dist and as.matrix in base R. However, this method is very slow, especially for large distance matrices. The package is based on C++ functions, allowing us to efficiently extract relevant values directly from the "dist" object with simple syntax. </p>

### Installation

<p align="justify"> 
To download the package, use the following R code: </p> 

```
library(devtools)
install_github("edelweiss611428/distExtraction") 
```
