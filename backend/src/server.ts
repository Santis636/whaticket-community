import gracefulShutdown from "http-graceful-shutdown";
import app from "./app";
import { initIO } from "./libs/socket";
import { logger } from "./utils/logger";
import { StartAllWhatsAppsSessions } from "./services/WbotServices/StartAllWhatsAppsSessions";
import sequelize from "./database";

async function startServer() {

  try {

    await sequelize.sync({ force: true });

    logger.info("Banco sincronizado");

    const server = app.listen(process.env.PORT, () => {
      logger.info(`Server started on port: ${process.env.PORT}`);
    });

    initIO(server);

    StartAllWhatsAppsSessions();

    gracefulShutdown(server);

  } catch (err) {
    console.error("Erro ao iniciar aplicação:", err);
  }
}

startServer();


