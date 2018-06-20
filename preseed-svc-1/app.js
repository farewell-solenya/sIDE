var express = require('express');
var app = express();
var fs = require('fs');
var creds = require('./creds.json');

fs.readFile('./preseed.cfg', 'utf8', function (err,defaultPreseed) {
  if (err) {
    return console.log(err);
  }
  fs.readFile('./secret.cfg', 'utf8', function (err,secretPreseed) {
    if (err) {
        return console.log(err);
      }
    app.get('/ping', function (req, res) {
        res.json({'success':true});
    });
    
    app.get('/preseed', function (req, res) {
        //if correct basic auth
        if(req.headers.authorization) {
            try {
                var authorizationHeader = req.headers.authorization;
                var pattern = /Basic (.*)/i;
                var result = pattern.exec(authorizationHeader);
                var authBuffer = new Buffer(result[1], 'base64');
                console.log(authBuffer.toString('utf8'));
                var username = authBuffer.toString('utf8').split(':')[0];
                var password = authBuffer.toString('utf8').split(':')[1];
                if(username !== creds.username || creds.password !== "pass") {
                    throw Unauthorized;
                }
                res.send(defaultPreseed + secretPreseed);
            }
            catch(e) {
                res.set(401).json({'status':'unauthorized'});
            }
        }
        else {
            res.send(defaultPreseed);
        }
    });
    
    app.listen(3000, function () {
        console.log('Example app listening on port 3000!');
    });
  });
});
