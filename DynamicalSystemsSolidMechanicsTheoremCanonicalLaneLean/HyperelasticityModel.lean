import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure HyperelasticityModel {M : Type u} [TopologicalSpace M] (S : SolidMechanicsSystem M) where
  strainEnergyDensity : S.stateSpace → ℝ
  polyconvexity : Prop
  growthCondition : Prop
  existenceMinimizer : Prop
  eulerLagrangeEquations : Prop

structure HyperelasticityEvidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (H : HyperelasticityModel S) where
  polyconvexityClosed : H.polyconvexity
  growthConditionClosed : H.growthCondition
  existenceMinimizerClosed : H.existenceMinimizer
  eulerLagrangeEquationsClosed : H.eulerLagrangeEquations

def HyperelasticityClosed {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (H : HyperelasticityModel S) : Prop :=
  H.polyconvexity ∧ H.growthCondition ∧ H.existenceMinimizer ∧ H.eulerLagrangeEquations

theorem hyperelasticity_closed_from_evidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (H : HyperelasticityModel S) (E : HyperelasticityEvidence H) : HyperelasticityClosed H := by
  exact And.intro E.polyconvexityClosed (And.intro E.growthConditionClosed (And.intro E.existenceMinimizerClosed E.eulerLagrangeEquationsClosed))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
