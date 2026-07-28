import canonicalLaneMathlib.AdmissibleClass
import BifurcationBucklingCanonicalLaneLean.BucklingBeamModel

/-!
# Linear Buckling Analysis Package
-/

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure LinearBucklingPackage (B : BucklingBeamPackage) where
  differentialEquation : Prop
  eigenvalueProblem : Prop
  bucklingModes : List (ℝ → ℝ)
  orthogonality : Prop
  criticalLoadFactor : ℝ

structure LinearBucklingEvidence {B : BucklingBeamPackage} (L : LinearBucklingPackage B) where
  differentialEquationClosed : L.differentialEquation
  eigenvalueProblemClosed : L.eigenvalueProblem
  bucklingModesClosed : L.bucklingModes.length > 0
  orthogonalityClosed : L.orthogonality
  criticalLoadFactorClosed : L.criticalLoadFactor = B.eulerBucklingLoad

def LinearBucklingClosed {B : BucklingBeamPackage} (L : LinearBucklingPackage B) : Prop :=
  L.differentialEquation ∧ L.eigenvalueProblem ∧ (L.bucklingModes.length > 0) ∧
  L.orthogonality ∧ (L.criticalLoadFactor = B.eulerBucklingLoad)

theorem linear_buckling_closed_from_evidence
    {B : BucklingBeamPackage} (L : LinearBucklingPackage B) (E : LinearBucklingEvidence L) :
    LinearBucklingClosed L := by
  exact And.intro E.differentialEquationClosed
    (And.intro E.eigenvalueProblemClosed
      (And.intro E.bucklingModesClosed
        (And.intro E.orthogonalityClosed E.criticalLoadFactorClosed)))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse