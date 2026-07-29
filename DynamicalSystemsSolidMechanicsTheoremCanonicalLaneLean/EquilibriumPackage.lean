import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure EquilibriumPackage (M : SolidMechanicsAdmittedObject) where
  localEquilibriumEquations : Prop
  boundaryConditions : Prop
  weakFormulation : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure EquilibriumEvidence (M : SolidMechanicsAdmittedObject) (E : EquilibriumPackage M) where
  localEquilibriumEquationsClosed : E.localEquilibriumEquations
  boundaryConditionsClosed : E.boundaryConditions
  weakFormulationClosed : E.weakFormulation
  existenceSolutionClosed : E.existenceSolution
  uniquenessSolutionClosed : E.uniquenessSolution

def EquilibriumClosed (M : SolidMechanicsAdmittedObject) (E : EquilibriumPackage M) : Prop :=
  E.localEquilibriumEquations ∧ E.boundaryConditions ∧ E.weakFormulation ∧
  E.existenceSolution ∧ E.uniquenessSolution

theorem equilibrium_closed_from_evidence
    (M : SolidMechanicsAdmittedObject) (E : EquilibriumPackage M)
    (Ev : EquilibriumEvidence M E) : EquilibriumClosed M E := by
  exact And.intro Ev.localEquilibriumEquationsClosed
    (And.intro Ev.boundaryConditionsClosed
      (And.intro Ev.weakFormulationClosed
        (And.intro Ev.existenceSolutionClosed Ev.uniquenessSolutionClosed)))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse