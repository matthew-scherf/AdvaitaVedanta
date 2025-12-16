# Advaita Vedānta: A Formal Axiomatization

**Abstract.** We present a first-order axiomatization of Advaita Vedānta metaphysics, formalized and verified in the Lean 4 proof assistant. The system comprises 69 primitive axioms organized into ten modules, capturing the core doctrines of non-dual Śaṅkara Vedānta including the identity of Ātman and Brahman, the three levels of reality, the theory of superimposition (adhyāsa), and the three-state analysis (avasthā-traya) from the Māṇḍūkya Upaniṣad. All proofs are machine-verified.

---

## 1. Signature

### 1.1 Sorts

We introduce five primitive sorts:

| Sort | Interpretation |
|:-----|:---------------|
| $\mathsf{Obj}$ | Domain of entities (objects, subjects, states of affairs) |
| $\mathsf{Level}$ | Ontological reality levels |
| $\mathsf{Time}$ | Temporal instants |
| $\mathsf{Event}$ | Occurrences |
| $\mathsf{State}$ | States of consciousness |

### 1.2 Constants

**Level Constants.** We posit three levels of reality:

$$\mathsf{Param}, \mathsf{Vyav}, \mathsf{Prat} : \mathsf{Level}$$

corresponding to *pāramārthika* (ultimate), *vyāvahārika* (conventional), and *prātibhāsika* (illusory) reality respectively.

**State Constants.** We posit three states of consciousness:

$$\mathsf{Jagrat}, \mathsf{Svapna}, \mathsf{Susupti} : \mathsf{State}$$

corresponding to waking, dream, and deep sleep.

### 1.3 Primitive Predicates

**Metaphysical Status.**

| Predicate | Type | Interpretation |
|:----------|:-----|:---------------|
| $A$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is Absolute (Brahman-nature) |
| $C$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is Conditioned (phenomenal) |
| $Y$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is ultimate Subject (Ātman-nature) |

**Phenomenal Properties.**

| Predicate | Type | Interpretation |
|:----------|:-----|:---------------|
| $T_p$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is temporal |
| $S_p$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is spatial |
| $Q_p$ | $\mathsf{Obj} \to \mathsf{Prop}$ | is qualitative |

**Saccidānanda.**

| Predicate | Type | Interpretation |
|:----------|:-----|:---------------|
| $\mathsf{Sat}$ | $\mathsf{Obj} \to \mathsf{Prop}$ | has Being-nature |
| $\mathsf{Cit}$ | $\mathsf{Obj} \to \mathsf{Prop}$ | has Consciousness-nature |
| $\mathsf{Ananda}$ | $\mathsf{Obj} \to \mathsf{Prop}$ | has Bliss-nature |

**Ontological Relations.**

| Predicate | Type | Interpretation |
|:----------|:-----|:---------------|
| $\mathsf{Cond}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | ontological grounding |
| $\mathsf{MayaPow}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | māyā-śakti manifestation |
| $\mathsf{Superimposed}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | adhyāsa |
| $\mathsf{Appears}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | vivarta |
| $\mathsf{IgnoranceOf}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | avidyā |
| $\mathsf{Upadhi}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | limiting adjunct |
| $\mathsf{Sublates}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | bādha |
| $\mathsf{Level\_of}$ | $\mathsf{Obj} \times \mathsf{Level} \to \mathsf{Prop}$ | level assignment |

**Awareness Relations.**

| Predicate | Type | Interpretation |
|:----------|:-----|:---------------|
| $\mathsf{Perceives}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | dualistic perception |
| $\mathsf{Witnesses}$ | $\mathsf{Obj} \times \mathsf{Obj} \to \mathsf{Prop}$ | non-dual witnessing |

**Entity Classifications.**

| Predicates | Type |
|:-----------|:-----|
| $\mathsf{Jiva}, \mathsf{Isvara}, \mathsf{World}$ | $\mathsf{Obj} \to \mathsf{Prop}$ |
| $\mathsf{SthulaSarira}, \mathsf{SukshmaSarira}, \mathsf{KaranaSarira}$ | $\mathsf{Obj} \to \mathsf{Prop}$ |

