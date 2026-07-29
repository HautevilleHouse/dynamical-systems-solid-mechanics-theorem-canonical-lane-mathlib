import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure StabilityPackage {M : Type u} [TopologicalSpace M] (S : SolidMechanicsSystem M) where
  lyapunovFunction : S.stateSpace → ℝ
  positiveDefinite : ∀ x ≠ 0, lyapunovFunction x > 0 ∧ lyapunovFunction 0 = 0
  derivativeNegative : ∀ x, derivative (lyapunovFunction ∘ S.flow ·) x < 0

structure StabilityEvidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (P : StabilityPackage S) where
  positiveDefiniteClosed : P.positiveDefinite
  derivativeNegativeClosed : P.derivativeNegative

def StabilityClosed {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (P : StabilityPackage S) : Prop :=
  P.positiveDefinite ∧ P.derivativeNegative

theorem stability_closed_from_evidence {M : Type u} [TopologicalSpace M] {S : SolidMechanicsSystem M} (P : StabilityPackage S) (E : StabilityEvidence P) : StabilityClosed P := by
  exact And.intro E.positiveDefiniteClosed E.derivativeNegativeClosed

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
