import canonicalLaneMathlib.AdmissibleClass
import BifurcationBucklingCanonicalLaneLean.BucklingModel

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure CriticalLoadAnalysisPackage (M : BucklingModel) where
  eigenvalueProblem : Prop
  linearizationStability : Prop
  criticalLoadComputed : Prop
  modeShapeIdentified : Prop

structure CriticalLoadAnalysisEvidence {M : BucklingModel} (P : CriticalLoadAnalysisPackage M) where
  eigenvalueProblemClosed : P.eigenvalueProblem
  linearizationStabilityClosed : P.linearizationStability
  criticalLoadComputedClosed : P.criticalLoadComputed
  modeShapeIdentifiedClosed : P.modeShapeIdentified

def CriticalLoadAnalysisClosed {M : BucklingModel} (P : CriticalLoadAnalysisPackage M) : Prop :=
  P.eigenvalueProblem ∧ P.linearizationStability ∧ P.criticalLoadComputed ∧ P.modeShapeIdentified

theorem critical_load_analysis_closed_from_evidence
    {M : BucklingModel} (P : CriticalLoadAnalysisPackage M) (E : CriticalLoadAnalysisEvidence P) :
    CriticalLoadAnalysisClosed P := by
  exact And.intro E.eigenvalueProblemClosed
    (And.intro E.linearizationStabilityClosed
      (And.intro E.criticalLoadComputedClosed E.modeShapeIdentifiedClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse