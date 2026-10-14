# Issue tracker: GitHub

Repository: JohanJanssens86/Skills.
Specificaties en tickets worden opgeslagen als GitHub Issues.
Gebruik de gh CLI vanuit de lokale repository.

Lees relevante issues voordat je wijzigingen uitvoert.
Publiceer een specificatie als een nieuw issue.
Gebruik --body-file voor teksten met meerdere regels.
Pas bij to-spec en to-tickets het label ready-for-agent toe.

## Tickets en afhankelijkheden

Lees specificaties met `gh issue view <number> --json number,title,body,labels,comments`.
Maak tickets met `gh issue create --title "..." --body-file <file> --label ready-for-agent`.
Als de bron een issue is, gebruik `--parent <number>` om het ticket als sub-issue te koppelen.
Stel blokkades in met `--blocked-by <numbers>` bij het aanmaken, of
`gh issue edit <ticket> --add-blocked-by <blocker>` achteraf.
Controleer beschikbare opties met `gh issue create --help` op oudere machines.
Als native relaties niet beschikbaar zijn, zet `Part of #<parent>` en
`Blocked by: #<blocker>` in de tickettekst.
Sluit afgeronde tickets met `gh issue close <number>` nadat de implementatie
geïntegreerd en gecontroleerd is. Een specificatie publiceren of opdelen sluit
de oorspronkelijke specificatie niet.

PRs as a request surface: no.
