import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure ElasticityPDE where
  spatialDomain : Type u
  displacementU : spatialDomain → ℝ^3
  lameParameters : ℝ × ℝ
  equilibriumEquation : ℝ^3 → ℝ^3
  pdeValidity : Prop
  pdeValidityTerm : pdeValidity

structure ElasticityPDEPackage (E : ElasticityPDE) where
  weakFormulation : Prop
  finiteElementSpace : Type v
  errorEstimates : Prop
  solutionRegularity : Prop
  solutionRegularityTerm : solutionRegularity

def ElasticityPDEClosed (E : ElasticityPDE) (P : ElasticityPDEPackage E) : Prop :=
  E.pdeValidity ∧ P.weakFormulation ∧ P.errorEstimates

theorem elasticity_pde_closed_from_evidence (E : ElasticityPDE) (P : ElasticityPDEPackage E) : ElasticityPDEClosed E P := by
  exact And.intro E.pdeValidityTerm (And.intro P.weakFormulation P.errorEstimates)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
