#import "preamble.typ": *
#set heading(numbering: "1.")

== Recap

- *Expectation*\/mean of a random variable $R$ is denoted by $EE[R]$ and
  "summarizes" its distribution. Formally, $EE[R] := sum_(omega in S) Pr[omega]
R[omega]$.
  - An altnerate definition is $EE[R] = sum_(x in "Range"(R)) x Pr[R=x]$.
- *Linearity of expectation*: for $n$ random variables $R_1, R_2, dots, R_n$ and
  constants $a_1, a_2, dots, a_n$, $EE[sum_(i=1)^n a_i R_i] = sum_(i=1)^n
  a_i EE[R_i]$.
- *Expectation for common distributions*:
  - If $R sim "Bernoulli"(p), EE[R] = p$.
  - If $R sim "Uniform"({v_1, dots, v_n}), EE[R] = (v_1 + dots + v_n)/n$.
  - If $R sim "Binomial"(n, p), EE[R] = n p$.
  - If $R sim "Geometric"(p), EE[R] = 1/p$.

= Conditional Expectation
Similarly to probabilities, expectations can be conditioned on some event.
- *Definition*: For random variable $R$, the expected value of $R$ conditioned
  on an event $A$ is:
$
EE[R|A}]:= sum_(x in Range(R)) x Pr[R=x|A]
$

*Q*: If we throw a standard dice and define $R$ to be the random variable equal
to the number that comes up, what is the expected value of $R$ given that the
number is at most 4? 

Let $A$ be the event that the number is at most 4 --- $A={1,2,3,4}$. 

$Pr[R=1|A] = (Pr[(R=1) inter A])/Pr[A] = Pr[R=1]/Pr[A] = (1/6)/(4/6) = 1/4$

Similarly, $Pr[R=2|A] = Pr[R=3|A] = Pr[R=4|A] = 1/4$ and $Pr[R=5|A] = Pr[R=6|A] = 0$.

$
EE[R|A] = sum_(x in A) x Pr[R=x|A] = 1/4[1+2+3+4] = 5/2
$

= Law of Total Expectation

If $R$ is a random variable $S to V$ and events $A_1, A_2, dots, A_n$ form a
partition of the sample space (i.e. for all $i, j, A_i inter A_j = emptyset$ and
$A_1 union A_2 union dots union A_n = S$), then,
$
EE[R] = sum_i EE[R|A_i] Pr[A_i].
$

= Independence of random variables

- *Definition*: Random variables $R_1 "and" R_2$ are independent if and only if
  for all $x_1 in Range(R_1) "and" x_2 in Range(R_2)$, events $[R_1=x_1]$ and
  $[R_2 = x_2]$ are independent. Formally,
  $
  Pr[(R_1 = x_1) inter (R_2 = x_2)] = Pr[R_1 = x_1] Pr[R_2 = x_2]
  $

*Alternate definition of independence*

Random variables $R_1 "and" R_2$ are independent if and only if for all $x_1 in
Range(R_1) "and" x_2 in Range(R_2)$,

$
Pr[(R_1 = x_1) | (R_2 = x_2)] = Pr[(R_1 = x_1)]\
Pr[(R_2 = x_1) | (R_1 = x_1)] = Pr[(R_2 = x_2)]
$

*Pairwise independence*

Similar to events, random variables $R_1, R_2, dots, R_n$ are pairwise
independent if and only if for any pair $R_i, R_j$ for all $x in Range(R_i)$ and
$y in Range(R_j)$, events $[R_i = x]$ and $[R_j = y]$ are pairwise independent
implying that

$
Pr[(R_i = x) inter (R_j = y)] = Pr[R_i=x]Pr[R_j=y]
$

Alternatively, $R_i$ and $R_j$ are pairwise independent if and only if for all
$x in Range(R_i)$ and $y in Range(R_j)$,

$
Pr[(R_i=x)|R_j=y)] = Pr[(R_i=x)]\
Pr[(R_j=y)|R_i=x)] = Pr[(R_j=y)]
$
