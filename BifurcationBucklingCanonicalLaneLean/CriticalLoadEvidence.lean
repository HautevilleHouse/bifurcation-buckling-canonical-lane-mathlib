import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.BucklingEquation
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.BucklingModels

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure CriticalLoadPackage {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} (Md : EulerColumnModelClosed M) where
  loadApplication : ℕ
  safetyFactor : ℕ
  criticalLoadVerification : loadApplication ≤ M.criticalAxialLoad / safetyFactor
  bucklingPreventionCondition : Prop
  criticalLoadVerified : criticalLoadVerification
  bucklingPreventionDerived : bucklingPreventionCondition

structure CriticalLoadEvidence {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    (C : CriticalLoadPackage Md) where
  criticalLoadVerifiedClosed : C.criticalLoadVerified
  bucklingPreventionDerivedClosed : C.bucklingPreventionDerived

def CriticalLoadClosed {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    (C : CriticalLoadPackage Md) : Prop :=
  C.criticalLoadVerified ∧ C.bucklingPreventionDerived

theorem critical_load_closed_from_evidence
    {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    (C : CriticalLoadPackage Md) (Ev : CriticalLoadEvidence C) :
    CriticalLoadClosed C := by
  exact And.intro Ev.criticalLoadVerifiedClosed Ev.bucklingPreventionDerivedClosed

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse