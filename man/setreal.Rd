\name{setreal}
\alias{Im<-}
\alias{Re<-}
\title{Manipulate real or imaginary components of an object}
\description{
Manipulate real or imaginary components of an object
}
\usage{
Im(x) <- value
Re(x) <- value
}
\arguments{
  \item{x}{Complex-valued object}
  \item{value}{Real-valued object}
}
\author{Robin K. S. Hankin}
\examples{
A <- matrix(c(1,0.1i,-0.1i,1),2,2)
Im(A) <- Im(A)*3
Re(A) <- matrix(c(5,2,2,5),2,2)


}
\keyword{math}
\keyword{complex}
