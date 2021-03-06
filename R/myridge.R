
# @NOTE: Reduced tolerance for solve function here
myridge = function(x, y, int = T, eps = 0.001, tolerance = 1e-50) {
  xx = x
  if (!is.matrix(xx))
    xx = matrix(xx, ncol = 1)
  lam = rep(eps, ncol(xx))

  if (int) {
    xx = cbind(1, xx)
    lam = c(0, lam)
  }
  d = diag(lam)
  if (ncol(xx) == 1)
    d = lam
  coef = solve(t(xx) %*% xx + d, tol = tolerance) %*% t(xx) %*% y
  res = y - xx %*% coef
  list(res = res, coef = coef)
}

