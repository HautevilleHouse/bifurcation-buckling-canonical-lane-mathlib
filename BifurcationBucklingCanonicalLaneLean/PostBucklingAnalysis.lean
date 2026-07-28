import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationBucklingCanonicalLaneLean.CriticalLoadEvidence

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure PostBucklingPackage {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    {C : CriticalLoadPackage Md} {Cl : CriticalLoadClosed C} where
  postBucklingDeflection : Prop
  loadDeflectionRelation : Prop
  snapThroughPhenomenon : Prop
  stableEquilibriumPath : Prop
  postBucklingDeflectionDerived : postBucklingDeflection
  loadDeflectionRelationDerived : loadDeflectionRelation
  snapThroughAnalysis : snapThroughPhenomenon → Prop
  stablePathDerived : stableEquilibriumPath

structure PostBucklingEvidence {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    {C : CriticalLoadPackage Md} {Cl : CriticalLoadClosed C}
    (P : PostBucklingPackage Cl) where
  postBucklingDeflectionClosed : P.postBucklingDeflectionDerived
  loadDeflectionRelationClosed : P.loadDeflectionRelationDerived
  snapThroughAnalysisClosed : P.snapThroughAnalysis P.snapThroughPhenomenon
  stablePathDerivedClosed : P.stablePathDerived

def PostBucklingClosed {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    {C : CriticalLoadPackage Md} {Cl : CriticalLoadClosed C}
    (P : PostBucklingPackage Cl) : Prop :=
  P.postBucklingDeflectionDerived ∧ P.loadDeflectionRelationDerived ∧
  P.snapThroughAnalysis P.snapThroughPhenomenon ∧ P.stablePathDerived

theorem post_buckling_closed_from_evidence
    {E : BucklingEquationPackage} {Eq : BucklingEquationClosed E}
    {M : EulerColumnModel Eq} {Md : EulerColumnModelClosed M}
    {C : CriticalLoadPackage Md} {Cl : CriticalLoadClosed C}
    (P : PostBucklingPackage Cl) (Ev : PostBucklingEvidence P) :
    PostBucklingClosed P := by
  exact And.intro Ev.postBucklingDeflectionClosed
    (And.intro Ev.loadDeflectionRelationClosed
      (And.intro Ev.snapThroughAnalysisClosed Ev.stablePathDerivedClosed))

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse