na\_fill
================

### Description

replace up to defined number of consecutive NA values in a vector

compare with zoo::na.approx()

### Arguments

*values* – vector of values

*maxgap* – maximum number of consecutive NAs to fill

*filler* – fill value

*fill.ends* – logical, should leading and tailing NAs be filled (only NA
groups up to maxgap will be filled), defaults to FALSE

### Details

Using maxgap = 0 replaces no NAs, which might be useful when using the
function in a loop.

### Example

``` r
v <- c(NA,NA,1,2,NA,NA,3,NA,2,3,NA,NA,NA,4,3,NA)
v
```

    ##  [1] NA NA  1  2 NA NA  3 NA  2  3 NA NA NA  4  3 NA

Replace NA with numeric value

``` r
na_fill(v, 2, 0)
```

    ##  [1] NA NA  1  2  0  0  3  0  2  3 NA NA NA  4  3 NA

``` r
na_fill(v, 3, 0, fill.ends = TRUE)
```

    ##  [1] 0 0 1 2 0 0 3 0 2 3 0 0 0 4 3 0

Replace NA with character value

``` r
na_fill(v, 2, "fill")
```

    ##  [1] NA     NA     "1"    "2"    "fill" "fill" "3"    "fill" "2"    "3"   
    ## [11] NA     NA     NA     "4"    "3"    NA
