import { User } from "@prisma/client";
import type {UserLoginEmail, UserLoginUsername} from "../dto/user.login";
import type {UserRead} from "../dto/user.read";
import { UserRegister } from "../dto/user.register";
import {prisma} from "../index";

export const register = async( user: Omit<UserRegister,"id">): Promise<UserRegister> =>{
    const {user_username, user_email, user_password, user_coins} = user;
    return prisma.user.create({
        data:{
            user_username,
            user_email,
            user_password,
            user_coins
        },
        select:{
            user_username:true,
            user_email:true,
            user_password:true,
            user_coins:true
        }
    })
}


export const getUsers = async(): Promise<UserRead[]> =>{
    return prisma.user.findMany({
        select:{
            user_id:true,
            user_username:true,
            user_email:true,
            created_At:true,
            updated_At:true,
            user_coins:true,
        }
    })
}

