#import "preamble.typ": *
#set heading(numbering: "1.")

== Recap

- For events $E, F$, we wish to compute $P[E | F]$. The probability of the event
  $E$ conditioned on (given that) $F$.
  - *Approach 1*: With conditioning, $F$ can be interpreted as the _new sample
    space_ such that for $omega in.not F, P[omega | F] = 0$.
  - *Approach 2*: $P[E|F] = (P[E inter F])/(P[F])$.
- Multiplication rule: For events $E_1, E_2, dots, E_n$, $P[E_1 inter E_2 inter
  dots inter E_n] = P[E_1] P[E_2|E_1] P[E_3|E_1 inter E_2] dots P[E_n|E_1 inter
  E_2 inter dots inter E_(n-1)]$.

*Tree diagrams*

- Helpful in calculating probabilities in sequetial process (E.g. throw one
  dice, followed by another).
- In a tree diagram, edge-weights correspond to conditonal probabilities and
  leaf nodes correspond to outcomes.
- The probability of an outcome can be calculated by multiplying the relevant
  probabilities along a path.

= The Monty Hall problem

*Q:* Suppose you're on a game show, and you're given the choice of three doors.
Behind one door is a car, behind the others, goats. You pick a door, say A, and
the host, who knows what's behind the doors, opens another door, say C, which
has a goat. He says to you, "Do you want to pick door B?" Is it your advantage
to switch your choice of doors?

- The car is equally likely to be hidden behind each of the three doors.
- The player is _equally likely_ to pick each of the three doors, regardless of
  the car's location. 
- After the player picks a door, the host must open a different door _with a
  goat behind it_ and offer the player the choice of staying with the original
  door or switching
- If the host has a choice of which door to open, then he is equally likely to
  select each of them.

#image("MontyHallDiagram.png", width: 50%)

Taking a look at the given tree diagram, we can take an event $E$ to be the
event where switching doors is advantageous.

$
E = "Switching wins" = {(A, B, C ), (A, C , B), (B, A, C ), (B, C , A), (C , A, B), (C , B, A)}
$

$
P[(A, A)] = P["Car is at A" inter "Player picks A"] \
= P["Player picks A" | "Car is at A"] P["Car is at A"] = 1/3 1/3 = 1/9\
P[(A, A, B)] = P["Door B is revealed" inter A A] = P["Door B is revealed" | A A]
P[A A] = 1/2 1/9 = 1/18
$

Therefore,
$
P[E] = Pr[(A, B, C )] + Pr[(A, C , B)] + Pr[(B, A, C )] +\
Pr[(B, C , A)] + Pr[(C , A, B)] + Pr[(C , B, A)] = 1/9 times 6 = 2/3
$

*Q:* What is the probability of winning by switching if we pick door A and door
B is opened?

$
(P[(C, A, B)])/(P[{(C, A, B), (A, A, B)}]) = (1/9)/(1/18 + 1/9) = 2/3
$

This follows for any two doors.
