import AttractorClassification

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure ConstitutiveStructurePackage {P : PhaseSpaceEvolutionPackage}
    {E : PhaseSpaceEvolutionEvidence P} {A : AttractorClassificationPackage E}
    (Ev : AttractorClassificationEvidence A) where
  stressStrainRelation : Prop
  elasticityTensor : Prop
  plasticityYield : Prop
  hardeningLaw : Prop
  closureCondition : Prop

structure ConstitutiveStructureEvidence {P : PhaseSpaceEvolutionPackage}
    {E : PhaseSpaceEvolutionEvidence P} {A : AttractorClassificationPackage E}
    {Ev : AttractorClassificationEvidence A} (C : ConstitutiveStructurePackage Ev) where
  stressStrainRelationClosed : C.stressStrainRelation
  elasticityTensorClosed : C.elasticityTensor
  plasticityYieldClosed : C.plasticityYield
  hardeningLawClosed : C.hardeningLaw
  closureConditionClosed : C.closureCondition

def ConstitutiveStructureClosed {P : PhaseSpaceEvolutionPackage}
    {E : PhaseSpaceEvolutionEvidence P} {A : AttractorClassificationPackage E}
    {Ev : AttractorClassificationEvidence A} (C : ConstitutiveStructurePackage Ev) : Prop :=
  C.stressStrainRelation ∧ C.elasticityTensor ∧ C.plasticityYield ∧ C.hardeningLaw ∧ C.closureCondition

theorem constitutive_structure_closed_from_evidence
    {P : PhaseSpaceEvolutionPackage} {E : PhaseSpaceEvolutionEvidence P}
    {A : AttractorClassificationPackage E} {Ev : AttractorClassificationEvidence A}
    (C : ConstitutiveStructurePackage Ev) (CE : ConstitutiveStructureEvidence C) :
    ConstitutiveStructureClosed C := by
  exact And.intro CE.stressStrainRelationClosed
    (And.intro CE.elasticityTensorClosed
      (And.intro CE.plasticityYieldClosed
        (And.intro CE.hardeningLawClosed CE.closureConditionClosed)))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse