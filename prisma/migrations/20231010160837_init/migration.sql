/*
  Warnings:

  - Added the required column `updated_At` to the `Item` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_At` to the `Rat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_At` to the `Type` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Item" ADD COLUMN     "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_At" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Rat" ADD COLUMN     "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_At" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Type" ADD COLUMN     "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_At" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "created_At" SET DEFAULT CURRENT_TIMESTAMP;
