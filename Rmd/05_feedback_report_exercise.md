05 Reproducible analyses - Exercise
================

## Vorbereitung

Erstellen Sie zwei Umgebungsvariablen, die für die Verbindung zu REDCap
benötigt werden:

``` r
## Set correct credentials to sign in to REDCap:
Sys.setenv("REDCAP_API_URL" = "https://your.hospital.org")
Sys.setenv("REDCAP_API_KEY" = "7994055EF43AE2B6439FBCF18B09EC0A")
```

Laden Sie sich [die Vorlage](./05_feedback_report_template.qmd) herunter
und speichern Sie die Datei auf Ihrem PC. Die Vorlage können Sie für die
folgenden Aufgaben erweitern.

Um das finale Dokument zu erzeugen, wird folgendes Kommando benötigt:

``` r
rmarkdown::render("/path/to/05_feedback_report_template.qmd")
```

## Aufgabe 1

Erstellen Sie einen Plot, der die Zufriedenheit der Schulung für jede
Gruppe „Vorwissen“ zeigt. (Beispiel)\[\]

### Tipps

``` r
## Read the manual for some functions that might be helpful:
?ggplot2::ggplot
?ggplot2::geom_histogram
```

## Aufgabe 2

Versuchen Sie programmatisch zu bestätigen, welche Gruppe mit welchem
Vorwissen am zufriedensten ist.
