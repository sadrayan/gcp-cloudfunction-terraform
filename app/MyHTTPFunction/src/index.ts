import { Request, Response } from "express";

export const helloHTTPFunction = async (req: Request, res: Response) => {
    // console.log(req);
    res.send("hello");
};