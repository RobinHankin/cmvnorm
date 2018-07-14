\name{corr_complex}
\alias{corr_complex}
\alias{complex_CF}
\alias{interpolant.quick.complex}
\alias{scales.likelihood.complex}
\title{Complex Gaussian processes}
\description{
Various utilities for investigating complex Gaussian processes
}
\usage{
corr_complex(z1, z2 = NULL, distance.function = complex_CF, means =
NULL, scales = NULL, pos.def.matrix = NULL)
complex_CF(z1,z2, means, pos.def.matrix)
scales.likelihood.complex(pos.def.matrix, scales, means,  zold, z,
               give_log = TRUE, func = regressor.basis)
interpolant.quick.complex(x, d, zold, Ainv, scales = NULL, pos.def.matrix = NULL,
               means=NULL, func = regressor.basis, give.Z = FALSE,
               distance.function = corr_complex, ...)
}
\arguments{
  \item{z, z1, z2}{Points in \eqn{C^n}}
  \item{distance.function}{Function giving the (complex) covariance
    between two points in \eqn{C^n} }
  \item{means, pos.def.matrix, scales}{In function \code{complex_CF()}, the mean
    and covariance matrix of the distribution whose characteristic
    function is used as to give the covariance matrix; \code{scales} is
    used to specify the diagonal of \code{pos.def.matrix} if the
    off-diagonal elements are zero}
  \item{zold, d, give_log, func, x, Ainv, give.Z,...}{Direct analogues of the
    arguments in \code{interpolant()} and \code{scales.likelihood()} in
    the \pkg{emulator} package}
}
\details{

\itemize{

  \item Function \code{complex_CF()} returns a (slightly reparameterized)
  characteristic function of a complex Gaussian distribution.  The
  covariance is given by
  
  \deqn{c(\mathbf{t}) = \exp(i\mathrm{Re}(\mathbf{t}^\ast\mathbf{\mu}) -
    \mathbf{t}^\ast B\mathbf{t})}{[omitted, see PDF]}
  
  where \eqn{\mathbf{t}=\mathbf{x}-\mathbf{x}'}{x-x'} is interpreted as
  the distance between two observations, \eqn{\mathbf{\mu}}{mu} is the
  mean of the distribution (which is in general a complex vector), and
  \eqn{B} a positive-definite matrix.
  
  \item Function \code{corr_complex()} is the complex analogue of
  \code{corr.matrix()}.  It returns a matrix with entry \eqn{(i,j)}
  equal to the covariance of the process at observation \eqn{i} and
  observation \eqn{j}, or
  \eqn{\mbox{cov}(\eta(\mathbf{x}_i),\eta(\mathbf{x}_j))}{cov(eta(x_i),eta(x_j))}.
  The elements are calculated by \code{complex_CF()}.
  
  This function includes only a single method, that of nested calls to
  \code{apply()}.  I could not figure out how to generalize method 1 of
  \code{corr.mattrix()}  to the complex case.

\item Function \code{scales.likelihood.complex()} is a complex version of
\code{scales.likelihood()} which takes a positive definite matrix and a
mean.  The formula used is \deqn{(\sigma^2)^{-(n-q)}|A|^{-1}
|H^\ast A^{-1}H|^{-1}}{[omitted, see PDF]}.  Here and elsewhere,
\eqn{A^\ast}{A^*} means the complex conjugate of the transpose.

\item Function \code{interpolant.quick.complex()} is a complex version of
\code{interpolant.quick()}.

\deqn{\mathbf{h}(\mathbf{x})^\ast\hat{\mathbf{\beta}} +
  \mathbf{t}(\mathbf{x})^\ast A^{-1}(\mathbf{y}-H\hat{\mathbf{\beta}})}{[omitted, see PDF]} 

This is the complex version of Oakley's equation 2.30 or Hankin's
equation 5.

}

More details are given in the package vignette.
}

\references{

  \itemize{
    \item Hankin, R. K. S. 2005.  \dQuote{Introducing
      BACCO, an R bundle for Bayesian Analysis of Computer Code Output},
    \emph{Journal of Statistical Software}, 14(15)
    
    \item J. Oakley 1999. \emph{Bayesian uncertainty analysis for complex
      computer codes}, PhD thesis, University of Sheffield.
  }
}


\author{
Robin K. S. Hankin
}

\examples{


complex_CF(c(1,1i),c(1,-1i),means=c(1i,1i),pos.def.matrix=diag(2))

V <- latin.hypercube(7,2,complex=TRUE)

cm <- c(1,1+1i)                     # "complex mean"
cs <- matrix(c(2,1i,-1i,1),2,2)   # "complex scales"
tb <- c(1,1i,1-1i)                     # "true beta"

A <- corr_complex(V,means=cm,pos.def.matrix=cs)
Ainv <- solve(A)
z <- drop(rcmvnorm(n=1,mean=regressor.multi(V) \%*\% tb, sigma=A))


betahat.fun(V,Ainv,z)    # should be close to 'tb'

#scales.likelihood.complex(cs,cm,V,z)   # log-likelihood evaluated true parameters



interpolant.quick.complex(x=0.1i+V[1:3,],d=z,zold=V,Ainv=Ainv,pos.def.matrix=cs,means=cm)


}

