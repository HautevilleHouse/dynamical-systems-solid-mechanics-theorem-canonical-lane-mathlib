import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure ElasticWavePackage where
  waveSpeed : ℝ
  displacementField : Type u
  waveEquation : Prop
  boundaryConditions : Prop
  waveEquationClosed : waveEquation
  boundaryConditionsClosed : boundaryConditions

structure ElasticWaveEvidence (E : ElasticWavePackage) where
  waveEquationClosed : E.waveEquation
  boundaryConditionsClosed : E.boundaryConditions

def ElasticWaveClosed (E : ElasticWavePackage) : Prop :=
  E.waveEquation ∧ E.boundaryConditions

theorem elastic_wave_closed_from_evidence (E : ElasticWavePackage)
    (Ev : ElasticWaveEvidence E) : ElasticWaveClosed E := by
  exact And.intro Ev.waveEquationClosed Ev.boundaryConditionsClosed

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse