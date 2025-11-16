#import "preamble.typ": *
#set heading(numbering: "1.")

= More Conditional Probability

*Q:* A test for detecting cancer has the following accuracy 
+ if a person has cancer, there is a 10% chacne that the test will say that the
  person does not have it. This is called a "false negative."
+ If a person does not have cancer, there is a 5% chance that the test will say
  that the person does have it. This is called a "false positive."

For patents that have no family history of cancer, the incidence of cancer is
1%. Person X does not have any family history of cancer, but is detected to have
cancer. What is the probability that the Person X dose have cancer?

$S = {("Healthy", "Positive"), ("Healthy", "Negative"), ("Sick", "Positive"),
("Sick", "Negative")}$

$A$ is the event that Person X has cancer. $B$ is the event that the test is
positive.

$
P[A|B] = (P[A inter B])/(P[B]) = (P[{(S, P)}])/(P[{(S, P), (H,P)}]) =
0.0090/(0.0090+0.0495) approx 15.4%
$

Bayes Rule

For events $E$ and $F$ if $P[E] eq.not 0 "and" P[F] eq.not 0$, then $P[E|F] =
(P[E|F]P[F])/P[E]$

_Proof:_ Using the formula for conditional probability,

#image("BayesProof.png")

= The Law of Total Probability and Bayes rule

For events $E "and" F, P[E] = P[E|F]P[F] + P[E|F^c]P[F^c]$

_Proof:_

$
E = (E inter F) union (E inter F^c)\
implies P[E] = P[(E inter F) union (E inter F^c)] = P[E inter F] + P[E inter
F^c]\
P[E] = P[E|F]P[F] + P[E|F^c]P[F^c]\
$

+ Apply the union rule for mutually exclusive events.
+ By the definition of conditional probability.

If we *combine* bayes rule and the Law of Total Probability, we get

$P[F|E] = (P[F inter E])/(P[E]) = (P[E|F]P[F])/P[E]$ #" " (By definition of
conditional probability)

$P[F|E] = (P[E|F]P[F])/(P[E|F]P[F] + P[E|F^c]P[F^c])$ #" " (By the law of total
probability)

*Q:* Provce that for events $E$ and $F$, $P[E^c|F] = 1 - P[E|F]$.

_Proof:_ Since $E union E^c = S$, for any event $F$ s.t. $P[F] eq.not 0$,

$
(E union E^c) inter F = S inter F = F\
(E union E^c) inter F = (E inter F) union (E^c inter F)\
implies P[(E inter F) union (E^c inter F)] = P[F]
$

Since $E inter F$ and $E^c inter F$ are mutually exclusive,

$
P[E inter F] + P[E^c inter F] = P[F] implies (P[E^c inter F])/(P[F]) = 1-(P[E
inter F])/(P[F])\
implies P[E^c|F] = 1 - P[E|F]
$

*Q:* 
