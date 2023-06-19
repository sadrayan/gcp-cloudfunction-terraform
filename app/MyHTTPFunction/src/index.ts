import { HttpFunction } from '@google-cloud/functions-framework';

export const helloHTTPFunction: HttpFunction = (req, res) => res.send("Hello!!")