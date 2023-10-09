-- CreateTable
CREATE TABLE "User" (
    "user_id" SERIAL NOT NULL,
    "user_username" TEXT NOT NULL,
    "user_email" TEXT NOT NULL,
    "user_password" TEXT NOT NULL,
    "user_coins" INTEGER NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL,
    "updated_At" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Rat" (
    "rat_id" SERIAL NOT NULL,
    "rat_name" TEXT NOT NULL,
    "rat_cost" DECIMAL(65,30) NOT NULL,
    "rat_damage" DECIMAL(65,30) NOT NULL,
    "rat_defense" DECIMAL(65,30) NOT NULL,
    "rat_health" DECIMAL(65,30) NOT NULL,
    "rat_speed" DECIMAL(65,30) NOT NULL,
    "rat_image" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,

    CONSTRAINT "Rat_pkey" PRIMARY KEY ("rat_id")
);

-- CreateTable
CREATE TABLE "Type" (
    "type_id" SERIAL NOT NULL,
    "type_name" TEXT NOT NULL,

    CONSTRAINT "Type_pkey" PRIMARY KEY ("type_id")
);

-- CreateTable
CREATE TABLE "Item" (
    "item_id" SERIAL NOT NULL,
    "item_name" TEXT NOT NULL,
    "item_description" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("item_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_user_username_key" ON "User"("user_username");

-- CreateIndex
CREATE UNIQUE INDEX "User_user_email_key" ON "User"("user_email");

-- AddForeignKey
ALTER TABLE "Rat" ADD CONSTRAINT "Rat_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rat" ADD CONSTRAINT "Rat_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "Type"("type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
