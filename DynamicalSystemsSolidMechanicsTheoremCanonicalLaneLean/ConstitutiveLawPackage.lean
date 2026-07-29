import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure ConstitutiveLawPackage (M : SolidMechanicsAdmittedObject) where
  stressStrainRelation : Prop
  materialSymmetry : Prop
  frameIndifference : Prop
  thermodynamicConsistency : Prop
  stabilityCondition : Prop

structure ConstitutiveLawEvidence (M : SolidMechanicsAdmittedObject) (C : ConstitutiveLawPackage M) where
  stressStrainRelationClosed : C.stressStrainRelation
  materialSymmetryClosed : C.materialSymmetry
  frameIndifferenceClosed : C.frameIndifference
  thermodynamicConsistencyClosed : C.thermodynamicConsistency
  stabilityConditionClosed : C.stabilityCondition

def ConstitutiveLawClosed (M : SolidMechanicsAdmittedObject) (C : ConstitutiveLawPackage M) : Prop :=
  C.stressStrainRelation ∧ C.materialSymmetry ∧ C.frameIndifference ∧
  C.thermodynamicConsistency ∧ C.stabilityCondition

theorem constitutive_law_closed_from_evidence
    (M : SolidMechanicsAdmittedObject) (C : ConstitutiveLawPackage M)
    (E : ConstitutiveLawEvidence M C) : ConstitutiveLawClosed M C := by
  exact And.intro E.stressStrainRelationClosed
    (And.intro E.materialSymmetryClosed
      (And.intro E.frameIndifferenceClosed
        (And.intro E.thermodynamicConsistencyClosed E.stabilityConditionClosed)))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse