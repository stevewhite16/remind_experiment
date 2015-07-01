# Power analysis - practical power analysis with pwr package
library(pwr)

d <- 0.4/1.8
n1 <- 400
n2 <- 400
type <- "paired"

# Paired and Unpaired t-test Power
# pwr.t.test(n=n1, d=d, sig.level=0.05, type=type)
# pwr.t2n.test(n1=n1, n2=n2, sig.level=0.05, d=d)
# pwr.t.test(n=25, d=, sig.level=0.05, type="two.sample")

# Linear Model Power
# pwr.f2.test(u=25, v=800, f2=0.02, sig.level=0.05)

# Paired clustered t-test Power or should I use linear model or anova?
# not really anova like in: pwr.anova.test(k=25, n=20, f=0.1, sig.level=0.95)
# ec10_power <- pwr.anova.test(k=25, f=0.1, sig.level=0.05, power=0.9)

detectable <- pwr.t2n.test(n1=350, n2=350, sig.level=0.05, power=0.9)
power <- pwr.t2n.test(n1=350, n2=350, sig.level=0.05, d=0.22)