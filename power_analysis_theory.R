# Power analysis - practical power analysis with pwr package
library(pwr)

d <- 0.4/1.8
n1 <- 400
n2 <- 400
type <- "paired"

pwr.t.test(n=n1, d=d, sig.level=0.05, type=type)
pwr.t2n.test(n1=n1, n2=n2, sig.level=0.05, d=d)

pwr.f2.test(u=25, v=800, f2=0.02, sig.level=0.05)