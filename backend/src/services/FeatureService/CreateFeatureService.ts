import Feature from "../../models/Feature";

interface Request {
  name: string;
}

const CreateFeatureService = async ({ name }: Request) => {

  if (!name) {
    throw new Error("Feature name is required");
  }

  const feature = await Feature.create({
    name,
    active: true
  });

  return feature;
};

export default CreateFeatureService;