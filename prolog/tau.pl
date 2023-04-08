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
