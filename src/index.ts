import express from 'express';
import  { PrismaClient } from '@prisma/client'
import cors from "cors";
import { userRouter } from './user/user.router';

const prisma = new PrismaClient()
const app = express();
const port = 3000;

async function main(){
  
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

app.use(cors())
app.use(express.json())
app.use("/api/user",userRouter)

export {prisma}