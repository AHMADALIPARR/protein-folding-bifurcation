import Lake
open Lake DSL

package «protein-folding-bifurcation» where
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.9.0"

@[default_target]
lean_lib «ProteinFoldingBifurcation» where
  roots := #[`ProteinFoldingBifurcation]
