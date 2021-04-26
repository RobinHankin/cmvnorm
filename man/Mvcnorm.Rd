\name{Mvcnorm}
\alias{Mvcnorm}
\alias{dcmvnorm}
\alias{rcmvnorm}
\alias{rcnorm}
\title{
Multivariate complex Gaussian density and random deviates
}
\description{
Density function and a random number generator for the multivariate
complex Gaussian distribution.
}
\usage{
rcnorm(n)
dcmvnorm(z, mean, sigma, log = FALSE) 
rcmvnorm(n, mean = rep(0, nrow(sigma)), sigma = diag(length(mean)), 
    method = c("svd", "eigen", "chol"),
    tol= 100 * .Machine$double.eps)
}
\arguments{
  \item{z}{Complex vector or matrix of quantiles.  If a matrix, each row
    is taken to be a quantile}
  \item{n}{Number of observations}
  \item{mean}{Mean vector}
  \item{sigma}{Covariance matrix, Hermitian positive-definite}
  \item{tol}{numerical tolerance term for verifying positive definiteness}
  \item{log}{In \code{dcmvnorm()}, Boolean with default \code{FALSE}
    meaning to return the Gaussian density function, and \code{TRUE}
    meaning to return the logarithm}
  \item{method}{Specifies the decomposition used to determine the
    positive-definite matrix square root of \code{sigma}.  Possible
    methods are eigenvalue decomposition (\dQuote{\code{eigen}},
    default), and singular value decomposition (\dQuote{\code{svd}})}
}
\details{
  Function \code{dcmvnorm()} is the density function of the complex
  multivariate normal (Gaussian) distribution:

  \deqn{p\left(\mathbf{z}\right)=\frac{\exp\left(-\mathbf{z}^*\Gamma\mathbf{z}\right)}{\left|\pi\Gamma\right|}}{
    p(z)=exp(-z*\Gamma z)/|\pi\Gamma|}
    
  Function \code{rcnorm()} is a low-level function designed to generate
  observations drawn from a standard complex Gaussian.  Function
  \code{rcmvnorm()} is a user-friendly wrapper for this.
  }
\references{
N. R. Goodman 1963.  \dQuote{Statistical analysis based on a certain
  multivariate complex Gaussian distribution}.  \emph{The Annals of
  Mathematical Statistics}.  34(1): 152--177
}
\author{Robin K. S. Hankin}
\examples{

S <- emulator::cprod(rcmvnorm(3,mean=c(1,1i),sigma=diag(2)))

rcmvnorm(10,sigma=S)
rcmvnorm(10,mean=c(0,1+10i),sigma=S)


# Now try and estimate the mean (viz 1,1i) and variance (S) from a
#  random sample:


n <- 101
z <- rcmvnorm(n,mean=c(0,1+10i),sigma=S)
xbar <- colMeans(z)
Sbar <- cprod(sweep(z,2,xbar))/n




}
\keyword{distribution}
\keyword{multivariate}
\keyword{complex}
