#import "preamble.typ": *
#set heading(numbering: "1.")

== Recap

$"Range"(R)$ is the set of values that $R$ actually takes with positive
probability. It is related to $V$, but some values in $V$ may never occur.

A *distribution* can be specified by its probability desntiy function (PDF,
denoted by $f$).
- *Bernoulli distribution*: $f_p(0) = 1-p, f_p(1)=p$. Example: when tossing a
  coin such that $Pr["heads"]=p$, random variable $R$ is equal to 1 if we get a
  heads, and 0 otherwise. In this case, $R$ follows the Bernoulli distribution,
  i.e. $R sim Ber(p)$.
- *Uniform distribution*: if $R:S -> V$, then for all $v in V, f(v) = 1/(|V|)$.
  Example: when tossing an $n$-sided die, random variable $R$ is the number that
  comes up on the die. $V = {1, 2, dots, n}$. In this case, $R$ follows the
  Uniform distribution, i.e. $R sim "Uniform"(1, n)$.
- *Binomial distribution*: $f_(n,p)(k) = binom(n,k)p^k (1-p)^(n-k)$. Example:
  when tossing $n$ independent coins such that $Pr["heads"]=p$, random variable
  $R$ is the number of heads in $n$ coin tosses. In this case, $R$ follows the
  Binomial distribution, i.e. $R sim "Bin"(n, p)$.
- *Geometric distribution*: $f_p (k) = (1-p)^(k-1)p$. Example: when repeatedly
  tossing a coin such that $Pr["heads"]=p$, random variable $R$ is the number of
  tosses needed to get the first heads. In this case, $R$ follows the geometric
  distribution i.e. $R sim "Geo"(p)$.

= Expectation of Random Variables

Recall that a random variable $R$ is a total function from $S to V$. 

*Definition*: Expectation of $R$ is denoted by $EE[R]$ and "summarizes" its
distribution. Formally,
$
EE[R] = sum_(omega in S) Pr[omega] R[omega]
$

$EE[R]$ is also known as the "expected value" or the "mean" of the random
variable $R$.
- Example: In a class, suppose we uniformly at random choose a student and
  define a r.v. $R$ equal to the percentage of marks they scored in an exam. The
  sample space $S$ is the student ID number of the student we picked, and $R:S to
  [0,100]$. $EE[R]$ is the class average.
- An r.v. does not necessarily achieve its expected value. Intuitively, consider
  doing the "experiment" (throw a dice and record the number) multiple times.
  This average of the numbers we record will tend to $EE[R]$ as the number of
  experiments becomes large. So the expectation can be thought of as a "long-term"
  average.

*Alternate definition*: $EE[R] = sum_(x in "Range"(R)) x Pr[R=x]$. 

- This definition does not depend on the sample space.
