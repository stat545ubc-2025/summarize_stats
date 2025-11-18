#First, create a test tibble with the expected outputs for mean, median and range to compare the function's output with.
exp_results <- steam_games %>% # Use hard-coded variables and functions to ensure that the output is accurate for comparison.
  group_by(types) %>%
  summarise(mean_col = mean(discount_price, na.rm = TRUE),
            median_col = median(discount_price, na.rm = TRUE),
            range_col = max(discount_price, na.rm = TRUE) - min(discount_price, na.rm = TRUE))

test_tbl <- tibble(exp_results) #Create the test tibble using the expected summary statistics output

#Second, test that the summarize_stats function output is identical to the manually calculated test tibble output.
test_that('Testing that the summary statistic calculation is accurate',
          expect_equal(summarize_stats(df = steam_games,
                                       numcol = discount_price,
                                       categcol = types,
                                       NAs = TRUE),
                       test_tbl)) #Compare the function output to the manually generated table with all the correct values
