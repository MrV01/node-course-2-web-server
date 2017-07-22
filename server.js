const express = require('express');
const hbs = require('hbs');
const fs = require('fs');

const port = process.env.PORT || 3000; // Heroku  deployment  port or default

var app = express();

//
// Using template language, And template engine.
//  handlebarsjs.com  Handlebars ( Other options are: EJS, pug)
//  npm hbs  @ https://www.npmjs.com/package/hbs
//  It is Express.js view engine for handlebars.js
//
hbs.registerPartials(__dirname + '/views/partials');  // Add support of partials to the HBS engine
// added footer.hbs  by Instructor
// Challenge 3.  add header.hbs
app.set('view engine', 'hbs');


// Register  Third  party  middlewaree in Express
// For instance logging requests to a log file
//
app.use((req, res, next ) => {  // request, response, next function to continue
  var now = new Date().toString();
  var log = `${now}: ${req.method} ${req.url}`;
  console.log(log);
  fs.appendFile('server.log', log +'\n', (err) => {
    if(err){
      console.log("Unable to append to server.log");
    }
  });
  next(); // Middleware must call next() pice of middleware . Or app.js will hangs in beetwwen of app.use-es
  // Output example
  // Node server.js ExpressJS Server is up on port 3000
  // Tue Jul 18 2017 01:37:05 GMT-0400 (Eastern Daylight Time): GET /
  // Tue Jul 18 2017 01:37:10 GMT-0400 (Eastern Daylight Time): GET /about
  // Tue Jul 18 2017 01:37:30 GMT-0400 (Eastern Daylight Time): GET /
});

// Challege 3.  Set up middleware, which will show maintenece page only. and nothing else.
// ( In Express object. )
app.use(( req, res, next) => {
  res.render('maintenance.hbs'); // renders responce page
});
// next() call is absent, therefore  only one maintenance page will be rendered
// Next piece of middleware will not get control.
// Register "Middleware" embedded into Express.js to run static web page:
app.use(express.static(__dirname + '/public'));


// Regietering helper(s)  on Handlebars engine
// Now we can use the name in .hbs files as: {{getCurrentYear}}
hbs.registerHelper('getCurrentYear', () => new Date().getFullYear()) ;
// Helper with parameter(s)  .hbs format: {{screamIt welcomeMessage  }}
hbs.registerHelper('screamIt', (screamText) => {
  return screamText.toUpperCase();
});

//
// Basic server, which is listening http/tcp port 3000 and has response handlers running:
  // 1.  /
  // 2.  /bad
  // 3.  /json
  // 4.  /about
  //


  //1. Route / (root)
app.get('/hello', (req, res) => {
  res.send('<h1>Hello Express!</h1>');
});

//
// Challenge 1. :  Send back some JSON, and set up errorMessage property
// 2. Route /bad  send  JSON with errorMessage propery set to some string.
app.get('/bad', (req, res) => {
    res.send({
        name: 'VVV',
        likes: [
          'Cooking',
          'Biking',
          'Suburbian'
        ],
        errorMessage: 'Bad responce sent to the client'
  });
});

// 4.  Route /about   Uses HandlebarJS template ( by default from views folder ).
  app.get('/about',  (req, res) => {
      res.render('about.hbs', {
        pageTitle: 'About Page',
        currentYear: new Date().getFullYear()
      });
  });

// Challenge 2. Create Home page with dynamic content.
// 5.  Route / ( root) modified.   Uses HandlebarJS template ( by default from views folder ).
  app.get('/',  (req, res) => {
      res.render('home.hbs', {
        pageTitle: 'Home Page',
        welcomeMessage: 'Welcome to the Hymalaya!!!! (Web site)',
        currentYear: new Date().getFullYear()
      });
  });

// 3.  Route JSON response
    app.get('/json', (req, res) => {

      res.send({
          name: 'VVV',
          likes: [
            'Cooking',
            'Biking',
            'Country'
          ]
      });

    });

app.listen(port, () => console.log(`Node server.js ExpressJS Server is up on port ${port}`));
