\name{var}
\alias{var}
\alias{sd}
\alias{sd.complex}
\alias{sd.default}
\alias{var.complex}
\alias{var.default}
\title{
Variance and standard deviation of complex vectors
}
\description{
Complex generalizations of \code{stats::sd()} and \code{stats::var()}
}
\usage{
var(x, y=NULL, na.rm=FALSE,use)
sd(x, na.rm=FALSE)
}
\arguments{
  \item{x,y}{Complex vector or matrix}
  \item{na.rm}{Boolean with default \code{FALSE} meaning to leave
    \code{NA} values present and \code{TRUE} meaning to remove them}
  \item{use}{Ignored}
}
\details{
  
Intended to be broadly compatible with \code{stats::sd()} and
\code{stats::var()}.  

If given real values, \code{var()} and \code{sd()} return the variance
and standard deviation as per ordinary real analysis.  If given complex
values, returns the complex generalization in which Hermitian transposes
are used.

If \code{z} is a complex matrix, \code{var(z)} returns the variance of
the rows.

These functions use \eqn{n-1} on the denominator purely for consistency
with \code{stats::var()} (for the record, I disagree with the rationale
for \eqn{n-1}).

}
\author{
Robin K. S. Hankin
}
\examples{

sd(rcnorm(10)) # imaginary component suppressed by zapim()

var(rcmvnorm(1e5,mean=c(0,0)))
}
