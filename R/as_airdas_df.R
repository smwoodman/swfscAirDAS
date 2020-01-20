#' Coerce object to a airdas_df object
#'
#' Check if an object is of class \code{\link{airdas_df}}, or coerce it if possible.
#'
#' @param x An object to be coerced to class \code{airdas_df}
#'
#' @details Currently only data frames can be coerced to an object of class \code{\link{airdas_df}}.
#'   If the \code{x} does not have column names and classes as specified in \code{\link{airdas_df}},
#'   then the function returns an error message detailing the first column that does not
#'   meet the \code{\link{airdas_df}} requirements.
#'
#' @return An object of class `airdas_df`
#'
#' @seealso \code{\link{airdas_df-class}}
#'
#' @export
as_airdas_df <- function(x) UseMethod("as_airdas_df")

#' @name as_airdas_df
#' @export
as_airdas_df.airdas_df <- function(x) x

#' @name as_airdas_df
#' @export
as_airdas_df.data.frame <- function(x) {
  exp.class <- list(
    Event = "character",
    DateTime = c("POSIXct", "POSIXt"),
    Lat = "numeric",
    Lon = "numeric",
    OnEffort = "logical",
    Trans = "character",
    Bft = "numeric",
    CCover = "numeric",
    Jelly = "numeric",
    HorizSun = "numeric",
    HKR = "character",
    ObsL = "character",
    ObsB = "character",
    ObsR = "character",
    Rec = "character",
    AltFt = "numeric",
    SpKnot = "numeric",
    VLI = "character",
    VLO = "character",
    VB = "character",
    VRI = "character",
    VRO = "character",
    Data1 = "character",
    Data2 = "character",
    Data3 = "character",
    Data4 = "character",
    Data5 = "character",
    Data6 = "character",
    Data7 = "character",
    EffortDot = "logical", 
    EventNum = "integer",
    file_das = "character",
    line_num = "integer"
  )
  exp.class.names <- names(exp.class)
  
  x.class <- lapply(x, class)
  
  for (i in seq_along(exp.class)) {
    name.curr <- exp.class.names[i]
    x.curr <- x.class[[name.curr]]
    
    if (!identical(x.curr, exp.class[[i]])) {
      stop("The provided object (x) cannot be coerced to an object of class airdas_df ",
           "because it does not contain the correct columns. ",
           "Specifically, it must contain a column with the name '", names(exp.class)[i], "' ",
           "and class '", exp.class[[i]], "'\n",
           "Was x created using airdas_process()? ", 
           "See `?as_airdas_df` or `?airdas_df-class` for more details.")
    }
  }

  class(x) <- c("airdas_df", setdiff(class(x), "airdas_df"))
  
  x
}