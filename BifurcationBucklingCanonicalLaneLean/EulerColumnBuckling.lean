import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationBucklingCanonicalLaneLean

structure EulerColumnBucklingPackage where
  columnLength : ℝ
  youngModulus : ℝ
  areaMomentInertia : ℝ
  criticalLoad : ℝ
  bucklingFormula : Prop
  formulaMatchesClassical : criticalLoad = (π^2 * youngModulus * areaMomentInertia) / columnLength^2

structure EulerColumnBucklingEvidence (E : EulerColumnBucklingPackage) where
  bucklingFormulaClosed : E.bucklingFormula
  formulaMatchesClassicalClosed : E.formulaMatchesClassical

def EulerColumnBucklingClosed (E : EulerColumnBucklingPackage) : Prop :=
  E.bucklingFormula ∧ E.formulaMatchesClassical

theorem euler_column_buckling_closed_from_evidence (E : EulerColumnBucklingPackage)
    (Ev : EulerColumnBucklingEvidence E) : EulerColumnBucklingClosed E := by
  exact And.intro Ev.bucklingFormulaClosed Ev.formulaMatchesClassicalClosed

end BifurcationBucklingCanonicalLaneLean
end HautevilleHouse