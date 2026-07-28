import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

def ConstrainedBifurcationClosure (A : BifurcationAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bifurcation_endgame (A : BifurcationAdmissibleClass) :
    ConstrainedBifurcationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse