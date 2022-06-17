02 Data structures
================

## Adressing lists

``` r
mein.erster.patient <- list(
  Nachname = "Meier",
  Vorname = "Walter",
  Alter = 47,
  getestet = FALSE
)
mein.erster.patient$Alter <- mein.erster.patient$Alter + 1
mein.erster.patient[c("Anrede", "Nachname")] <- c("Herr", "Schmidt")

## Using ONE square bracket returns a sub-LIST:
mein.erster.patient["Vorname"]
```

    ## $Vorname
    ## [1] "Walter"

``` r
## Using TWO square brackets returns the acutal value in its original data type:
mein.erster.patient[["Vorname"]]
```

    ## [1] "Walter"

``` r
str(mein.erster.patient["Vorname"])
```

    ## List of 1
    ##  $ Vorname: chr "Walter"

``` r
str(mein.erster.patient[["Vorname"]])
```

    ##  chr "Walter"

``` r
mein.erster.patient
```

    ## $Nachname
    ## [1] "Schmidt"
    ## 
    ## $Vorname
    ## [1] "Walter"
    ## 
    ## $Alter
    ## [1] 48
    ## 
    ## $getestet
    ## [1] FALSE
    ## 
    ## $Anrede
    ## [1] "Herr"
