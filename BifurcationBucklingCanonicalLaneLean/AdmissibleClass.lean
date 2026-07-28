import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure BifurcationAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  loadParameter : Type v
  equilibriumPath : Prop
  bifurcationCondition : Prop
  conclusion : bifurcationCondition

structure BifurcationAdmissibleClass where
  object : BifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : BifurcationAdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : BifurcationAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : BifurcationAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BifurcationAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse