#' Generate summary statistics across groups
#' Outputs the mean, median, and range of a numerical variable across different groups of a categorical variable in a dataframe.
#'
#' @description summarize_stats generates the mean, median, and the range values of a numeric variable across a categorical variable.
#' This facilitates the comparison of these summary statistics across different groups within a categorical variable of interest, allowing for further downstream analyses.
#' @import dplyr
#' @import datateachr
#' @import palmerpenguins
#' @importFrom stats median
#' @param df dataframe containing the dataset to be analysed. Named df as a shorter form for dataframe.
#' @param numcol numeric vector specifying the numerical column used for summary statistics. Named numcol as a shorter form of numeric column.
#' @param categcol character vector specifying the categorical column with groups of interest. Named categcol as a shorter form of categorical column.
#' @param NAs logical specifying whether you want to exclude missing values from your summary statistic calculations. If TRUE, remove all missing values. Named NAs to represent the presence/absence of missing values.
#' @return a table with the mean, median, and range values of the `numcol` column across all the groups of the `categcol` column.
#'
#' @examples
#' summarize_stats(df = datateachr::steam_games, numcol = original_price, categcol = types, NAs = TRUE)
#' summarize_stats(df = palmerpenguins::penguins, numcol = bill_depth_mm, categcol = sex, NAs = TRUE)
#' @export
summarize_stats <- function(df, numcol, categcol, NAs = TRUE) {
  if(!inherits(df, 'data.frame')){ #Throw an error if the input for df is not a dataframe.
    stop("the df input must be a dataframe or tibble. Please try again.") }

  if(!is.numeric(pull(df, {{numcol}}))) { #Throw an error if the input for numcol is not a numerical vector
    stop("The numcol input must be a numeric column. Please try again.") }

  if (!is.character(pull(df, {{categcol}})) && !is.factor(pull(df, {{categcol}}))) { #Throw an error if the input for categcol is not a character vector or a factor vector
    stop("The categcol input must be a character column. Please try again.") }

  if (!is.logical(NAs)) { #Throw an error if the input for NAs is not logical.
    stop("The NAs input must be logical (TRUE or FALSE). Please try again.")}

  summary_stats <- df %>%
    dplyr::group_by({{categcol}}) %>% #sort the categorical column into the groups
    dplyr::summarize(mean_col = mean({{numcol}}, na.rm = NAs), #calculate the mean value for the numerical variable across all the groups
              median_col = stats::median({{numcol}}, na.rm = NAs), #calculate the median value for the numerical variable across all the groups
              range_col = max({{numcol}}, na.rm = NAs) - min({{numcol}}, na.rm = NAs)) #calculate the range of the numerical variable for all the groups

  return(summary_stats)
}
