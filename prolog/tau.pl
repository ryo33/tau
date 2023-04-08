:- op(500, xfx, [:, !]). % infix operators
:- op(600, xfx, [→]). % effect
:- op(700, xfx, [:⇐, :⇒, <:, ≦:, ⇓]).
:- op(800, xfx, ⊢).
:- op(900, xfx, ⊣).

% Evaluation
Γ ⊢ ref(t, args) ⇓ v :- member((t, a), Γ), apply(a, args).
Γ ⊢ apply(t, []) ⇓ t.
Γ ⊢ apply(dprod(x, f), [a | tail]) ⇓ v :- a <: x, [(x, a) | Γ] ⊢ apply(f, tail) ⇓ v.
Γ ⊢ apply(dsum(x, f), args) ⇓ sum(x, apply(f, args)).
Γ ⊢ apply(prod(x, set, f), args) ⇓ prod(x, set, apply(f, args).

% Subtyping
a <: a.
