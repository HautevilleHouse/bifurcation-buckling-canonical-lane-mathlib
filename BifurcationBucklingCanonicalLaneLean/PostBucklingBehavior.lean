import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.BifurcationPointAnalysis

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure PostBucklingBehaviorPackage {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} where
  postBucklingPathExists : Prop
  imperfectionSensitivity : Prop
  secondaryPathStable : Prop
  loadDeflectionRelation : Prop

structure PostBucklingBehaviorEvidence {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} (P : PostBucklingBehaviorPackage B) where
  postBucklingPathExistsClosed : P.postBucklingPathExists
  imperfectionSensitivityClosed : P.imperfectionSensitivity
  secondaryPathStableClosed : P.secondaryPathStable
  loadDeflectionRelationClosed : P.loadDeflectionRelation

def PostBucklingBehaviorClosed {E : EulerColumnBucklingPackage}
    {B : BifurcationPointAnalysisPackage E} (P : PostBucklingBehaviorPackage B) : Prop :=
  P.postBucklingPathExists ∧ P.imperfectionSensitivity ∧ P.secondaryPathStable ∧ P.loadDeflectionRelation

theorem post_buckling_behavior_closed_from_evidence
    {E : EulerColumnBucklingPackage} {B : BifurcationPointAnalysisPackage E}
    (P : PostBucklingBehaviorPackage B) (Ev : PostBucklingBehaviorEvidence P) :
    PostBucklingBehaviorClosed P := by
  exact And.intro Ev.postBucklingPathExistsClosed
    (And.intro Ev.imperfectionSensitivityClosed
      (And.intro Ev.secondaryPathStableClosed Ev.loadDeflectionRelationClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse