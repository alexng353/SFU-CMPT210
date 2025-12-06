#import "preamble.typ": *
#set heading(numbering: "1.")

= Expectation of Random Variables

*Q*: If $R sim "Uniform"({v_1, v_2, ..., v_n})$, compute $EE[R]$.

Range of $R = V = {v_1, v_2, ..., v_n}$ and $Pr[R=v_i] = 1/n$. Hence, $EE[R] =
(v_1+v_2+...+v_n)/n$ and the expectation for a uniform random variable is the
average of the possible outcomes.

*Q*: If $R sim "Ber"(p)$, compute $EE[R]$.

Range of $R$ is ${0,1}$ and $Pr[R=1] = p$.

$
EE[R] = sum_(x in {0,1}) x Pr[R=x] = (0)(1-p)+(1)(p) = p\
EE[R] = p
$

*Q*: If $I_A$ is the indicator random variable for event $A$, calculate
$EE[I_A]$.

$"Range"(I_A) = {0,1}$ and $I_A = 1$ iff $A$ occurs.

$
EE[I_A] = Pr[I_A=1](1) + Pr[I_A=0](0) = Pr[A]
$

Hence, for $I_A$, the expectation is equal to the probability that event $A$
happens.

*Q*: If $R sim "Geo"(p)$, compute $EE[R]$.

$"Range"[R] = {1, 2, dots}$ and $Pr[R=k] = (1-p)^(k-1)p$.

$
EE[R] = sum_(k=1)^infinity k(1-p)^*k-1)p implies (1-p) EE[R] =
sum_(k=1)^infinity k(1-p)^k p\
implies (1-(1-p))EE[R] = sum_(k=1)^infinity k(1-p)^(k-1)p - sum_(k=1)^infinity
k(1-p)^k p\
implies EE[R] = sum_(k=1)^infinity (k+1)(1-p)^k - sum_(k=1)^infinity k(1-p)^k +
sum_(k=1)^infinity (1-p)^k = 1+ (1-p)/(1-(1-p)) = 1/p
$

Implies that when tossing a coin multiple times, on average, it will take $1/p$
tosses to get the first heads.

= Linearity of Expectation.

For two random variables $R_1$ and $R_2$, $EE[R_1+R_2] = EE[R_1] + EE[R_2]$.

In general for $n$ random variables $R_1, R_2, ..., R_n$, and constants $a_1,
a_2, ..., a_n$, $EE[sum_(i=1)^n a_i R_i] = sum_(i=1)^n a_i EE[R_i]$.

This also means that $EE[a R] = a EE[R]$ for any constant $a$.

*Q*: If $R sim "Bin"(n, p)$, compute $EE[R]$.

There are two ways to solve this problem.

1. For a binomial random variable, $"Range"[R] = {0, 1, 2, dots, n}$ and
   $Pr[R=k] = binom(n,k) p^k (1-p)^(n-k)$. This leads to a painful computation
  that ends up showing $EE[R] = sum_(k=0)^n k binom(n,k) p^k (1-p)^(n-k)$.

2. The easier way is to use the linearity of expectation: Define $R_i$ to be the
   indicator random variable that we get a heads in toss $i$ of the coin. Recall
  that $R$ is the random variable equal to the number of heads in $n$ tosses.
  Hence,

  $
  R = R_1 + R_2 + ... + R_n\
  implies EE[R] = EE[R_1 + R_2 + ... + R_n]
  $

  By linearity of expectation,

  $
  E[R] = E[R_1] + E[R_2] + ... + E[R_n] = Pr[R_1] + Pr[R_2] + ... + Pr[R_n] = n p
  $

  Therefore, if the probability of success is $p$ and there are $n$ trials, on
  average, we expect $n p$ of the trials to succeed.
