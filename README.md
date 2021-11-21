
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qplots

<!-- badges: start -->
<!-- badges: end -->

The goal of qplots is to quickly plot variables of a data frame so that
you can obtain basic information regarding variables of the data.

## Installation

You can install the development version of qplots from the GitHub
repository like so:

``` r
devtools::install_github("HosseinEbrahimiK/qplots")
```

## Example

This is a basic example which shows you how to solve a common problem
within a dataframe. Here, we have used `gapminder` dataset as an
example:

``` r
library(qplots)

quick_dist(gapminder::gapminder, "lifeExp") # a numeric variable
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
quick_dist(gapminder::gapminder, "gdpPercap") # a numeric variable
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r
quick_dist(gapminder::gapminder, "continent") # a categorical variable
```

<img src="man/figures/README-example-3.png" width="100%" />
