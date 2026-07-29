import DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.BridgeLemmas
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure SolidMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SolidMechanicsAdmittedObject where
  space : SolidMechanicsSpace
  phaseSpaceComplete : Prop
  evolutionUnique : Prop
  stressStrainClosed : Prop
  conclusion : phaseSpaceComplete ∧ evolutionUnique ∧ stressStrainClosed

def SolidMechanicsWitnessClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.conclusion

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse