% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/airdas_read.R
\name{airdas_read}
\alias{airdas_read}
\title{Read AirDAS file(s)}
\usage{
airdas_read(
  file,
  file.type = c("turtle", "caretta", "survey", "phocoena"),
  skip = 0,
  tz = "UTC",
  ...
)
}
\arguments{
\item{file}{filename(s) of one or more AirDAS files}

\item{file.type}{character; indicates the program used to create \code{file}.
Must be one of: "turtle", "caretta", "survey", or "phocoena" (case sensitive). 
Default is "turtle"}

\item{skip}{integer: see \code{\link[readr]{read_fwf}}. Default is 0}

\item{tz}{character; see \code{\link[base]{strptime}}. Default is UTC}

\item{...}{ignored}
}
\value{
An \code{airdas_dfr} object, which is also a data frame, 
  with AirDAS data read into columns.
  The data are read into the data frame as characters,
  with the following exceptions:
  \tabular{lll}{
    \emph{Name} \tab \emph{Class} \tab \emph{Details}\cr
    EffortDot \tab logical   \tab \code{TRUE} if "." was present, and \code{FALSE} otherwise\cr
    DateTime  \tab POSIXct   \tab combination of 'Date' and 'Time' columns, with time zone \code{tz}\cr
    Lat       \tab numeric   \tab 'Latitude' columns converted to decimal degrees in range [-90, 90]\cr
    Lon       \tab numeric   \tab 'Longitude' columns converted to decimal degrees in range [-180, 180]\cr
    Data#     \tab character \tab leading/trailing whitespace trimmed for non-comment events (i.e. where 'Event' is not "C" )\cr
    file_das  \tab character \tab base filename, extracted from the \code{file} argument\cr
    line_num  \tab integer   \tab line number of each data row\cr
    file_type \tab character \tab \code{file.type} argument
  }
}
\description{
Read one or more fixed-width aerial survey DAS text file(s) 
  generated by TURTLEP, or another AirDAS program, into a data frame, 
  where each line is data for a specific event
}
\details{
Reads/parses aerial survey DAS data into columns of a data frame.
  If \code{file} contains multiple filenames, then the individual 
  data frames will be combined using \code{\link[base:cbind]{rbind}}
  
  See \code{\link{airdas_format_pdf}} for information about 
  AirDAS format requirements for the specific file types (programs)
}
\examples{
y <- system.file("airdas_sample.das", package = "swfscAirDAS")
airdas_read(y, file.type = "turtle")

}
