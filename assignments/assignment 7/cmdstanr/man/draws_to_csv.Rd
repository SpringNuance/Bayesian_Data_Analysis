% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\name{draws_to_csv}
\alias{draws_to_csv}
\title{Write posterior draws objects to CSV files suitable for running standalone generated
quantities with CmdStan.}
\usage{
draws_to_csv(
  draws,
  sampler_diagnostics = NULL,
  dir = tempdir(),
  basename = "fittedParams"
)
}
\arguments{
\item{draws}{A \verb{posterior::draws_*} object.}

\item{sampler_diagnostics}{Either \code{NULL} or a \verb{posterior::draws_*} object
of sampler diagnostics.}

\item{dir}{(string) An optional path to the directory where the CSV files will be
written. If not set, \link[base:tempfile]{temporary directory} is used.}

\item{basename}{(string) If \code{dir} is specified, `basename`` is used for naming
the output CSV files. If not specified, the file names are randomly generated.}
}
\value{
Paths to CSV files (one per chain).
}
\description{
Write posterior draws objects to CSV files suitable for running standalone generated
quantities with CmdStan.
}
\details{
\code{draws_to_csv()} generates a CSV suitable for running standalone generated
quantities with CmdStan. The CSV file contains a single comment \verb{#num_samples},
which equals the number of iterations in the supplied draws object.

The comment is followed by the column names. The first column is the \code{lp__} value,
followed by sampler diagnostics and finnaly other variables of the draws object.
#' If the draws object does not contain the \code{lp__} or sampler diagnostics variables,
columns with zeros are created in order to conform with the requirements of the
standalone generated quantities method of CmdStan.

The column names line is finally followed by the values of the draws in the same
order as the column names.
}
\examples{
\dontrun{
draws <- posterior::example_draws()

draws_csv_files <- draws_to_csv(draws)
print(draws_csv_files)

# draws_csv_files <- draws_to_csv(draws,
#                                 sampler_diagnostic = sampler_diagnostics,
#                                 dir = "~/my_folder",
#                                 basename = "my-samples")
}

}
