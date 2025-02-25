/*
  Warnings:

  - You are about to drop the column `consumptionMethod` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `orderId` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `menuCategoryId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `coverImageUrl` on the `Restaurant` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Restaurant` table. All the data in the column will be lost.
  - You are about to drop the `MenuCategory` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `consunptionMethod` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updateAt` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Price` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderID` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updateAt` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menuCatagoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updateAt` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coverImageurl` to the `Restaurant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updateAt` to the `Restaurant` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "consunptionMethod" AS ENUM ('TAKEAMAY', 'DINE_IN');

-- DropForeignKey
ALTER TABLE "MenuCategory" DROP CONSTRAINT "MenuCategory_restaurantId_fkey";

-- DropForeignKey
ALTER TABLE "OrderProduct" DROP CONSTRAINT "OrderProduct_orderId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_menuCategoryId_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "consumptionMethod",
DROP COLUMN "updatedAt",
ADD COLUMN     "consunptionMethod" "consunptionMethod" NOT NULL,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "OrderProduct" DROP COLUMN "orderId",
DROP COLUMN "price",
DROP COLUMN "updatedAt",
ADD COLUMN     "Price" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "orderID" INTEGER NOT NULL,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "menuCategoryId",
DROP COLUMN "updatedAt",
ADD COLUMN     "menuCatagoryId" TEXT NOT NULL,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "coverImageUrl",
DROP COLUMN "updatedAt",
ADD COLUMN     "coverImageurl" TEXT NOT NULL,
ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "MenuCategory";

-- DropEnum
DROP TYPE "ConsumptionMethod";

-- CreateTable
CREATE TABLE "MenuCatagory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "restaurantId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MenuCatagory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MenuCatagory" ADD CONSTRAINT "MenuCatagory_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCatagoryId_fkey" FOREIGN KEY ("menuCatagoryId") REFERENCES "MenuCatagory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