**Five Sheaths (Pañca-kośa).**
$$\mathsf{Annamaya}, \mathsf{Pranamaya}, \mathsf{Manomaya}, \mathsf{Vijnanamaya}, \mathsf{Anandamaya} : \mathsf{Obj} \to \mathsf{Prop}$$

**Three Guṇas.**
$$\mathsf{Sattva}, \mathsf{Rajas}, \mathsf{Tamas} : \mathsf{Obj} \to \mathsf{Prop}$$

**State Relations.**

| Predicate | Type |
|:----------|:-----|
| $\mathsf{InState}$ | $\mathsf{Obj} \times \mathsf{State} \to \mathsf{Prop}$ |
| $\mathsf{Manifests}$ | $\mathsf{Obj} \times \mathsf{Obj} \times \mathsf{State} \to \mathsf{Prop}$ |

**Temporal and Event Relations.**

| Predicate | Type |
|:----------|:-----|
| $\mathsf{Before}$ | $\mathsf{Time} \times \mathsf{Time} \to \mathsf{Prop}$ |
| $\mathsf{OccursAt}$ | $\mathsf{Event} \times \mathsf{Time} \to \mathsf{Prop}$ |
| $\mathsf{EventOf}$ | $\mathsf{Event} \times \mathsf{Obj} \to \mathsf{Prop}$ |
| $\mathsf{CausesEvent}$ | $\mathsf{Event} \times \mathsf{Event} \to \mathsf{Prop}$ |

### 1.4 Defined Predicates

$$\Phi(x) \coloneqq T_p(x) \lor S_p(x) \lor Q_p(x)$$

$$\mathsf{Saccidananda}(x) \coloneqq \mathsf{Sat}(x) \land \mathsf{Cit}(x) \land \mathsf{Ananda}(x)$$

$$\mathsf{Sheath}(x) \coloneqq \mathsf{Annamaya}(x) \lor \mathsf{Pranamaya}(x) \lor \mathsf{Manomaya}(x) \lor \mathsf{Vijnanamaya}(x) \lor \mathsf{Anandamaya}(x)$$

$$\mathsf{HasGuna}(x) \coloneqq \mathsf{Sattva}(x) \lor \mathsf{Rajas}(x) \lor \mathsf{Tamas}(x)$$

---

## 2. Core Axioms

### 2.1 Fundamental Classification

**Axiom A1** (Exhaustive Partition).
$$\forall x.\; A(x) \lor C(x)$$
$$\forall x.\; \lnot(A(x) \land C(x))$$

*Every entity is either Absolute or Conditioned, but not both.*

**Axiom A2** (Unique Absolute).
$$(\exists a.\; A(a)) \land (\forall a_1, a_2.\; A(a_1) \land A(a_2) \to a_1 = a_2)$$

*There exists exactly one Absolute.*

**Axiom A3** (Unique Subject).
$$(\exists u.\; Y(u)) \land (\forall u_1, u_2.\; Y(u_1) \land Y(u_2) \to u_1 = u_2)$$

*There exists exactly one ultimate Subject.*

**Axiom A4** (Tat Tvam Asi).
$$\forall x.\; Y(x) \leftrightarrow A(x)$$

*The Subject is identical with the Absolute. This is the core mahāvākya.*

### 2.2 Grounding Relations

**Axiom A5** (Self-Grounding).
$$\forall a.\; A(a) \to \mathsf{Cond}(a, a)$$

**Axiom A6** (Universal Grounding).
$$\forall x.\; \exists a.\; A(a) \land \mathsf{Cond}(a, x)$$

*Everything is grounded in the Absolute.*

**Axiom A9** (Asymmetry).
$$\forall x, y.\; \mathsf{Cond}(x, y) \land \mathsf{Cond}(y, x) \to (x = y \land A(x))$$

*Mutual grounding implies identity with the Absolute.*

**Axiom A10** (Transitivity).
$$\forall x, y, z.\; \mathsf{Cond}(x, y) \land \mathsf{Cond}(y, z) \to \mathsf{Cond}(x, z)$$

### 2.3 Nature of the Absolute

