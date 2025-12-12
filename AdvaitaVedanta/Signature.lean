-- Formal signature for Advaita Vedanta metaphysics
namespace AdvaitaVedanta

-- ═══════════════════════════════════════════════════════════════════
-- SORTS (Types)
-- ═══════════════════════════════════════════════════════════════════

axiom Obj : Type
axiom Level : Type
axiom Time : Type
axiom Event : Type
axiom State : Type  -- States of consciousness (avasthā)

-- ═══════════════════════════════════════════════════════════════════
-- LEVEL CONSTANTS
-- ═══════════════════════════════════════════════════════════════════

axiom Param : Level  -- Pāramārthika (ultimate reality)
axiom Vyav : Level   -- Vyāvahārika (conventional reality)
axiom Prat : Level   -- Prātibhāsika (illusory appearance)

-- ═══════════════════════════════════════════════════════════════════
-- STATE CONSTANTS
-- ═══════════════════════════════════════════════════════════════════

axiom Jagrat : State   -- Waking (jāgrat)
axiom Svapna : State   -- Dream (svapna)
axiom Susupti : State  -- Deep sleep (suṣupti)

-- State distinctness
axiom State_distinct_JS : Jagrat ≠ Svapna
axiom State_distinct_SSu : Svapna ≠ Susupti
axiom State_distinct_JSu : Jagrat ≠ Susupti

-- ═══════════════════════════════════════════════════════════════════
-- CORE METAPHYSICAL PREDICATES
-- ═══════════════════════════════════════════════════════════════════

axiom A : Obj → Prop      -- Absolute (Brahman-nature)
axiom C : Obj → Prop      -- Conditioned (phenomenal)
axiom Y : Obj → Prop      -- Subject (Ātman-nature, witness)

-- Phenomenal properties
axiom T_p : Obj → Prop    -- Temporal
axiom S_p : Obj → Prop    -- Spatial
axiom Q_p : Obj → Prop    -- Qualitative
def Phi (x : Obj) : Prop := T_p x ∨ S_p x ∨ Q_p x

-- Saccidānanda (Being-Consciousness-Bliss)
axiom Sat : Obj → Prop
axiom Cit : Obj → Prop
axiom Ananda : Obj → Prop
def Saccidananda (x : Obj) : Prop := Sat x ∧ Cit x ∧ Ananda x

-- ═══════════════════════════════════════════════════════════════════
-- ONTOLOGICAL RELATIONS
-- ═══════════════════════════════════════════════════════════════════

axiom Level_of : Obj → Level → Prop        -- Reality level assignment
axiom Cond : Obj → Obj → Prop              -- Ontological grounding
axiom MayaPow : Obj → Obj → Prop           -- Māyā-power manifestation
axiom MayaLevel : (Obj → Obj → Prop) → Level → Prop
axiom Superimposed : Obj → Obj → Prop      -- Adhyāsa (superimposition)
axiom Appears : Obj → Obj → Prop           -- Vivarta (appearance)
axiom IgnoranceOf : Obj → Obj → Prop       -- Avidyā (ignorance)
axiom Upadhi : Obj → Obj → Prop            -- Limiting adjunct
axiom Sublates : Obj → Obj → Prop          -- Bādha (sublation)

-- ═══════════════════════════════════════════════════════════════════
-- ENTITY CLASSIFICATIONS
-- ═══════════════════════════════════════════════════════════════════

axiom Jiva : Obj → Prop          -- Individual soul
axiom Isvara : Obj → Prop        -- Lord (cosmic self)
axiom World : Obj → Prop         -- External world entity

-- Three bodies (śarīra-traya)
axiom SthulaSarira : Obj → Prop  -- Gross body
axiom SukshmaSarira : Obj → Prop -- Subtle body (mind)
axiom KaranaSarira : Obj → Prop  -- Causal body

axiom Body : Obj → Prop          -- General body predicate
axiom Embodied : Obj → Obj → Prop

-- ═══════════════════════════════════════════════════════════════════
-- AWARENESS RELATIONS
-- ═══════════════════════════════════════════════════════════════════

axiom Perceives : Obj → Obj → Prop     -- Dualistic perception
axiom Witnesses : Obj → Obj → Prop     -- Non-dualistic witnessing
axiom Possesses : Obj → Obj → Prop     -- Knowledge possession

-- Knowledge structure
axiom Knower : Obj → Prop
axiom Known : Obj → Prop
axiom Knowing : Obj → Prop
axiom DistinctAspects : Obj → Obj → Obj → Prop
axiom Knowledge : Obj → Prop
axiom Liberating : Obj → Prop

-- ═══════════════════════════════════════════════════════════════════
-- STATE RELATIONS
-- ═══════════════════════════════════════════════════════════════════

axiom InState : Obj → State → Prop           -- Jīva is in state
axiom Manifests : Obj → Obj → State → Prop   -- Object manifests to jīva in state
axiom StateTransition : State → State → Prop -- Transition between states
axiom Remembers : Obj → State → Prop         -- Memory of state

-- ═══════════════════════════════════════════════════════════════════
-- CHANGE AND TRANSFORMATION
-- ═══════════════════════════════════════════════════════════════════

axiom RealChange : Obj → Obj → Prop
axiom Changes : Obj → Prop
axiom Born : Obj → Prop
axiom Dies : Obj → Prop

-- ═══════════════════════════════════════════════════════════════════
-- FIVE SHEATHS (Pañca-kośa)
-- ═══════════════════════════════════════════════════════════════════

axiom Annamaya : Obj → Prop      -- Physical sheath
axiom Pranamaya : Obj → Prop     -- Vital sheath
axiom Manomaya : Obj → Prop      -- Mental sheath
axiom Vijnanamaya : Obj → Prop   -- Intellectual sheath
axiom Anandamaya : Obj → Prop    -- Bliss sheath
def Sheath (x : Obj) : Prop := 
  Annamaya x ∨ Pranamaya x ∨ Manomaya x ∨ Vijnanamaya x ∨ Anandamaya x
axiom Layer : Obj → Obj → Prop

-- ═══════════════════════════════════════════════════════════════════
-- THREE GUṆAS
-- ═══════════════════════════════════════════════════════════════════

axiom Sattva : Obj → Prop
axiom Rajas : Obj → Prop
axiom Tamas : Obj → Prop
def HasGuna (x : Obj) : Prop := Sattva x ∨ Rajas x ∨ Tamas x

-- ═══════════════════════════════════════════════════════════════════
-- EGO AND SPACETIME
-- ═══════════════════════════════════════════════════════════════════

axiom Ego : Obj → Prop
axiom ApparentSubject : Obj → Prop
axiom Identifies : Obj → Obj → Prop
axiom SpaceItself : Obj → Prop
axiom TimeItself : Obj → Prop

-- ═══════════════════════════════════════════════════════════════════
-- EVENT STRUCTURE
-- ═══════════════════════════════════════════════════════════════════

axiom EE : Event → Prop                  -- Event exists
axiom Before : Time → Time → Prop        -- Temporal ordering
axiom OccursAt : Event → Time → Prop     -- Event occurrence
axiom EventOf : Event → Obj → Prop       -- Event association
axiom CausesEvent : Event → Event → Prop -- Causal relation

-- Event constructors
axiom PerceptionEvent : Obj → Obj → Event
axiom ChangeEvent : Obj → Event
axiom BirthEvent : Obj → Event
axiom DeathEvent : Obj → Event

end AdvaitaVedanta
