import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.PhaseSpacePackage

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure HamiltonianFlowPDEPackage (P : PhaseSpacePackage) where
  flowTimeDomain : Type u
  integralCurves : flowTimeDomain → P.baseManifold
  hamiltonVectorFieldApplied : flowTimeDomain → BaseVectorField P.baseManifold
  pdeEquation : Prop
  initialCondition : Prop
  uniqueness : Prop
  flowMap : flowTimeDomain → (P.baseManifold → P.baseManifold)

def HamiltonianFlowPDEClosed {P : PhaseSpacePackage} (H : HamiltonianFlowPDEPackage P) : Prop :=
  H.pdeEquation ∧ H.initialCondition ∧ H.uniqueness

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse