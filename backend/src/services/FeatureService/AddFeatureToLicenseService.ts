import License from "../../models/License";
import Feature from "../../models/Feature";
import LicenseFeature from "../../models/LicensaFeature";

interface Request {
  licenseId: number;
  featureId: number;
  createdBy: string;
}

const AddFeatureToLicenseService = async ({
  licenseId,
  featureId,
  createdBy
}: Request) => {

  // valida se license existe
  const license = await License.findByPk(licenseId);
  if (!license) {
    throw new Error("License not found");
  }

  // valida se feature existe
  const feature = await Feature.findByPk(featureId);
  if (!feature) {
    throw new Error("Feature not found");
  }

  // verifica se já existe vínculo
  const existing = await LicenseFeature.findOne({
    where: {
      licenseId,
      featureId
    }
  });

  if (existing) {
    throw new Error("Feature already linked to this license");
  }

  const licenseFeature = await LicenseFeature.create({
    licenseId,
    featureId,
    active: true,
    createdBy,
    updatedBy: createdBy
  });

  return licenseFeature;
};

export default AddFeatureToLicenseService;