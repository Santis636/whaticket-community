import Company from "../../models/Company";

interface Request {
    companyId: number;
    updatedBy: string;
    active: boolean;
};

const DeleteCompanyService = async ({
    companyId,
    active,
    updatedBy
}: Request) => {

    const company = await Company.findByPk(companyId);

    if (!company) {
        throw new Error("Company not found");
    }

    await company.update({ active: false, updatedBy })
};
export default DeleteCompanyService;