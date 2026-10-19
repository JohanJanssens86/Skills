# Invulregels projectinitiatie

## Herkomst en toepassing

De rubrieken en hun volgorde volgen de door de gebruiker aangeleverde
`ICTPRJ-yymmdd_Initiatie (imp_)-151026-072847.pdf` (3 pagina's), meegeleverd
als `assets/initiatietemplate.pdf`.

De aanvullende invulling is afgeleid uit het aangeleverde voorbeeld
`Initiatie_eHealthBox_WGK_volgens_handleiding.pdf` (Concept 0.4, 6 pagina's).
Dat voorbeeld verwijst naar een afzonderlijke handleiding [G1]; die handleiding
zelf is niet aangeleverd. Claim daarom niet dat alle regels daarvan bekend zijn.
Neem de eHealthBox-projectgegevens, bronverwijzingen [H1-H5/N1], openstaande
besluiten en de projectspecifieke wens om budgetvelden leeg te laten niet over.
De oorspronkelijke lege template is de basis; het voorbeeld verduidelijkt de
inhoudelijke uitwerking. De expliciete opdracht van de gebruiker bepaalt de
onderstaande sizing en de drie ramingscategorieën.

## Inhoud per rubriek

Schrijf per rubriek alleen de kern. Vermijd herhaling en uitgebreide API- of
implementatiebeschrijvingen; verwijs naar de bron voor details. Behoud de
hoofdrubrieken, relevante aannames, risico's en open beslispunten.

- **Aanvrager & stakeholders:** persoon en dienst, betrokken partijen, sponsor,
  beslissingsbevoegde en ICT-lead voor zover bekend. Scheid betrokkenheid van
  formeel eigenaarschap; wijs geen verantwoordelijkheden stilzwijgend toe.
- **Aanleiding & doel:** huidig probleem, gewenste verandering en meetbare
  uitkomst waar onderbouwd. Scheid bestaande werking van gewenste werking.
- **Business value:** voordelen voor processen, zorg/veiligheid indien relevant,
  data en organisatie. Tijdswinst is niet automatisch een FTE-besparing.
- **Urgentie & impact:** motiveer urgentie met termijn en gevolgen van uitstel.
  Gebruik heel hoog (1-3 maanden), hoog (3-6 maanden), midden (6-12 maanden),
  laag (effect na meer dan een jaar of uitstel zonder directe gevolgen), of
  onbekend. Dit zijn de banden uit het voorbeeld; bevestig de categorie bij
  overlappende grensmaanden of termijnen korter dan een maand. Onbekend maakt
  de vraag inzichtelijk zonder zelfstandig de prioriteitenlijst te veranderen.
  Beoordeel vijf dimensies afzonderlijk als hoog/midden/laag met motivering:
  wettelijke verplichting, kwaliteit van zorg / veiligheid, efficiëntie van
  processen, financieel en data. Onbekend of niet van toepassing mag met reden.
  Verzin geen totaalscore of prioriteringsformule. Controleer actuele wettelijke
  claims via gezaghebbende bronnen voordat je ze als feit opneemt.
- **Scope:** beschrijf expliciet in scope, het MVP en out of scope. Mogelijke
  vervolguitbreidingen zijn geen MVP-toezegging. Markeer onbesliste afbakening.
- **Impact analyse:** processen; applicaties / interfaces; andere diensten /
  functies; afhankelijkheden van andere projecten / EPICs / features.
- **Risico analyse:** risico's, aandachtspunten en afhankelijkheden. Vermeld
  waar mogelijk gevolg, beheersmaatregel en eigenaar; onbekende eigenschappen
  van een oplossing zijn onzekerheden, geen bewezen tekortkomingen.
- **Plan van aanpak:** functionele én technische aanpak, fasering, betrokken
  teams, afhankelijkheden en aannames. Nieuwe EPIC-/featurelabels zijn voorstellen
  en geen bestaande trackeridentificaties.
- **Inschattingen en verwachte kosten:** gebruik de regels hieronder. Vraag
  teamnamen en het leidende team na. Identificeer vanuit scope en impactanalyse
  afzonderlijke herkenbare features en beschrijf hun afbakening kort. Raam per
  feature Analyse, Testing en Development; splits alleen waar de inhoud dat
  rechtvaardigt. Voorkom overlap en dubbeltelling van gedeeld werk. Vermeld
  teamverantwoordelijkheden in de begeleidende tekst. Voeg geen kostprijstabel
  toe. Vermeld relevante, bekende kosten of financiële onzekerheden zo nodig
  beknopt in tekst. Scheid inspanning en doorlooptijd; voeg beheer niet als
  vierde ramingscategorie toe.
- **ROI:** maak alleen een financiële berekening als kosten, baten en periode
  voldoende onderbouwd zijn. Toon de formule en aannames. Zonder cijfers geef
  je kwalitatieve baten en ontbrekende input, geen verzonnen rendement.
- **Haalbaarheid:** technische, organisatorische en financiële haalbaarheid
  afzonderlijk, met onderbouwing en voorwaarden.
- **Beslissing:** daadwerkelijk genomen besluit, beslisser, datum en voorwaarden
  indien bekend. Anders “Nog geen beslissing vastgelegd” met te beslissen punten.

## Meerdere oplossingsopties

Werk per serieuze optie afzonderlijk impact, risico's, functionele en technische
aanpak, inschattingen/kosten, ROI en haalbaarheid uit binnen de overeenkomstige
hoofdrubrieken. Vergelijk dezelfde scope en aannames. Houd gemeenschappelijke
informatie gedeeld en label verschillen duidelijk. Kies geen voorkeursoplossing
zonder onderbouwing of gebruikersbesluit.

## Inschattingen: werkdagen, 20% marge en T-shirtmaat

`d` betekent een werkdag inspanning (persoonswerkdag), geen kalenderdag of
doorlooptijd. Verdeel alle inspanning onder **Analyse**, **Testing** en
**Development**, per geïdentificeerde feature en zo nodig per oplossingsoptie.
Leg betrokken teams en leveranciers vast in de begeleidende tekst. Vergelijk
alternatieve opties in afzonderlijke tabellen met dezelfde features en scope.

1. Leg per raming de basis in werkdagen en de onderbouwing intern vast. Een eigen
   expertinschatting mag als expliciet voorlopig voorstel met aannames ter
   bevestiging; zonder voldoende basis blijft de waarde “Nog te ramen”.
2. Bereken `marge = basis × 0,20` en `inclusief marge = basis × 1,20`.
   Bewaar decimalen; rond niet af voordat je de maat bepaalt. Houd de dagen
   en berekening intern bij. De ramingstabel bevat de kolommen **Feature**,
   **Analyse**, **Testing** en **Development**, zonder **Inschatting (d)** of
   **Onderbouwing / status**. Gebruik één rij per feature, met de featurenaam
   in de eerste kolom en een T-shirtmaat in elk van de drie topic-kolommen.
   Voeg per optie een totaalrij met de maat per topic toe en vermeld de totale
   maat over alle topics samen kort onder de tabel. Vermeld ramende partij, betrokken
   teams, afbakening, aannames en status beknopt in begeleidende tekst.
   Toon geen basisdagen, marge of berekening in het
   initiatiedocument.
3. Bepaal de T-shirtmaat op de inspanning **inclusief** marge. De schrijfwijze
   van de gebruiker bevat overlappende grenzen; gebruik onderstaande expliciete
   grensconventie. Plaats direct onder de ramingstabel een afzonderlijke tabel
   met alle onderstaande maten en daggrenzen, met de kolommen **T-shirtmaat**
   en **Inspanning (d)**. Vermeld daarbij dat d een persoonswerkdag betekent;
   laat de marge uit de zichtbare tabelkop en toelichting weg. Volg een latere
   gebruikerscorrectie consequent in alle ramingen.

| Maat | Werkdagen inclusief 20% marge |
| --- | --- |
| XS | minder dan 5d |
| S | vanaf 5d tot minder dan 10d |
| M | vanaf 10d tot minder dan 20d |
| L | vanaf 20d tot minder dan 40d |
| XL | vanaf 40d tot en met 80d |
| XXL | meer dan 80d |

4. Tel de basisdagen en margedagen van alle features en topics op voor een
   totaal per subproject en oplossingsoptie. Reken gedeeld werk slechts één
   keer mee en vermeld bij welke feature het is ondergebracht. Voeg niet
   opnieuw 20% toe aan een totaal van reeds verhoogde ramingen. Tel geen
   T-shirtletters op. Een totaalmaat wordt opnieuw uit de totale dagen bepaald.
   Tel wederzijds uitsluitende oplossingsopties niet samen.
5. Als een aangeleverde raming al 20% marge bevat, leg die status intern vast en voorkom
   dubbeltelling. Bij onduidelijkheid vraag je na of de marge inbegrepen is.
6. Is alleen een T-shirtmaat bekend, vraag naar basisdagen of een onderbouwd
   interval én of de maat inclusief marge is. Verzin geen middelpunt. Bij een
   daginterval reken je beide grenzen met 1,20 door en toon je de mogelijke
   maten; XXL heeft geen eindige bovengrens. Zonder dagen geen exact dagtotaal.
7. Inspanning is niet de planning: leid doorlooptijd alleen af met informatie
   over capaciteit, parallel werk en afhankelijkheden. Zet bij kosten de
   gebruikte tarieven en periode; leid geen eurobedrag af uit alleen een maat.

Voorbeelden (basis -> inclusief marge -> maat):

- 8d -> 9,6d -> S.
- 9d -> 10,8d -> M.
- 20d -> 24d -> L.
- 35d -> 42d -> XL.
- 70d -> 84d -> XXL.

Exact 5d inclusief marge is S, exact 10d is M, exact 20d is L, exact 40d is XL en exact 80d
is XL. Een expliciet bevestigde 0d betekent geen inspanning: toon “n.v.t.”
in plaats van S. Verwar onbekend niet met nul en accepteer geen negatieve dagen.