**Axiom A7a** (Transcendence).
$$\forall a.\; A(a) \to (\lnot T_p(a) \land \lnot S_p(a) \land \lnot Q_p(a))$$

*The Absolute transcends time, space, and quality.*

**Axiom A7b** (Saccidānanda).
$$\forall a.\; A(a) \to \mathsf{Saccidananda}(a)$$

*The Absolute is Being-Consciousness-Bliss.*

**Axiom A8** (Conditioned is Phenomenal).
$$\forall x.\; C(x) \to \Phi(x)$$

### 2.4 Awareness

**Axiom A11** (Universal Witnessing).
$$\forall a, x.\; A(a) \to \mathsf{Witnesses}(a, x)$$

*The Absolute witnesses everything.*

**Axiom A13** (Subject Does Not Perceive).
$$\forall u, o.\; Y(u) \to \lnot\mathsf{Perceives}(u, o)$$

*The Subject never perceives dualistically.*

**Axiom W4** (Perceiver is Conditioned).
$$\forall s.\; (\exists o.\; \mathsf{Perceives}(s, o)) \to C(s)$$

**Axiom W11** (Witness-Absolute Identity).
$$\forall w.\; (\forall x.\; \mathsf{Witnesses}(w, x)) \to A(w)$$

*Whatever witnesses everything is the Absolute.*

### 2.5 Change and Permanence

**Axiom CH1–3** (Absolute is Unchanging).
$$\forall a.\; A(a) \to \lnot\mathsf{Changes}(a)$$
$$\forall a.\; A(a) \to \lnot\mathsf{Born}(a)$$
$$\forall a.\; A(a) \to \lnot\mathsf{Dies}(a)$$

**Axiom CH4** (Conditioned Changes).
$$\forall x.\; C(x) \land \mathsf{Level\_of}(x, \mathsf{Vyav}) \to (\mathsf{Born}(x) \lor \mathsf{Dies}(x) \lor \mathsf{Changes}(x))$$

---

## 3. Level Axioms

**Axiom K1** (Exhaustive Levels).
$$\forall x.\; \mathsf{Level\_of}(x, \mathsf{Param}) \lor \mathsf{Level\_of}(x, \mathsf{Vyav}) \lor \mathsf{Level\_of}(x, \mathsf{Prat})$$

**Axiom K2** (Absolute at Pāramārthika Only).
$$\forall a.\; A(a) \to \mathsf{Level\_of}(a, \mathsf{Param})$$
$$\forall a.\; A(a) \to \lnot\mathsf{Level\_of}(a, \mathsf{Vyav})$$
$$\forall a.\; A(a) \to \lnot\mathsf{Level\_of}(a, \mathsf{Prat})$$

**Axiom K3–4** (Conditioned at Lower Levels).
$$\forall x.\; C(x) \to \lnot\mathsf{Level\_of}(x, \mathsf{Param})$$
$$\forall x.\; C(x) \to (\mathsf{Level\_of}(x, \mathsf{Vyav}) \lor \mathsf{Level\_of}(x, \mathsf{Prat}))$$

**Axiom K5** (Hierarchical Sublation).
$$\forall x, y.\; C(x) \land \mathsf{Level\_of}(x, \mathsf{Vyav}) \land \mathsf{Level\_of}(y, \mathsf{Prat}) \to \mathsf{Sublates}(x, y)$$

**Axiom K6** (Non-Empty Vyāvahārika).
$$\exists x.\; \mathsf{Level\_of}(x, \mathsf{Vyav})$$

---

## 4. Māyā Axioms

**Axiom M1** (Māyā Source).
$$\forall a, x.\; \mathsf{MayaPow}(a, x) \to A(a)$$

*Only the Absolute wields māyā-śakti.*

**Axiom M2** (Conditioned via Māyā).
$$\forall x.\; C(x) \to (\exists a.\; A(a) \land \mathsf{MayaPow}(a, x))$$

*All conditioned entities arise through māyā.*

**Axiom M4** (Māyā Implies Grounding).
$$\forall a, x.\; \mathsf{MayaPow}(a, x) \to \mathsf{Cond}(a, x)$$

