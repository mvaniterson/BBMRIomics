% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Genotype_Helpers.R
\name{read.dosages}
\alias{read.dosages}
\title{read dosages files impute2-transformed}
\usage{
read.dosages(
  file,
  yieldSize = NULL,
  colClassesInfo = c("character", "character", "integer", "numeric", "numeric",
    "numeric", "integer", "integer", "character", "integer", "character", "character"),
  type = c("data.frame", "GRanges", "SummarizedExperiment"),
  verbose = TRUE,
  ...
)
}
\arguments{
\item{file}{character filename}

\item{yieldSize}{yieldSize for reading data in chunks}

\item{colClassesInfo}{describes the types of the columns}

\item{type}{data.frame GRanges or SummerizedExperiment}

\item{verbose}{default TRUE show progress message}

\item{...}{additional arguments to scanTabix}
}
\value{
data.frame
}
\description{
read dosages files impute2-transformed
}
\details{
read dosages files impute2-transformed
}
\examples{
\dontrun{
gzipped <- dir(file.path(VM_BASE_DATA, "GWAS_ImputationGoNLv5/dosages", RP3_BIOBANKS[1]),
pattern= "gz$", full.names=TRUE)
chunk <- read.dosages(gzipped[1], yieldSize=5000)
chunk[1:5, 1:10]
chunk <- read.dosages(gzipped[1], yieldSize=5000, type="GRanges")
chunk
chunk <- read.dosages(gzipped[1], yieldSize=5000, type="SummarizedExperiment")
chunk
colData(chunk)
rowRanges(chunk)
assay(chunk)[1:5, 1:5]
}
}
\author{
mvaniterson
}
