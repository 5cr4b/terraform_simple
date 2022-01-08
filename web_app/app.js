const express = require('express');
const app =  express();
const port =  3000;
const db = require('./db').db;
const http = require('http');
const bodyParser = require('body-parser');
const server = http.createServer(app);
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static('public'));

// this is welcome page with sign in form
app.get("/" ,  function(req ,res){
    res.sendFile('public/index.html' , { root : __dirname});
});

app.get("/register",function(req,res){
    res.sendFile("public/register.html", { root : __dirname});
});



// get username, password to  authenticate 
app.post("/",function(req,res){
    let foundUser = db.find((data) => req.body.username === data.username);

    if (foundUser) {
        let submittedPass = req.body.password; 
        let storedPass = foundUser.password; 


        if (submittedPass ===  storedPass) {
            res.send(" Welcome to company " + foundUser.username)
        }
        else {
            res.send("Wrong username or  password");
        }
    }   
    else {
        res.send("Wrong username or  password");
    }
});

// add username, password to database
app.post("/register",function(req,res){
    let foundUser = db.find((data) => req.body.username === data.username);
    if (!foundUser) {
        let newUser = {
            username: req.body.username,
            password: req.body.password,
        };
        db.push(newUser);
        res.redirect("/")
    }
    else {
        res.send("username already taken !");
    }
});

app.listen(port)
