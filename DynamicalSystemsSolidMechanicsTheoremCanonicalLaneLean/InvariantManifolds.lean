import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.HamiltonianFlowPDE

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure InvariantManifoldsPackage {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P} where
  equilibriumPoints : Set P.baseManifold
  stableManifold : P.baseManifold → Prop
  unstableManifold : P.baseManifold → Prop
  centerManifold : P.baseManifold → Prop
  invariantUnderFlow : Prop
  hyperbolicStructure : Prop
  stableUnstableTransversality : Prop

def InvariantManifoldsClosed {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P}
    (I : InvariantManifoldsPackage P H) : Prop :=
  I.invariantUnderFlow ∧ I.hyperbolicStructure ∧ I.stableUnstableTransversality

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse