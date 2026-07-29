import PhaseSpaceEvolution

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure AttractorClassificationPackage {P : PhaseSpaceEvolutionPackage}
    (E : PhaseSpaceEvolutionEvidence P) where
  attractorExists : Prop
  basinOfAttraction : Prop
  structuralStability : Prop
  completionCondition : Prop

structure AttractorClassificationEvidence {P : PhaseSpaceEvolutionPackage}
    {E : PhaseSpaceEvolutionEvidence P} (A : AttractorClassificationPackage E) where
  attractorExistsClosed : A.attractorExists
  basinOfAttractionClosed : A.basinOfAttraction
  structuralStabilityClosed : A.structuralStability
  completionConditionClosed : A.completionCondition

def AttractorClassificationClosed {P : PhaseSpaceEvolutionPackage}
    {E : PhaseSpaceEvolutionEvidence P} (A : AttractorClassificationPackage E) : Prop :=
  A.attractorExists ∧ A.basinOfAttraction ∧ A.structuralStability ∧ A.completionCondition

theorem attractor_classification_closed_from_evidence
    {P : PhaseSpaceEvolutionPackage} {E : PhaseSpaceEvolutionEvidence P}
    (A : AttractorClassificationPackage E) (Ev : AttractorClassificationEvidence A) :
    AttractorClassificationClosed A := by
  exact And.intro Ev.attractorExistsClosed
    (And.intro Ev.basinOfAttractionClosed
      (And.intro Ev.structuralStabilityClosed Ev.completionConditionClosed))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse