# Matt Pocock-skills voor Codex

Deze repository bevat twaalf skills voor Codex: `domain-modeling`,
`grilling`, `grill-me`, `grill-with-docs`, `to-spec`, `setup-matt-pocock-skills`,
`to-tickets`, `implement-spec`, `tdd`, `code-review`, `projectinitiatie` en `to-xray`.

Bron: [mattpocock/skills](https://github.com/mattpocock/skills). De lokale
aanpassingen vervangen Claude-specifieke aanroepen door Codex-instructies.
`projectinitiatie` is een eigen uitbreiding op basis van de aangeleverde
initiatietemplate en het aanvullende invulvoorbeeld.

## Installeren op Windows

Installeer Git en Codex en voer in PowerShell uit:

```powershell
git clone https://github.com/JohanJanssens86/Skills.git
cd Skills
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -InstallGitHubCli
```

Het script installeert de skills in `$CODEX_HOME/skills`, of in
`%USERPROFILE%/.codex/skills` als `CODEX_HOME` niet ingesteld is. Bestaande versies
worden eerst bewaard in de naastgelegen map `skill-backups`. Andere skills blijven
behouden. `-InstallGitHubCli` installeert GitHub CLI via winget als dat nodig is.

Herstart Codex en open een nieuwe terminal. Meld je op elke machine afzonderlijk aan:

```powershell
gh auth login
```

Aanmeldgegevens worden niet in deze repository opgeslagen.

## Gebruiken in een project

Roep `$setup-matt-pocock-skills` expliciet aan in het doelproject. Deze skill stelt
de issue tracker en de locatie van domeindocumentatie voor dat project in.
De instellingen in `docs/agents/` van deze repository verwijzen naar
`JohanJanssens86/Skills`; kopieer ze niet blind naar een ander project.

Gebruik `$grill-me` voor een ontwerpinterview, `$grill-with-docs` om daarbij
begrippen en beslissingen vast te leggen, en `$to-spec` om de besproken specificatie
te publiceren. Bij GitHub Issues moet het label `ready-for-agent` bestaan:

```powershell
gh label create ready-for-agent --repo OWNER/REPO --color 0E8A16 --description "Ready for implementation by an agent"
```

In `JohanJanssens86/Skills` is dit label al aanwezig. De `triage`-skill is niet
onderdeel van deze bundel.

Gebruik `$implement-spec` met een verwijzing naar een specificatie en de
bijbehorende tickets met afhankelijkheden. De skill laat subagents de tickets
implementeren in afzonderlijke worktrees, brengt het resultaat samen op een
integratiebranch en gebruikt `tdd` en `code-review`. Maak de tickets vooraf met
`$to-tickets`: die skill splitst de specificatie in uitvoerbare tickets met
afhankelijkheden en publiceert de goedgekeurde indeling naar de tracker.
De volledige workflow is `$grill-with-docs` → `$to-spec` → `$to-tickets` →
`$implement-spec`. Het installeren voert geen specificatie uit.

Gebruik `$projectinitiatie` voor een kritisch vraag-en-antwoordinterview dat
eindigt in een zo volledig mogelijk ingevulde initiatietemplate. De skill bevat
de oorspronkelijke PDF en een bewerkbare Markdowntemplate. Inschattingen worden
verdeeld over Analyse, Testing en Development: eerst 20% marge bij de werkdagen,
daarna T-shirt sizing (S <10d, M 10-<20d, L 20-<40d, XL 40-80d, XXL >80d).
De marge wordt intern verwerkt en niet afzonderlijk getoond. Ontbrekende gegevens
blijven zichtbaar als open punten. Het resultaat is een beknopt lokaal
initiatiedocument in Markdown, na inhoudelijke bevestiging altijd ook als
downloadbare PDF. Er worden geen specificatie of tickets gepubliceerd.

Gebruik `$to-xray` met een specificatiebestand, GitHub-issue of URL om manuele
testgevallen voor Xray Cloud te maken. De skill levert een CSV voor de Xray
Test Case Importer en een Markdownrapport met dekking, open vragen en
importinstructies. Er wordt niets automatisch geïmporteerd in Jira/Xray.
Standaard is er geen maptoewijzing; geef desgewenst
`--test-repository "Map/Submap"` op. Deze skill is aangeleverd door een collega
en aangepast voor Codex; ze wordt alleen expliciet aangeroepen.

Voor installatie in de persoonlijke `.agents/skills`-map gebruik je
`powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -Destination "$env:USERPROFILE\.agents\skills"`.

## Bijwerken

```powershell
git pull --ff-only
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

Herstart daarna Codex. Voor een preview gebruik je `-WhatIf`; voor een andere
installatiemap gebruik je `-Destination C:\pad\naar\skills`.
