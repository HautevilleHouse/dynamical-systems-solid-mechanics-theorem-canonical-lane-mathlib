import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure PhaseSpacePackage where
  baseManifold : Type u
  topology : TopologicalSpace baseManifold
  cotangentBundle : Type v
  symplecticForm : Type w
  hamiltonianFunction : baseManifold → ℝ
  hamiltonianVectorField : baseManifold → BaseVectorField baseManifold
  poissonBracketDefined : Prop
  symplecticNondegenerate : Prop
  hamiltonianFlowDefined : Prop

def PhaseSpaceClosed (P : PhaseSpacePackage) : Prop :=
  P.symplecticNondegenerate ∧ P.poissonBracketDefined ∧ P.hamiltonianFlowDefined

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse