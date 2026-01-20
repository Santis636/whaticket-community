import License from "../../models/License";

type LicenseStatus = "active" | "suspended" | "expired";
interface Request {
    companyId: number;
    type: string;
    status: LicenseStatus; //colocar uma verificação para saber se o status é "active", "suspended", "expired"
    endDate: Date;
    createdBy: string;
    updatedBy: string;
};

const CreatedLicenseService = async ({
    companyId,
    type,
    status,
    endDate,
    createdBy,
    updatedBy
}: Request) => {
    //colocar tratamento nos dados para saber se está tudo funcional
    const startDate = new Date()
    const license = await License.create({
        companyId,
        type,
        startDate,
        status,
        endDate,
        createdBy,
        updatedBy
    });
    return license;
};
export default CreatedLicenseService;