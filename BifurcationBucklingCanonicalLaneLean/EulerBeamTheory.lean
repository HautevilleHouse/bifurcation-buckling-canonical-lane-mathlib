import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBuckling

structure EulerBeamPackage where
  length : ℝ
  youngModulus : ℝ
  momentOfInertia : ℝ
  axialLoad : ℝ
  bendingStiffness : ℝ := youngModulus * momentOfInertia
  boundaryCondition : Prop

structure EulerBeamEvidence (E : EulerBeamPackage) where
  boundaryConditionClosed : E.boundaryCondition
  bendingStiffnessPositive : E.bendingStiffness > 0

def EulerBeamClosed (E : EulerBeamPackage) : Prop :=
  E.boundaryCondition ∧ E.bendingStiffness > 0

theorem euler_beam_closed_from_evidence (E : EulerBeamPackage) (Ev : EulerBeamEvidence E) :
    EulerBeamClosed E := by
  exact And.intro Ev.boundaryConditionClosed Ev.bendingStiffnessPositive

end BifurcationBuckling
end HautevilleHouse