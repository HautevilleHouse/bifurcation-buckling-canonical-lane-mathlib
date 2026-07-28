import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.EulerColumnBuckling

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure BifurcationPointAnalysisPackage {E : EulerColumnBucklingPackage} where
  preBucklingPath : Prop
  bifurcationCondition : Prop
  stabilityChange : Prop
  bifurcationPointIdentified : Prop

structure BifurcationPointAnalysisEvidence {E : EulerColumnBucklingPackage}
    (B : BifurcationPointAnalysisPackage E) where
  preBucklingPathClosed : B.preBucklingPath
  bifurcationConditionClosed : B.bifurcationCondition
  stabilityChangeClosed : B.stabilityChange
  bifurcationPointIdentifiedClosed : B.bifurcationPointIdentified

def BifurcationPointAnalysisClosed {E : EulerColumnBucklingPackage}
    (B : BifurcationPointAnalysisPackage E) : Prop :=
  B.preBucklingPath ∧ B.bifurcationCondition ∧ B.stabilityChange ∧ B.bifurcationPointIdentified

theorem bifurcation_point_analysis_closed_from_evidence
    {E : EulerColumnBucklingPackage} (B : BifurcationPointAnalysisPackage E)
    (Ev : BifurcationPointAnalysisEvidence B) : BifurcationPointAnalysisClosed B := by
  exact And.intro Ev.preBucklingPathClosed
    (And.intro Ev.bifurcationConditionClosed
      (And.intro Ev.stabilityChangeClosed Ev.bifurcationPointIdentifiedClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse