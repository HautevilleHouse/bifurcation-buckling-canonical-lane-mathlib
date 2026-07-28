import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure CriticalLoadPackage where
  criticalLoadValue : Prop
  limitPointExists : Prop
  bifurcationMode : Prop
  loadFactorDetermination : Prop

structure CriticalLoadEvidence (C : CriticalLoadPackage) where
  criticalLoadValueClosed : C.criticalLoadValue
  limitPointExistsClosed : C.limitPointExists
  bifurcationModeClosed : C.bifurcationMode
  loadFactorDeterminationClosed : C.loadFactorDetermination

def CriticalLoadClosed (C : CriticalLoadPackage) : Prop :=
  C.criticalLoadValue ∧ C.limitPointExists ∧
  C.bifurcationMode ∧ C.loadFactorDetermination

theorem critical_load_closed_from_evidence (C : CriticalLoadPackage)
    (E : CriticalLoadEvidence C) : CriticalLoadClosed C := by
  exact And.intro E.criticalLoadValueClosed
    (And.intro E.limitPointExistsClosed
      (And.intro E.bifurcationModeClosed E.loadFactorDeterminationClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse