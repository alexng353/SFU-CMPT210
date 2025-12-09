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

= Sums of Random Variables

If all you know about a random variable is its mean and variance, then
Chebyshev's Theorem is the best you can do when it comes to bounding the
probability that the random variable devaites from its mean. In some cases,
however, we know more---for example, that the random variable has a binomial
distribution---and then it is possible to prove much stronger bounds. Instead of
polynomially small bounds such as $1/(c^2)$, we can sometimes even obtain
exponentially small bounds such as $1/(e^c)$. As we will soon discover, thisis
the case whenever the random variable $T$ is the sum of $n$ mutually independent
random variables, $T_1, T_2, dots, T_n$, where $0<=T_i<=1$. A random variable
with a binomial distribution is just one of many examples of such a $T$. Here is
another.

== A Motivating Example

Fussbook is a new social networking site oriented toward unpleasant people. Like
all major web services, Fussbook has a load balancing problem: it receives lots
of forum posts that computer servers have to process. If any server is assigned
more work than it can complete in a given interval, then it is overloaded and
system performance suffers. That would be bad, because Fussbook users are _not_
a tolerant bunch. So balancing the work load across multiple servers is vital.

If the length of every task were known in advance, then finding a balanced
distribution would be much easier. However, task lengths are not known in
advance, which is typical of workload patterns in the real world. 

The programmers of Fussbook gave up and just randomly assigned posts to
computers. Imagine their surprise when the system stayed up and hasn't crashed
yet!

As it turns out, random assignment not only balances the load reasonbly well,
but also permits provable performacne guarantees. In general, a randomized
approach to a problem is worth considering when a deterministic solution is hard
to compute or requires unavailable information.

Specifically, Fussbook receives 24,000 forum posts in every 10-minute interval.
Each post is assigned to one of serveral servers for processing, and each server
works sequentially through its assigned tasks. It takes a server an average of
$1/4$ seconds to process a post. Some posts, such as pointless grammar critiques
and snide witticisms, are easier, but no post---not even the most protracted
harangues---takes more than one full second.

Measuring workload in seconds, this means a server is overloaded when it is
assigned more than 600 units of work in a given 600 second interval. Fussbook's
average processing load of $24,000 dot 1/4 = 6,000$ seconds per interval would
keep 10 computers running at 100% capacity with perfect load balancing. Surely,
more than 10 servers are needed to cope with random fluctuation in task length
and imperfect load balance. But would 11 be enough? ... or 15, 20, 100? We'll
answer that question with a new mathematical tool.

== The Chernoff Bound

The Chernoff bound is a hammer that you can use to nail a great many problems.
Roughly, the Chernoff bound says that certain random variables are very unlikely
to significantly exceed their expectation. For example, if the expected load on
a processor is just a bit below its capacity, then the processor is unlikely to
be overloaded, provided the conditions of the Chernoff bound are satisfied. 

More precisely, the Chernoff Bound says that _the sum of lots of little,
independent random variables is unlikely to significantly exceed the mean of the
sum._ The Markov and Chebyshev bounds lead to the same kind of conclusion but
typically provide much weaker bounds. In particular, the Markov and Chebyshev
bounds are polynomial, while the Chernoff bound is exponential. 

Here is the theorem. The proof will come later in Section 19.6.6.

*Theorem 19.6.1* (Chernoff Bound). _Let $T_1, T_2, dots, T_n$ be mutually
independent random variables such that $0<=T_i<=1$ for all $i$. Let $T = T_1 +
dots + T_n$. Then for all $c>=1$,_

$
Pr[T>=c EE[T]] <= e^(-Beta (c) EE[T])
$

_where $Beta(c) := c ln c - c + 1$_

The Chernoff bound applies only to distributions of sums of independent random
variabels that take on values in the real interval $[0,1]$. The binomial
distribution is the most well-known distribution taht fits these criteria, but
many others are possible, because the Chernoff bound allows the variables in the
sum to have differeing, arbitrary, or even unknown distributions over the range 
$[0,1]$. Furthermore, there is no direct dependence on either the number of
random variables in the sum or their expectations. In short, the Chernoff bound
gives strong results for lots of problems based on little information.