**Axiom M5** (Absolute Not Subject to Māyā).
$$\forall a, x.\; A(a) \to \lnot\mathsf{MayaPow}(x, a)$$

**Axiom M6–7** (Superimposition Structure).
$$\forall x, y.\; \mathsf{Superimposed}(x, y) \to C(x)$$
$$\forall x, y.\; \mathsf{Superimposed}(x, y) \to A(y)$$

*Superimposition is always of the conditioned upon the Absolute.*

**Axiom M9** (Appearance Without Change).
$$\forall x, y.\; \mathsf{Appears}(x, y) \to \lnot\mathsf{RealChange}(x, y)$$

*Vivarta: appearance involves no real transformation of the substratum.*

**Axiom M10** (All Conditioned Appears).
$$\forall x.\; C(x) \to (\exists a.\; A(a) \land \mathsf{Appears}(a, x))$$

**Axiom M12** (Ignorance of the Absolute).
$$\forall s, x.\; \mathsf{IgnoranceOf}(s, x) \to A(x)$$

**Axiom M15** (Absolute Has No Ignorance).
$$\forall a, x.\; A(a) \to \lnot\mathsf{IgnoranceOf}(a, x)$$

**Axiom M18** (Sublation Asymmetry).
$$\forall k_1, k_2.\; \mathsf{Sublates}(k_1, k_2) \to \lnot\mathsf{Sublates}(k_2, k_1)$$

---

## 5. Jīva and Īśvara Axioms

**Axiom J1** (Jīva is Conditioned).
$$\forall j.\; \mathsf{Jiva}(j) \to C(j)$$

**Axiom J2** (Jīva at Vyāvahārika).
$$\forall j.\; \mathsf{Jiva}(j) \to \mathsf{Level\_of}(j, \mathsf{Vyav})$$

**Axiom J4** (Jīva is Embodied).
$$\forall j.\; \mathsf{Jiva}(j) \to (\exists b.\; \mathsf{Body}(b) \land \mathsf{Embodied}(j, b))$$

**Axiom J6** (Jīva Has Ignorance).
$$\forall j.\; \mathsf{Jiva}(j) \to (\exists a.\; A(a) \land \mathsf{IgnoranceOf}(j, a))$$

**Axiom J7a** (Jīva Has Spatial Upādhi).
$$\forall j.\; \mathsf{Jiva}(j) \to (\exists s.\; \mathsf{SpaceItself}(s) \land \mathsf{Upadhi}(s, j))$$

**Axiom J8** (Multiple Jīvas).
$$\exists j_1, j_2.\; \mathsf{Jiva}(j_1) \land \mathsf{Jiva}(j_2) \land j_1 \neq j_2$$

**Axiom I1–2** (Īśvara is Conditioned at Vyāvahārika).
$$\forall i.\; \mathsf{Isvara}(i) \to C(i)$$
$$\forall i.\; \mathsf{Isvara}(i) \to \mathsf{Level\_of}(i, \mathsf{Vyav})$$

**Axiom I5** (Unique Īśvara).
$$\forall i_1, i_2.\; \mathsf{Isvara}(i_1) \land \mathsf{Isvara}(i_2) \to i_1 = i_2$$

---

## 6. Upādhi and Guṇa Axioms

**Axiom U1** (Upādhi Implies Conditioned).
$$\forall u, x.\; \mathsf{Upadhi}(u, x) \to C(x)$$

**Axiom U2** (Absolute Has No Upādhi).
$$\forall u, a.\; A(a) \to \lnot\mathsf{Upadhi}(u, a)$$

**Axiom G1** (Conditioned Has Guṇas).
$$\forall x.\; C(x) \to \mathsf{HasGuna}(x)$$

**Axiom G2** (Absolute Transcends Guṇas).
$$\forall a.\; A(a) \to (\lnot\mathsf{Sattva}(a) \land \lnot\mathsf{Rajas}(a) \land \lnot\mathsf{Tamas}(a))$$

---

## 7. Sheath Axioms

**Axiom S1** (Sheaths are Conditioned).
$$\forall s.\; \mathsf{Sheath}(s) \to C(s)$$

