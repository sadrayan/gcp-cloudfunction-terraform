import { HttpFunction } from '@google-cloud/functions-framework';

export const hello: HttpFunction = (req, res) => res.send("Hello!")