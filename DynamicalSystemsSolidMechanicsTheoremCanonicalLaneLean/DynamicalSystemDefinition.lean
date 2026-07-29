import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure DynamicalSystem (M : Type u) [TopologicalSpace M] where
  stateSpace : Type u
  timeDomain : Type v
  flow : timeDomain → stateSpace → stateSpace
  continuous : ∀ t, Continuous (flow t)
  semigroup : ∀ s t x, flow (s + t) x = flow s (flow t x)
  identity : flow 0 = id

structure SolidMechanicsSystem (M : Type u) [TopologicalSpace M] extends DynamicalSystem M where
  deformationGradient : stateSpace → Matrix ℝ (Fin 3) (Fin 3)
  stressTensor : stateSpace → Matrix ℝ (Fin 3) (Fin 3)
  balanceOfForces : ∀ x, div (stressTensor x) = 0
  constitutiveLaw : ∀ x, stressTensor x = f (deformationGradient x)
  where
    f : Matrix ℝ (Fin 3) (Fin 3) → Matrix ℝ (Fin 3) (Fin 3)

structure AdmittedDynamicalSolidObject (M : Type u) [TopologicalSpace M] where
  system : SolidMechanicsSystem M
  initialCondition : system.stateSpace
  boundaryCondition : Prop
  existenceTheorem : Prop
  uniquenessTheorem : Prop
  stabilityTheorem : Prop
  conclusion : stabilityTheorem

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
