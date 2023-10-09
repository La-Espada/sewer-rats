import express from 'express';
import  { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()
const app = express();
const port = 3000;

async function main(){
  const allUsers = await prisma.user.findMany()
  console.log(allUsers)
}

main()
.then(async()=>{
  await prisma.$disconnect()
})
.catch( async(e) => {
  console.error(e)
  await prisma.$disconnect()
  process.exit(1)
})

app.get('/', (req, res) => {
  res.send('Hello, Express!');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});