# easyDist

### Description

<p align="justify"> The package provides functions for creating, manipulating, and expanding "dist" objects, which are commonly used in cluster analysis in R. </p> 

This package is under development. Only two features are supported in v.0.0.1, namely:

- subDist: Subsetting a "dist" object from another "dist" object.
- extractDist: Extracting distances between pairs of observations in two subsets from a "dist" object.

Features under development:

- getColsDist: Extracting some "columns" (or "row") from a "dist" object.
- Dist2Mat: Convert a "dist" object to a symmetric matrix.
- createDist: Creating a "dist" object.
- createDistXY: Computing pairwise distances between pairs of observations in two matrices.
- expandDist: Expanding a "dist" object by appending more "rows" and "columns".

 ### Installation

 To download the package, use the following R code: 

```
library(devtools)
install_github("edelweiss611428/easyDist") 
```
