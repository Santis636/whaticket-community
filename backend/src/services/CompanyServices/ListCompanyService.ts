import Company from "../../models/Company";

interface Request {
    active?: boolean;
};

const ListCompanyService = async ({
    active
}: Request) => {
    const companies = await Company.findAll({
        where: active !== undefined ? { active } : undefined,
        order: [
            ["name", "ASC"],
            ["createdAt", "DESC"]
        ]
    })
    return companies;
};
export default ListCompanyService;