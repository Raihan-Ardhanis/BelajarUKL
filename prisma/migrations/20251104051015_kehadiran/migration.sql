/*
  Warnings:

  - You are about to drop the column `createdAt` on the `attendance` table. All the data in the column will be lost.
  - You are about to drop the column `note` on the `attendance` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `attendance` table. All the data in the column will be lost.
  - You are about to alter the column `status` on the `attendance` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(0))` to `Enum(EnumId(1))`.
  - You are about to drop the column `classOrPosition` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `user` table. All the data in the column will be lost.
  - You are about to alter the column `role` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(1))` to `Enum(EnumId(0))`.
  - A unique constraint covering the columns `[username]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `time` to the `Attendance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `User_email_key` ON `user`;

-- AlterTable
ALTER TABLE `attendance` DROP COLUMN `createdAt`,
    DROP COLUMN `note`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `time` VARCHAR(191) NOT NULL,
    MODIFY `status` ENUM('hadir', 'izin', 'sakit', 'alpha') NOT NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `classOrPosition`,
    DROP COLUMN `email`,
    ADD COLUMN `username` VARCHAR(191) NOT NULL,
    MODIFY `role` ENUM('siswa', 'karyawan', 'admin') NOT NULL DEFAULT 'siswa';

-- CreateIndex
CREATE UNIQUE INDEX `User_username_key` ON `User`(`username`);
