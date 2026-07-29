import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure StabilityAnalysisPackage (M : SolidMechanicsAdmittedObject) (D : DynamicsPackage M) where
  lyapunovFunction : Prop
  linearizedStability : Prop
  energyMethods : Prop
  perturbationAnalysis : Prop
  bifurcationClassification : Prop

structure StabilityAnalysisEvidence (M : SolidMechanicsAdmittedObject) (D : DynamicsPackage M)
    (S : StabilityAnalysisPackage M D) where
  lyapunovFunctionClosed : S.lyapunovFunction
  linearizedStabilityClosed : S.linearizedStability
  energyMethodsClosed : S.energyMethods
  perturbationAnalysisClosed : S.perturbationAnalysis
  bifurcationClassificationClosed : S.bifurcationClassification

def StabilityAnalysisClosed (M : SolidMechanicsAdmittedObject) (D : DynamicsPackage M)
    (S : StabilityAnalysisPackage M D) : Prop :=
  S.lyapunovFunction ∧ S.linearizedStability ∧ S.energyMethods ∧
  S.perturbationAnalysis ∧ S.bifurcationClassification

theorem stability_analysis_closed_from_evidence
    (M : SolidMechanicsAdmittedObject) (D : DynamicsPackage M)
    (S : StabilityAnalysisPackage M D) (E : StabilityAnalysisEvidence M D S) :
    StabilityAnalysisClosed M D S := by
  exact And.intro E.lyapunovFunctionClosed
    (And.intro E.linearizedStabilityClosed
      (And.intro E.energyMethodsClosed
        (And.intro E.perturbationAnalysisClosed E.bifurcationClassificationClosed)))

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse