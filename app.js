const app = require('express')();

app.set('view engine', 'html');
app.use(express.static('www'));

app.get('/',(req, res)=>{
  res.render( 'index',{
    'title': 'Gerrymandering Tinder',
  });
}

var appPort = 2000;
if (app.get('env') === 'production') appPort = 80;
console.log(appPort);
app.listen(appPort, () =>{
   console.log('Gerrymandering Tinder is listening on 2000')
 });
//app.listen(2000);
