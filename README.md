# Matt Pocock-skills voor Codex

Deze repository bevat negen skills, aangepast voor Codex: `domain-modeling`,
`grilling`, `grill-me`, `grill-with-docs`, `to-spec`, `setup-matt-pocock-skills`,
`implement-spec`, `tdd` en `code-review`.

Bron: [mattpocock/skills](https://github.com/mattpocock/skills). De lokale
aanpassingen vervangen Claude-specifieke aanroepen door Codex-instructies.

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
integratiebranch en gebruikt `tdd` en `code-review`. `to-tickets` is niet
geïnstalleerd; de tickets moeten al bestaan. Het installeren voert geen
specificatie uit.

## Bijwerken

```powershell
git pull --ff-only
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

Herstart daarna Codex. Voor een preview gebruik je `-WhatIf`; voor een andere
installatiemap gebruik je `-Destination C:\pad\naar\skills`.
