import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure BucklingModel where
  geometry : Type u
  material : Type v
  boundaryConditions : Prop
  equilibriumPath : Prop
  criticalLoad : ℝ
  modeShape : Type w

def BucklingModelClosed (M : BucklingModel) : Prop :=
  M.boundaryConditions ∧ M.equilibriumPath

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse