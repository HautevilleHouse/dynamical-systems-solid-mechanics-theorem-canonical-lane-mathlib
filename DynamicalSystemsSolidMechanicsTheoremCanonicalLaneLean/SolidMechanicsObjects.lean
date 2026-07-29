import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure SolidMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidMechanicsAdmittedObject where
  space : SolidMechanicsSpace
  continuousDynamics : Prop
  lyapunovStability : Prop
  stressStrainClosure : Prop
  conclusion : stressStrainClosure

structure SolidMechanicsEndgameState where
  object : SolidMechanicsAdmittedObject

def SolidMechanicsWitnessClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.stressStrainClosure

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse