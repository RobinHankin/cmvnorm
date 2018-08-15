\name{cmvnorm-package}
\alias{cmvnorm-package}
\alias{cmvnorm}
\docType{package}
\title{
\packageTitle{cmvnorm}
}
\description{
\packageDescription{cmvnorm}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{cmvnorm}
\packageIndices{cmvnorm}

Generalizing the real multivariate Gaussian distribution to the complex
case is not straightforward but one common approach is to replace the
real symmetric variance matrix with a Hermitian positive-definite
matrix.  The \pkg{cmvnorm} package provides some functionality for
the resulting density function.
}

\author{
\packageAuthor{cmvnorm}

Maintainer: \packageMaintainer{cmvnorm}
}
\references{
  \itemize{
    \item N. R. Goodman 1963.  \dQuote{Statistical analysis based on a certain
      multivariate complex Gaussian distribution}.  \emph{The Annals of
      Mathematical Statistics}.  34(1): 152--177
    \item R. K. S. Hankin 2015.  \dQuote{The complex multivariate
      Gaussian distribution}.  \emph{R News}, volume 7, number 1.
  }
}
\keyword{ package }
\examples{


S1 <- 4+diag(5)
S2 <- S1
S2[1,5] <- 4+1i
S2[5,1] <- 4-1i   # Hermitian


rcmvnorm(10,sigma=S1)
rcmvnorm(10,mean=rep(1i,5),sigma=S2)

dcmvnorm(rep(1,5),sigma=S2)

}
