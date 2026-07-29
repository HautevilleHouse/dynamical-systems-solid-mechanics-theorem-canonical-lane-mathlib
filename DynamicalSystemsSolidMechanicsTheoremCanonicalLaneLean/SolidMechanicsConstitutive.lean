import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean.PhaseSpacePackage

namespace HautevilleHouse
namespace DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean

structure SolidMechanicsConstitutivePackage (P : PhaseSpacePackage) where
  deformationGradient : P.baseManifold → Matrix ℝ 3 3
  stressTensor : P.baseManifold → Matrix ℝ 3 3
  strainTensor : P.baseManifold → Matrix ℝ 3 3
  constitutiveLaw : Prop
  elasticityTensor : Type u
  hyperelasticPotential : P.baseManifold → ℝ
  frameIndifference : Prop
  materialSymmetry : Prop

def SolidMechanicsConstitutiveClosed {P : PhaseSpacePackage} (S : SolidMechanicsConstitutivePackage P) : Prop :=
  S.constitutiveLaw ∧ S.frameIndifference ∧ S.materialSymmetry

end DynamicalSystemsSolidMechanicsTheoremCanonicalLaneLean
end HautevilleHouse