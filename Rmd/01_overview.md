01 Overview
================

## R-Syntax

``` r
test <- 10
if (test > 5) {
  print("variable 'test' is greater than 5")
} else{
  print("variable 'test' is smaller or equal to 5")
}
```

    ## [1] "variable 'test' is greater than 5"

## Basic parameters

``` r
(7 + 5)/2
```

    ## [1] 6

``` r
# This is a comment

5 ** 2 # Notation for powers
```

    ## [1] 25

``` r
## ^ is the same like **:
5 ^ 2
```

    ## [1] 25

``` r
cos(0) # Function call with parameter 0
```

    ## [1] 1

``` r
c(FALSE,TRUE,FALSE,TRUE) | c(FALSE,FALSE,TRUE,TRUE)
```

    ## [1] FALSE  TRUE  TRUE  TRUE

## Plots

You can also embed plots, for example:

``` r
plot(pressure)
```

![](01_overview_files/figure-gfm/pressure-1.png)<!-- -->
