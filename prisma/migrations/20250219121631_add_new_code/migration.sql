/*
  Warnings:

  - You are about to drop the column `consunptionMethod` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `Price` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `orderID` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `OrderProduct` table. All the data in the column will be lost.
  - You are about to drop the column `menuCatagoryId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `coverImageurl` on the `Restaurant` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Restaurant` table. All the data in the column will be lost.
  - You are about to drop the `MenuCatagory` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `consumptionMethod` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderId` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `OrderProduct` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menuCategoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coverImageUrl` to the `Restaurant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Restaurant` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ConsumptionMethod" AS ENUM ('TAKEAWAY', 'DINE_IN');

-- DropForeignKey
ALTER TABLE "MenuCatagory" DROP CONSTRAINT "MenuCatagory_restaurantId_fkey";

-- DropForeignKey
ALTER TABLE "OrderProduct" DROP CONSTRAINT "OrderProduct_orderID_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_menuCatagoryId_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "consunptionMethod",
DROP COLUMN "updateAt",
ADD COLUMN     "consumptionMethod" "ConsumptionMethod" NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "OrderProduct" DROP COLUMN "Price",
DROP COLUMN "orderID",
DROP COLUMN "updateAt",
ADD COLUMN     "orderId" INTEGER NOT NULL,
ADD COLUMN     "price" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "menuCatagoryId",
DROP COLUMN "updateAt",
ADD COLUMN     "menuCategoryId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "coverImageurl",
DROP COLUMN "updateAt",
ADD COLUMN     "coverImageUrl" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "MenuCatagory";

-- DropEnum
DROP TYPE "consunptionMethod";

-- CreateTable
CREATE TABLE "MenuCategory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "restaurantId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MenuCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MenuCategory" ADD CONSTRAINT "MenuCategory_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCategoryId_fkey" FOREIGN KEY ("menuCategoryId") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
