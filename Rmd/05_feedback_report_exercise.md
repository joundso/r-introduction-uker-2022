05 Reproducible analyses - Exercise
================

## Aufgabe

Erstellen Sie zwei Umgebungsvariablen, die für die Verbindung zu REDCap
benötigt werden:

``` r
## Set credentials to sign in to REDCap:
Sys.setenv("REDCAP_API_URL" = "https://your.hospital.org")
Sys.setenv("REDCAP_API_KEY" = "123456789")
```

## Aufgabe 1

Erstellen Sie einen Plot, der die Zufriedenheit der Schulung für jede
Gruppe „Vorwissen“ zeigt.

### Tipps

``` r
## Read the manual for some functions that might be helpful:
?ggplot2::ggplot
?ggplot2::geom_histogram
```

## Aufgabe 2

Versuchen Sie programmatisch zu bestätigen, welche Gruppe mit welchem
Vorwissen am zufriedensten ist.
