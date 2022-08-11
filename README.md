# utVizSunburst

<!-- badges: start -->
<!-- badges: end -->

The goal of {utVizSunburst} is to provide R users the ability to generate interactive sunburst plots
for displaying retention and admission data.

## Installation

You can install the development version of utVizSunburst like so:

``` r
remotes::install_gitlab("jumpingrivers/projects/uta/ard/utvizsunburst")
```

## Example

Please see the vignettes for an example of how to use utVizSunburst.

## For developers

### Precommit

Hooks for ensuring code style issues and other book-keeping tasks are corrected at an early stage
are provided. To use these you will need a local copy of both the python
[precommit tool](https://pre-commit.com/) and the R
[{precommit} package](https://github.com/lorenzwalthert/precommit/).
This uses various other R packages (styler, lintr etc) that must be installed in your R environment.

At present, {styler} is configured to it's second-most stringent level (scope = "line_breaks") and
as such will not modify any symbols in your code.

### Tests

Unit tests should be defined using testthat.

### Features

All major features should be demonstrated in the vignette titled "Using utVizSunburst".