**Axiom S3–6** (Sheath Layering).
$$\forall x.\; \mathsf{Annamaya}(x) \to (\exists y.\; \mathsf{Pranamaya}(y) \land \mathsf{Layer}(x, y))$$
$$\forall x.\; \mathsf{Pranamaya}(x) \to (\exists y.\; \mathsf{Manomaya}(y) \land \mathsf{Layer}(x, y))$$
$$\forall x.\; \mathsf{Manomaya}(x) \to (\exists y.\; \mathsf{Vijnanamaya}(y) \land \mathsf{Layer}(x, y))$$
$$\forall x.\; \mathsf{Vijnanamaya}(x) \to (\exists y.\; \mathsf{Anandamaya}(y) \land \mathsf{Layer}(x, y))$$

**Axiom S7** (Layer Grounding).
$$\forall x, y.\; \mathsf{Layer}(x, y) \to \mathsf{Cond}(y, x)$$

---

## 8. Temporal Axioms

**Axiom T1–4** (Strict Linear Order).
$$\forall t.\; \lnot\mathsf{Before}(t, t) \tag{Irreflexivity}$$
$$\forall t_1, t_2, t_3.\; \mathsf{Before}(t_1, t_2) \land \mathsf{Before}(t_2, t_3) \to \mathsf{Before}(t_1, t_3) \tag{Transitivity}$$
$$\forall t_1, t_2.\; \mathsf{Before}(t_1, t_2) \to \lnot\mathsf{Before}(t_2, t_1) \tag{Asymmetry}$$
$$\forall t_1, t_2.\; t_1 \neq t_2 \to (\mathsf{Before}(t_1, t_2) \lor \mathsf{Before}(t_2, t_1)) \tag{Linearity}$$

**Axiom T5–6** (Non-Trivial Time).
$$\exists t.\; \top$$
$$\exists t_1, t_2.\; t_1 \neq t_2$$

---

## 9. Event Axioms

**Axiom E1–2** (Event Existence).
$$\forall e.\; \mathsf{EE}(e) \leftrightarrow (\exists t.\; \mathsf{OccursAt}(e, t))$$
$$\forall e.\; \mathsf{EE}(e) \to (\forall t_1, t_2.\; \mathsf{OccursAt}(e, t_1) \land \mathsf{OccursAt}(e, t_2) \to t_1 = t_2)$$

**Axiom E3** (Events Have Objects).
$$\forall e.\; \mathsf{EE}(e) \to (\exists x.\; \mathsf{EventOf}(e, x))$$

**Axiom E9** (Causal Ordering).
$$\forall e_1, e_2, t_1, t_2.\; \mathsf{CausesEvent}(e_1, e_2) \land \mathsf{OccursAt}(e_1, t_1) \land \mathsf{OccursAt}(e_2, t_2) \to \mathsf{Before}(t_1, t_2)$$

**Axiom E10** (Absolute Has No Events).
$$\forall a, e.\; A(a) \to \lnot\mathsf{EventOf}(e, a)$$

---

## 10. State Axioms (Avasthā-Traya)

### 10.1 State Structure

**State Distinctness.**
$$\mathsf{Jagrat} \neq \mathsf{Svapna} \qquad \mathsf{Svapna} \neq \mathsf{Susupti} \qquad \mathsf{Jagrat} \neq \mathsf{Susupti}$$

**Axiom AV1** (Unique State).
$$\forall j.\; \mathsf{Jiva}(j) \to (\exists s.\; \mathsf{InState}(j, s))$$
$$\forall j, s_1, s_2.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, s_1) \land \mathsf{InState}(j, s_2) \to s_1 = s_2$$

### 10.2 Waking State (Jāgrat)

**Axiom AV3** (Waking Manifestation).
$$\forall j.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Jagrat}) \to (\exists b.\; \mathsf{SthulaSarira}(b) \land \mathsf{Manifests}(b, j, \mathsf{Jagrat}))$$
$$\forall j.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Jagrat}) \to (\exists w.\; \mathsf{World}(w) \land \mathsf{Manifests}(w, j, \mathsf{Jagrat}))$$

