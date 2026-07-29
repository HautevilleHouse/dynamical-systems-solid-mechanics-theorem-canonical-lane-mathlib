import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure DiscreteDynamicsPackage where
  map : Type u → Type u
  fixedPoint : Prop
  stability : Prop
  convergenceRate : ℝ
  fixedPointClosed : fixedPoint
  stabilityClosed : stability

structure DiscreteDynamicsEvidence (D : DiscreteDynamicsPackage) where
  fixedPointClosed : D.fixedPoint
  stabilityClosed : D.stability

def DiscreteDynamicsClosed (D : DiscreteDynamicsPackage) : Prop :=
  D.fixedPoint ∧ D.stability

theorem discrete_dynamics_closed_from_evidence (D : DiscreteDynamicsPackage)
    (Ev : DiscreteDynamicsEvidence D) : DiscreteDynamicsClosed D := by
  exact And.intro Ev.fixedPointClosed Ev.stabilityClosed

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse