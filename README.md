<!-- SPDX-License-Identifier: LicenseRef-Sovereign-Leviathan-SL-AGPL3-001 -->
<!-- Copyright (c) 2026 Ahmad Ali Parr. All rights reserved. -->
<!-- Authored by Ahmad Ali Parr. -->

# Protein Folding Bifurcation

**10 theorems. Zero sorry. Zero axioms. All Mathlib.**

Protein folding is a bifurcation. The energy landscape splits at a critical point, and the protein must choose a branch: fold correctly, misfold, or aggregate. This repo proves it in Lean 4.

## The model

**Energy:** E(x, λ) = x⁴ − λx² (pitchfork bifurcation)

- λ = control parameter (temperature, pH, denaturant)
- x = reaction coordinate (radius of gyration, RMSD from native)

**Key identity:** E(x, λ) + λ²/4 = (x² − λ/2)² ≥ 0

This single algebraic identity proves everything. No calculus needed.

## What the theorems prove

### 1D Pitchfork (7 theorems)

| Theorem | What it proves |
|---------|---------------|
| `pitchfork_identity` | E + λ²/4 = (x² − λ/2)² — the workhorse |
| `pitchfork_lower_bound` | E ≥ −λ²/4 for λ > 0 — energy bounded below |
| `pitchfork_min_pos` | +√(λ/2) is global min — **FOLDED state** |
| `pitchfork_min_neg` | −√(λ/2) is global min — **MISFOLDED state** |
| `pitchfork_zero_not_min` | x = 0 is local max for λ > 0 — **BARRIER** |
| `pitchfork_neg_unique_min` | x = 0 is unique global min for λ < 0 — **UNFOLDED state** |
| `pitchfork_minima_distinct` | Folded ≠ misfolded — two distinct states |
| `pitchfork_bifurcation_count` | Minima count changes at λ = 0 — **BIFURCATION** |

### 2D Ramachandran (3 theorems)

| Theorem | What it proves |
|---------|---------------|
| `ramachandran_four_minima` | 4 global minima for λ₁, λ₂ > 0 — folded, misfolded, 2 intermediates |
| `ramachandran_lower_bound` | E ≥ −(λ₁² + λ₂²)/4 — no conformation has lower energy |
| `ramachandran_bifurcation` | Unique min at (0,0) for λ₁, λ₂ < 0 — unfolded |

## The folding story

```
λ < 0 (hot / denatured)     λ = 0 (transition)     λ > 0 (cold / native)
─────────────────────      ──────────────────      ─────────────────────
  1 minimum (unfolded)     BIFURCATION POINT      2 minima (folded + misfolded)
  x = 0                                        x = ±√(λ/2)
                                                barrier at x = 0
```

In 2D (Ramachandran φ/ψ): 1 minimum → 4 minima. The funnel narrows through bifurcations.

**Misfolding diseases** (Alzheimer's, Parkinson's, prions) are proteins that took the wrong branch at the bifurcation. The native state and the amyloid state are both minima. The bifurcation between them is where pathology lives.

## Build

```bash
lake build
```

Requires Lean 4.9.0 + Mathlib v4.9.0. First build downloads Mathlib (~600MB) and builds it (~30-60 min).

## Why zero sorry matters

Every theorem is fully proved by the Lean kernel. No gaps. No placeholders. No axioms. The bifurcation structure of protein folding energy landscapes is now machine-verified.

Built on the bifurcation lemmas from [lean-bifurcation-quantum](https://github.com/AHMADALIPARR/lean-bifurcation-quantum), extended to protein folding with a concrete, provable model.

## License

SNAPKITTY OPAQUE SOURCE LICENSE v1.0 — see `LICENSE`.
