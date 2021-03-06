% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/airdas_effort_sight.R
\name{airdas_effort_sight}
\alias{airdas_effort_sight}
\title{Summarize AirDAS sightings by effort segment}
\usage{
airdas_effort_sight(x.list, sp.codes, sp.events = c("S", "t"))
}
\arguments{
\item{x.list}{list; output of \code{\link{airdas_effort}}}

\item{sp.codes}{character; species code(s) to include in segdata. 
These code(s) will be converted to lower case to match \code{\link{airdas_sight}}}

\item{sp.events}{character; event code(s) to include in the sightinfo output.
This argument supersedes the 'included' value when determining
whether a sighting is included in the segment summaries.
Must be one or more of: "S", "t" (case-sensitive).
The default is that all of these event codes are kept}
}
\value{
A list, identical to \code{x.list} except for
  1) the nSI and ANI columns added to \code{x.list$segdata},
  one each for each element of \code{sp.codes}, and
  2) the included column of \code{x.list$sightinfo}, which has been set as
  \code{FALSE} for sightings of species not listed in \code{sp.codes}
}
\description{
Summarize number of sightings and animals for selected species by segment
}
\details{
This function takes the output of \code{\link{airdas_effort}} and
  adds columns for the number of sightings (nSI) and number of animals (ANI)
  for selected species (selected via \code{sp.codes}) for each segment
  to the segdata element of \code{x.list}.
  However, only sightings with an included value of \code{TRUE}
  (included is a column in sightinfo) are included in the summaries.
  Having this step separate from \code{\link{airdas_effort}} allows users to
  personalize the included values as desired for their analysis.
}
\examples{
y <- system.file("airdas_sample.das", package = "swfscAirDAS")
y.proc <- airdas_process(y)
y.cond <- airdas_effort(
  y.proc, method = "condition", conditions = "Bft", seg.min.km = 0.05, 
  num.cores = 1
)

airdas_effort_sight(y.cond, sp.codes = c("mn", "bm"))

}
