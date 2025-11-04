# 🕒 Aplikasi Presensi Online — Backend (UKL XI RPL)

Proyek ini dibuat sebagai bagian dari **Uji Kenaikan Level XI RPL (Backend Developer)** di SMK Telkom Malang.  
Aplikasi ini merupakan sistem **Presensi Online** berbasis RESTful API yang dikembangkan menggunakan **Node.js, Express, dan Prisma ORM** dengan database **MySQL**.

---

## 📘 Penjelasan Singkat

Aplikasi Presensi Online ini berfungsi untuk:
- Mencatat kehadiran siswa atau karyawan secara digital.
- Mengelola data pengguna (admin, HRD, dan siswa/karyawan).
- Menyimpan dan menampilkan riwayat kehadiran.
- Menghasilkan rekap dan analisis tingkat kehadiran.

Proyek ini berjalan di sisi backend (server) dan dapat diuji menggunakan **Postman**.  
Autentikasi dilakukan menggunakan **JWT (JSON Web Token)** agar setiap request aman dan terotorisasi.

---

## ⚙️ Cara Kerja Program

1. **Login & Autentikasi**
   - User (Admin atau Siswa) login dengan email dan password.
   - Password diverifikasi menggunakan **bcrypt**.
   - Jika valid, sistem mengembalikan token **JWT** untuk digunakan di setiap request berikutnya.

2. **Pengelolaan Data Pengguna**
   - Admin dapat menambahkan, mengedit, dan melihat data pengguna baru melalui endpoint `/api/users`.

3. **Presensi**
   - User dapat mengirimkan data presensi harian (hadir, izin, absen, terlambat).
   - Data disimpan di tabel `Attendance` yang terhubung dengan `User`.

4. **Rekap & Analisis**
   - Sistem dapat menampilkan rekap bulanan kehadiran.
   - HRD atau Admin dapat melakukan analisis tingkat kehadiran berdasarkan kelas atau jabatan.

---

## 🧩 Teknologi yang Digunakan

- **Node.js** — runtime JavaScript untuk server.
- **Express.js** — framework untuk RESTful API.
- **Prisma ORM** — penghubung antara Node.js dan MySQL.
- **MySQL** — basis data utama.
- **bcrypt** — enkripsi password.
- **jsonwebtoken (JWT)** — autentikasi.
- **dotenv** — pengelolaan konfigurasi environment.

---

## 🧠 Struktur Folder Proyek

Aplikasi Presensi Online UKL/
├── prisma/
│ └── schema.prisma
├── routes/
│ ├── auth.routes.js
│ ├── users.routes.js
│ └── attendance.routes.js
├── controllers/
│ ├── auth.controller.js
│ ├── users.controller.js
│ └── attendance.controller.js
├── src/
│ └── prismaClient.js
├── .env
├── server.js
├── package.json
└── README.md

yaml
Copy code

---

## 🧪 Cara Menjalankan Program

1. **Instal dependensi:**
   ```bash
   npm install
Buat file .env:

env
Copy code
PORT=3000
JWT_SECRET=superrahasia123
TOKEN_EXPIRES_IN=7d
DATABASE_URL="mysql://root:password@localhost:3306/presensi_db"
Migrasikan database:

bash
Copy code
npx prisma migrate dev --name init
Jalankan server:

bash
Copy code
npm run dev
Server akan berjalan di http://localhost:3000

Uji API di Postman dengan endpoint berikut:

Endpoint	Method	Deskripsi
/api/auth/register	POST	Menambahkan admin pertama
/api/auth/login	POST	Login dan mendapatkan token JWT
/api/users	POST	Menambah pengguna baru (Admin/HRD)
/api/attendance	POST	Menambahkan data presensi
/api/attendance/history/:userId	GET	Melihat riwayat presensi user
/api/attendance/summary/:userId	GET	Rekap kehadiran bulanan
/api/attendance/analysis	POST	Analisis kehadiran berdasarkan kelas/jabatan

📸 Screenshot Hasil Program
Berikut beberapa hasil uji API melalui Postman yang menunjukkan program bekerja sesuai instruksi.

🔹 Login 

![Login Admin](./foto/login.png)

🔹 Tambah User

![Tambah User](./foto/register.png)

🔹 Input Presensi

![Input Presensi](./foto/presensi.png)

🔹 Lihat Rekap Bulanan

![Rekap Bulanan](./foto/recap_bulanan.png)

👨‍💻 Identitas Pengembang
Nama	        Kelas	    Sekolah	            Tahun
Raihan Raharja	XI RPL 3	SMK Telkom Malang	2025

📄 Catatan Tambahan
File README.md ini dibuat untuk memenuhi ketentuan UKL XI RPL Backend Developer.

Program dapat dijalankan di lokal dengan Node.js 18+ dan MySQL aktif.

Semua pengujian dilakukan menggunakan Postman untuk memastikan endpoint bekerja dengan benar.

🧾 Lisensi
Proyek ini dibuat untuk keperluan pembelajaran dan tugas akademik.
Diperbolehkan untuk dimodifikasi dan dikembangkan lebih lanjut selama mencantumkan kredit kepada pengembang asli.
