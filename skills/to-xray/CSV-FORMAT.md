# CSV-contract voor Xray Cloud

Gebruik de **Xray Test Case Importer**, niet Jira's algemene CSV-importer. De kolomnamen worden in de importwizard aan velden gekoppeld; dit contract kiest een vaste standaard voor deze skill.

## Standaardexport

UTF-8, komma als kolomscheiding, dubbele quotes als quote-teken, CRLF als rijafsluiting. Gebruik een CSV-writer die komma's, quotes en regeleinden correct escapt. Schrijf geen spreadsheetformules; testdata blijft letterlijke tekst.

```csv
Test ID,Summary,Test Type,Description,Action,Data,Expected Result,Test Repository Folder
TC-001,Toegelaten gebruiker opent het overzicht,Manual,"Bron: US-001. Voorwaarde: gebruiker is aangemeld met de vereiste rol. Er is een bezoek voor Testklant Één op 26/10/2026.",Open het overzicht.,,Het overzicht wordt getoond.,
TC-001,Toegelaten gebruiker opent het overzicht,Manual,"Bron: US-001. Voorwaarde: gebruiker is aangemeld met de vereiste rol. Er is een bezoek voor Testklant Één op 26/10/2026.",Zoek de bezoeken van de testklant op 26/10/2026.,Klant: Testklant Één; datum: 26/10/2026.,De bezoeken van Testklant Één op 26/10/2026 staan in het overzicht.,
```

Dit is een voorbeeld van het formaat, geen bron voor nieuwe requirements.

Eén rij per stap. Herhaal testmetadata op iedere rij. Gebruik hetzelfde `Test ID` voor alle stappen van één test, en een ander ID voor een volgende test. Rijen bepalen de stapvolgorde. `Test ID` is een lokale groeperingswaarde, geen Jira-issuekey; opnieuw importeren met dezelfde lokale IDs voorkomt geen duplicaten.

## Importmapping

| CSV-kolom | Veld in de importwizard |
| --- | --- |
| Test ID | Test ID / Issue Id (groeperingsveld van de importer) |
| Summary | Summary |
| Test Type | Test Type |
| Description | Description |
| Action | Xray Test Step Fields → Action |
| Data | Xray Test Step Fields → Data |
| Expected Result | Xray Test Step Fields → Expected Result |
| Test Repository Folder | Standaard niet koppelen (lege kolom); alleen bij expliciete maptoewijzing: Test Repository Folder |

Selecteer UTF-8 en komma in de bestandsinstellingen. Kies het Jira-doelproject in de wizard; de CSV hoeft geen projectkey te bevatten. Controleer het beschikbare testtype `Manual` en de geconfigureerde stapveldnamen: projecten kunnen andere waarden of verplichte extra velden hebben. Gebruik bevestigde projectvelden waar bekend en documenteer afwijkingen in het rapport. De verplichte basisvelden zijn het groeperings-ID, Summary en Test Type.

## Bestemming in de Test Repository

Standaard blijft `Test Repository Folder` op alle staprijen leeg: **geen maptoewijzing**. Vraag niet naar een doelmap. Koppel deze lege kolom niet in de importwizard en laat automatisch aanmaken van mappen uitgeschakeld. Documenteer deze standaard in het rapport. Dit garandeert geen plaatsing in de repository-root.

Alleen bij expliciete maptoewijzing bevat `Test Repository Folder` het relatieve pad binnen de Test Repository van het geselecteerde Jira-project, bijvoorbeeld `WGK/Patientbeheer`. Gebruik `/` tussen mapnamen, geen Jira-URL of lokaal bestandspad. Herhaal de bestemming op alle staprijen van dezelfde test. Het project wordt afzonderlijk gekozen in de wizard; deze kolom bepaalt de map binnen dat project.

Map alleen bij expliciete maptoewijzing de CSV-kolom naar **Test Repository Folder**. Schakel in de Setup-stap de optie voor automatisch aanmaken van ontbrekende Test Repository-mappen in wanneer het doelpad nog niet bestaat en aangemaakt mag worden. Gebruik anders een bestaande map. Vermeld in de importinstructies welke keuze van toepassing is; de CSV zelf schakelt deze optie niet in.

Een lege waarde bevat geen expliciete maptoewijzing en is de standaard voor deze skill. Controleer na import de mapplaatsing: Xray kan Test-issues wel importeren maar een waarschuwing geven als een map niet aangemaakt kan worden of een test niet verplaatst kan worden.

## Nieuwe tests en koppelingen

Default worden nieuwe Test-issues aangemaakt. Een `Issue Key`-kolom is alleen voor een expliciet gevraagde update met bevestigde bestaande Test-keys. De standaardexport bevat die kolom niet.

Voor echte Jira-requirements mag een optionele kolom `Requirement Links` worden toegevoegd wanneer keys én de juiste linkrelatie bekend zijn. Map deze naar de passende `Link ...`-relatie en richting in de wizard. Gebruik puntkomma als lijstscheiding voor meerdere keys en stel dezelfde lijstscheiding in de wizard in. Verzin de naam/richting van de relatie niet. Bij onbekende mapping blijven de keys als traceerbaarheidstekst in Description en het rapport; claim dan geen automatische dekkingskoppeling.

Sla na een eerste succesvolle import de configuratie uit Xray op voor hergebruik. Rapporteer de importresultaten en bewaar de toegekende Jira-keys voordat later updates worden voorbereid.

## Grenzen en bronnen

Deze export maakt manuele Test-issues met stappen. De importer ondersteunt ook Preconditions en Test Sets, maar maakt geen Test Plan. Groepering in een Xray Test Plan is een aparte actie.

Maximaal 1000 issues per import; deze skill exporteert alleen tests. Bij optionele links geldt bovendien de gedocumenteerde limiet: maximaal 2000 extra links bovenop de eerste link per test. Splits zo nodig op in batches die ook aan deze limiet voldoen.

Bron: [Xray Cloud — Importing Tests using Test Case Importer](https://getxraydocs.atlassian.net/wiki/spaces/XRAYCLOUD/pages/44565062), geraadpleegd op 26 oktober 2026. Controleer deze officiële documentatie bij gewijzigde importvelden of meldingen van incompatibiliteit. Een lokale CSV-controle bewijst niet dat de projectconfiguratie van de gebruiker de import accepteert.
