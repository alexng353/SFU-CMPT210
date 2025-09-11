#let iff = sym.arrow.l.r.double.long
#let implies = sym.arrow.r.double.long
#let impliedby = sym.arrow.l.double.long

Instructor: Sharan Vaswani
- Email: sharan_vaswani\@sfu.ca
- Office Hours: Tuesday, 2:30-3:30 pm (TASC1-8221)

Textbooks: 
+ https://people.csail.mit.edu/meyer/mcs.pdf
+ Introduction to Probability and Statistics for Engineers and Scientists (Ross).

= Sets

Informal definition: An unordered collection of distnict objects (elements).
Examples: ${a,b,c}, {{a,b}, {c,a}}, {1.2,2.5}, {"yellow", "red", "green"},
{x | x "is a capital of a North American country"}, {x|x "is an integer in" [5,
10]}$

An element may not appear twice: ${a,a,b} = {a,b}$

Unordered: ${a,b} = {b,a}$

$C = {x|x "is a color of the rainbow"}$

*Elements* of C: $\{
 "red",
 "orange",
 "yellow",
 "green",
 "blue",
 "indigo",
 "violet"
\}$

*Membership*: $"red" in C, "brown" in.not C$

*Cardinality*: Number of elements: $|C| = 7$

== Common Sets

- $emptyset$: The Empty set
- $NN$: Natural numbers ${0,1,2,...}$
- $ZZ$: Integers ${-2, -1, 0, 1, 2, ...}$
- $QQ$: Set of rational numbers that can be expressed as $p/q$ where $p,q in ZZ
  and q eq.not 0$ --- ${-10.1, -1.2. 0, 5.5, 15,...}$
- $RR$: Real numbers
- $CC$: Complex numbers

Set Comparison: $A$ is a subset of $B iff$ every element of
$A$ is also an element of $B$

$A$ is a _proper subset_ of $B iff A$ is a subset of $B$
and $A eq.not B$

== Set Operations

*Union*: The union of two sets $A,B$ consists of elements appearing in $A$ or
$B$. If $A = {1,2,3}$ and $B = {3,4,5}$, then $A union B = {1,2,3,4,5}$

*Intersection*: The intersection of two sets $A,B$ consists of elements that
appear in both $A$ and $B$. If $A = {1,2,3}$ and $B = {3,4,5}$, then 
$A inter B = {3}$

*Set Difference*: The set difference of $A,B$ consists of all elements that are
in $A$, but not in $B$. If $A = {1,2,3}$ and $B = {3,4,5}$, then $A without B =
B-A = {4,5}$

*Complement*: Given a domain (or universe) $D$ such that $A subset D$, the
complement of $A$ consistes of all elememnts that are not in $A$.

$ D = NN, A = {1, 2, 3}, A subset D and overline(A) = {0, 4, 5, 6, ...} $

$ A union overline(A) = D, A inter overline(A) = emptyset, A without overline(A)
= A $

Q: $D = NN, A = {1,2,3}$ and $B = {3,4,5}$. Compute $overline(A inter B),(B
without A) union (A without B)$

- De Morgan's Law: $overline(A inter B) = overline(A) union overline(B)$

*Power Set*: The power set of $A$ is the set of all subsets of $A$. If $A =
{a,b,c}$, then
$ P(A) = {emptyset, {a}, {b}, {c}, {a,b}, {a,c}, {b,c}, {a,b,c}} $

The number of elements in $P(A)$ is $2^{|A|}$
- Proof: Every element of $A$ has two choices: either it is in a subset or it
  is. Therefore, the number of possibilities is equal to the number of
  possibilities for each element. $2 times 2 times 2 times...$ n times = $2^n$
  - TODO: Find a nice proof of this online to really understand it.
  - This is called the product rule, (google this)

*Disjoint Sets*: Two sets $A,B$ are disjoint if $A inter B = emptyset$

*Symmetric Difference*: The symmetric difference of two sets $A,B$ consists of
all elements that are either in $A$ or in $B$, but not in both.

Q: Show $A Delta B$ on a Venn diagram.
Q: For $A = {1,2,3}$ and $B = {3,4,5}$, compute $A Delta B$
$ A Delta B = { x | (x in A and x in.not B) or (x in B and x in.not A) } =
{1,2,4,5} $

== Relations

The *Cartesiaon Product* of two sets is a set consisting of ordered pairs
_(tuples)_, i.e.

$A times B = {(a,b) | a in A and b in B}$ if $A = {1,2,3}$ and $B = {3,4,5}$
$A times B = {(1,3), (1,4), (1,5), (2,3), (2,4), (2,5)}$

i.e. if sets are 1-dimensional objects, the Cartesian Product of two sets can be
thought of as 2-dimensional.

Q: Is $A times B = B times A$? --- No, because tuples are ordered pairs.

Q: If $|A| = m, |B| = n$, then what is $|A times B|$? --- $m*n$, (find a nice
proof of this)

In general, $A_1 times A_2 times ... times A_k = {(a_1, a_2, ..., a_k) | a_1 in
A_1, a_2 in A_2, ..., a_k in A_k}$ where $(a_1, a_2, ..., a_k)$ is referred to
as a k-tuple.

