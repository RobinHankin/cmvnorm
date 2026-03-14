test_that("Test suite test_aaa", {

    S <- matrix(c(3, 1i, -1i, 2), 2, 2)
    Z <- rcmvnorm(1e6, sigma=S)
    expect_true(all(abs(cmvnorm::var(Z) - S) < 0.01))
})
