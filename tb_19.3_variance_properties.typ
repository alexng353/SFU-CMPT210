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

= Properties of Variance

Variance is the average _of the square_ of the distance from the mean. For this
reason, variance is sometimes called the "mean square deviation." Then we take
its square root to get the standard deviation---which in turn is called "root
mean square deviation."

But why bother squaring? Why not study the acutal distance from the mean,
namely, the absolute value of $R-EE[R]$, instead of its root mean square? The
answer is that variance and standard deviation have useful properties that make
them much more important in probability theory than average absolute deviation.

== A Formula for Variance

Applying linearity of expectation to teh formula for variance yields a
convenient alternative formula

*Lemma 19.3.1.* 
$
Var[R] = EE[R^2] - (EE[R])^2
$
_for any random variable, $R$._

A simple and very useful formula for the variance of an indicator is an
immediate consequence.

*Corollary 19.3.2.* _If $B$ is a Bernoulli variable where $p:=Pr[B=1]$, then_

$
Var[B] = p-p^2 = p(1-p)
$

== Variance of Time to Failure

According to #sym.section\18.4.6, the mean time to failure is $1/p$ for a process
that fails during any given hour with probability $p$. What about the variance?

By Lemme 19.3.1,

$
Var[C] = EE[C^2] - (1/p)^2
$

so all we need is a formula for $EE[C^2]$. 

== Dealing with Contstants

It helps to know hwo to calculate the variance of $a R+b$:

*Theorem 19.3.4.* [Square Multiple Rule for Variance] _Let $R$ be a random
variable and $a$ a constant. Then_

$
Var[a R] = a^2 Var[R]
$

It's even simpler to prove that adding a constant does not change the variacne.

*Theorem 19.3.5.* _Let $R$ be a random variable and $b$ a constant. Then_
$
Var[R+b] = Var[R]
$

Recalling that the standard deviation is the square root of variance, this
implies that the standard deviation of $a R+b$ is simply $abs(a)$ times the
standard deviation of $R$.

*Corollary 19.3.6.* 

$
sigma_(a R+b) = abs(a) sigma_R
$

== Variance of a Sum

In general, the variance of a sum is not equal to the sum of the variances, but
variances do add for _independent_ variables. In fact, _mutual_ independence is
not necessary: _pairwise_ independence will do. This is useful to know because
there are some important situations, such as Birtdhay Matching in 
#sym.section\16.4, that involve variables that are pairwise independent but not
mutually independent.

*Theorem 19.3.7.* _If $R$ and $S$ are independent random variables, then_

$
Var[R+S] = Var[R] + Var[S]
$<variance_sum>

*Theorem 19.3.8.* _[Pairwise Independent Additivity of Variance] If $R_1, R_2,
dots, R_n$ are pairwise independent random variables, then_

$
Var[R_1 + R_2 + dots + R_n] = Var[R_1] + Var[R_2] + dots + Var[R_n]
$<variance_pairwise>

Now we have a simple way of computing the variance of a variable, $J$, that has
an $(n,p)$-binomial distribution. We know that $J = sum_(k=1)^n I_k$ where $I_k$
are the mutually independent indicator variables with $Pr[I_k=1] = p$. The
variance of each $I_k$ is $p(1-p)$ by corollary 19.3.2, so by linearity of
variance, we have

*Lemma 19.3.9* (Variance of the Binomial Distribution). _If $J$ has the $(n,p)$
binomial distribution, then_

$
Var[J] = n Var[I_k] = n p(1-p)
$
