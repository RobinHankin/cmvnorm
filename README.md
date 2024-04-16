The complex multivariate Gaussian distribution in R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="man/figures/cmvnorm.png" width = "150" align="right" />

To cite the `cmvnorm` package in publications please use Hankin (2015).
Consider the (zero mean) multivariate Gaussian distribution with
probability density function

![f{\left({\mathbf x};\Sigma\right)} =
\frac{
  \exp\left(-\frac{1}{2}{\mathbf x}^T\Sigma^{-1}{\mathbf x}\right)
}{
  \sqrt{\left\|2\pi\Sigma\right\|}
},
\qquad{\mathbf x}\in{\mathbb R}^n](https://latex.codecogs.com/png.latex?f%7B%5Cleft%28%7B%5Cmathbf%20x%7D%3B%5CSigma%5Cright%29%7D%20%3D%0A%5Cfrac%7B%0A%20%20%5Cexp%5Cleft%28-%5Cfrac%7B1%7D%7B2%7D%7B%5Cmathbf%20x%7D%5ET%5CSigma%5E%7B-1%7D%7B%5Cmathbf%20x%7D%5Cright%29%0A%7D%7B%0A%20%20%5Csqrt%7B%5Cleft%7C2%5Cpi%5CSigma%5Cright%7C%7D%0A%7D%2C%0A%5Cqquad%7B%5Cmathbf%20x%7D%5Cin%7B%5Cmathbb%20R%7D%5En "f{\left({\mathbf x};\Sigma\right)} =
\frac{
  \exp\left(-\frac{1}{2}{\mathbf x}^T\Sigma^{-1}{\mathbf x}\right)
}{
  \sqrt{\left|2\pi\Sigma\right|}
},
\qquad{\mathbf x}\in{\mathbb R}^n")

where ![\Sigma](https://latex.codecogs.com/png.latex?%5CSigma "\Sigma")
is an
![n\times n](https://latex.codecogs.com/png.latex?n%5Ctimes%20n "n\times n")
positive-definite variance matrix. Now compare the complex version with
![\Gamma](https://latex.codecogs.com/png.latex?%5CGamma "\Gamma")
Hermitian positive-definite:

![f{\left({\mathbf z};\Gamma\right)} =
\frac{
  \exp\left( -{\mathbf z}^\dag\Gamma^{-1}{\mathbf z}\right)
}{
 \left\|\pi\Gamma\right\|
},
\qquad{\mathbf z}\in\mathbb{C}^n.](https://latex.codecogs.com/png.latex?f%7B%5Cleft%28%7B%5Cmathbf%20z%7D%3B%5CGamma%5Cright%29%7D%20%3D%0A%5Cfrac%7B%0A%20%20%5Cexp%5Cleft%28%20-%7B%5Cmathbf%20z%7D%5E%5Cdag%5CGamma%5E%7B-1%7D%7B%5Cmathbf%20z%7D%5Cright%29%0A%7D%7B%0A%20%5Cleft%7C%5Cpi%5CGamma%5Cright%7C%0A%7D%2C%0A%5Cqquad%7B%5Cmathbf%20z%7D%5Cin%5Cmathbb%7BC%7D%5En. "f{\left({\mathbf z};\Gamma\right)} =
\frac{
  \exp\left( -{\mathbf z}^\dag\Gamma^{-1}{\mathbf z}\right)
}{
 \left|\pi\Gamma\right|
},
\qquad{\mathbf z}\in\mathbb{C}^n.")

See how much nicer the complex version is! No awkward, unsightly factors
of two and no inconvenient square roots. This is essentially due to
Gauss’s integral operating more cleanly over the complex plane than the
real line:

![{
\int\_\mathbb{C}e^{-z^\dag z}\\dz=
\iint\_{(x,y)\in\mathbb{R}^2}\\\\\\\\\\\\\\\\\\\\\\\\\\\\
e^{-(x^2+y^2)}\\dx\\dy=
\int\_{\theta=0}^{2\pi}\int\_{r=0}^\infty e^{-r^2}r\\dr\\d\theta=
2\pi\int\_{r=0}^\infty e^{-r^2}r\\dr=\pi.
}](https://latex.codecogs.com/png.latex?%7B%0A%5Cint_%5Cmathbb%7BC%7De%5E%7B-z%5E%5Cdag%20z%7D%5C%2Cdz%3D%0A%5Ciint_%7B%28x%2Cy%29%5Cin%5Cmathbb%7BR%7D%5E2%7D%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%5C%21%0Ae%5E%7B-%28x%5E2%2By%5E2%29%7D%5C%2Cdx%5C%2Cdy%3D%0A%5Cint_%7B%5Ctheta%3D0%7D%5E%7B2%5Cpi%7D%5Cint_%7Br%3D0%7D%5E%5Cinfty%20e%5E%7B-r%5E2%7Dr%5C%2Cdr%5C%2Cd%5Ctheta%3D%0A2%5Cpi%5Cint_%7Br%3D0%7D%5E%5Cinfty%20e%5E%7B-r%5E2%7Dr%5C%2Cdr%3D%5Cpi.%0A%7D "{
\int_\mathbb{C}e^{-z^\dag z}\,dz=
\iint_{(x,y)\in\mathbb{R}^2}\!\!\!\!\!\!\!\!\!\!\!\!\!\!
e^{-(x^2+y^2)}\,dx\,dy=
\int_{\theta=0}^{2\pi}\int_{r=0}^\infty e^{-r^2}r\,dr\,d\theta=
2\pi\int_{r=0}^\infty e^{-r^2}r\,dr=\pi.
}")

It can be shown that
![{\mathbb E}({\mathbf z}{\mathbf z}^\dag)=\Gamma](https://latex.codecogs.com/png.latex?%7B%5Cmathbb%20E%7D%28%7B%5Cmathbf%20z%7D%7B%5Cmathbf%20z%7D%5E%5Cdag%29%3D%5CGamma "{\mathbb E}({\mathbf z}{\mathbf z}^\dag)=\Gamma"),
so ![\Gamma](https://latex.codecogs.com/png.latex?%5CGamma "\Gamma")
really is the variance of the distribution. We can also introduce a
nonzero mean,
![{\mathbf m}\in{\mathbb C}^n](https://latex.codecogs.com/png.latex?%7B%5Cmathbf%20m%7D%5Cin%7B%5Cmathbb%20C%7D%5En "{\mathbf m}\in{\mathbb C}^n")
in the natural way. The `cmvnorm` package furnishes some R functionality
for dealing with the complex multivariate Gaussian distribution.

# The package in use

The simplest case would be the univariate standard complex normal
distribution, that is is a complex random variable
![z](https://latex.codecogs.com/png.latex?z "z") with PDF
![\exp(z^\*z)/\pi](https://latex.codecogs.com/png.latex?%5Cexp%28z%5E%2Az%29%2F%5Cpi "\exp(z^*z)/\pi").
Random samples are given by `rcnorm()`:

``` r
rcnorm(10)
#>  [1] -0.0528480-0.9952359i -0.1131178-0.8621966i -1.9530376+0.7795398i
#>  [4] -0.8482803-0.6904584i -0.4034849-0.2782016i -0.6505241-0.2635794i
#>  [7] -0.4601972-0.3981609i  0.2999707+1.0394118i  0.8252793-0.1500767i
#> [10]  0.0513397+0.7407047i
```

Observations are circularly symmetric in the sense that
![z](https://latex.codecogs.com/png.latex?z "z") has the same
distribution as
![e^{i\theta}z](https://latex.codecogs.com/png.latex?e%5E%7Bi%5Ctheta%7Dz "e^{i\theta}z")
for any
![\theta\in{\mathbb R}](https://latex.codecogs.com/png.latex?%5Ctheta%5Cin%7B%5Cmathbb%20R%7D "\theta\in{\mathbb R}"),
as we may verify visually:

``` r
par(pty="s")
plot(rcnorm(10000),asp=1,xlim=c(-3,3),ylim=c(-3,3),pch=16,cex=0.2)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

We may sample from this distribution and verify that it has zero mean
and unit variance:

``` r
z <- rcnorm(1e6)
mean(z)   # zero, subject to sample error
#> [1] -1.827709e-04-6.668696e-04i
var(z)    # one, subject to sample error
#> [1] 0.9997283
```

Note that the real and imaginary components of
![z](https://latex.codecogs.com/png.latex?z "z") have variance
![0.5](https://latex.codecogs.com/png.latex?0.5 "0.5"):

``` r
z <- rcnorm(1e6)

var(Re(z))
#> [1] 0.5000272
var(Im(z))
#> [1] 0.5008242
```

We may sample from the multivariate case similarly. Suppose
![{\mathbf m}=(1,i)^T](https://latex.codecogs.com/png.latex?%7B%5Cmathbf%20m%7D%3D%281%2Ci%29%5ET "{\mathbf m}=(1,i)^T")
and
![\Gamma=\left(\begin{array}{cc}3&i\\-i&2\end{array}\right)](https://latex.codecogs.com/png.latex?%5CGamma%3D%5Cleft%28%5Cbegin%7Barray%7D%7Bcc%7D3%26i%5C%5C-i%262%5Cend%7Barray%7D%5Cright%29 "\Gamma=\left(\begin{array}{cc}3&i\\-i&2\end{array}\right)"):

``` r
tm <- c(1,1i)  # true mean
tS <- matrix(c(3,1i,-1i,2),2,2)  # true variance
rcmvnorm(10,mean=tm, sigma=tS)
#>                         [,1]                  [,2]
#>  [1,]  0.8731987-1.94077331i  0.3285428-0.1240904i
#>  [2,] -0.7022897-1.67515193i -1.7838359-0.5522284i
#>  [3,]  0.0068067-1.85508490i -1.2905219+1.6677639i
#>  [4,]  1.5369290+0.58712538i -1.1072621+0.1520979i
#>  [5,]  0.5830273-0.64866845i  1.1231384+1.0761326i
#>  [6,]  0.6577197+3.42004985i  0.6495996-0.6234960i
#>  [7,]  1.0893717+0.16370232i  0.2841823+3.5702796i
#>  [8,] -0.0255602+0.01500786i  1.5170690-0.2546599i
#>  [9,]  1.1753106-1.13978364i  1.0580657+0.3429528i
#> [10,]  1.0640442+1.69023115i -0.0649188+0.3008208i
```

We may perform elementary inference. For the mean and variance we can
calculate their maximum likelihood estimates:

``` r
n <- 1e6  # sample size
z <- rcmvnorm(n,mean=tm, sigma=tS)
colMeans(z)   # should be close to tm=[1,i]
#> [1]  1.0002005-0.000978i -0.0014166+0.998508i
z <- scale(z,scale=FALSE) # sweep out the mean
cprod(z)/n  # should be close to tS
#>                      [,1]                 [,2]
#> [1,]  2.9966367+0.000000i -0.0004503+0.999323i
#> [2,] -0.0004503-0.999323i  1.9994317+0.000000i
```

# Further information

For further information, see the package vignette: type

`vignette("cmvnorm")`

at the R command line.

# References

Hankin, R. K. S. 2015. “The complex multivariate Gaussian distribution”.
*The R Journal*, 7(1):73-80
