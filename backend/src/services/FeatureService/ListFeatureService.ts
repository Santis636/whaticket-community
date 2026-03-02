import Feature from "../../models/Feature";

const ListFeaturesService = async () => {

  const features = await Feature.findAll({
    where: { active: true },
    order: [["name", "ASC"]]
  });

  return features;
};

export default ListFeaturesService;