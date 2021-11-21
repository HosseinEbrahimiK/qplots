#'  quick distribution plotting of variables in a data frame
#'
#' `quick_dist()` function takes two arguments as the input, a data frame and one of its columns.
#'  It plots the distribution of the given variable in the dataset.
#' @param df A data frame object. The output plot is based on one of df's variables.
#' @param var_name A variable (column) in characters format in the provided data frame, df.
#'  It should be an object of numeric, factor (categorical), or character classes.
#'  If numeric, the output is the density plot of the distribution.
#'  If factor or character, the output is a bar chart of frequencies of categories.
#' @param na.rm If TRUE, the default, missing values are silently removed. If FALSE, missing values are removed with a warning.
#' @return A plotted distribution based on the given column in the data frame input. Based on the class of input variable, it is either a density plot of the distribution or a bar chart of counts of categories.
#' @examples
#' # examples with the gapminder dataset
#' quick_dist(gapminder::gapminder, "lifeExp")
#' quick_dist(gapminder::gapminder, "gdpPercap")
#' quick_dist(gapminder::gapminder, "continent")
#' @export

quick_dist <- function(df, var_name, na.rm = TRUE){

  if (!is.data.frame(df)){
    stop('The parameter df should be a data frame object.\n',
         'You have provided an object of class: ', class(df)[1])
  }

  if (!is.character(var_name)){
    stop('The parameter var_name requires a character input.\n',
         'You have provided an object of class: ', class(var_name)[1])
  }

  if (!var_name %in% colnames(df)){
    stop('The var_name parameter does
         not exist in the provided data frame.\n')
  }
  var_name <- as.name(var_name)
  var <- df[[var_name]]

  if (!is.numeric(var) &&
      !is.factor(var) &&
      !is.character(var)){
    stop("The column specified by the parameter var_name
         requries a numeric, factor or character variable, \n",
         'You have provided an object of class: ', class(var)[1])
  }

  if (is.numeric(var)){

    mu <- mean(var, na.rm = na.rm)
    plt <- df %>%
      dplyr::filter(if (na.rm == TRUE) !is.na(!!var_name) else TRUE) %>%

      ggplot2::ggplot(ggplot2::aes(!!var_name)) +
      ggplot2::geom_density(fill = 'dodgerblue', alpha = 0.5) +
      ggplot2::geom_vline(ggplot2::aes(xintercept=mu), linetype="dashed", color='red') +
      ggplot2::theme_bw() +
      ggplot2::xlab(var_name)
  }

  else if (is.factor(var) || is.character(var)){

    plt <- df %>%
      dplyr::filter(if (na.rm == TRUE) !is.na(!!var_name) else TRUE) %>%

      ggplot2::ggplot(ggplot2::aes(!!var_name)) +
      ggplot2::geom_bar(fill='dodgerblue', width = 0.5) +
      ggplot2::theme_bw() +
      ggplot2::xlab(var_name)
  }
  return(plt)
}