**Axiom AV5** (Waking Objects at Vyāvahārika).
$$\forall j, x.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Jagrat}) \land \mathsf{Manifests}(x, j, \mathsf{Jagrat}) \land \mathsf{World}(x) \to \mathsf{Level\_of}(x, \mathsf{Vyav})$$

### 10.3 Dream State (Svapna)

**Axiom AV6–7** (Dream Non-Manifestation).
$$\forall j, b.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Svapna}) \land \mathsf{SthulaSarira}(b) \to \lnot\mathsf{Manifests}(b, j, \mathsf{Svapna})$$
$$\forall j, w.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Svapna}) \land \mathsf{World}(w) \to \lnot\mathsf{Manifests}(w, j, \mathsf{Svapna})$$

**Axiom AV10** (Dream Objects at Prātibhāsika).
$$\forall j, x.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Svapna}) \land \mathsf{Manifests}(x, j, \mathsf{Svapna}) \land \lnot\mathsf{SukshmaSarira}(x) \to \mathsf{Level\_of}(x, \mathsf{Prat})$$

### 10.4 Deep Sleep (Suṣupti)

**Axiom AV11** (Complete Withdrawal).
$$\forall j, x.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Susupti}) \to \lnot\mathsf{Manifests}(x, j, \mathsf{Susupti})$$

*This is the key axiom: nothing manifests in deep sleep.*

### 10.5 The Witness (Sākṣin)

**Axiom AV16** (Witness Persists).
$$\forall j, s.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, s) \to (\exists u.\; Y(u) \land \mathsf{Witnesses}(u, j))$$

**Axiom AV18** (Witness Transcends States).
$$\forall u, s.\; Y(u) \to \lnot\mathsf{InState}(u, s)$$

*The witness is never "in" any state—it is turīya, the fourth.*

### 10.6 Criterion of Reality

**Axiom AV22** (Transience Implies Non-Absolute).
$$\forall x, j, s_1, s_2.\; \mathsf{Jiva}(j) \land \mathsf{Manifests}(x, j, s_1) \land \lnot\mathsf{Manifests}(x, j, s_2) \to \lnot A(x)$$

*What appears in one state but not another cannot be ultimately real.*

**Axiom AV23** (Absolute Never Manifests).
$$\forall a, j, s.\; A(a) \land \mathsf{Jiva}(j) \to \lnot\mathsf{Manifests}(a, j, s)$$

### 10.7 Bodies are Conditioned

**Axiom AV24–25.**
$$\forall b.\; \mathsf{SthulaSarira}(b) \to C(b)$$
$$\forall m.\; \mathsf{SukshmaSarira}(m) \to C(m)$$
$$\forall k.\; \mathsf{KaranaSarira}(k) \to C(k)$$
$$\forall w.\; \mathsf{World}(w) \to C(w)$$

---

## 11. Key Theorems

### 11.1 Identity Theorems

**Theorem T0** (Brahman-Ātman Identity).
$$\mathsf{Brahman} = \mathsf{Atman}$$

*Proof.* By A2, A3, and A4. $\square$

**Theorem T5** (Subject-Absolute Equivalence).
$$\forall u.\; Y(u) \leftrightarrow A(u)$$

*This is axiom A4 itself—the core of Tat Tvam Asi.*

### 11.2 Transcendence Theorems

**Theorem T13** (Absolute Transcends Phenomenality).
$$\lnot\Phi(\mathsf{Brahman})$$

**Theorem T29** (Subject Transcends Guṇas).
$$\lnot\mathsf{Sattva}(\mathsf{Atman}) \land \lnot\mathsf{Rajas}(\mathsf{Atman}) \land \lnot\mathsf{Tamas}(\mathsf{Atman})$$

### 11.3 State Analysis Theorems

**Theorem ST10–11** (World and Body Absent in Deep Sleep).
$$\forall j, w.\; \mathsf{Jiva}(j) \land \mathsf{World}(w) \land \mathsf{InState}(j, \mathsf{Susupti}) \to \lnot\mathsf{Manifests}(w, j, \mathsf{Susupti})$$
$$\forall j, b.\; \mathsf{Jiva}(j) \land \mathsf{SthulaSarira}(b) \land \mathsf{InState}(j, \mathsf{Susupti}) \to \lnot\mathsf{Manifests}(b, j, \mathsf{Susupti})$$

