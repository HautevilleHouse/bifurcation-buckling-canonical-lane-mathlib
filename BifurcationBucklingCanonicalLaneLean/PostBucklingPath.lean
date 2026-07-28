import canonicalLaneMathlib.AdmissibleClass
import BifurcationBucklingCanonicalLaneLean.BucklingModel

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure PostBucklingPathPackage (M : BucklingModel) where
  asymptoticExpansion : Prop
  initialPostBucklingStiffness : Prop
  snapThroughCondition : Prop
  stablePostBuckling : Prop

structure PostBucklingPathEvidence {M : BucklingModel} (P : PostBucklingPathPackage M) where
  asymptoticExpansionClosed : P.asymptoticExpansion
  initialPostBucklingStiffnessClosed : P.initialPostBucklingStiffness
  snapThroughConditionClosed : P.snapThroughCondition
  stablePostBucklingClosed : P.stablePostBuckling

def PostBucklingPathClosed {M : BucklingModel} (P : PostBucklingPathPackage M) : Prop :=
  P.asymptoticExpansion ∧ P.initialPostBucklingStiffness ∧ P.snapThroughCondition ∧ P.stablePostBuckling

theorem post_buckling_path_closed_from_evidence
    {M : BucklingModel} (P : PostBucklingPathPackage M) (E : PostBucklingPathEvidence P) :
    PostBucklingPathClosed P := by
  exact And.intro E.asymptoticExpansionClosed
    (And.intro E.initialPostBucklingStiffnessClosed
      (And.intro E.snapThroughConditionClosed E.stablePostBucklingClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse