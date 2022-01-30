\name{wishart}
\alias{wishart}
\alias{rcwis}
\alias{rwis}
\title{The complex Wishart distribution}
\description{
Returns an observation drawn from the complex Wishart distribution.  To
sample from the inverse complex Wishart distribution (or indeed the
complex inverse Wishart distribution), use \code{solve(rcwis(...))}.
}
\usage{
rcwis(n, S)
}
\arguments{
  \item{n}{Integer; degrees of freedom}
  \item{S}{Variance matrix.  If an integer, use \code{diag(nrow=S)}}
}
\value{
Returns a (semi-) positive definite Hermitian matrix the same size as
argument \code{S}
}
\author{Robin K. S. Hankin}
\note{

The first argument of \code{rcwis()} is \code{n}, by universal
statistics convention.  But in the R world, functions returning random
observations (such as \code{runif()}) generally reserve argument
\code{n} for the number of observations to return.  Although
\code{rchisq()} uses \code{df} for the number of degrees of freedom.
}
\examples{


rcwis(10,2)
eigen(rcwis(7,3),TRUE,TRUE)   # all positive
eigen(rcwis(3,7),TRUE,TRUE)   # 4 positive, 3 zero

rcwis(10,rcwis(10,3))


}