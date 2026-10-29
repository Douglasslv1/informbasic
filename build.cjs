const fs=require('fs');fs.mkdirSync('dist',{recursive:true});for(const f of ['index.html','style.css','content.js','app.js'])fs.copyFileSync(f,'dist/'+f);console.log('Aplicação pronta em dist/');
