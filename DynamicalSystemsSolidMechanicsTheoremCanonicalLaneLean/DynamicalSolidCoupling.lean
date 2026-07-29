import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.HamiltonianFlowPDE
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.SolidMechanicsConstitutive

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure DynamicalSolidCouplingPackage {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P}
    (S : SolidMechanicsConstitutivePackage P) where
  coupledFieldEquations : Prop
  mechanicalDissipation : Prop
  thermalCoupling : P.baseManifold → ℝ
  entropyProduction : Prop
  couplingConsistency : Prop
  stabilityUnderCoupling : Prop

def DynamicalSolidCouplingClosed {P : PhaseSpacePackage} {H : HamiltonianFlowPDEPackage P}
    {S : SolidMechanicsConstitutivePackage P} (C : DynamicalSolidCouplingPackage P H S) : Prop :=
  C.coupledFieldEquations ∧ C.couplingConsistency ∧ C.stabilityUnderCoupling

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse