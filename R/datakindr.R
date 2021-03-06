#' datakindr: Tools And Utilities for DataKind
#'
#' Provides tools, utilities, data and more for use by the DataKind
#' Dublin team. Including a convenient interface to CSO.ie's Statbank and a
#' ggplot2 theme and colour palette for convenient & consistent visualisation
#' styles.
#'
#' @section Datakindr statbank functions:
#' For interacting with CSO.ie datasets, the following two functions can be used:
#' \itemize{
#' \item{\code{search_statbank_datasets()} returns a data frame with dataset
#' codes and a description of the dataset to which each code refers.}
#' \item{Once you've found the dataset you need (either from the Statbank website,
#' or by using \code{search_statbank_datasets()}) you can use
#' \code{get_cso_dataset()} to retrieve the dataset as a data.frame.}
#' }
#' @section Datakindr Plotting:
#' A number of convenience objects have been provided as part of this package
#' to make creating consistent visualisations when using ggplot2.
#' \describe{
#' \item{\code{dk_theme}}{ggplot2 theme object that can be used as a
#' starting point when creating visualisations for Datakind to create a
#' consistent look and feel.}
#' \item{\code{dk_palette}}{Main 4-colour palette. Comes bundled with
#' \code{dk_theme}.}
#' \item{\code{dk_sequential_palette}}{Extended 7-colour palette for use
#' with sequential data series.}
#' \item{\code{dk_non_sequential_palette}}{Extended 5-colour palette for use
#' with \strong{non}-sequential data series.}
#' }
#'
#' @examples
#' # Querying CSO.ie Statbank
#' \dontrun{
#' dataset_names <- search_statbank_datasets("garda")
#' garda_dataset <- get_cso_dataset(dataset_names$dataset_code[1])
#' View(garda_dataset)
#' }
#'
#' \dontrun{
#' # Use of ggplot2 theme and datakind palette:
#' ggplot2::ggplot(data.frame( y = runif(100, min = 0, max = 20) +
#'   seq(1, 100, 1),
#'   x = seq(1, 100, 1),
#'   z = rep_len(c("a", "b", "c", "d"), 100)),
#'   ggplot2::aes(x, y, colour = z, fill = z)) +
#'   ggplot2::geom_point() +
#'   ggplot2::facet_wrap(~z, nrow = 2) +
#'   ggplot2::geom_smooth(se = TRUE) +
#'   ggplot2::labs(title = "Some Data (2011)",
#'       x = "Range", y = "Value") +
#'   dk_theme
#'
#' ggplot2::ggplot(data.frame( x = c('Primary 1', 'Primary 2',
#'                                  'Secondary 1', 'Secondary 2',
#'                                  "even", "more", "colours"),
#'                            y = runif(7, 10, 100)),
#'                ggplot2::aes(x,y, fill = x)) +
#'  ggplot2::geom_bar(stat = "identity") +
#'  ggplot2::labs(title = "Some Data (2011)",
#'                x = "Range", y = "Value") +
#'  dk_theme +
#'  ggplot2::scale_fill_manual(values = dk_sequential_palette)
#' }
#' @docType package
#' @name datakindr
NULL
