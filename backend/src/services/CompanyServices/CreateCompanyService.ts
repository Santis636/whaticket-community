import Company from "../../models/Company";

interface Request {
    name: string;
    document: string;
    adress: string;
    logo: string;
    createdBy: string;
    updatedBy: string;
};

const CreateCompanyService = async ({
    name,
    document,
    adress,
    logo,
    createdBy,
    updatedBy
}: Request) => {
    const company = await Company.create({
        name,
        document,
        adress,
        logo,
        createdBy,
        updatedBy
    });
    return company;
    //adicinar tratamento de erros e retorno positivo para API
}
export default CreateCompanyService;