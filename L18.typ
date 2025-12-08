#import "preamble.typ": *
#set heading(numbering: "1.")

#let cE = $cal(E)$
#let cV = $cal(V)$
#let cT = $cal(T)$
#let cS = $cal(S)$
#let cU = $cal(U)$

= Independence of Random Variables

*Mutual independence*: Random variables $R_1, R_2, dots, R_n$ are mutually
independent if for all $x_1 in Range(R_1), x_2 in Range(R_2), dots, x_n in
Range(R_n)$, events $[R_1 = x_1], [R_2=x_2], dots, [R_n=x_n]$ are mutually
independent.

*Mutual independence of events*: A set of events is said to be mutually
independent if the probability of each event in the set is the same no matter
which subset of events has occurred:
- Formally, $E_1, E_2, dots, E_n$ are mutually independent if: 
  $forall i in [n],Pr[E_i | "any subset of the other" n-1 "events"] = Pr[E_i]$

_Example_: For events $E_1, E_2, E_3$ to be mutually independent, the following
equalities should hold: 
+ $forall i, j eq.not i, Pr[E_i | E_j] = Pr[E_i]$
+ $forall i, forall j, k, j eq.not i, k eq.not i, j eq.not k, Pr[E_i | E_j inter E_k] = Pr[E_i]$

- For 2 r.v's $R_1, R_2$, mutual independence and pairwise independence are
  equivalent.
- For more than 2 r.v's, mutual independence implies pairwise independence.

= Max Cut

*Aim*: Given a graph $G=(cV,cE)$, partition the graph's vertices into two
complementary sets #cS and #cT, such that the number of edges between the set
#cS and the set #cT is as large as possible.

- Max Cut has applications to VLSI circuit design.

*Formal objective*: Find a set $cal(U) subset.eq cV$ of vertices that solve the
following problem:

$
max_(cU subset.eq cV) |delta (cU)| "where" delta(cU) := {(u,v) in cE | (u in cU
"and" v in.not cU) "or" (u in.not cU "and" v in cU)}
$

$delta(cU)$ is the "cut" corresponding to the set #cU and the aim is to find the
cut with the largest size.

- Max Cut is *NP-hard*, meaning that there is no polynomial (in $|cE|$) time
  algorithm that solves Max Cut exactly.
- We want to find an approximate solution #cU such that, if OPT is the size of
  the optimal cut, then, $|delta(cU)| >= alpha "OPT"$ where $alpha in (0, 1)$ is
  the multiplicative approximation factor.
- Randomized algorithm that guarantees an approximate solution with $alpha =
  1/2$ with probability close to 1 (Erdos, 1967).
- Complicated algorithm with $alpha = 0.878$ (Goemans and Williamson, 1995).
- Under some technical conditions, no algorithm has $alpha > 0.878$ (Khot et al,
  2004).

We will use Erdos' randomized algorithm and prove the result in expectation. We
wish to prove that for #cU returned by Erdos' algorithm,
$
EE[|delta(cU)|] >= 1/2 "OPT"
$

*Algorithm*: Select #cU to be a random subset of #cV i.e. for each vertex $v$,
choose $v$ to be in the set #cU independently with probability $1/2$ (don't even
look at the edges). 

== Deviation from the Mean

- We have developed tools to calculate the mean of random variables. Getting a
  handle on the expectation is useful because it tells us what would happen on
  average.
- However, summarizing the PDF using the mean is typically not enough. We also
  want to know how "spread" the distribution is. 
Example: Consider three random variables $W, Y, Z$ whose PDFs can be given as:
$
W = 0 "with" p = 1\
Y = cases(
  -1 "with" p = 1/2,
  +1 "with" p = 1/2,
)\
Z = cases(
  -1000 "with" p = 1/2,
  +1000 "with" p = 1/2,
)
$

Though $EE[W] = EE[Y] = EE[Z] = 0$, these distributions are quite different. $Z$
can take values really far away from its expected value, while $W$ can only take
one value equal to the mean. Hence, we want to understand how much a random
variable *deviates* from its mean.

Before we calculate the deviation of a r.v. from its mean, we need an additional
definition: For an r.v. $X: cS to cV$, and a function $g: V to RR$, we define
$EE[g(X)]$ as follows:

$
EE[g(X)] = sum_(x in Range(X)) g(x)*EE[X]
$

If $g(x) = x$ for all $x in Range(X)$, then $EE[g(X)] = EE[X]$.

*Q*: For a standard dice, if $X$ is the r.v. corresponding to the number that
comes up on the dice, compote $EE[X^2]$ and $EE[X]$.

For a standard dice, $X sim "Uniform"({1,2,3,4,5,6})$ and hence,

$
EE[X^2] = sum_(x in {1,2,3,4,5,6}) x^2 Pr[X=x] = 1/6 [1^2 + dots + 6^2] = 91/6
$

and

$
(EE[X])^2 = (sum_(x in {1,2,3,4,5,6}) x Pr[X=x])^2 = (1/6 [1+dots+6])^2 = 49/4
$

= Variance

*Definition*: _Variance_ is the standard way to measure the deviation of a r.v.
from its mean. Formally, for an r.v. $X$, 
$
Var[X] = EE[(X-EE[X])^2] = sum_(x in Range(X)) (x-mu)^2 Pr[X=x] "      "("where" mu := EE[X])
$

Intuitively, the variance measures the probability-weighted average of how far
(in squared distance) the random variable is from its mean $mu$.

*Q*: If $X sim "Ber"(p)$, compute $Var[X]$.

Since $X$ is a Bernoulli random variable, $X = 1$ with probability $p$ and $X =
0$ with probability $1-p$. Recall that $EE[X] = mu = (0)(1-p) + (1)(p) = p$.

$
Var[X] = sum_(x in {0,1}) (x-p)^2 Pr[X=x] = (0-p)^2 Pr[X=0] + (1-p)^2 Pr[X=1]\
= p^2 (1-p) + (1-p)^2 p = p(1-p)[p+1-p] = p(1-p)
$

- For a Bernoulli r.v. $X$, $Var[X] = p(1-p) <= 1/4$ and the variance is maximum
  when $p = 1/2$.

*Alternative definition of variance*: $Var[X] = EE[X^2] - mu^2 = EE[X^2] - (EE[X])^2$
