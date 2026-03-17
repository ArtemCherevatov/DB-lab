-- CreateTable
CREATE TABLE "categories" (
    "categoryid" SERIAL NOT NULL,
    "categoryname" VARCHAR(100) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("categoryid")
);

-- CreateTable
CREATE TABLE "customers" (
    "customerid" SERIAL NOT NULL,
    "firstname" VARCHAR(50) NOT NULL,
    "lastname" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
);

-- CreateTable
CREATE TABLE "orderdetails" (
    "orderdetailid" SERIAL NOT NULL,
    "orderid" INTEGER,
    "productid" INTEGER,
    "quantity" INTEGER NOT NULL,
    "unitprice" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "orderdetails_pkey" PRIMARY KEY ("orderdetailid")
);

-- CreateTable
CREATE TABLE "orders" (
    "orderid" SERIAL NOT NULL,
    "customerid" INTEGER,
    "orderdate" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(50) NOT NULL DEFAULT 'Нове',

    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid")
);

-- CreateTable
CREATE TABLE "products" (
    "productid" SERIAL NOT NULL,
    "categoryid" INTEGER,
    "productname" VARCHAR(255) NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "stockquantity" INTEGER NOT NULL DEFAULT 0,
    "isAvailable" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "productid" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "categories_categoryname_key" ON "categories"("categoryname");

-- CreateIndex
CREATE UNIQUE INDEX "customers_email_key" ON "customers"("email");

-- AddForeignKey
ALTER TABLE "orderdetails" ADD CONSTRAINT "orderdetails_orderid_fkey" FOREIGN KEY ("orderid") REFERENCES "orders"("orderid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orderdetails" ADD CONSTRAINT "orderdetails_productid_fkey" FOREIGN KEY ("productid") REFERENCES "products"("productid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_customerid_fkey" FOREIGN KEY ("customerid") REFERENCES "customers"("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_categoryid_fkey" FOREIGN KEY ("categoryid") REFERENCES "categories"("categoryid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_productid_fkey" FOREIGN KEY ("productid") REFERENCES "products"("productid") ON DELETE RESTRICT ON UPDATE CASCADE;
