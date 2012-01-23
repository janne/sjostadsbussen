### Q: När går nästa buss till Sjöstan?
### A: [sjostadsbussen.se](http://www.sjostadsbussen.se/)

Applikationen består av två komponenter, en serverkomponent byggd på
[Sinatra](http://www.sinatrarb.com/) som hämtar informationen från trafiklab.se
och en klientkomponent byggd på [Ember.js](http://www.emberjs.com/) som
presenterar informationen för användaren.

Det är en Rack-applikation, förberedd för drift på Unicorn. Inkluderat finns
också en Procfile och det är lätt att driftsätta den på Heroku. 

För att autenticeringen mot [Trafiklab](http://www.trafiklab.se/) skall fungera
behövs en API-nyckel till SL Realtidsinformation. Den erhålles på deras hemsida
och sätts i config/trafiklab.yml. På Heroku definieras den genom `heroku
config:add API_KEY=yourkey`.

Tjänsten går också att använda som ett API, anropa /departures/SITE_ID.json där
SITE_ID bestämmer hållplats utifrån något av följande:

    1365, Södra Station
    1366, Wollmar Yxkull
    1552, Luma
    4633, Sickla Strand
    9820, Sickla Udde

Då returneras ett JSON-dokument med busser på linje 74 (Sjöstadsbussen) åt båda
hållen från specificerad station.
