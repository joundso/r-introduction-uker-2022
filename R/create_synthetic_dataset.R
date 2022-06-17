## Create a synthetic dataset:
create_synthetic_dataset <- function() {
  size <- 1e3

  set.seed(312)
  return_dataset <- data.table::data.table(
    "patient_id" = paste0("PSEU", 1:size),
    "PLZ" = sample(
      x = 0:99999,
      size = size,
      replace = TRUE
    ),
    "blood_group" = sample(
      x = c(
        "A Rhesus positiv",
        "A Rhesus negativ",
        "0 Rhesus positiv",
        "0 Rhesus negativ",
        "B Rhesus positiv",
        "B Rhesus negativ",
        "AB Rhesus positiv",
        "AB Rhesus negativ"
      ),
      size = size,
      replace = TRUE,
      prob = c(.37, .06, .35, .06, .09, .02, .04, .01)
    ),
    "age_at_admission_years" = round(rnorm(
      n = size, mean = 48, sd = 20
    ), digits = 0),
    "n_previous_admissions" = sample(
      x = 0:4,
      size = size,
      replace = TRUE,
      prob = c(.7, .14, .1, .05, .01)
    ),
    "diagnosis" = sample(
      x = c("Back pain", "Hypertension", "Lipid metabolism", "Flu"),
      size = size,
      replace = TRUE,
      prob = c(0.32, 0.57, 0.03, 0.08)
    ),
    "deceased" = sample(
      x = 0:1,
      size = size,
      replace = TRUE,
      prob = c(0.8, 0.2)
    ),
    "malformations" = sample(
      x = 0:1,
      size = size,
      replace = TRUE,
      prob = c(0.91, 0.09)
    ),
    "chromosomal" = sample(
      x = 0:1,
      size = size,
      replace = TRUE,
      prob = c(0.83, 0.17)
    ),
    "pulm_art_hypertension" = sample(
      x = 0:1,
      size = size,
      replace = TRUE,
      prob = c(0.99, 0.01)
    ),
    "sex" = sample(
      x = c("m", "f"),
      size = size,
      replace = TRUE,
      prob = c(0.55, 0.45)
    ),
    "height_cm" = sample(
      x = 50:220,
      size = size,
      replace = TRUE
    ),
    "year_of_admission" = sample(
      x = 2010:2020,
      size = size,
      replace = TRUE
    )
  )


  # to keep correlation, calculate weight from height (BMI is sampled)
  return_dataset[,
                 ("weight_kg") := round(x = (get("height_cm") / 100) ^ 2 * rnorm(n = size, mean = 22, sd = 5),
                                        digits = 2)]

  return_dataset[,
                 ("bmi") := round(x = get("weight_kg") / (get("height_cm") / 100) ^ 2,
                                  digits = 2)]

  # missing values
  missing_vals <- c(
    weight_kg = .2 * size,
    height_cm = .2 * size,
    malformations = .1 * size,
    pulm_art_hypertension = .1 * size,
    year_of_admission = 1
  )

  ground_truth <- seq_len(nrow(return_dataset))
  for (i in names(missing_vals)) {
    sample_size <- missing_vals[i]

    cols_to_na <- c(i)

    ## Also remove bmi if weight or height is missing:
    if (i %in% c("weight_kg", "height_cm")) {
      cols_to_na <- c(cols_to_na, "bmi")
    }

    rows_to_na <- sample(x = ground_truth,
                         size = sample_size,
                         replace = FALSE)

    # if (!(j %in% c("weight", "height"))) {
    #   rows_to_na <- c(rows_to_na, died_in_op)
    # }

    return_dataset[rows_to_na, (cols_to_na) := NA]
  }
  return(return_dataset)
}

## Save the data:
data.table::fwrite(x = create_synthetic_dataset(), file = "./data/synthetic_data.csv")
