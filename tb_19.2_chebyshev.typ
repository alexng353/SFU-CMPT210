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

= Chebyshev's Theorem

We've seen that Markov's Theorem can give a better bound when applied to $R-b$
rather than $R$. More generally, a good trick for getting stronger bounds on a
random variable $$ out of Markov's Theorem is to apply the theorem to some
cleverly chosen function of $R$. Choosing functions that are powers of the
absolute value of $R$ turns out to be especially useful. In particular, since
$|R|^z$ is nonnegative for any real number $z$, Markov's inequality also applies
to the event $|R|^z >= x^z$. But for positive $x,z > 0$ this event is equivalent
to the event $[|R|>=x]$, so we have:

*Lemma 19.2.1.* _For any random variable $R$ and positive real numbers $x,z$,_

$
Pr[|R|>=x]<=(EE[|R|^z])/(x^z)
$


Rephrasing (19.2.1) in terms of $|R-EE[R]^z$, the random variable that measures
$R$'s deviation from its mean, we get

$
Pr[|R-EE[R]|>=x] <= (EE[(R-EE[R])^z])/(x^z)
$<lemma_19.2.1>

The case when $z=2$ turns out to be so important that the numerator of the
right-hand-side of (@lemma_19.2.1) has been given a name:

*Definition 19.2.2.* The _variance_, $Var[R]$, of a random variable, $R$, is:
$
Var[R] := EE[(R-EE[R])^2]
$

Variance is also known as _mean square deviation._ The restatement of
(@lemma_19.2.1) for $z=2$ is known as _Chebyshev's Theorem._

*Theorem 19.2.3.* (Chebyshev) _Let $R$ be a random variable and $x in RR^+$.
Then_

$
Pr[|R-EE[R]|>=x]<=(Var[R])/(x^2)
$<chebyshev>


The innermost expression, $R-EE[R]$, is the deviation of $R$ _above_ its mean.
Squaring this, $(R-EE[R])^2$, we get a random variable that is near 0 when $R$
is close to its mean and is a large positive number when $R$ deviates far above
_or below_ its mean. So, if $R$ is always close to teh mean, then the variance
will be small. If $R$ is often far from the mean, then the variance will be
large.

== Variance in Two Gambling Games

The relevance of variance is apparent when we compare the following two gambling
games.

- *Game A*: We win \$2 with probability $2/3$ and lose \$1 with probability $1/3$.
- *Game B*: We win \$1002 with probability $2/3$ and lose \$2001 with probability
  $1/3$.

Which game is better financially? We have the same probability, $2/3$, of
winning each game, but that does not tell the whole story. What about the
expected return for each game? Let random variable $A$ and $B$ be the payoffs
for the two games. For example, $A$ is 2 with probability $2/3$ and -1 with
probability $1/3$. We can compute the expected payoff for each game as follows:

$
EE[A] &= 2 dot 2/3 + (-1) dot 1/3 = 1\
EE[B] &= 1002 dot 2/3 + (-2001) dot 1/3 = 1
$

The expected payoff is the same for both games, but the games are very
different. This difference is not apparent in their expected value, but is
captured by variance. 

We compute $Var[A]$ by working "from the inside out" as follows:

$
A-EE[A] &= cases(
  1 & "with probability" 2/3,
  -2 & "with probability" 1/3
)\
(A-EE[A])^2 &= cases(
  1 & "with probability" 2/3,
  4 & "with probability" 1/3
)\
EE[(A-EE[A])^2] &= 1 dot 2/3 + 4 dot 1/3
Var[A] &= 2.
$

Similarly, we have for $Var[B]$:
$
A-EE[A] &= cases(
  1001 & "with probability" 2/3,
  -2002 & "with probability" 1/3
)\
(A-EE[A])^2 &= cases(
  1\,002\,001 & "with probability" 2/3,
  4\,008\,004 & "with probability" 1/3
)\
EE[(A-EE[A])^2] &= 1,002,001 dot 2/3 + 4,008,004 dot 1/3
Var[A] &= 2,004,002.
$
The variance of Game A is 2 and the variance of Game B is more than two million.
Intuitively, this means that the payoff in Game A is usually close to the
expected value of \$1, but the payoff in Game B can deviate very far from this
expected value. 

High variance is often associated with high risk. For example, in ten rounds of
Game A, we expect to make \$10, but we could conceivably lose \$10 instead. On
the other hand, in ten rounds of Game B, we also expect to make \$10, but could
actually lose more than \$20,000.

== Standard Deviation

In Game B above, the deviation from the mean is 1001 in one outcome and $-2002$ in
the other. But the variance is a whopping 2,004,002. This happens becaause the
"units" of variance are wrong: if the random variable is in dollars, then the
expectation is also in dollars, but the variance is in "square dollars." For
this reason, people often describe random variables using _standard deviation_
intsead of variance.

*Definition 19.2.4.* The _standard deviation_, $sigma_R$ of a random variable,
$R$, is the square root of the variance:

$
sigma_R := sqrt(Var[R]) = sqrt(EE[(R-EE[R])^2])
$<stdev>

#align(center)[
#image("stddev.png", width:40%)
]

The standard deviation of a distribution indicates how wide the "main part" of
it is. 

So the standard deviation is the square root of the mean square deviation, or
the _root mean squre_ for short. It has the same units---dollars, in our
example---as the original random variable and as the mean. Intuitively, it
measures the average deviation from the mean, since we can think of the square
root on the outside as cancelling the square on the inside.

_Example_ 19.2.5. The standard deviation of the payoff in Game B is:

$
sigma_B = sqrt(Var[B]) = sqrt(2\,004\,002) approx 1416
$

The random variable $B$ actually devaites from the mean by either positive 1001,
or negatifve 2002, so the standard deviation of 1416 decribes this situation
more lcosely than the value in the millions of the variance. 

For bell-shaped distributions like the one illustrated in the image above, the
standard deviation measures the "width" of the interval in which values are most
likely to fall. This can be more clearly explained by rephrasing Chebyshev's
Theorem in terms of standard deviation, which we can do by substituting $x= c
sigma_R$ in Markov's Theorem.

*Corollary 19.2.6.*: _Let $R$ be a random variable, and let $c$ be a positive
real number._

$
Pr[abs(R-EE[R])>=c sigma_R] <= 1/(c^2)
$

Now we see explicitly how the "likely" values of $R$ are clustered in an
$O(sigma_R)$-sized region around $EE[R]$, confirming that the standard deviation
measures how spread out the distribution of $R$ is around its mean.

*The IQ Example*

Suppose that, in addition to the national average IQ being 100, we also know the
standard deviation of IQ's is 10. How rare is an IQ of 300 or more?

Let the random variable, $R$, be the IQ of a random person. So $EE[R] = 100$,
$sigma_R = 10$ and $R$ is nonnegative. We want to compute $Pr[R >= 300]$.

We have already seen that Markov's Theorem gives us a coarse bound, namely,

$
Pr[R >= 300] <= 1/3
$

Now we apply Chebyshev's Theorem to teh same problem.

$
Pr[R>=300] = Pr[abs(R-100)>=200] <= (Var[R])/(200^2) = (10^2)/(200^2) = 1/400
$

So Chebyshev's Theorem implies that at most one person in four hundred has an IQ
of 300 or more. We have gotten a much tighter bound using additional
information---the variance of $R$---than we could get knowing only the
expectation.

