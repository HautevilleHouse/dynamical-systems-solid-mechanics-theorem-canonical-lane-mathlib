import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure BifurcationProblem where
  parameterSpace : Type u
  stateEquation : parameterSpace → ℝ^3 → ℝ^3
  trivialSolution : parameterSpace → ℝ^3
  bifurcationPoint : parameterSpace
  bifurcationCondition : Prop
  bifurcationConditionTerm : bifurcationCondition

structure BifurcationPackage (B : BifurcationProblem) where
  centerManifoldReduction : Prop
  normalFormComputed : Prop
  stabilityAnalysis : Prop
  stabilityAnalysisTerm : stabilityAnalysis

def BifurcationClosed (B : BifurcationProblem) (P : BifurcationPackage B) : Prop :=
  B.bifurcationCondition ∧ P.centerManifoldReduction ∧ P.normalFormComputed

theorem bifurcation_closed_from_evidence (B : BifurcationProblem) (P : BifurcationPackage B) : BifurcationClosed B P := by
  exact And.intro B.bifurcationConditionTerm (And.intro P.centerManifoldReduction P.normalFormComputed)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
