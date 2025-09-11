#set heading(numbering: "1.")

#align(center, text(17pt)[
  *CMPT 201: Probability and Computing*\
  Lecture 03
])

#grid(
  columns: (1fr, 1fr),
  align(center)[
    Lecturer: Dr. Sharan Vaswani \
    Simon Fraser University \
  ],
  align(center)[
    Notetaker: Alexander Ng \
    Simon Fraser University \
  ]
)

= Recap

*Sum rule:* (insert formula)

*Product rule:* (insert formula)

*Generalized product rule:* (insert formula)

*Division rule:* (insert formula)

= Counting Subsets (Combinations)

*Q:* How many $k$-sized subsets of size $n$ are there?

*e.g.:* How many ways can we choose 5 books from 100?

+ Form a permutation of the $n$-sized set (which we are choosing from)
+ Pick the first $k$ elements to form a subset
+ Every $k$-sized subset can be generated in this way. There are $n!$ total such
  permutations.

The order of the first $k$ elements in the permutation does not matter in
forming the subset, and neither does the order of the remaining $n-k$ elements.
The first $k$ elements can be ordered in $k!$ ways, and the remaining $n-k$
elements can be ordered in $(n-k)!$ ways. According to the product
rule, $k! times (n-k)!$ permutations map to the same $k$-sized subset.

Therefore, the function $(f : "permutations" -> k"-sized subsets")$ is a 
$k! times (n-k)!$-to-1 function. Let $P$ be the set of permutations, and $S$
be the set of $k$-sized subsets. Then, by the division rule, 
$|P| = k! times (n-k)!|S|$. Hence, the number of $k$-sized subsets is

$ (n!)/(k! times (n-k)!) $

We name this function "choose," denoted by $binom(n, k)$, pronounced $n$
*choose* $k$.

$ binom(n, k) := (n!)/(k! times (n-k)!) $

*Q:* Prove that $binom(n, k) = binom(n, n-k)$
+ Algebraically (using the formula for $binom(n, k)$)
+ And combinatorically (without using the formula)

*Q:* Which is bigger, $binom(8, 4)$ or $binom(8, 5)$?

== How Many $m$-bit Binary Sequences Contain Exactly $k$ Ones? <2.1>

Let $A = { 1, dots, m }$. Select a set $S$ of size $k$ from $A$. $S$ records the
position of the 1's, and can be mapped to a unique binary sequence. Similarly,
every $m$-bit sequence with exactly $k$ ones can be mapped to a subset $S$ of
size $k$. Hence, there is a bijection:

$ f : m"-bit sequences with exactly" k "ones" -> "subsets of size" k $.
$ |m"-bit sequences with exactly" k "ones"| = |"subsets of size" k| = binom(m, k) $

=== What is a Bijection?

A bijection is a function that is both injective (one-to-one) and surjective
(onto). In other words, it is a function that maps each element in the domain to
a unique element in the codomain. In this case, the domain is the set of $m$-bit
sequences with exactly $k$ ones, and the codomain is the set of $k$-sized
subsets of size $m$.

+ Injective (one-to-one): exactly one (distinct) element in the domain maps to
  exactly one (distinct) element in the codomain.
+ Surjective (onto): every element in the codomain has a corresponding element
  (image) in the domain. i.e. there are no extra elements in the codomain that
  are "unreachable" from the domain.

== More Examples
+ What is the number of $n$-bit binary sequences with _at least_ $k$ ones?

  A sequence with $k$ ones is disjoint from a sequence with $k+1$ ones. Therefore,
  we can apply the sum rule to count the number of sequences with $k$ ones:

  Let $N_k$ be the set of $n$-bit sequences with exactly $k$ ones. Then, the
  number of sequences with $k$ ones is $|N_k| = binom(n, k)$. By the sum rule, the
  number of sequences with at least $k$ ones is $|N_k union N_(k+1) union dots
  union N_n| = |N_k| + |N_(k+1)| + ... + |N_n| = sum_(i=k)^n binom(n, i)$.

+ What is the number of $n$-bit binary sequences with less than $k$ ones?
  
  Using the same logic, we can derive

  $ "number of sequences with less than" k "ones" = sum_(i=0)^k binom(n, i) $

+ What is the total number of $n$-bit binary sequences?

  $ sum_(i=0)^n binom(n,i) = 2^n $

  This is a special case of the binomial theorem, which states that:

= The Binomial Theorem

$ forall n in NN "and" a, b in RR: \
(a + b)^n = sum_(k=0)^n binom(n, k) a^(n-k) b^(k) $

Example: If $a=b=1$, then $sum_(k=0)^n binom(n, k) = 2^n$ (from the previous
slide).

If $n=2$, then $(a+b)^2 = binom(2, 0)a^2 + binom(2, 1)a b + binom(2, 2)b^2 =
a^2+2 a b+b^2$.

*Q:* What is the coefficient of the terms with $a b^3$ in $(a+b)^4$?

- The coefficient of $a b^3$ is $binom(4, 3) = 4$.

*Q:* For $a,b > 0$, what is the coefficient of $a^(2n-7)b^7 "and" a^(2n-8)b^7
"in" (a+b)^(2n) + (a-b)^(2n)$?

- No clue lmfao

= The Donut Problem (Counting Sets Using a Bijection)

*Q:* Suppose we want to buy 10 donuts. There are 5 donut varieties ---
chocolate, lemon-filled, sugar, glazed, and plain. What is the number of ways to
select the 10 donuts?

Let $A$ be the set of ways to select the 10 donuts. Each element of $A$ is a
potential selection. For example, 4 chocolate, 3 lemon, 0 sugar, 2 glazed, and 1
plain. We can map it to a bit string as follows:

$ 0000, 000, , 00, 0 $

We'll fix the ordering to be "chocolate, lemon, sugar, glazed, plain", and
abstract this out further, using 1's as the separators between the varieties.

$ 0000 1 000 1 1 00 1 0 $

Hence, each way of choosing donuts is mapped to a binary sequence of length 14
with exactly 4 ones. Now, let $B$ be all 14-bit sequences with exactly 4 ones.
An example element of $B$ is: $11110000000000$.

*Q:* For what order of donuts does the above binary sequence correspond to?\
*A*: The order of donuts is 10 plain donuts, and 0 of the other varieties.

For every way to select donuts, we have an equivalent sequence in $B$, and every
seuqence in $B$ implies a unique way to select donuts. Hence, the mapping from
$A -> B$ is a bijective function.

Therefore, $|A| = |B|$, meaning that we have reduced the problem to counting the
number of 14-bit sequences with exactly 4 ones (@2.1). This is, again,
equivalent to counting the number of subsets, so:

$ binom(14, 4) = 1,001 $

Therefore there are 1001 unique, unordered ways to select 10 donuts from a
selection of 5 donut varieties.

We can generalize this to say that every problem involving counting the number
of ways to choose $n$ elements with $k$ available varieties is equivalent to
counting the number of $n+k-1$-bit binary sequences with exactly $k-1$ ones.
Therefore,

$ binom(n+k-1, k-1) $

*Q:* There are 2 donut varieties – chocolate and lemon-filled. Suppose we want to buy only 2
donuts. Use the above result to count the number of ways in which we can select the donuts?
What are these ways?

*Q:* In the above example, I want at least one chocolate donut. What are the types of acceptable
3-bit sequences with this criterion? How many ways can we do this?

#pagebreak()
= Practice

== Prove Pascal's Identity Combinatorically
$ binom(n, k) = binom(n-1, k-1) + binom(n-1, k) $

LHS: $binom(n, k)$ -> the number of ways to select $k$ students from a class of
$n$ students

RHS: The number of ways to select $k$ students such that an arbitrary student
$x$ is always included: $binom(n-1, k-1)$

The number of ways to select $k$ students such that student $x$ is not included:
$binom(n-1, k)$

Apply the sum rule to the RHS (the number of ways to select students such that
one student is always included, and the number of ways to select students such
that one student is always excluded, combined are equal to the number of ways to
select students), and you can show that the LHS is equal to the RHS.

== Dice Rolling

A standard dice, with numbers ${1, 2, 3, 4, 5, 6}$, is rolled 6 times in
succession. We define a roll to be the sequence formed by the numbers on the 6
dice. For example, $(1,2,4,1,6,5)$.

- How many rolls will have no 6?
  - $5^6$ -> you choose from 1..5 for each roll, therefore the number of
    possible rolls is $5^6$.
- How many rolls will have each number exactly once?
  - $6!$ -> Rolling the first die nets 6 choices, and one is removed, so the
    second roll has 5 choices, and so on. Therefore, the number of possible
    rolls is $6!$.
- How many rolls will have 6 come up exactly once?
  - $5^5 * 6$ -> we have one choice for where to put the 6, and then we have 5
    more positions to fill with a choice from 1..5. Therefore, the number of
    possible rolls is $5^5 * 6$.
- How many rolls will have 6 come up exactly $k$ times (for $k <= 6$)?
  - I'll be honest, I missed this one. Check his filled notes for the answer.

== 5-Digit Numbers

=== Combinatorically (ish)

*Q:* How many 5-digit numbers are there which contain at least one 0? A number
is different from a string, so a leading 0 makes the number not 5-digit.

$ (9 * 10^4) - 9^5 = 30,951 $

+ The first position can be anything *but* a 0, so we have 9 choices.
+ The other digits must be a digit, so we have $10^4$ choices.
+ Our number must have at least one 0, so we subtract the number of possible
  5-digit numbers that don't have a 0, which is 5 choices of 1..9, which is 
  $9^5$.

=== Another Way

$D_i$ is the set of all numbers with exactly $i$ zeros, $i in {1, 2, 3, 4}$.

$D = sum_(i=1)^4 |D_i|$ --- we can use the sum rule!

$binom(4, i) times 9^(5-i)$ -> number of ways to select with exactly $i$ zeros

$|D| = sum_(i=1)^4 (binom(4, i) times 9^(5-i))$ -> you get the same answer
