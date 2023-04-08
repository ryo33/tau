:- op(500, xfx, [:, !]). % infix operators
:- op(600, xfx, [→]). % effect
:- op(700, xfx, [:⇐, :⇒, <:, ≦:, ⇓]).
:- op(800, xfx, ⊢).
:- op(900, xfx, ⊣).

% Evaluation
Γ ⊢ ref(t, args) ⇓ v :- member((t, a), Γ), apply(a, args).
Γ ⊢ apply(t, []) ⇓ t.
Γ ⊢ apply(dep_prod(x, f), [a | tail]) ⇓ v :- a <: x, [(x, a) | Γ] ⊢ apply(f, tail) ⇓ v.
Γ ⊢ apply(dep_sum(x, f), args) ⇓ dep_sum(x, apply(f, args)).
Γ ⊢ apply(prod(x, set, f), args) ⇓ prod(x, set, apply(f, args).
Γ ⊢ apply(sum(x, set, f), args) ⇓ sum(x, set, apply(f, args).
prod(x, [a], f) ⇓ t :- substitute(f, x, a, t).
sum(x, [a], f) ⇓ t :- substitute(f, x, a, t).

% Subtyping
a <: a.
t <: prod(_, [], _) ⊣ t.
sum(x, [], f) <: _ ⊣ sum(x, [], f).
prod(x, set1, f) <: prod(y, set2, g) ⊣ a :- optimal(set1, set2, a, b).
prod(x, set,  f) <: a ⊣ b :- prod(x, set, f) <: prod(y, [a], y) ⊣ b.
sum(x, set1, f) <: sum(y, set2, g) a ⊣ a :-  optimal(set1, set2, a, b).
a <: sum(x, set, f) ⊣ sum(y, [b], y) <: sum(x, set, f).
