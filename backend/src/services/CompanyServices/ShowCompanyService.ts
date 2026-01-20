import { compareAsc } from "date-fns";
import Company from "../../models/Company";
import AppError from "../../errors/AppError";

const ShowCompanyService = async (companyId: number): Promise<Company> => {
    const company = await Company.findByPk(companyId);

    if (!company) {
        throw new AppError("ERR_NO_CONTACT_FOUND", 404);
    }

    return company;
};

export default ShowCompanyService;



