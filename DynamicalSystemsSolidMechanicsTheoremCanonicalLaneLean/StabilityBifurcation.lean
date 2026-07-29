import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.InvariantManifolds

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure StabilityBifurcationPackage {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P}
    {I : InvariantManifoldsPackage P H} where
  lyapunovFunction : P.baseManifold → ℝ
  lyapunovStability : Prop
  asymptoticStability : Prop
  bifurcationParameter : Type u
  bifurcationDiagram : bifurcationParameter → Set P.baseManifold
  hopfBifurcation : Prop
  saddleNodeBifurcation : Prop
  structuralStability : Prop

def StabilityBifurcationClosed {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P}
    {I : InvariantManifoldsPackage P H} (S : StabilityBifurcationPackage P H I) : Prop :=
  S.lyapunovStability ∧ S.structuralStability ∧ (S.hopfBifurcation ∨ S.saddleNodeBifurcation)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse