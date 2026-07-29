import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure FiniteElementDiscretization {M : Type u} [TopologicalSpace M] (S : SolidMechanicsSystem M) where
  mesh : Type v
  basisFunctions : mesh → (S.stateSpace → ℝ)
  stiffnessMatrix : Matrix ℝ (Fin n) (Fin n)
  massMatrix : Matrix ℝ (Fin n) (Fin n)
  semidiscreteEquation : Prop
  convergenceToContinuous : Prop

structure FEDiscretizationEvidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (F : FiniteElementDiscretization S) where
  semidiscreteEquationClosed : F.semidiscreteEquation
  convergenceToContinuousClosed : F.convergenceToContinuous

def FEDiscretizationClosed {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (F : FiniteElementDiscretization S) : Prop :=
  F.semidiscreteEquation ∧ F.convergenceToContinuous

theorem fe_discretization_closed_from_evidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (F : FiniteElementDiscretization S) (E : FEDiscretizationEvidence F) : FEDiscretizationClosed F := by
  exact And.intro E.semidiscreteEquationClosed E.convergenceToContinuousClosed

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
