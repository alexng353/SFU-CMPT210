// This work includes material from *Mathematics for Computer Science*
// by Eric Lehman, F. Thomson Leighton, and Albert R. Meyer,
// https://people.csail.mit.edu/meyer/mcs.pdf,
// licensed under the Creative Commons Attribution–ShareAlike 3.0
// Unported License (CC BY-SA 3.0). 
// https://creativecommons.org/licenses/by-sa/3.0/
// Many changes were made. The text is my interpretation/notes of the original work.
//
// You are free to:
// - Share: copy and redistribute the material in any medium or format
// - Adapt: remix, transform, and build upon the material
// for any purpose, even commercially.
//
// Under the following terms:
// - Attribution: You must give appropriate credit, provide a link to the
//   license, and indicate if changes were made.
// - ShareAlike: If you remix, transform, or build upon the material,
//   you must distribute your contributions under the same license.

#set math.equation(numbering: "(1)")
#import "preamble.typ": *
#set heading(numbering: "1.")

= Estimation by Random Sampling

Democratic politicians were astonished in 2010 when their early voter polls of
sample voters showed Republican Scott Brown was favoured by a majority of voters
and so would win the special election to fill the seat that late Democrat Teddy
Kennedy had occupied for over 40 years. Based on their poll results, tehy
mounted and intense, but ultimately unsuccessful, effort to save the seat for
their party.

== A Voter Poll

Suppose at some time before the election that $p$ was the fration of voters
favouring Scott Brown. We want to estimate this unknown fraction $p$. Suppose we
have some random process for selecting voters from registration lists that
selects each voter with equal probability. We can define an indicator variable,
$K$, by the rule that $K=1$ if the random voter most prefers Brown, and $K=0$
otherwise.

Now, to estimate $p$, we take a large number, $n$ of random choices of voters.
We define variables $K_1, K_2, dots, K_n$ where $K_i$ is the indicator variable
for the event that the $i$th random voter chooses Brown. Since our choices are
made independently, the $K_i$'s are independent. Now, let $S_n$ be their sum.

$
S_n:= sum_(i=1)^n K_i
$

The variable $S_n/n$ describes this fraction. Most people, intuitively, and
correctly, expect this sample to give a useful approximation of the unknown
fraction, $p$.

So we will use the sample value $S_n/n$ as our _statistical estimate_ of $p$. We
know that $S_n$ has a binomial distribution with paramaters $n$ and$p$; we can
choose $n$, but $p$ is unknown. 

*How Large a Sample?*

Suppose we want our estimate to be within $0.04$ of the fraction, $p$, at least
$95%$ of the time. This means we want

$
Pr[abs(S_n/n -p ) <= 0.004] >= 0.95
$<19_17>

So we'd better determine the number, $n$, of times we must poll voters so that
inequality (@19_17) will hold. Chebyshev's Theorem offers a simple way to
determine such an $n$. 

$S_n$ is binomially distributed. Equation (19.15), combined with the fact that
$p(1-p)$ is maximized when $p=1-p$, that is, when $p=1/2$, gives

$
Var[S_n] = n(p(1-p)) <= n*1/4 = n/4
$

Next, we bound the variance of $S_n/n$:

$
Var[S_n/n] &= (1/n)^2 Var[S_n] & & "(Square Multiple Rule for Variance (19.9))"\
&<= (1/n)^2 n/4 & &"(by 19.8)"\
&= 1/(4n)
$<19_19>

Using Chebyshev's bound and (@19_19), we have:

$
Pr[abs(S_n/n -p)>= 0.04] <= (Var[S_n / n])/(0.04)^2 <= 1/(4n 0.04^2) = 156.25/n
$<19_20>

To make our estimate with $95%$ confidence, we want the righthand side of (@19_20)
to be at most $1/20$. So we choose $n$ so that 

$
156.25/n <= 1/20
$

that is,

$
n > 3\,125
$

Section 19.6.2 describes how to get tighter estimates o the tails of binomial
distributions that lead to a bound on $n$ that is about four times smaller than
the one above. But working through this example using only variance illustrates
an approach to estimation that is applicable to arbitrary random variables, not
just binomial variables. 

== Pairwise Independent Sampling

We can summarize the above reasoning into a slightly more general form with a
basic result called the Pairwise Independent Sampling Theorem. In particular, we
do not need to restrict ourselves to sums of zero-one valued variables, or to
variables with the same distribution. For simplicitly, we state the Theorem for
pairwise independent variabels with possibly different distibutions but with the
same mean and variance. 

*Theorem 19.4.1.* (Pairwise Independent Sampling) _Let $G_1, dots, G_n$ be
pairwise independent variables with the same mean, $mu$, and deviation, $sigma$.
Define_

$
S_n:=sum_(i=1)^n G_i
$

_Then_

$
Pr[abs(S_n/n - mu) >= x] <= 1/n (sigma/x)^2
$

_Proof._ We observe first that the expectation of $S_n/n$ is $mu$:

$
EE[S_n/n] &= EE[(sum_(i=1)^n G_i)/n] & & "(By the definition of $S_n$)"\
&= (sum_(i=1)^n EE[G_i])/n & & "(By linearity of expectation)"\
&= (sum_(i=1)^n mu)/n\
&= (n mu)/n = mu
$

The second important property of $S_n/n$ is that its variance is the variance of
$G_i$ divided by $n$:

$
Var[S_n/n] &= (1/n)^2 Var[S_n] & & "(Square Multiple Rule for Variance (19.9))"\
&= 1/(n^2) Var[sum_(i=1)^n G_i] & & ("definition of" S_n)\
&= 1/(n^2) sum_(i=1)^n Var[G_i] & & ("pairwise independent additivity")\
&= 1/(n^2) dot n sigma^2 = sigma^2/n
$

The Pairwise Independent Sampling Theorem provides a quantitative general
statement about how the average of independent samples of a random variable
approaches the mean. In particular, it proves what is known as the Law of Large
Numbers: by choosing a large enough sample size, we can get arbitrarily accurate
estimates of the mean with confidence arbitrarily close to 100%.

*Corollary 19.4.2.* _[Weak Law of Large Numbers] Let $G_1, dots, G_n$ be
pairwise independent variables with the same mean, $mu$, and the same finite
deviation, and let_

$
S_n := (sum_(i=1)^n G_i)/n
$

_Then for every $epsilon > 0$,_

$
lim_(n to infinity) Pr[abs(S_n - mu) <= epsilon] = 1.
$
