import canonicalLaneMathlib.AdmissibleClass

/-!
# Buckling Beam Model Package
-/

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure BucklingBeamPackage where
  length : ℝ
  crossSection : Type u
  materialStiffness : ℝ
  boundaryConditions : Prop
  eulerBucklingLoad : ℝ
  constCompression : Prop

structure BucklingBeamEvidence (B : BucklingBeamPackage) where
  lengthClosed : B.length > 0
  crossSectionClosed : Nonempty B.crossSection
  materialStiffnessClosed : B.materialStiffness > 0
  boundaryConditionsClosed : B.boundaryConditions
  eulerBucklingLoadClosed : B.eulerBucklingLoad = π ^ 2 * B.materialStiffness / (B.length ^ 2)
  constCompressionClosed : B.constCompression

def BucklingBeamClosed (B : BucklingBeamPackage) : Prop :=
  B.length > 0 ∧ Nonempty B.crossSection ∧ B.materialStiffness > 0 ∧
  B.boundaryConditions ∧ (B.eulerBucklingLoad = π ^ 2 * B.materialStiffness / (B.length ^ 2)) ∧ B.constCompression

theorem buckling_beam_closed_from_evidence (B : BucklingBeamPackage) (E : BucklingBeamEvidence B) :
    BucklingBeamClosed B := by
  exact And.intro E.lengthClosed
    (And.intro E.crossSectionClosed
      (And.intro E.materialStiffnessClosed
        (And.intro E.boundaryConditionsClosed
          (And.intro E.eulerBucklingLoadClosed E.constCompressionClosed))))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse