import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import userRoutes from "./routes/users.routes.js";
import presensiRoutes from "./routes/presensi.routes.js";
import attendanceRoutes from "./routes/attendance.routes.js";

dotenv.config();

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

app.use("/api/users", userRoutes);
app.use("/api/presensi", presensiRoutes);
app.use("/api/attendance", attendanceRoutes);  

app.listen(PORT, () => {
    console.log(`server running on http://localhost:${PORT}`);
});