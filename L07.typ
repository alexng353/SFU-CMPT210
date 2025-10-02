#let implies = sym.arrow.r.double.long
Skipped the review section.

= Uniform Probability Spaces

A probability space is uniform of $forall omega in S : P[omega] = 1/(|S|)$. i.e.
the probability of every outcome is equal.

*Example:* For a standard die, $S={1,2,3,4,5,6}; P[1] = P[2] = P[3] = P[4] = P[5] = P[6] = 1/6$
- $P[E] = sum_(omega in E) P[omega] = |E| P[omega] = (|E|)/(|S|)$
*Example:* For a standard die, if $E={3,6}, "then" P[E] = (|E|)/(|S|) = 1/3$

Hence, for a uniform probability space, computing the probability is equivalent
to counting the number of outcomes we "care" about.

== Back to throwing dice

*Q:* Suppose we have a loaded die, such that the probability of rolling an even
number is twice that of getting an odd number. What is the probability of
getting a 6?

Let $p$ be the probability of getting an odd number. Probability of getting an
even number is $2p$. $sum_(omega in S) P[omega] = 3p + 3(2p) = 1 implies p =
1/9$

*Q:* What is the probability that we get either a 3 or a 6?
- $E={3,6}$, so $P[E] = 2p + p = 3p; p = 1/9 implies P[E] = 3/9 = 1/3$
*Q:* What is the probability that we get a prime number?
- $E={2,3,5} implies P[E] = 2p + p + p implies P[E] = 4/9$

= Probability Examples

== Card Counting
*Q:* Suppose we select a card at random from a standard deck of 52 cards. What
is the probability of getting:

- A spade
  - $1/4$
- A spade face card
  - $1/4 * 3/13 = 3/52$
- A black card
  - $1/2$
- The queen of hearts
  - $1/52$
- An ace
  - $4/52$


== Exam Scores

*Q:* A class consists of 6 men and 4 women. An exam is given and the students
are ranked according to their performance. Assuming that no two students obtain
the same scores and all rankings are considered equally likely, what is the
probability that women receive the top 4 scores?

Let $S$ be the set of all possible rankings

Let $E$ be the set of all rankings where the four women have the top 4 scores

$|S| = 10!$

$E = {w_1, w_2, w_3, w_4, m_1, m_2, m_3, m_4, m_5, m_6}$

$ |E| = (4! 6!) $

$ P[|E|] = (4! 6!)/(10!) $ 

== Exam Scores (2)
*Q:* A class consists of $m$ men and $w$ women. An exam is given and the students
are ranked according to their performance. Assuming that no two students obtain
the same scores and all rankings are considered equally likely, what is the
probability that women receive the top $t <= w$ scores?

$S$ is the set of all possible rankings, $E$ is the set of all rankings where
$w$ women receive the top $t <= w$ scores.

$ 
|S| = (m+2)!\
|E| = (binom(w, t) times t!) times (m+w-t)!\
implies P[E] = (|E|)/(|S|) = (binom(w,t) times t! times (m+w-t)!)/(m+w)!
$

== Committee
*Q:* A committee of size 5 is to be selected from a gropu of 6 CS and 9 Math
students (no double majors). If the selection is made randomly, what is the
probability that the committee consists of 3 CS and 2 Math students?

Let $S$ be the set of all possible committees. Let $E$ be the set of all
possible committees where the committee consists of 3 CS and 2 Math students.

$
|S| = binom(15, 5)\
|E| = binom(6, 3) times binom(9, 2)\
P[E] = (|E|)/(|S|) = (binom(6, 3) times binom(9, 2))/binom(15, 5)
$

== Gambling

*Q:* From a set of $n$ items a random sample of size $k$ is selected (all
selections are equally likely). What is the probability that the sample contains
a given item $alpha$?

$|K| = binom(n, k)$

If we fix an item into the sample, the number of ways to select the other items
is $binom(n-1, k-1)$. Hence, the probability that $alpha$ is among the $k$
selected is $binom(n-1, k-1)/binom(n, k) = k/n$

*Q:* From a set of $n$ items, a random sample of size $k$ is to be selected.
Given two items of interest, $alpha$ and $beta$, what is the probability that:

+ $alpha$ and $beta$ are selected
  - If we want both $alpha$ and $beta$ to be selected, the number of ways to
    choose the other items is $binom(n-2, k-2)$. Therefore, the probability that
    both $alpha$ and $beta$ are selected is $binom(n-2, k-2)/binom(n, k) =
    (k(k-1))/(n(n-1))$
+ At least one of $alpha$ and $beta$ is selected
  - Let $A$ be the event that item $alpha$ is selected. $P[A] = k/n$. Similarly,
    $B$ is the event that item $beta$ is in the selection. $P[B] = n-k/n$. By
    the inclusion-exclusion rule, $P[A union B] = P[A] + P[B] - P[A inter B]$.
    Hence, the probability that one of $alpha$ and $beta$ is selected is
    $(2k)/n - (k(k-1))/(n(n-1))$
+ neither $alpha$ nor $beta$ are selected
  - Number of ways to choose the other items is $binom(n-2, k)$. Therefore, the
    probability that neither $alpha$ nor $beta$ are selected is $binom(n-2, k)/
    binom(n, k) = ((n-k)(n-k-1))/(n(n-1))$

= Questions

*Q:* There are 75 students in a class. What is the probability that two students
have their birthday in the same week?
- $P[w] = 1$, by the pigeonhole principle $75 > 52$, therefore there must be at
  least two students with the same birthday week.

*Q:* In this class, what is the probability that two students share the same
birthday? We'll order the students according to their ID. A birthday sequence is
(11 Feb, 23 April, ...). First, let's count the number of possible birthday
sequences. 

Let $S$ be the set of all possible birthday sequences.

$|S| = 365^75 approx 1.48 times 10^192$

We will apply the complement method to find the probability that two students
share the same birthday. Let us compute the probability of the event that *no
two students share the same birthday*.

$P[E] = 1 - P[E^C]: E^C = $ the probability that no two students share the same
birthday.

$P[E^C] = (|E^C|)/(|S|)$ which is a uniform probability space.

We need to count E complement.

$
|E^C| = d times (d-1) times (d-2) dots (d-(n-1))\
implies P[E^C] = (d times (d-1) times (d-2) dots (d-(n-1)))/(d^n)\
= d/d times (d-1)/d times (d-2)/d dots (d-(n-1))/d\

$

