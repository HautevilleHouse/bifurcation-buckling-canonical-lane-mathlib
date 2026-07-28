import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure BucklingEquationPackage where
  beam : Type u
  loading : Type v
  deflection : beam → loading → Prop
  criticalLoad : Prop
  bifurcationCondition : Prop
  stabilityAnalysis : Prop

structure BucklingEquationEvidence (E : BucklingEquationPackage) where
  criticalLoadClosed : E.criticalLoad
  bifurcationConditionClosed : E.bifurcationCondition
  stabilityAnalysisClosed : E.stabilityAnalysis

def BucklingEquationClosed (E : BucklingEquationPackage) : Prop :=
  E.criticalLoad ∧ E.bifurcationCondition ∧ E.stabilityAnalysis

theorem buckling_equation_closed_from_evidence
    (E : BucklingEquationPackage) (Ev : BucklingEquationEvidence E) :
    BucklingEquationClosed E := by
  exact And.intro Ev.criticalLoadClosed
    (And.intro Ev.bifurcationConditionClosed Ev.stabilityAnalysisClosed)

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse