import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure SolidMechanics where
  body : Type u
  displacementField : body → ℝ^3
  stressTensor : body → Matrix (Fin 3) (Fin 3) ℝ
  strainTensor : body → Matrix (Fin 3) (Fin 3) ℝ
  constitutiveLaw : Prop
  constitutiveLawTerm : constitutiveLaw

structure SolidMechanicsPackage (M : SolidMechanics) where
  equilibriumEquations : Prop
  boundaryConditions : Prop
  weakFormulation : Prop
  finiteElementApproximation : Prop
  finiteElementApproximationTerm : finiteElementApproximation

def SolidMechanicsClosed (M : SolidMechanics) (P : SolidMechanicsPackage M) : Prop :=
  M.constitutiveLaw ∧ P.equilibriumEquations ∧ P.weakFormulation

theorem solid_mechanics_closed_from_evidence (M : SolidMechanics) (P : SolidMechanicsPackage M) : SolidMechanicsClosed M P := by
  exact And.intro M.constitutiveLawTerm (And.intro P.equilibriumEquations P.weakFormulation)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
