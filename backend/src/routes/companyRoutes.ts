import express from "express";
import isAuth from "../middleware/isAuth";
import * as companyController from "../controllers/CompanyController";

const companyRouter = express.Router()

companyRouter.post("/company", isAuth, companyController.create); //remover o isauth para teste
companyRouter.put("/company/:companyId",companyController.update)
companyRouter.put("/company/remove/:companyId",companyController.remove)
companyRouter.get("/company/:companyId",companyController.show)
companyRouter.get("/company/list/:ative",companyController.list)

export default companyRouter;
