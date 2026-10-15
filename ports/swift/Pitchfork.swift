// SPDX-License-Identifier: LicenseRef-Sovereign-Leviathan-SL-AGPL3-001
// Copyright (c) 2026 Ahmad Ali Parr. All rights reserved.
// Authored by Ahmad Ali Parr.
// Swift: pitchfork bifurcation
// Mirrors ProteinFoldingBifurcation.lean

import Foundation

/// Protein folding energy landscape: E(x, λ) = x⁴ - λx²
struct EnergyLandscape {
    let lambda: Double

    /// Energy at position x
    func energy(at x: Double) -> Double {
        pow(x, 4) - lambda * pow(x, 2)
    }

    /// Key identity: E + λ²/4 = (x² - λ/2)²
    func identityHolds(at x: Double) -> Bool {
        let lhs = energy(at: x) + (lambda * lambda) / 4
        let rhs = pow(pow(x, 2) - lambda / 2, 2)
        return abs(lhs - rhs) < 1e-10
    }

    /// Global minimum energy (λ > 0)
    var minEnergy: Double {
        -lambda * lambda / 4
    }

    /// Folded state: x = +√(λ/2)
    var foldedX: Double {
        sqrt(lambda / 2)
    }

    /// Misfolded state: x = -√(λ/2)
    var misfoldedX: Double {
        -sqrt(lambda / 2)
    }

    /// Number of global minima
    var minimaCount: Int {
        lambda < 0 ? 1 : 2
    }

    /// State classification
    var state: FoldingState {
        if lambda < 0 { return .unfolded }
        if lambda == 0 { return .bifurcation }
        return .folded
    }
}

enum FoldingState {
    case unfolded, bifurcation, folded
}

// Example:
let landscape = EnergyLandscape(lambda: 2.0)
print("Energy at folded: \(landscape.energy(at: landscape.foldedX))")  // -1.0
print("Minima: \(landscape.minimaCount)")  // 2
print("State: \(landscape.state)")  // folded
