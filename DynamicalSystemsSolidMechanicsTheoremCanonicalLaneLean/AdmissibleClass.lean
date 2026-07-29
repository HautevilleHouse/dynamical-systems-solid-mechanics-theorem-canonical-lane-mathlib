import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure SolidMechanicsAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  stressField : space → space → ℝ
  strainField : space → space → ℝ
  constitutiveLaw : Prop
  equilibriumCondition : Prop
  conclusion : constitutiveLaw ∧ equilibriumCondition

structure AdmissibleClass where
  object : SolidMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SolidMechanicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def SolidMechanicsWitnessClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.constitutiveLaw ∧ O.equilibriumCondition

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse