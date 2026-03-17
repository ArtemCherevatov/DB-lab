const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
    console.log("Очищення старих тестових відгуків...");
    await prisma.review.deleteMany();

    let product = await prisma.products.findFirst();

    if (!product) {
        console.log("Товарів не знайдено. Створюємо тестовий товар...");
        product = await prisma.products.create({
            data: {
                productname: "Тестовий Смартфон",
                price: 15000,
                stockquantity: 5
            }
        });
    }

    console.log(`Додавання нового відгуку до товару з ID: ${product.productid}...`);
    
    const newReview = await prisma.review.create({
        data: { 
            rating: 5, 
            comment: "Чудовий товар, працює ідеально!", 
            products: {
                connect: { productid: product.productid }
            }
        }
    });
    console.log("Відгук створено успішно!\n");

    console.log("Отримання результату з бази (Товар + Відгуки):");
    const result = await prisma.products.findUnique({
        where: { productid: product.productid },
        include: { reviews: true }
    });

    console.log(JSON.stringify(result, null, 2));
}

main()
  .catch((e) => {
    console.error("Виникла помилка:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });