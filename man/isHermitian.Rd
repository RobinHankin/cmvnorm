\name{isHermitian}
\alias{isHermitian}
\alias{ishpd}
\alias{zapim}
\title{
Is a Matrix Hermitian?
}
\description{
Returns \code{TRUE} if a matrix is Hermitian or Hermitian positive-definite
}
\usage{
isHermitian(x, tol = 100 * .Machine$double.eps)
ishpd(x,tol= 100 * .Machine$double.eps)
zapim(x,tol= 100 * .Machine$double.eps)
}
\arguments{
  \item{x}{A square matrix}
  \item{tol}{Tolerance for numerical scruff}
}
\details{
Functions \code{isHermitian()} and \code{ishpd()} return a Boolean,
indicating whether the argument is Hermitian or Hermitian positive
definite respectively.  Function \code{zapim()} zaps small imaginary
parts of a vector, returning real if all elements are so zapped.
}
\author{Robin K. S. Hankin}
\examples{
v <- 2^(1:30)
zapim(v+1i*exp(-v))


ishpd(matrix(c(1,0.1i,-0.1i,1),2,2))   # should be TRUE
isHermitian(matrix(c(1,3i,-3i,1),2,2)) # should be TRUE
ishpd(rcwis(6,2))                      # should be TRUE

}

\keyword{complex}
