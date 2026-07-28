import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.EulerColumnBuckling

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure EnergyCriterionPackage {E : EulerColumnBucklingPackage} where
  totalPotentialEnergy : Prop
  equilibriumCondition : Prop
  stabilityCriterion : Prop
  criticalEnergy : Prop

structure EnergyCriterionEvidence {E : EulerColumnBucklingPackage}
    (En : EnergyCriterionPackage E) where
  totalPotentialEnergyClosed : En.totalPotentialEnergy
  equilibriumConditionClosed : En.equilibriumCondition
  stabilityCriterionClosed : En.stabilityCriterion
  criticalEnergyClosed : En.criticalEnergy

def EnergyCriterionClosed {E : EulerColumnBucklingPackage}
    (En : EnergyCriterionPackage E) : Prop :=
  En.totalPotentialEnergy ∧ En.equilibriumCondition ∧ En.stabilityCriterion ∧ En.criticalEnergy

theorem energy_criterion_closed_from_evidence
    {E : EulerColumnBucklingPackage} (En : EnergyCriterionPackage E)
    (Ev : EnergyCriterionEvidence En) : EnergyCriterionClosed En := by
  exact And.intro Ev.totalPotentialEnergyClosed
    (And.intro Ev.equilibriumConditionClosed
      (And.intro Ev.stabilityCriterionClosed Ev.criticalEnergyClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse