import AdvaitaVedanta.Signature
import AdvaitaVedanta.CoreAxioms
import AdvaitaVedanta.EventAxioms

namespace AdvaitaVedanta

-- ═══════════════════════════════════════════════════════════════════
-- AWARENESS AXIOMS (W1-W11)
-- ═══════════════════════════════════════════════════════════════════

-- NOTE: W1 (Y w → Witnesses w x) is derivable from A4 + A11
-- Kept as explicit axiom for convenience as it's foundational

-- W2: Witnessing is Timeless (not an event)
axiom W2 : ∀ w x : Obj, ∀ e : Event, 
  Witnesses w x → ¬(e = PerceptionEvent w x)

-- W3: Perception is Temporal (produces events)
axiom W3 : ∀ s o : Obj, Perceives s o → 
  (∃ e : Event, ∃ t : Time, e = PerceptionEvent s o ∧ OccursAt e t)

-- W4: Perceiver is Conditioned
axiom W4 : ∀ s : Obj, (∃ o : Obj, Perceives s o) → C s

-- W5: Witness Identity (converse direction)
axiom W5 : ∀ w : Obj, (∃ x : Obj, Witnesses w x ∧ x ≠ w) → Y w

-- W6: Perception Requires Subject-Object Distinctness
axiom W6 : ∀ s o : Obj, Perceives s o → s ≠ o

-- W7: Knowledge Structure Collapse in Subject
-- In the Subject, knower-known-knowing collapse into one
axiom W7 : ∀ u : Obj, Y u → 
  (∀ k n g : Obj, DistinctAspects k n g → (k = u ∧ n = u ∧ g = u))

-- W8: Conditioned Knowledge is Tripartite
axiom W8 : ∀ x : Obj, C x → 
  (∃ k : Obj, Knowledge k → 
    (∃ k' n g : Obj, DistinctAspects k' n g ∧ k' ≠ n ∧ n ≠ g ∧ k' ≠ g))

-- W9: Liberating Knowledge Removes Ignorance
axiom W9 : ∀ k j a : Obj, 
  Liberating k ∧ Jiva j ∧ A a → (Possesses j k → ¬IgnoranceOf j a)

-- W10: Subject Transcends Tripartite Structure
axiom W10 : ∀ u : Obj, Y u → 
  ¬(∃ k n g : Obj, DistinctAspects k n g ∧ 
    (u = k ∨ u = n ∨ u = g) ∧ (u ≠ k ∨ u ≠ n ∨ u ≠ g))

-- W11: Witness-Absolute Identity
-- Whatever witnesses everything is the Absolute
axiom W11 : ∀ w : Obj, (∀ x : Obj, Witnesses w x) → A w

-- ═══════════════════════════════════════════════════════════════════
-- DERIVED (W1 from A4 + A11)
-- ═══════════════════════════════════════════════════════════════════

-- W1 derived: Subject witnesses everything
theorem W1_derived : ∀ w x : Obj, Y w → Witnesses w x := by
  intro w x hyw
  have haw : A w := (A4 w).mp hyw
  exact A11 w x haw

end AdvaitaVedanta
