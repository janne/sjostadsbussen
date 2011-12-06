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

Tjänsten går också att använda som ett API, anropa /departures/SITE_ID.json där
SITE_ID bestämmer hållplats utifrån något av följande:

    1365, Södra Station
    1366, Wollmar Yxkull
    1552, Luma
    4633, Sickla Strand
    9820, Sickla Udde

Då returneras ett JSON-dokument med busser på linje 74 (Sjöstadsbussen) åt båda
hållen från specificerad station.
