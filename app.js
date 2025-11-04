import express from "express";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import { sequelize } from "./models/server.js";

import authRoutes from "./routes/attendance.routes.js";
import userRoutes from "./routes/user.routes.js";
import attendanceRoutes from "./routes/presensi.routes.js";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => res.json({ message: "API Presensi Online - Express" }));

app.use("/api/auth", authRoutes);
app.use("/api/users", userRoutes);
app.use("/api/attendance", attendanceRoutes);

// initialize DB and start
(async () => {
  try {
    await sequelize.sync({ alter: true }); // use { force: true } only to reset
    console.log("Database synced.");
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  } catch (err) {
    console.error("Failed to sync DB:", err);
  }
})();
