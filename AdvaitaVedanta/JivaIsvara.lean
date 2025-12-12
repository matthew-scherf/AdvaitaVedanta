import AdvaitaVedanta.Signature
import AdvaitaVedanta.CoreAxioms
import AdvaitaVedanta.LevelAxioms

namespace AdvaitaVedanta

-- ═══════════════════════════════════════════════════════════════════
-- JĪVA AXIOMS (minimal set)
-- ═══════════════════════════════════════════════════════════════════

-- J1: Jīva is Conditioned
axiom J1 : ∀ j : Obj, Jiva j → C j

-- J2: Jīva at Vyāvahārika level
axiom J2 : ∀ j : Obj, Jiva j → Level_of j Vyav

-- NOTE: J3 (Jiva → Phi) removed - derivable from J1 + A8

-- J4: Jīva is Embodied
axiom J4 : ∀ j : Obj, Jiva j → (∃ b : Obj, Body b ∧ Embodied j b)

-- NOTE: J5 (Jiva → ∃a. A a ∧ Cond a j) removed - instance of A6

-- J6: Jīva has Ignorance of the Absolute
axiom J6 : ∀ j : Obj, Jiva j → (∃ a : Obj, A a ∧ IgnoranceOf j a)

-- NOTE: J7 removed - weaker than J7a

-- J7a: Jīva has Spatial Upādhi
axiom J7a : ∀ j : Obj, Jiva j → (∃ s : Obj, SpaceItself s ∧ Upadhi s j)

-- J8: Multiple Jīvas Exist
axiom J8 : ∃ j₁ j₂ : Obj, Jiva j₁ ∧ Jiva j₂ ∧ j₁ ≠ j₂

-- NOTE: J9, J10 removed - derivable from J1/I1 + A4 + A1b

-- ═══════════════════════════════════════════════════════════════════
-- ĪŚVARA AXIOMS (minimal set)
-- ═══════════════════════════════════════════════════════════════════

-- I1: Īśvara is Conditioned
axiom I1 : ∀ i : Obj, Isvara i → C i

-- I2: Īśvara at Vyāvahārika level
axiom I2 : ∀ i : Obj, Isvara i → Level_of i Vyav

-- NOTE: I3 removed - instance of A6

-- I4: Īśvara has Omniscient Quality
axiom I4 : ∀ i : Obj, Isvara i → Q_p i

-- I5: Unique Īśvara
axiom I5 : ∀ i₁ i₂ : Obj, Isvara i₁ ∧ Isvara i₂ → i₁ = i₂

-- I6: Īśvara Related to All Vyāvahārika
axiom I6 : ∀ i x : Obj, Isvara i ∧ C x ∧ Level_of x Vyav →
  (∃ r : Obj → Obj → Prop, r i x)

-- ═══════════════════════════════════════════════════════════════════
-- DERIVED LEMMAS
-- ═══════════════════════════════════════════════════════════════════

-- J3 derived from J1 + A8
theorem J3_derived : ∀ j : Obj, Jiva j → Phi j := by
  intro j hj
  exact A8 j (J1 j hj)

-- J5 derived as instance of A6
theorem J5_derived : ∀ j : Obj, Jiva j → (∃ a : Obj, A a ∧ Cond a j) := by
  intro j _
  exact A6 j

-- J9 derived from J1 + A4 + A1b
theorem J9_derived : ∀ u j : Obj, Y u ∧ Jiva j → u ≠ j := by
  intro u j ⟨hyu, hjiva⟩
  intro heq
  have hau : A u := (A4 u).mp hyu
  have hcj : C j := J1 j hjiva
  rw [heq] at hau
  exact A1b j ⟨hau, hcj⟩

-- J10 derived from I1 + A4 + A1b
theorem J10_derived : ∀ u i : Obj, Y u ∧ Isvara i → u ≠ i := by
  intro u i ⟨hyu, hisvara⟩
  intro heq
  have hau : A u := (A4 u).mp hyu
  have hci : C i := I1 i hisvara
  rw [heq] at hau
  exact A1b i ⟨hau, hci⟩

-- I3 derived as instance of A6
theorem I3_derived : ∀ i : Obj, Isvara i → (∃ a : Obj, A a ∧ Cond a i) := by
  intro i _
  exact A6 i

end AdvaitaVedanta
