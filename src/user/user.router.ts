import * as UserService from "./user.service"
import express from "express";
import type { Request,Response } from "express";
import { body,validationResult } from "express-validator";
import { request } from "http";

export const userRouter = express.Router();

//Post: 

userRouter.post("/register", 
    body("user_username").isString, 
    body("user_email").isEmail,
    body("user_password").isString, 
    body("user_coins").isNumeric,
    async(request:Request, response:Response)=>{
        try{
        console.log(request.body.user_username)
        const errors = validationResult(request);
        if(!errors.isEmpty()){
            return response.status(400).json({errors:errors.array()});
        }
    
        const user =request.body;
        const newUser = UserService.register(user);
        return response.status(201).json(newUser);
    }catch(error:any){
        return response.status(500).json(error.message);
    }
})

userRouter.get("/", async (request:Request, response:Response)=>{
    try{
        const users = await UserService.getUsers();
        return response.status(200).json(users);
    }catch(error:any){
        return response.status(500).json(error.message);
    }
})