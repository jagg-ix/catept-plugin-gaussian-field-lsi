import Lake
open Lake DSL

package «catept-plugin-gaussian-field-lsi» where
  leanOptions := #[]

require GaussianField from git
  "https://github.com/jagg-ix/gaussian-field.git" @ "cacaa98743ee90a7dc9010d62eca488a8561953e"

-- Mathlib last so its version wins over any transitive constraint.
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "8a178386ffc0f5fef0b77738bb5449d50efeea95"

@[default_target]
lean_lib «CATEPTPluginGaussianFieldLSI» where
  roots := #[`CATEPTPluginGaussianFieldLSI.IntegrationBridge]
