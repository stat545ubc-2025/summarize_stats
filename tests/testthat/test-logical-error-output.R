#Test that the correct error is produced when the NAs parameter input is NOT logical.
library(dplyr)
library(datateachr)
test_that('Using a categorical variable in numcol should output the correct error message', {
  expect_error(summarize_stats(df = datateachr::steam_games,
                               numcol = original_price,
                               categcol = genre,
                               NAs = 7), #7 is an integer, not a logical input. This should throw an error
               "The NAs input must be logical (TRUE or FALSE). Please try again.",
               fixed = TRUE)
})
