// SPDX-License-Identifier: LicenseRef-Sovereign-Leviathan-SL-AGPL3-001
// Copyright (c) 2026 Ahmad Ali Parr. All rights reserved.
// Authored by Ahmad Ali Parr.
// Dylan: pitchfork bifurcation
// Mirrors ProteinFoldingBifurcation.lean

define library protein-folding
  use common-dylan;
  use transcendental;
  export protein-folding;
end library;

define module protein-folding
  use common-dylan;
  use transcendental;
  export <energy-landscape>, pitchfork-energy,
         folded-x, misfolded-x, minima-count, bifurcation?,
         min-energy;
end module;

define class <energy-landscape> (<object>)
  slot lambda :: <real>, required-init-keyword: lambda:;
end class;

// E(x, λ) = x⁴ - λx²
define method pitchfork-energy (x :: <real>, lam :: <real>)
    => (e :: <real>)
  (x ^ 4) - (lam * (x ^ 2))
end method;

// Key identity: E + λ²/4 = (x² - λ/2)²
define method pitchfork-identity? (x :: <real>, lam :: <real>)
    => (holds :: <boolean>)
  let e = pitchfork-energy(x, lam);
  (e + (lam ^ 2) / 4) = ((x ^ 2) - (lam / 2)) ^ 2
end method;

// Global minimum energy (λ > 0)
define method min-energy (lam :: <real>) => (e :: <real>)
  -((lam ^ 2) / 4)
end method;

// Folded: x = +√(λ/2)
define method folded-x (lam :: <real>) => (x :: <real>)
  sqrt(lam / 2)
end method;

// Misfolded: x = -√(λ/2)
define method misfolded-x (lam :: <real>) => (x :: <real>)
  -sqrt(lam / 2)
end method;

// Minima count: 1 if λ < 0, else 2
define method minima-count (lam :: <real>) => (n :: <integer>)
  if (lam < 0) 1 else 2 end
end method;

// Bifurcation at λ = 0?
define method bifurcation? (lam :: <real>) => (b :: <boolean>)
  lam = 0
end method;
