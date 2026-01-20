import { Request, Response } from "express";
import CreatedLicenseService from "../services/LicenseService/CreateLicenseService";


export const create = async (req: Request, res: Response) => {
    const { companyId,
        type,
        status,
        endDate,
        createdBy,
        updatedBy
    } = req.body;

    const license = await CreatedLicenseService({
        companyId,
        type,
        status,
        endDate,
        createdBy,
        updatedBy
    });
    return res.status(201).json(license);
};