$ |A_1 times A_2 times ... times A_k| = |A_1| times |A_2| times ... times |A_k| $

(proof by induction)

== Laws of Set Theory

*Distributive Property*: $A inter (B union C) = (A inter B) union (A inter C)$

$z in A inter (B union C)$

$iff z in A and z in (B union C)$ --- by the definition of intersection

$iff z in A and (z in B or z in C)$ --- by the definition of union

Using the distributivity of $and$ over $or$, for binary literals $w,x,y in
{0,1}, x and (y or w) = (x and y) or (x and w). "For" x colon.eq z in A, y
colon.eq z in B, w colon.eq z in C,$

(We can only use the properties of binary literals because we can basically
equate $z$ being in or not in a set $S$ to assigning a variable $x$ to be 0 or
1)

$iff (z in A and z in B) or (z in A and z in C)$

$iff z in (A inter B) or z in (A inter C)$

$iff z in (A inter B) union (A inter C)$

= Sequences

Examples: $(a,b,a), (1,3,4), (4,3,1)$

An element may appear twice, and the order of the elements does matter.
- $(a,a,b) eq.not (a,b)$
- $(a,b) eq.not (b,a)$

Q: What is the size of $(1,2,2,3)$? What is the size of ${1,2,2,3}$?
- TODO: answer the question

*Sets and Sequences*: The Cartesnian product of sets $S times T times U$ is a
set consisting of all sequences where the first component is drawn from $S$, the
second is drawn from $T$, and the third is drawn from $U$.

$ S times T times U = {(s,t,u) | s in S, t in T, u in U} $

Q: For set $S = {0,1}, S^3 = {S times S times S}$. Enumerate $S^3$. What is |S^3|?
- Enumeration: $S^3} = {(0,0,0), (0,0,1), (0,1,0), (0,1,1), (1,0,0), (1,0,1),
(1,1,0), (1,1,1)}$
- $2 times 2 times 2 = 8$

Formula:
$ |S times T times U| = |S| times |T| times |U| $

$ |S^n| = |S|^n $

= Counting Sets --- Using the Sum Rule

Q: Let $R$ be the set of rainy days, $S$ be the set of sunny days, and $H$ be
hte set of really hot days in 2023. A bad day can be either rainy, snowy or
really hot. What is the number of good days?

Let $B$ be the set of bad days. $B = R union S union H$, and we want to estimate
$|overline(B)|. |D| = 365. |overline(B)| = |D| - |B| = 365 - |R union S union
H|.$

Since the sets $R, S, H$ are disjoint, $|R union S union H| = |R| + |S| + |H|.$.
hence, the number of good days $= 365 - |R| - |S| - |H|$

$ B union G = D, |B union G| = |D| = 365 $

$B$ and $G$ are disjoint, so we can apply the sum rule: 

$ |B| + |G| = |D| \ implies |G| = 365 - |B| = 365 - (|R| + |S| + |H|) $

*Sum Rule*: if $A_1, A_2, ..., A_m$ are disjoint sets, $|A_1 union A_2 union
..., union A_m| = sum_(i=1)^m |A_i|$

= Counting Sequences --- Using the Product Rule

Q: Suppose the university offers Math courses ($M$), CS courses ($C$), and
Statistics courses ($S$). We need to pick one course from each subject, Math, CS
and Statistics. What is the number of ways we can select the 3 courses?

We can use the cartesian product, so the number of ways we can select three
courses is $|M times C times S| = |M| times |C| times |S|$

Formally:\
The number of ways to select the 3 courses is\
$=$ the number of sequences of the form $(m,c,s) | m in M, c in C, s in S$

$ M times C times S = {(m,c,s) | m in M, c in C, s in S} $ 
$ |M times C times S| = |M| times |C| times |S| $

== Counting --- Example 1

Q: What is the number of length $n$ passwords that can be generated if each
character in the password is only allowed to be a lowercase letter?

The number of passwords $=$ the number of sequences of length $n$ of the form
$(a, c, d, ...) = {a,b,...,z} times {a,b,...,z} times ...$ n times. Therefore,
the number of passwords of length $n$ is $|{a,b,...,z} times {a,b,...,z} times
...| = |{a,b,...,z}|^n = 26 times 26 times ... times 26 = 26^n$

== Counting --- Example 2

Q: What is the number of passwords that can be generated if
+ The first character is only allowed to be a lowercase letter,
+ Each subseqnet character in the password is allowed to be lower-case letter or
  digit
+ The password may be between 6 and 8 characters long

Answer: $26*36^7 + 26*36^6 + 26*36^5=2,095,636,727,808$

Let $L = {a,b,...,z}$ and $D = {0,1,...,9}$. Using the equivalences between
sequences and products of sets, the set of passwords of length n is given by
$P_n = L times (L union D)^(n-1)$.

Since the total set of passwords $P = P_6 union P_7 union P_8$, and a password
can be either of length 6, 7 or 8, sets $P_6, P_7, P_8$ are disjoint. Using the
sum rule, we can write $|P| = |P_6| + |P_7| + |P_8| = |L| times [(|L|+|D|)^5
times (1 + (|L|+|D|) + (|L|+|D|)^2)] = 26 times 36^5 times [1+36+36^2] = 2,095,636,727,808$
