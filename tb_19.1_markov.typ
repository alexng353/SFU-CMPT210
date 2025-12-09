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

The most important reason to care about the mean value comes from its connection
to estimation by sampling. If we want to measure a population, we first
determine a random process for selecting people. This process makes the person's
age, income, and so on a random variable whose _mean_ equals the _actual
average_ age or income of the population. So, we can select a random sample of
people and calculate the average of people in the sample to estimate the true
average in the whole population. 

= Markov's Theorem
gives a generally coarse estimate of the probability that a random value takes a
value _much larger_ than its mean. The idea can be explained by considering the
idea behind the  _intelligence quotient_ (IQ). IQ is defined to have an average
measurement of 100. This implies that at most 1/3 of the population can have an
IQ of 300 or more, because if more than a third had an IQ of 300, then the
average would have to be more than $1/3 times 300 = 100$. So, the probability
that a randomly chosen person has an IQ of 300 or more is at most 1/3. By the
same logic, we can also conclude that at most 2/3 of the population can have an
IQ of 150 or more. 

Of course, these are not very strong conclusions. No IQ of over 300 has ever
been recorded; and while many IQ's of over 150 have been recorded, the fraction
of the population that actually has an IQ that high is very much smaller than
2/3. But though these conclusions are weak, we reached them just using the fact
that the average IQ is 100 --- along with another fact we took for granted: IQ
is never negative. Using only these facts, we can't derive smaller fractions,
because there are nonnegative random variables with mean 100 that achieve these
fractions. For example, if we choose a random variable equal to 300 with
probability 1/3 and 0 with probability 2/3, then its mean is 100, and the
probability of a value of 300 or more really is 1/3. 

*Theorem 19.1.1* (Markov's Theorem). _If $R$ is a nonnegative random variable,
then for all $x > 0$_

$
Pr[R>=x] <= EE[R]/x
$

Our focus is deviation from the mean, so it's useful to rephrase Markov's
Theorem this way:

*Corollary 19.1.2.* _If $R$ is a nonnegative random variable, then for all $c >= 1$_

$
Pr[R>=c times EE[R]] <= 1/c
$

This corollary follows immediately from Markov's Theorem by letting $x = c times
EE[R]$.

== Applying Markov's Theorem

(A reference to #sym.section\18.5.2 of the textbook is made here.)

In the hat-check problem, we ask what the probability is that $x$ or more men
get the right hat, i.e. what the value of $Pr[G>=x]$ is.

  We can compute an upper bound with Markov's Theorem. Since we know $EE[G] =
1$, Markov's Theorem implies

$
Pr[G>=x] <= EE[G]/x = 1/x
$

For example, there is no greater than a 20% chance that 5 men get the right hat,
regardless of the number of people at the dinner party.

The Chinese Appetizer problem is similar to the Hat-Check problem. In this case,
$n$ people are eating different appetizers arranged on a lazy susan. Someone
spins the tray so that each person receives a random appetizer. What is the
probability that everyone gets the same appetizer as before?

There are $n$ equally likely orientations for the tray after it stops spinning.
Everyone gets the right appetizer in just one of these $n$ orientations.
Therefore, the correct answer is $1/n$. But what probability do we get from
Markov's Theorem? Let the random variable, R, be the number of people that get
the right appetizer. Then of course, $EE[R] = 1$, so applying Markov's Theorem,
we find:

$
Pr[R >= n] <= EE[R]/n = 1/n
$

In this rare case, Markov's Theorem is precisely correct. However, in most other
cases, Markov's Theorem will not be so accurate. For example, it gives the same
$1/n$ bound for the probability that everyone gets their own hat back in the
Hat-Check problem, where the probability is atually $1/(n!)$. So for Hat-Check,
Markov's Theorem gives a probability bound that is way too large.

== Markov's Theorem for Bounded Variables

Suppose we learn that the average IQ among MIT students is 150. What can we say
about the probability that an MIT student has an IQ of more than 200? Markov's
theorem immediately tells us that no more than $150/200$ or $3/4$ of the
students can have such a high IQ. Here, we simply applied Markov's Theorem to
the random variable, $R$, equal to the IQ of a random MIT student to conclude:

$
Pr[R >= 200] <= EE[R]/200 = 3/4
$

But let's observe an additional fact (which may be true): no MIT student has an
IQ less than 100. This means that if we let $T := R - 100$, then $T$ is
nonnegative and $EE[T] = 50$, so we can apply Markov's Theorem to $T$ and
conclude:

$
Pr[R > 200] = Pr[T>100] <= EE[T]/100 = 1/2
$

So only half, not $3/4$, of the students can be as amazing as they think they
are. We can generalize this to get better bounds applying Markov's Theorem to
$R-b$ instead of $R$ for any lower bound $b$ on $R$. Similarly, if we have any
upper bound, $u$, on a random variable, $S$, then $u -S$ will be a nonnegative
random variable, and applying the theorem to $u-S$ will allow us to bound the
probability that $S$ is much _less_ than its expectation.
