import express  from "express"
import isAuth from "../middleware/isAuth";
import LicenseController from "../controllers/LicenseController";
const LicenseRoutes = express.Router();

LicenseRoutes.post("/license", isAuth, LicenseController.create);

export default LicenseRoutes;