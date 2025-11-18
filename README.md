
<!-- README.md is generated from README.Rmd. Please edit that file -->

# The summarize_stats package

## Introduction

The **summarize_stats** package contains the function *summarize_stats*
that generates the mean, median, and the range values of a numeric
variable across a categorical variable. This facilitates the comparison
of these summary statistics across different groups within a categorical
variable of interest, allowing for further downstream analyses.

## Installation

You can install the latest version of summarize_stats from
[GitHub](https://github.com/) with:

``` r
`devtools::install_github('stat545ubc-2025/summarize_stats')`
```

## Examples of use cases

Example using the steam_games dataset from the *datateachr* package.
Investigate the summary statistics of **Steam game prices** (numerical
variable) across **purchase types** (factor variable).

``` r
library(summarizestats)
library(datateachr) #contains the steam_games dataset
summarize_stats(df = datateachr::steam_games, numcol = original_price, categcol = types, NAs = TRUE)
#> # A tibble: 4 × 4
#>   types  mean_col median_col range_col
#>   <chr>     <dbl>      <dbl>     <dbl>
#> 1 app        53.2       4.99   730640 
#> 2 bundle     49.5      22.5       527.
#> 3 sub        33.7      20.0       996.
#> 4 <NA>       30.0      30.0         0
```

Example using the penguins dataset from the *palmerpenguins* package.
Investigate the summary statistics of **bill length** (numerical
variable) based on **penguin sex** (factor variable).

``` r
library(palmerpenguins) #contains the penguins dataset
#> 
#> Attaching package: 'palmerpenguins'
#> The following objects are masked from 'package:datasets':
#> 
#>     penguins, penguins_raw
summarize_stats(df = penguins, numcol = bill_depth_mm, categcol = sex, NAs = TRUE)
#> # A tibble: 3 × 4
#>   sex    mean_col median_col range_col
#>   <fct>     <dbl>      <dbl>     <dbl>
#> 1 female     16.4       17         7.6
#> 2 male       17.9       18.4       7.4
#> 3 <NA>       16.6       17.1       6.4
```

## Getting Help

Try using the following code in your R console after installing if you
have any questions:

``` r
?summarize_stats 
```

This will provide a description of the package and definitions of each
parameter within the function.

If you have any further issues installing/running the package, or if you
have any suggestions for improvements, feel free to leave an issue!
