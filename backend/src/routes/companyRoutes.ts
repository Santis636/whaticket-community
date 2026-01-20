import express from "express";
import isAuth from "../middleware/isAuth";
import companyController from "../controllers/CompanyController";

const companyRouter = express.Router()

companyRouter.post("/company", isAuth, companyController.create);

export default companyRouter;
