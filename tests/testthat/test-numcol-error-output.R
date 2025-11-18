#Test that using a categorical variable in the numcol parameter should output the respective error message defined in the function.
library(dplyr)
library(datateachr)
test_that('Using a categorical variable in numcol should output the correct error message', {
  expect_error(summarize_stats(df = datateachr::steam_games,
                               numcol = mature_content, #mature_content is a categorical variable, not a numeric variable
                               categcol = genre,
                               NAs = TRUE),
               'The numcol input must be a numeric column. Please try again.',
               fixed = TRUE)
})
