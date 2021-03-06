\name{imputation.maf}
\alias{can.impute}
\alias{imputation.maf}
\alias{imputation.r2}
\alias{imputation.nsnp}
\title{Extract statistics from imputation rules}
\description{
These functions extract key characteristics of regression-based
imputation rules stored as an object of class
\code{"ImputationRules"}. \code{imputation.maf} extracts the minor
allele frequencies of the imputed SNPs and \code{imputation.r2} extracts
the prediction \eqn{R^2}.
}
\usage{
can.impute(rules)
imputation.maf(rules)
imputation.r2(rules)
imputation.nsnp(rules)
}

\arguments{
  \item{rules}{An object of class \code{"ImputationRules"}}
}
\details{\code{can.impute} returns a logical vector identifying which
  rules allow a valid imputation.
  \code{imputation.maf} and \code{imputation.r2} extract the
  minor allele frequencies of the imputed SNPs and the \eqn{R^2} for
  prediction achieved when building each rule. \code{imputation.nsnp}
  returns the numbers of SNPs used in each imputation}
\value{
  Either a logical vector, or a numeric vector containing the extracted values
}
\author{David Clayton \email{dc208@cam.ac.uk}}
\seealso{\code{\link{ImputationRules-class}},
  \code{\link{snp.imputation}}}
\examples{
# These functions are currently defined as
function (rules) sapply(rules, function(x) x$maf)
function (rules) sapply(rules, function(x) x$r2)
}
\keyword{manip}

