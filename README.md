# catept-plugin-gaussian-field-lsi

Sibling repo of [`jagg-ix/catept-main`](https://github.com/jagg-ix/catept-main).
Sixth plugin extracted under [Target 5](https://github.com/jagg-ix/catept-main/blob/main/docs/architecture/targets/target-4-plan.md)
(Phase 2 / scale-out). T5.4.

## What this provides

Re-exports the [`GaussianField`](https://github.com/jagg-ix/gaussian-field)
package's proved theorems for use by CATEPT's BKM and entropic-time
bridges. Six theorems:

| Theorem | What it asserts |
|---|---|
| `proved_gross_log_sobolev` | Infinite-dim Gross LSI: `∫ (ω f)² log((ω f)² / E[(ω f)²]) dμ ≤ 2‖Tf‖²` |
| `proved_log_sobolev_1d` | 1D LSI: `∫ x² log(x²/σ²) dN(0,σ²) ≤ 2σ²` |
| `provedHasSpectralGap` | Spectral-gap predicate (re-exported) |
| `discrete_poincare_from_spectral_gap` | Spectral gap ⇒ discrete Poincaré inequality |
| `gaussian_field_content_available` | Witness conjunction (1D LSI + spectral-gap-Poincaré) |
| `proved_second_moment_eq_covariance` | `E[ω(f)²] = ⟨Tf, Tf⟩_H` |

All six depend only on the kernel axioms `propext`, `Classical.choice`,
`Quot.sound`. Verified via `#print axioms`. No `sorry`.

## Dependencies

| Pin | Version |
|---|---|
| Lean toolchain | `leanprover/lean4:v4.29.0` |
| Mathlib | `8a178386ffc0f5fef0b77738bb5449d50efeea95` |
| GaussianField | `jagg-ix/gaussian-field @ cacaa98743ee90a7dc9010d62eca488a8561953e` |

`Lattice.CombesThomas` lives inside the `GaussianField` package — no
separate pin needed.

## Re-import contract

```lean
require «catept-plugin-gaussian-field-lsi» from git
  "https://github.com/jagg-ix/catept-plugin-gaussian-field-lsi.git" @ "<sha>"
```

```lean
import CATEPTPluginGaussianFieldLSI.IntegrationBridge

open CATEPTPluginGaussianFieldLSI (
  proved_gross_log_sobolev proved_log_sobolev_1d
  provedHasSpectralGap discrete_poincare_from_spectral_gap
  gaussian_field_content_available
  log_sobolev_is_bkm_ingredient_1_backbone
  proved_second_moment_eq_covariance)
```

## Build locally

```bash
lake exe cache get
lake build
```

## License

MIT, matching `catept-main`.
