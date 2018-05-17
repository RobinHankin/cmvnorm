\name{cmvnorm-package}
\alias{cmvnorm-package}
\alias{cmvnorm}
\docType{package}
\title{
The complex multivariate Gaussian distribution
}
\description{
Various utilities for investigating the complex generalization of the
multivariate Gaussian distribution
}
\details{
\tabular{ll}{
Package: \tab cmvnorm\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-01-10\cr
License: \tab GPL-2\cr
}



}
\author{
Robin K. S.Hankin; much of the code is inspired by the mvtnorm package

Maintainer: \email{hankin.robin@gmail.com}
}

\references{
N. R. Goodman 1963.  \dQuote{Statistical analysis based on a certain
  multivariate complex Gaussian distribution}.  \emph{The Annals of
  Mathematical Statistics}.  34(1): 152--177
}

\keyword{ package }

\examples{

Covmat <- matrix(c(1,0.1i,-0.1i,1),2,2)
rcmvnorm(10,sigma=Covmat)
dcmvnorm(emulator::latin.hypercube(5,2,complex=TRUE),sigma=Covmat)

}

