:- op(500, xfx, [:, !]). % infix operators
:- op(600, xfx, [→]). % effect
:- op(700, xfx, [:⇐, :⇒, <:, ≦:, ⇓]).
:- op(800, xfx, ⊢).
:- op(900, xfx, ⊣).

% Evaluation
Γ ⊢ ref(t, []) ⊣ Γ ⇓ v :- member((t, v), Γ).
Γ1 ⊢ ref(product(x, f), [a | tail]) ⊣ Γ2 ⇓ v :- a <: x, [(x, a) | Γ1] ⊢ ref(f, tail) ⇓ v ⊣ Γ2.
% Γ1 ⊢ ref(sum(x, f), [a | tail]) ⇓ v ⊣ Γ3 :- Γ1 ⊢ a <: sum(x, f), ref(a, tail).

% Subtyping
a <: a.
