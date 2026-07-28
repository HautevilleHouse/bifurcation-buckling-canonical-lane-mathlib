import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure EquilibriumPackage where
  equilibriumEquations : Prop
  linearizedStability : Prop
  preBucklingBehavior : Prop
  loadDeflectionRelation : Prop

structure EquilibriumEvidence (P : EquilibriumPackage) where
  equilibriumEquationsClosed : P.equilibriumEquations
  linearizedStabilityClosed : P.linearizedStability
  preBucklingBehaviorClosed : P.preBucklingBehavior
  loadDeflectionRelationClosed : P.loadDeflectionRelation

def EquilibriumClosed (P : EquilibriumPackage) : Prop :=
  P.equilibriumEquations ∧ P.linearizedStability ∧
  P.preBucklingBehavior ∧ P.loadDeflectionRelation

theorem equilibrium_closed_from_evidence (P : EquilibriumPackage)
    (E : EquilibriumEvidence P) : EquilibriumClosed P := by
  exact And.intro E.equilibriumEquationsClosed
    (And.intro E.linearizedStabilityClosed
      (And.intro E.preBucklingBehaviorClosed E.loadDeflectionRelationClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse