import express  from "express"
import isAuth from "../middleware/isAuth";
import * as LicenseController from "../controllers/LicenseController";
const LicenseRoutes = express.Router();

LicenseRoutes.post("/license", isAuth, LicenseController.create); //remover o isauth para teste

export default LicenseRoutes;