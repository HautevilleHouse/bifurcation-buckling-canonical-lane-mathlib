import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.PostBucklingBehavior

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure ImperfectionSensitivityPackage {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} {P : PostBucklingBehaviorPackage B} where
  imperfectionParameter : ℝ
  knockdownFactor : ℝ
  sensitivityFormula : Prop
  imperfectionEffectModeled : Prop

structure ImperfectionSensitivityEvidence {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} {P : PostBucklingBehaviorPackage B}
    (I : ImperfectionSensitivityPackage P) where
  knockdownFactorClosed : I.knockdownFactor > 0
  sensitivityFormulaClosed : I.sensitivityFormula
  imperfectionEffectModeledClosed : I.imperfectionEffectModeled

def ImperfectionSensitivityClosed {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} {P : PostBucklingBehaviorPackage B}
    (I : ImperfectionSensitivityPackage P) : Prop :=
  I.knockdownFactor > 0 ∧ I.sensitivityFormula ∧ I.imperfectionEffectModeled

theorem imperfection_sensitivity_closed_from_evidence
    {E : EulerColumnBucklingPackage} {B : BifurcationPointAnalysisPackage E}
    {P : PostBucklingBehaviorPackage B} (I : ImperfectionSensitivityPackage P)
    (Ev : ImperfectionSensitivityEvidence I) : ImperfectionSensitivityClosed I := by
  exact And.intro Ev.knockdownFactorClosed
    (And.intro Ev.sensitivityFormulaClosed Ev.imperfectionEffectModeledClosed)

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse