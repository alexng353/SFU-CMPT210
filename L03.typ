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

== Example 1

*Q*: How many $m$-bit binary sequences contain exactly $k$ ones?

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

  This is a special case of the binomial theorem, which states that

  $ forall n in NN "and" a, b in RR: \
  (a + b)^n = sum_(i=0)^n binom(n, i) a^i b^(n-i) $
