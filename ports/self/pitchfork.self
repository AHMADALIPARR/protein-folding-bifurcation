// SPDX-License-Identifier: LicenseRef-Sovereign-Leviathan-SL-AGPL3-001
// Copyright (c) 2026 Ahmad Ali Parr. All rights reserved.
// Authored by Ahmad Ali Parr.
// Self: pitchfork energy prototype
// Mirrors ProteinFoldingBifurcation.lean

bootstrap addSlotsTo: globals From: (| parent* = traits clonable |)

| pitchforkEnergy = (|
  parent* = traits clonable.

  " E(x, λ) = x⁴ - λx² "
  energy: x Lambda: lam = (
    (x ^ 4) - (lam * (x ^ 2))
  ).

  " Key identity: E + λ²/4 = (x² - λ/2)² "
  identity: x Lambda: lam = (
    ((self energy: x Lambda: lam) + ((lam ^ 2) / 4))
      = ((x ^ 2) - (lam / 2)) ^ 2
  ).

  " Global minimum energy for λ > 0 "
  minEnergy: lam = ( -1 * ((lam ^ 2) / 4) ).

  " Folded state: x = +√(λ/2) "
  foldedX: lam = ( (lam / 2) sqrt ).

  " Misfolded state: x = -√(λ/2) "
  misfoldedX: lam = ( -1 * ((lam / 2) sqrt) ).

  " Bifurcation: count minima "
  minimaCount: lam = (
    lam < 0 ifTrue: [1] False: [2]
  ).

  " State: unfolded / bifurcation / folded "
  state: lam = (
    lam < 0 ifTrue: ['unfolded']
    False: [lam = 0 ifTrue: ['bifurcation'] False: ['folded']]
  ).
|)