**Theorem ST12–13** (World and Body Return on Waking).
$$\forall j.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Jagrat}) \to (\exists w.\; \mathsf{World}(w) \land \mathsf{Manifests}(w, j, \mathsf{Jagrat}))$$
$$\forall j.\; \mathsf{Jiva}(j) \land \mathsf{InState}(j, \mathsf{Jagrat}) \to (\exists b.\; \mathsf{SthulaSarira}(b) \land \mathsf{Manifests}(b, j, \mathsf{Jagrat}))$$

### 11.4 "You Are Not" Corollaries

**Corollary** (You Are Not the Body).
$$\forall u, b.\; Y(u) \land \mathsf{SthulaSarira}(b) \to u \neq b$$

**Corollary** (You Are Not the Mind).
$$\forall u, m.\; Y(u) \land \mathsf{SukshmaSarira}(m) \to u \neq m$$

**Corollary** (You Are Not the World).
$$\forall u, w.\; Y(u) \land \mathsf{World}(w) \to u \neq w$$

*Proof.* By A4, $Y(u) \to A(u)$. By AV24–25, bodies/mind/world satisfy $C$. By A1b, $\lnot(A(x) \land C(x))$. $\square$

---

## 12. Axiom Summary

| Category | Count |
|:---------|------:|
| Core (A-series) | 12 |
| Level (K-series) | 6 |
| Māyā (M-series) | 10 |
| Jīva/Īśvara (J/I-series) | 8 |
| Upādhi/Guṇa (U/G-series) | 4 |
| Sheath (S-series) | 6 |
| Temporal (T-series) | 6 |
| Event (E-series) | 5 |
| State (AV-series) | 12 |
| **Total** | **69** |

---

## 13. Philosophical Remarks

### 13.1 What the Formalization Captures

1. **Non-duality (Advaita).** The identity $Y \leftrightarrow A$ (Axiom A4) expresses that the innermost self is Brahman.

2. **Three levels of reality.** The partition into $\mathsf{Param}/\mathsf{Vyav}/\mathsf{Prat}$ with hierarchical sublation.

3. **Māyā as appearance.** Vivarta (appearance without transformation) rather than pariṇāma (real modification).

4. **Three-state analysis.** The argument from deep sleep—what disappears cannot be ultimately real.

5. **Witness-consciousness.** Sākṣin as that which underlies all states without being in any state.

### 13.2 What the Formalization Cannot Capture

1. **Māyā's indeterminacy.** Māyā is classically described as "neither real nor unreal" (*sadasadvilakṣaṇa*). Classical logic cannot express this.

2. **The performative dimension.** "Tat Tvam Asi" is not just a proposition but a mahāvākya whose utterance is meant to trigger recognition.

3. **Beginninglessness of avidyā.** The temporal structure here assumes time exists; the doctrine that avidyā is *anādi* (beginningless) would require modal or non-well-founded frameworks.

4. **Liberation as recognition.** Mokṣa is not the production of a new state but the recognition of what was always the case.

---

## Appendix: Lean Definitions

```lean
-- Brahman: The unique Absolute
noncomputable def Brahman : Obj := Classical.choose A2.1

-- Atman: The unique Subject  
noncomputable def Atman : Obj := Classical.choose A3.1

-- Phenomenality
def Phi (x : Obj) : Prop := T_p x ∨ S_p x ∨ Q_p x

-- Saccidānanda
def Saccidananda (x : Obj) : Prop := Sat x ∧ Cit x ∧ Ananda x

-- Sheath predicate
def Sheath (x : Obj) : Prop := 
  Annamaya x ∨ Pranamaya x ∨ Manomaya x ∨ Vijnanamaya x ∨ Anandamaya x

-- Guṇa predicate
def HasGuna (x : Obj) : Prop := Sattva x ∨ Rajas x ∨ Tamas x
```

---

*This specification is verified in Lean 4.12.0. The complete proof development is available in the accompanying source files.*
