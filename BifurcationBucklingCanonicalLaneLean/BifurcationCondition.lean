import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBuckling.EulerBeamTheory

namespace HautevilleHouse
namespace BifurcationBuckling

structure BifurcationPackage (E : EulerBeamPackage) where
  preBucklingDeflection : ℝ
  bifurcationLoad : ℝ
  bifurcationCondition : Prop
  nontrivialSolutionExists : Prop
  eigenvalueProblemSolved : Prop

structure BifurcationEvidence {E : EulerBeamPackage} (B : BifurcationPackage E) where
  bifurcationConditionClosed : B.bifurcationCondition
  nontrivialSolutionExistsClosed : B.nontrivialSolutionExists
  eigenvalueProblemSolvedClosed : B.eigenvalueProblemSolved

def BifurcationClosed {E : EulerBeamPackage} (B : BifurcationPackage E) : Prop :=
  B.bifurcationCondition ∧ B.nontrivialSolutionExists ∧ B.eigenvalueProblemSolved

theorem bifurcation_closed_from_evidence {E : EulerBeamPackage} (B : BifurcationPackage E) (Ev : BifurcationEvidence B) :
    BifurcationClosed B := by
  exact And.intro Ev.bifurcationConditionClosed
    (And.intro Ev.nontrivialSolutionExistsClosed Ev.eigenvalueProblemSolvedClosed)

end BifurcationBuckling
end HautevilleHouse