= Counting Recap

*Product Rule:* For sets $A_1, A_2, dots, A_m, |A_1 
times A_2 times dots times A_m| = product_(i=1)^m |A_i| $

*Sum Rule:* If $A_1, A_2, dots, A_m$ are *disjoint* sets, then, $|A_1 union A_2
union dots union A_m| = sum_(i=1)^m |A_i|$

== Counting Sequences using the Generalized Product Rule

*Question 1:*
Suppose we have $p$ prizes to be handed amongst the set $A$ of $n$ students.
What are the number of ways in which we can distribute the prizes?

For each of the $p$ prizes, we can give it to any of the $n$ students in $A$. We
have $n$ choices for each prize, therefore the number of ways in which we can
distribute the prizes is $n times n times dots times n = n^p$.

In other words, what is the number of ways in which we can distribute a set of 
distint prizes can be distributed amongst another set of distinct students,
where a student may be given zero, one or more than one prizes?

*Question 2:*
Suppose we have $p$ prizes to be handed amongst the set $A$ of $n$ students.
What are the number of ways in which we can distribute the prizes such that each
prize is given to a different student? Assume that $n >= p$.

For the first prize, we can give it to any of the $n$ students in $A$. For the
second prize, we can give it to any of the $n-1$ students in $A$, and so on. We
can generalize this to say:

$ n times (n-1) times dots times (n-p+1) = C(n,p) = n!/((n-p)!) $

// In other words, what is the number of ways in which we can distribute a set of 

*Generalized Product Rule:*
If $S$ is the set of length $k$ sequences, such that the first entry can be
selected in $n_1$ ways, after the first entry is chosen, the second one can be
chosen in $n_2$ ways, and so on, then $|S| = n_1 times n_2 times dots times
n_k$. If $n_1 = n_2 = dots = n_k = n$, then we recover the product rule.

== Counting - Example

*Q:* A dollar bill is "defective" if some digit appears more than once in the
8-digit serial number. What is the fraction of non-defective bills?

In order to compute the fraction of non-defective bills, we need to compute the
quantity 
$ (|"serial numbers with all different digits"|)/(|"possible serial numbers"|) $
For computing |possible serial numbers|, each digit can be one of 10 numbers,
hence, using the product, rule |possible serial numbers| = $10^8$.

To compute |serial numbers with all different digits|, the first digit can be
one of 10 numbers. Once the first digit is chosen, the second one can be chosen
in 9 ways, and so on. By the generalized product rule, |serial numbers with
all different digits| $= 10 times 9 times ... times 3 = 10!/(2!) = 1,814,400$.

The fraction of non-defective bills is $1,814,400/10^8 = 1.8144%$.

= Permutations

A permutation of a set $S$ is a sequence of length $|S|$ that contains every
element of $S$ exactly once. Permutations of ${a,b,c}$ are $(a,b,c), (a,c,b)...$

*Q:* Given a set of size $n$, what is the total number of permutations?

Considering a sequence of length $n$, the first entry can be chosen in $n$ ways.
Since each element can only be chosen once, the second entry can be chosen in 
$n-1$ ways, and so on. By the generalized product rule, the number of
permutations is $n times n-1 times dots times 1 = n!$.

*Factorial:* $n! := n times (n-1) times dots times 1$. By convention, $0! = 1$.

How big is $n!$ ? The stirling approximation for $n!$ is $n! approx sqrt(2 pi n)
(n/e)^n$. This approximation is exponential in $n$, meaning the order of $n!$
grows exponentially with $n$.

*Q:* Which is bigger? $n!$ or $n(n-1)(n+2)(n-3)!$?

$n! = n times (n-1)! = n times (n-1) times (n-2) times (n-3)!$

Comparing the two, you can cancel out $n, (n-1) "and" (n-3)!$ from each side,
and you're left with $(n-2)$ vs. $(n+2)$. Therefore, the right hand side is
larger.

*Q:* In how many ways can we arrange $n$ people in a line?

$n!$, because this question is equivalent to asking "how many permutations of a
set of size $n$ are there?"

= Division Rule

A $k$-to-1 function maps exactly $k$ elements of the domain to every element of
the codomain.

If $f: A -> B$ is a $k$-to-1 function, then, $|A| = k|B|$. i.e. the number of
elements in $A$ is exactly $k$ times the number of elements in $B$, because
there exists exactly $k$ elements that map to each element of $B$.

Example: $E$ is the set of ears in this room, and $P$ is the set of people. Then
$f$ mapping the ears to people is a 2-to-1 function. Hence, $|E| = 2|P|$.

*Q:* if $f : A -> B$ is a $k$-to-1 function, and $g: B->C$ is a $m$-to-1 
function, then what is $(|A|)/(|C|)$?

$|A| = k|B|$, and $|B| = m|C|$. Therefore, $(|A|)/(|C|) = k m$.

*Q:* if $f : A -> B$ is a $k$-to-1 function, and $g: C->B$ is a $m$-to-1, then
what is $(|A|)/(|C|)$?

$|A| = k|B|$, and $|C| = m|B|$. $(k|B|)/(m|B|) = k/m$.

= Arrangements around a Round Table

*Q:* In how many ways can we arrange $n$ people around a round table? Two
seatings are considered to be the same _arrangement_ if each person sits with
the same person on their left in both seatings.

The number of seatings is $n!$ (permutations of $n$ people vs $n$ seat numbers).

You may create $n$ identical arrangements for each seating by rotating the seat
numbers once clockwise. Therefore, the number of seatings is $n times$ the
number of arrangements. You can then say that $f: S -> A$ is an $n$-to-1
function where $S$ is the set of seat numbers, and $A$ is the set of
arrangements. Therefore, $|S| = n|A| -> |A| = n!/n = (n-1)!$.

You can also think of it as something like this: To create a unique seating (an
arrangement), you need to fix one person to kill rotational symmetry. One choice
is taken away from us, and therefore we have (n-1) choices left, which is $n-1!$.

// The number of arrangements is $(n-1)!$, since you need to make one unique
// seating pair to create a unique arrangement.
