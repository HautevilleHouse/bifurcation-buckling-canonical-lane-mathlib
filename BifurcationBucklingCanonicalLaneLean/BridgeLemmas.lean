import canonicalLaneMathlib.AdmissibleClass
import BifurcationBucklingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse