import chai from 'chai';
import chaiHttp from 'chai-http';
import express from 'express';
import {helloHTTPFunction} from '../index';

chai.use(chaiHttp);
chai.should();

const app = express();
app.all('/', helloHTTPFunction);

describe('helloWorld function', () => {
    describe('GET /', () => {
        it('should get return Hello!', done => {
            chai
                .request(app)
                .get('/')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.text.should.be.a('string');
                    res.text.should.equal('Hello!');
                    done();
                });
        });
    });
});