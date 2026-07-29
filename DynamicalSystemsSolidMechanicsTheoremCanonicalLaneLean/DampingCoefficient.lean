import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure DampingCoefficientPackage where
  dampingRatio : ℝ
  criticalDamping : Prop
  underdampedResponse : Prop
  overdampedResponse : Prop
  criticalDampingClosed : criticalDamping
  underdampedResponseClosed : underdampedResponse
  overdampedResponseClosed : overdampedResponse

structure DampingCoefficientEvidence (D : DampingCoefficientPackage) where
  criticalDampingClosed : D.criticalDamping
  underdampedResponseClosed : D.underdampedResponse
  overdampedResponseClosed : D.overdampedResponse

def DampingCoefficientClosed (D : DampingCoefficientPackage) : Prop :=
  D.criticalDamping ∧ D.underdampedResponse ∧ D.overdampedResponse

theorem damping_coefficient_closed_from_evidence (D : DampingCoefficientPackage)
    (Ev : DampingCoefficientEvidence D) : DampingCoefficientClosed D := by
  exact And.intro Ev.criticalDampingClosed
    (And.intro Ev.underdampedResponseClosed Ev.overdampedResponseClosed)

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse