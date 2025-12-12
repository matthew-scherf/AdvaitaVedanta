import AdvaitaVedanta.Signature
import AdvaitaVedanta.CoreAxioms
import AdvaitaVedanta.LevelAxioms
import AdvaitaVedanta.JivaIsvara
import AdvaitaVedanta.AdditionalAxioms

namespace AdvaitaVedanta

-- ═══════════════════════════════════════════════════════════════════
-- STATE AXIOMS: AVASTHĀ-TRAYA (Three-State Analysis)
-- From Māṇḍūkya Upaniṣad
-- ═══════════════════════════════════════════════════════════════════

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 1: STATE STRUCTURE
-- ═══════════════════════════════════════════════════════════════════

-- AV1: Every jīva is in exactly one state at a time
axiom AV1a : ∀ j : Obj, Jiva j → (∃ s : State, InState j s)
axiom AV1b : ∀ j : Obj, ∀ s₁ s₂ : State, 
  Jiva j → InState j s₁ → InState j s₂ → s₁ = s₂

-- AV2: State transitions occur
axiom AV2 : StateTransition Susupti Jagrat ∧ 
            StateTransition Jagrat Svapna ∧ 
            StateTransition Svapna Susupti

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 2: WAKING STATE (JĀGRAT) - VIŚVA
-- ═══════════════════════════════════════════════════════════════════

-- AV3: In waking, gross body and world manifest
axiom AV3a : ∀ j : Obj, Jiva j → InState j Jagrat → 
  (∃ b : Obj, SthulaSarira b ∧ Manifests b j Jagrat)
axiom AV3b : ∀ j : Obj, Jiva j → InState j Jagrat → 
  (∃ w : Obj, World w ∧ Manifests w j Jagrat)

-- AV4: In waking, subtle body (mind) is also active
axiom AV4 : ∀ j : Obj, Jiva j → InState j Jagrat → 
  (∃ m : Obj, SukshmaSarira m ∧ Manifests m j Jagrat)

-- AV5: Waking world objects are at vyāvahārika level
axiom AV5 : ∀ j x : Obj, Jiva j → InState j Jagrat → 
  Manifests x j Jagrat → World x → Level_of x Vyav

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 3: DREAM STATE (SVAPNA) - TAIJASA
-- ═══════════════════════════════════════════════════════════════════

-- AV6: In dream, gross body does NOT manifest
axiom AV6 : ∀ j b : Obj, Jiva j → InState j Svapna →
  SthulaSarira b → ¬Manifests b j Svapna

-- AV7: In dream, external world does NOT manifest
axiom AV7 : ∀ j w : Obj, Jiva j → InState j Svapna →
  World w → ¬Manifests w j Svapna

-- AV8: In dream, subtle body (mind) IS active - it creates dream content
axiom AV8 : ∀ j : Obj, Jiva j → InState j Svapna →
  ∃ m : Obj, SukshmaSarira m ∧ Manifests m j Svapna

-- AV9: Dream objects are mind-dependent projections
axiom AV9 : ∀ j x : Obj, Jiva j → InState j Svapna →
  Manifests x j Svapna → ¬SukshmaSarira x →
  ∃ m : Obj, SukshmaSarira m ∧ Cond m x

-- AV10: Dream objects are at prātibhāsika level
axiom AV10 : ∀ j x : Obj, Jiva j → InState j Svapna →
  Manifests x j Svapna → ¬SukshmaSarira x → Level_of x Prat

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 4: DEEP SLEEP (SUṢUPTI) - PRĀJÑA
-- ═══════════════════════════════════════════════════════════════════

-- AV11: In deep sleep, NO objects manifest whatsoever
-- This is THE crucial axiom - total withdrawal of manifestation
axiom AV11 : ∀ j x : Obj, Jiva j → InState j Susupti → ¬Manifests x j Susupti

-- NOTE: AV12-14 removed as derivable from AV11:
-- AV12: Gross body doesn't manifest - follows from AV11
-- AV13: World doesn't manifest - follows from AV11
-- AV14: Subtle body doesn't manifest - follows from AV11

-- AV15: Only the causal body (seed of ignorance) persists
axiom AV15 : ∀ j : Obj, Jiva j → InState j Susupti →
  ∃ k : Obj, KaranaSarira k ∧ Upadhi k j

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 5: THE WITNESS (SĀKṢIN) - TURĪYA
-- ═══════════════════════════════════════════════════════════════════

-- AV16: The witness persists through ALL states
axiom AV16 : ∀ j : Obj, ∀ s : State, Jiva j → InState j s →
  ∃ u : Obj, Y u ∧ Witnesses u j

-- NOTE: AV17 removed - derivable from AV16 + A3 (uniqueness of Y)

-- AV18: The witness itself is never "in" any state
-- It is turīya - the fourth, beyond the three
axiom AV18 : ∀ u : Obj, ∀ s : State, Y u → ¬InState u s

-- NOTE: AV19 removed - derivable from W1_derived (Y witnesses all)

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 6: MEMORY AND CONTINUITY
-- ═══════════════════════════════════════════════════════════════════

-- AV20: Upon waking, one remembers having slept
axiom AV20 : ∀ j : Obj, Jiva j → InState j Jagrat →
  (∃ s : State, StateTransition s Jagrat ∧ s = Susupti) → 
  Remembers j Susupti

-- NOTE: AV21 removed - derivable from AV16

-- ═══════════════════════════════════════════════════════════════════
-- SECTION 7: THE CRITERION OF REALITY
-- ═══════════════════════════════════════════════════════════════════

-- AV22: What appears in one state but not another cannot be Absolute
-- This is the key metaphysical principle of the three-state argument
axiom AV22 : ∀ x j : Obj, ∀ s₁ s₂ : State,
  Jiva j → (Manifests x j s₁ ∧ ¬Manifests x j s₂) → ¬A x

-- AV23: The Absolute never "manifests" in the empirical sense
axiom AV23 : ∀ a j : Obj, ∀ s : State, A a → Jiva j → ¬Manifests a j s

-- AV24: Bodies are conditioned entities
axiom AV24a : ∀ b : Obj, SthulaSarira b → C b
axiom AV24b : ∀ m : Obj, SukshmaSarira m → C m
axiom AV24c : ∀ k : Obj, KaranaSarira k → C k

-- AV25: World entities are conditioned
axiom AV25 : ∀ w : Obj, World w → C w

-- ═══════════════════════════════════════════════════════════════════
-- DERIVED LEMMAS
-- ═══════════════════════════════════════════════════════════════════

-- AV12 derived: Body absent in deep sleep
theorem AV12_derived : ∀ j b : Obj, Jiva j → InState j Susupti →
  SthulaSarira b → ¬Manifests b j Susupti := by
  intro j b hj hs _
  exact AV11 j b hj hs

-- AV13 derived: World absent in deep sleep
theorem AV13_derived : ∀ j w : Obj, Jiva j → InState j Susupti →
  World w → ¬Manifests w j Susupti := by
  intro j w hj hs _
  exact AV11 j w hj hs

-- AV14 derived: Mind absent in deep sleep
theorem AV14_derived : ∀ j m : Obj, Jiva j → InState j Susupti →
  SukshmaSarira m → ¬Manifests m j Susupti := by
  intro j m hj hs _
  exact AV11 j m hj hs

-- ═══════════════════════════════════════════════════════════════════
-- MAIN THEOREMS
-- ═══════════════════════════════════════════════════════════════════

-- ST1: World is not Absolute
theorem ST1_WorldNotAbsolute : ∀ w : Obj, World w → ¬A w := by
  intro w hw ha
  have hcw : C w := AV25 w hw
  exact A1b w ⟨ha, hcw⟩

-- ST2: Gross body is not Absolute
theorem ST2_GrossBodyNotAbsolute : ∀ b : Obj, SthulaSarira b → ¬A b := by
  intro b hb ha
  have hcb : C b := AV24a b hb
  exact A1b b ⟨ha, hcb⟩

