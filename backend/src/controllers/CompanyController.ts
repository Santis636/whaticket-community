import CreateCompanyService from "../services/CompanyServices/CreateCompanyService";
import { Request, Response } from "express";
import DeleteCompanyService from "../services/CompanyServices/DeleteCompanyService";
import ListCompanyService from "../services/CompanyServices/ListCompanyService";
import ShowCompanyService from "../services/CompanyServices/ShowCompanyService";
import UpdateCompanyService from "../services/CompanyServices/UpdateCompanyService";
import { getIO } from "../libs/socket";


export const create = async (req: Request, res: Response) => {
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

export const remove = async (req: Request, res: Response) => {
    const {
        companyId,
        updatedBy
    } = req.body;
    const io = getIO();
    io.emit("company", {
        action: "remove",
        companyId
    });

    await DeleteCompanyService({
        companyId,
        active: false,
        updatedBy
    });

    return res.status(200).json({ message: "Company deleted" });
}

export const list = async (req: Request, res: Response) => {
    const {
        active
    } = req.body

    const listcompany = await ListCompanyService(active)
    return res.status(201).json(listcompany);
};

export const show = async (req: Request, res: Response) => {
    const { companyId } = req.body;

    const company = await ShowCompanyService(companyId);


    return res.status(201).json(company);
}

export const update = async (req: Request, res: Response) => {
    const {
        companyId,
        name,
        document,
        address,
        logo,
        updateBy
    } = req.body

    const company = await UpdateCompanyService({
        companyId,
        name,
        document,
        address,
        logo,
        updateBy
    })

    const io = getIO();
    io.emit("company", {
        action: "update",
        company
    });

    return res.status(201).json({message: "Company update"})
}