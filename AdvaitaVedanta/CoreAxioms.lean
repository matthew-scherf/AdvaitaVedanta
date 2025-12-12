import AdvaitaVedanta.Signature

namespace AdvaitaVedanta

-- ═══════════════════════════════════════════════════════════════════
-- CORE AXIOMS (A1-A14)
-- Minimal set after removing derivable axioms
-- ═══════════════════════════════════════════════════════════════════

-- A1: Universal Classification (Exhaustive Partition)
-- Every entity is either Absolute or Conditioned, but not both
axiom A1a : ∀ x : Obj, A x ∨ C x
axiom A1b : ∀ x : Obj, ¬(A x ∧ C x)

-- A2: Uniqueness of the Absolute
-- There exists exactly one Absolute
axiom A2 : (∃ a : Obj, A a) ∧ (∀ a₁ a₂ : Obj, A a₁ → A a₂ → a₁ = a₂)
-- NOTE: A2b (∀ a x, A a → x ≠ a → ¬A x) is derivable from A2

-- A3: Uniqueness of the Subject  
-- There exists exactly one ultimate Subject
axiom A3 : (∃ u : Obj, Y u) ∧ (∀ u₁ u₂ : Obj, Y u₁ → Y u₂ → u₁ = u₂)
-- NOTE: A3b is derivable from A3

-- A4: Subject-Absolute Identity (Tat Tvam Asi)
-- The core mahāvākya: the Subject IS the Absolute
axiom A4 : ∀ x : Obj, Y x ↔ A x

-- A5: Self-Grounding of the Absolute
axiom A5 : ∀ a : Obj, A a → Cond a a

-- A6: Universal Grounding
-- Everything is grounded in the Absolute
axiom A6 : ∀ x : Obj, ∃ a : Obj, A a ∧ Cond a x

-- A7a: Transcendence of Phenomenality
-- The Absolute is beyond time, space, and quality
axiom A7a : ∀ a : Obj, A a → (¬T_p a ∧ ¬S_p a ∧ ¬Q_p a)
-- NOTE: A7 (¬Phi) is derivable from A7a via de Morgan

-- A7b: Saccidānanda Nature
axiom A7b : ∀ a : Obj, A a → Saccidananda a

-- A8: Phenomenality of the Conditioned
axiom A8 : ∀ x : Obj, C x → Phi x

-- A9: Asymmetry of Grounding
-- Mutual grounding implies identity with the Absolute
axiom A9 : ∀ x y : Obj, Cond x y ∧ Cond y x → (x = y ∧ A x)

-- A10: Transitivity of Grounding
axiom A10 : ∀ x y z : Obj, Cond x y ∧ Cond y z → Cond x z

-- A11: Absolute Witnesses Everything
axiom A11 : ∀ a x : Obj, A a → Witnesses a x
-- NOTE: A12 (self-witnessing) is an instance of A11

-- A13: Subject Does Not Perceive (Dualistically)
axiom A13 : ∀ u o : Obj, Y u → ¬Perceives u o

-- A14: Subject is Knower-Known-Knowing (Collapsed Trinity)
axiom A14 : ∀ u : Obj, Y u → (Knower u ∧ Known u ∧ Knowing u)

-- ═══════════════════════════════════════════════════════════════════
-- DERIVED LEMMAS (for convenience, proven from axioms)
-- ═══════════════════════════════════════════════════════════════════

-- Derived: A2b - uniqueness contrapositive
theorem A2b_derived : ∀ a : Obj, A a → (∀ x : Obj, x ≠ a → ¬A x) := by
  intro a ha x hne hax
  have huniq := A2.2 a x ha hax
  exact hne huniq.symm

-- Derived: A3b - uniqueness contrapositive  
theorem A3b_derived : ∀ u : Obj, Y u → (∀ x : Obj, x ≠ u → ¬Y x) := by
  intro u hu x hne hyx
  have huniq := A3.2 u x hu hyx
  exact hne huniq.symm

-- Derived: A7 - transcendence of phenomenality
theorem A7_derived : ∀ a : Obj, A a → ¬Phi a := by
  intro a ha hphi
  have ⟨hnt, hns, hnq⟩ := A7a a ha
  unfold Phi at hphi
  rcases hphi with ht | hs | hq
  · exact hnt ht
  · exact hns hs
  · exact hnq hq

-- Derived: A12 - self-luminosity (instance of A11)
theorem A12_derived : ∀ a : Obj, A a → Witnesses a a := by
  intro a ha
  exact A11 a a ha

end AdvaitaVedanta