-- ST3: Subtle body is not Absolute
theorem ST3_SubtleBodyNotAbsolute : ∀ m : Obj, SukshmaSarira m → ¬A m := by
  intro m hm ha
  have hcm : C m := AV24b m hm
  exact A1b m ⟨ha, hcm⟩

-- ST4: Causal body is not Absolute
theorem ST4_CausalBodyNotAbsolute : ∀ k : Obj, KaranaSarira k → ¬A k := by
  intro k hk ha
  have hck : C k := AV24c k hk
  exact A1b k ⟨ha, hck⟩

-- ST5: Witness is Atman (using definitions from Theorems)
-- The unique Y is the unique A

-- ST6: Witness persists through all states
theorem ST6_WitnessPersists : ∀ j : Obj, ∀ s : State, 
  Jiva j → InState j s → ∃ u : Obj, Y u ∧ Witnesses u j := by
  intro j s hj hs
  exact AV16 j s hj hs

-- ST7: Witness is unique
theorem ST7_WitnessUnique : ∀ u₁ u₂ : Obj, Y u₁ → Y u₂ → u₁ = u₂ := by
  intro u₁ u₂ hy1 hy2
  exact A3.2 u₁ u₂ hy1 hy2

-- ST8: Witness is Atman (the Subject)
theorem ST8_WitnessIsAtman : ∀ u : Obj, Y u → A u := by
  intro u hu
  exact (A4 u).mp hu

-- ST9: Witness transcends all states
theorem ST9_WitnessTranscendsStates : ∀ u : Obj, ∀ s : State, Y u → ¬InState u s := by
  intro u s hu
  exact AV18 u s hu

