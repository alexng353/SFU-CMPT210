#let implies = sym.arrow.r.double.long

== Recap

- *Sample Space $S$:* A countable set of possible outcomes
- *Outcome $w in S$:* A possible "thing" that can happen
- *Event $E$:* A subset of the sample space. E.g., $E = {6}$ or $E = {3, 6}$

= Event Operations

== Union of Events

- Since the event $E$ is a set, all set theory operations are available.
- Suppose $E,F in S$. The union $E union F$ consists of outcomes that are either
  in $E$ or in $F$ (standard union operation). Formally:
$ G = E union F = { w : w in E or w in F } $
I.e., $G$ ocdurs if either $E$ or $F$ ocurrs.
- We can define the union between more than two events in the same way we
  defined union between more than two sets. $G = E_1 union E_2 union ... union
E_n$ "happens" when _at least one_ of the events $E_i$ ocurrs.

== Intersection of Events

- We define the intersection in a similar way:
$ G = E inter F = { w : w in E and w in F } $
- "$G$ occurs if both $E$ and $F$ occur."

== Mutually Exclusive and Complement Events

- *Mutually Exclusive:* If $E,F$ are two events such that $E inter F =
  emptyset$, then $E$ and $F$ are mutually exclusive.
- *Complement:* If $E$ is an event, then $E^c$ is defined such that 
  $E union E^c = S$ and $E^c inter E = emptyset$.
  - Example: We threw one dice and want to get a 6. $E = {6}$ and $E^c = {1,2,3,4,5}$
- Two complement events are mutually exclusive, but two mutually exclusive
  events are not necessarily complements of each other. 
- Subset: If $E subset F$, then $E implies F$.

= Axioms of Probability

- *Probability Function:* A _total function_ $P : S -> [0,1]$
$ forall w in S, 0 <= P[w] <= 1 ; sum_(w in S) P[w] = 1 $
- *Probability Space:* The outcome space $S$ together with the probability
  function
- *Union:* For mutually exclusive events, $E_1, E_2, ..., E_n$, (i.e. sets $E_i$
  are disjoint), then $P[E_1 union E_2 union ... union E_n] = P[E_1] +
P[E_2] + ... + P[E_n]$

There's a proof for this but I'm lazy so I'll just say it's the sum rule.

== Back to Throwing Dice
*Q:* Suppose we throw a standard dice. What is the probability that the number
that comes up is 6
$
S = {1,2,3,4,5,6}\ 
P[1] = P[2] = P[3] = P[4] = P[5] = P[6]\
P[S] = 1 implies sum_(w in S) P[w] = 1\
implies P[6] = 1/6
$

*Q:* Suppose we throw a standard dice, what is the probability that we get
either a 3 or a 6?

$
E = {3}, F = {6}, G = E union F = {3,6}\
E inter F = emptyset\
implies E "and" F "are mutually exclusive"\
implies P[G] = P[E] + P[F] = 1/6 + 1/6 = 1/3
$

= Probability Rules

- *Complement Rule:* $P[E] = 1 - P[E^c]$
- *Inclusion-Exclusion Rule:* For any two events $E,F, P[E union F] = P[E] +
  P[F] - P[E inter F]$
- *Union Bound:* For any two events $E, F, P[E union F] <= P[E] + P[F]$
  - For any events $E_1, E_2, ..., E_n$,
$ P[E_1 union E_2 union ... union E_n] <= sum_(i=1)^n P[E_i] $
- *Monotonicity Rule:* For events $A$ and $B$, if $A subset B$, then $P[A] <
  P[B]$
