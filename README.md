### Q: När går nästa buss till Sjöstan?
### A: [sjostadsbussen.se](http://www.sjostadsbussen.se/)

Applikationen består av två komponenter, en serverkomponent byggd i Sinatra som
hämtar informationen från trafiklab.se och en klientkomponent byggd i
CoffeeScript som presenterar informationen för användaren.

Applikationen använder sig av Procfile och är därför lätt att driftsätta på
Heroku. Det är också lämpligt att använda sig av tekniken för att starta
applikationen lokalt, närmare bestämt
[Foreman](https://github.com/ddollar/foreman).

För att autenticeringen mot Trafiklab skall fungera behövs en API-nyckel till
SL Realtidsinformation. Den erhålles på deras hemsida och sätts sedan som
miljövariabeln API_KEY. På Heroku definieras den genom `heroku config:add
API_KEY=yourkey`.
