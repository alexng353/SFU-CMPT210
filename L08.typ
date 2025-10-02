#import "preamble.typ": *
#set heading(numbering: "1.")
= Conditional Probability

*Conditioning* is revising probabilities based on partial informatino (an
event).

*Q:* Suppose we throw a standard die: what is the probability of getting a 6 if
we are told that the outcome is even?

We wish to compute $P(6 | "even")$, or the probability of getting a 6 given that
the outcome is even, or the probability of a 6 _conditioned on the event that
the outcome is even_.

$S = {1, 2, 3, 4, 5, 6}, E = {6}$. Additional information tells us that $F = {2,
4, 6}$ has occurred. With conditioning on $F$, the new sample space $S' = F =
{2,4,6}$.

Since each outcome in $S'$ is equally likely, it is still a uniform probability
space. Hence, conditioned on the event that the outcome is even, $sum_(omega in
S') P[omega] = 1 implies P["even"] = 1/3, P["odd"] = 0 implies P[6] = 1/3$.

*Q:* What is the probability of getting either a 3 or 6 if the outcome is even? 

$E = {3, 6}, F={2,4,6}$. 

$P[6] = 1/3, P[3] = 0, P[E] = P[6] + P[3] = 1/3 + 0 = 1/3$

*Q:* Suppose we throw two standard dice, one after the other. What is the
probability that the sum of the dice is 6?

If $D$ is the sample space of a single die, then $S = D^2$ is a two-dimensional
tuple space $S = {(1,1), (1,2) dots}$. The event $E$ consists of all outcomes
such that the sum of the dice is 6. $E = {(1,5), (2,4), (3,3), (4,2), (5,1)}$.
Since all outcomes are equally likely, the probability of $E$ is $5/36$.

*Q:* Suppose I tell you that the first dice came up 4. Given this information,
what is the probability that the sum of the dice is 6? 

Let $F$ be the event that the first dice came up 4. $P[E | F]$ is the
probability that the sum of the dice is 6 conditioned on the event that the
first dice came up 4. 

The new sample space $S' = F = {(4,1), (4,2), dots}$. For this new probability
space, $E={(4,2)}$. Therefore, $P[E | F] = (|E|)/(|S'|) = 1/6$.

== Condtional Probability Rule

For two events $E$ and $F$, $P[E | F] = (P[E inter F])/(P[F]), F eq.not 0$.

_Proof:_ Conditioning on $F$ implies that the only outcomes we care about are in
$F$. i.e. for $omega in.not F, P[omega | F] = 0$.

Since we want to compute the probability that $E$ happens, we care about the
outcomes that are in $E$. Hence, the outcomes we care about lie in both $E$ and
$F$, meaning that $omega in E inter F implies P[E|F] = c sum_(omega in (E inter
F)) P[omega] implies c = 1/(sum_(omega in (E inter F)) P[omega])$.

The probability of $F$ given $F$ is 1. Therefore, $sum_(omega in F) P[omega] = P[F]$.

We can substitute the value of $c$:

$ P[E|F] = (sum_(omega in (E inter F)) P[omega])/(sum_(omega in F) P[omega]) =
(P[E inter F])/(P[F]), "where" P[F] eq.not 0 $

== Back to throwing dice

*Q:* Suppose we throw two standard dice one after the other. What is the
probability that the sum of the dice is 6 given that the first dice came up 4?

== Multiplication Rule

For events $E_1, E_2, E_3, P[E_1 inter E_2 inter E_3] = 
P[E_1]P[E_2|E_1]P[E_3|E_1 inter E_2]$

_Proof:_

$ 
P[E_1]P[E_2|E_1]P[E_3|E_1 inter E_2] = P[E_1] 
(P[E_2 inter E_1])/(P[E_1])
(P[E_3 inter E_1 inter E_2])/(P[E_1 inter E_2])
= P[E_1 inter E_2 inter E_3]
$

We can order the events in any way we want to compute teh probability more
easily.

$
P[E_1 inter E_2 inter E_3] = P[E_2] P[E_3|E_2] P[E_1|E_2 inter E_3]
$

And we can extend this rule to any number of events.

$
P[E_1 inter E_2 inter dots inter E_n] = P[E_1] P[E_2|E_1] P[E_3|E_1 inter E_2] dots
P[E_n|E_1 inter E_2 inter dots inter E_(n-1)]
$

=== Examples

*Q:* The organization that Jones works for is running a father-son dinner for
those employees having at least one son. Each of these employees is invited to
attend along with his youngest son. If Jones is known to have two children, what
is the conditional probability that they are both boy sgiven that he is invited
to the dinner? Assume that the space $S$ is given by $S = {(b,b), (b,g), (g,b),
(g,g)}$ and all outcomes are equally likely.

Jones is invited to the dinner $implies$ he has at least one son $implies$ $F =
{(b,b), (b,g), (g,b)}$. The event $E$ we are interested in is the event that
both of his children are boys $E = {(b,b)}$.

$ P[E|F] = (P[E inter F])/(P[F]) = (1/4)/(3/4) = 1/3 $

*Q:* Ms. Perez figures that there is a 30% chance that her company will set up a
branch office in Phoenix. If it does, she has a 60% chance that she will be made
manager of this new operation. What is the probability that there will be a
branch in Phoenix and Perez will be its manager?

$E=$ Perez will be Manager; $F=$ branch office in Phoenix; $E inter F = $ Perez
will be an office manager in the Phoenix branch.

$ P[F] = 0.3, P[E|F] = 0.6 implies P[E inter F] = P[E] P[E|F] = 0.3 times 0.6 =
0.18 $

*Q:* Suppose we have a bowl containing 6 white and 5 black balls. If we randomly
draw a ball, what is the probability that it is black?

$E = $ ball is black. $S = $ bowl containing 6 white and 5 black balls.

$ P[E] = (|E|)/(|S|) = 5/11 $

*Q:* If we randomly draw two balls, one after the other (without putting the
first back), what is the probability that we:

+ Draw a black ball followed by a white ball\
  $P[B_1] = 5/11, P[W_2|B_1] = 6/10 implies P[B_1 inter W_2] = P[B_1]P[W_2|B_1]
= 30/110 = 3/11$
+ Draw a white ball followed by a black ball\
  $P[W_1] = 6/11, P[B_2|W_1] = 5/10 implies P[W_1]P[B_2|W_1] = 3/11$
+ Draw one black ball and one white ball
  
+ Draw two black balls
+ Draw two white balls