-- ST10: World absent in deep sleep (main goal #1)
theorem ST10_WorldAbsentInDeepSleep : ∀ j w : Obj, 
  Jiva j → World w → InState j Susupti → ¬Manifests w j Susupti := by
  intro j w hj _ hs
  exact AV11 j w hj hs

-- ST11: Body absent in deep sleep (main goal #2)
theorem ST11_BodyAbsentInDeepSleep : ∀ j b : Obj,
  Jiva j → SthulaSarira b → InState j Susupti → ¬Manifests b j Susupti := by
  intro j b hj _ hs
  exact AV11 j b hj hs

-- ST12: World returns on waking (main goal #3)
theorem ST12_WorldReturnsOnWaking : ∀ j : Obj, 
  Jiva j → InState j Jagrat → ∃ w : Obj, World w ∧ Manifests w j Jagrat := by
  intro j hj hs
  exact AV3b j hj hs

-- ST13: Body returns on waking (main goal #4)
theorem ST13_BodyReturnsOnWaking : ∀ j : Obj,
  Jiva j → InState j Jagrat → ∃ b : Obj, SthulaSarira b ∧ Manifests b j Jagrat := by
  intro j hj hs
  exact AV3a j hj hs

-- ST14: Dream is less real than waking
theorem ST14_DreamLessRealThanWaking : ∀ j x y : Obj,
  Jiva j → InState j Svapna → Manifests x j Svapna → ¬SukshmaSarira x →
  Jiva j → InState j Jagrat → Manifests y j Jagrat → World y →
  Level_of x Prat ∧ Level_of y Vyav := by
  intro j x y hj1 hs1 hm1 hns hj2 hs2 hm2 hw
  constructor
  · exact AV10 j x hj1 hs1 hm1 hns
  · exact AV5 j y hj2 hs2 hm2 hw

-- ST15: Vyāvahārika sublates prātibhāsika
theorem ST15_DreamSublatedByWaking : ∀ x y : Obj,
  C x → Level_of x Vyav → Level_of y Prat → Sublates x y := by
  intro x y hcx hlx hly
  exact K5 x y ⟨hcx, hlx, hly⟩

-- ═══════════════════════════════════════════════════════════════════
-- COROLLARIES: "You Are Not..."
-- ═══════════════════════════════════════════════════════════════════

theorem Corollary_YouAreNotTheBody : ∀ u b : Obj, Y u → SthulaSarira b → u ≠ b := by
  intro u b hu hb heq
  have hau : A u := (A4 u).mp hu
  have hcb : C b := AV24a b hb
  rw [heq] at hau
  exact A1b b ⟨hau, hcb⟩

theorem Corollary_YouAreNotTheMind : ∀ u m : Obj, Y u → SukshmaSarira m → u ≠ m := by
  intro u m hu hm heq
  have hau : A u := (A4 u).mp hu
  have hcm : C m := AV24b m hm
  rw [heq] at hau
  exact A1b m ⟨hau, hcm⟩

theorem Corollary_YouAreNotTheWorld : ∀ u w : Obj, Y u → World w → u ≠ w := by
  intro u w hu hw heq
  have hau : A u := (A4 u).mp hu
  have hcw : C w := AV25 w hw
  rw [heq] at hau
  exact A1b w ⟨hau, hcw⟩

-- ═══════════════════════════════════════════════════════════════════
-- MASTER THEOREM: Three-State Analysis
-- ═══════════════════════════════════════════════════════════════════

theorem MasterTheorem_ThreeStateAnalysis :
  -- There exists a unique witness that:
  (∃ witness : Obj, 
    -- 1. Is the Subject (Y)
    Y witness ∧ 
    -- 2. Is the Absolute (A)
    A witness ∧
    -- 3. Is Saccidānanda
    Saccidananda witness ∧
    -- 4. Persists through all states
    (∀ j : Obj, ∀ s : State, Jiva j → InState j s → Witnesses witness j) ∧
    -- 5. Is never "in" any state
    (∀ s : State, ¬InState witness s) ∧
    -- 6. Is unique
    (∀ w : Obj, Y w → w = witness)) ∧
  -- And everything transient (body, mind, world) is not that witness
  (∀ b : Obj, SthulaSarira b → ∀ u : Obj, Y u → b ≠ u) ∧
  (∀ m : Obj, SukshmaSarira m → ∀ u : Obj, Y u → m ≠ u) ∧
  (∀ w : Obj, World w → ∀ u : Obj, Y u → w ≠ u) := 
  -- Get the witness from A3.1
  let ⟨wit, hwit⟩ := A3.1
  let hawit : A wit := (A4 wit).mp hwit
  let hsac : Saccidananda wit := A7b wit hawit
  -- Build the persistence proof
  let persists : ∀ j : Obj, ∀ s : State, Jiva j → InState j s → Witnesses wit j := 
    fun j s hj hs => 
      let ⟨u, hyu, hwu⟩ := AV16 j s hj hs
      let heq : u = wit := A3.2 u wit hyu hwit
      heq ▸ hwu
  -- Build the not-in-state proof
  let notInState : ∀ s : State, ¬InState wit s := fun s => AV18 wit s hwit
  -- Build uniqueness proof
  let unique : ∀ w : Obj, Y w → w = wit := fun w hyw => A3.2 w wit hyw hwit
  -- Build part 2 proofs
  let part2a : ∀ b : Obj, SthulaSarira b → ∀ u : Obj, Y u → b ≠ u := 
    fun b hb u hu => Ne.symm (Corollary_YouAreNotTheBody u b hu hb)
  let part2b : ∀ m : Obj, SukshmaSarira m → ∀ u : Obj, Y u → m ≠ u := 
    fun m hm u hu => Ne.symm (Corollary_YouAreNotTheMind u m hu hm)
  let part2c : ∀ w : Obj, World w → ∀ u : Obj, Y u → w ≠ u := 
    fun w hw u hu => Ne.symm (Corollary_YouAreNotTheWorld u w hu hw)
  ⟨⟨wit, hwit, hawit, hsac, persists, notInState, unique⟩, part2a, part2b, part2c⟩

end AdvaitaVedanta
