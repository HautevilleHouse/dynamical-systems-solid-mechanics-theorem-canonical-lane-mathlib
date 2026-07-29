import SolidMechanicsObjects

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure PhaseSpaceEvolutionPackage where
  stateSpace : Type
  flowMap : stateSpace → stateSpace
  energyConservation : Prop
  entropyProduction : Prop
  growthRate : Prop

structure PhaseSpaceEvolutionEvidence (P : PhaseSpaceEvolutionPackage) where
  energyConservationClosed : P.energyConservation
  entropyProductionClosed : P.entropyProduction
  growthRateClosed : P.growthRate

def PhaseSpaceEvolutionClosed (P : PhaseSpaceEvolutionPackage) : Prop :=
  P.energyConservation ∧ P.entropyProduction ∧ P.growthRate

theorem phase_space_evolution_closed_from_evidence
    (P : PhaseSpaceEvolutionPackage) (E : PhaseSpaceEvolutionEvidence P) :
    PhaseSpaceEvolutionClosed P := by
  exact And.intro E.energyConservationClosed
    (And.intro E.entropyProductionClosed E.growthRateClosed)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse