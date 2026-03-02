import Feature from "../../models/Feature";

interface Request {
  featureId: number;
  name?: string;
  active?: boolean;
}

const UpdateFeatureService = async ({
  featureId,
  name,
  active
}: Request) => {

  const feature = await Feature.findByPk(featureId);

  if (!feature) {
    throw new Error("Feature not found");
  }

  await feature.update({
    name,
    active
  });

  return feature;
};

export default UpdateFeatureService;