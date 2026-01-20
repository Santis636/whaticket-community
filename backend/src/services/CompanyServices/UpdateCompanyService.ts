import AppError from "../../errors/AppError";
import Company from "../../models/Company";

interface Request {
    companyId: number;
    name: string;
    document: string;
    address: string;
    logo: string;
    updateBy: String;
};

const UpdateCompanyService = async ({
    companyId,
    name,
    document,
    address,
    logo,
    updateBy
}: Request) => {
    const company = await Company.findByPk(companyId);

    if (!company) {
        throw new AppError("ERR_NO_COMPANY_FOUND", 404);
    }

    await company.update({
        name,
        document,
        address,
        logo,
        updateBy
    });

    await company.reload();

    return company;
};
export default UpdateCompanyService;