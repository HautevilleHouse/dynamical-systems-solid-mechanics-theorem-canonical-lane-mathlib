import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure DynamicalSystem where
  stateSpace : Type u
  timeDomain : Type v
  flow : timeDomain → stateSpace → stateSpace
  initialCondition : stateSpace
  dynamicsWellDefined : Prop
  dynamicsWellDefinedTerm : dynamicsWellDefined

structure DynamicalSystemPackage (D : DynamicalSystem) where
  invariantMeasure : Type w
  ergodicityProperty : Prop
  attractorExistence : Prop
  bifurcationSet : Prop
  bifurcationSetTerm : bifurcationSet

def DynamicalSystemClosed (D : DynamicalSystem) (P : DynamicalSystemPackage D) : Prop :=
  D.dynamicsWellDefined ∧ P.attractorExistence ∧ P.ergodicityProperty

theorem dynamical_system_closed_from_evidence (D : DynamicalSystem) (P : DynamicalSystemPackage D) : DynamicalSystemClosed D P := by
  exact And.intro D.dynamicsWellDefinedTerm (And.intro P.attractorExistence P.ergodicityProperty)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
