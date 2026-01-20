import CreateCompanyService from "../services/CompanyServices/CreateCompanyService";
import { Request, Response } from "express";


class companyController {

    async create(req: Request, res: Response) {
        const {
            name,
            document,
            adress,
            logo,
            createdBy,
            updatedBy
        } = req.body;

        const company = await CreateCompanyService({
            name,
            document,
            adress,
            logo,
            createdBy,
            updatedBy
        })
        return res.status(201).json(company)
    };
};
export default new companyController();