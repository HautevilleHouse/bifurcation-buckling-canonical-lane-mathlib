import canonicalLaneMathlib.AdmissibleClass
import BifurcationBucklingCanonicalLaneLean.CriticalLoadPackage

/-!
# Post-Buckling Path Package
-/

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure PostBucklingPathPackage {B : BucklingBeamPackage} {L : LinearBucklingPackage B}
    (C : CriticalLoadPackage L) where
  initialPostBucklingSlope : ℝ
  imperfectionSensitivity : Prop
  stableUnstableBranch : Prop
  secondaryBifurcation : Prop

structure PostBucklingPathEvidence {B : BucklingBeamPackage} {L : LinearBucklingPackage B}
    {C : CriticalLoadPackage L} (P : PostBucklingPathPackage C) where
  initialPostBucklingSlopeClosed : P.initialPostBucklingSlope = 0.5
  imperfectionSensitivityClosed : P.imperfectionSensitivity
  stableUnstableBranchClosed : P.stableUnstableBranch
  secondaryBifurcationClosed : P.secondaryBifurcation

def PostBucklingPathClosed {B : BucklingBeamPackage} {L : LinearBucklingPackage B}
    {C : CriticalLoadPackage L} (P : PostBucklingPathPackage C) : Prop :=
  (P.initialPostBucklingSlope = 0.5) ∧ P.imperfectionSensitivity ∧
  P.stableUnstableBranch ∧ P.secondaryBifurcation

theorem post_buckling_path_closed_from_evidence
    {B : BucklingBeamPackage} {L : LinearBucklingPackage B}
    {C : CriticalLoadPackage L} (P : PostBucklingPathPackage C)
    (E : PostBucklingPathEvidence P) : PostBucklingPathClosed P := by
  exact And.intro E.initialPostBucklingSlopeClosed
    (And.intro E.imperfectionSensitivityClosed
      (And.intro E.stableUnstableBranchClosed E.secondaryBifurcationClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse