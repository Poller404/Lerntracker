# Lerntracker

Studienplaner für die HF: Module, Aufträge, Noten, Stundenplan, Notizen und Lernzeit an einem Ort. Eine einzelne HTML-Seite ohne Build-Werkzeuge oder Abhängigkeiten.

## Funktionen

- **Heute**: Wochenleiste, heutige Lektionen als Zeitstrahl (mit «Notiz» pro Lektion), fällige und überfällige Aufträge, Fokus-Timer, Lernzeit der Woche
- **Woche**: Stundenplan mit wiederkehrenden Lektionen und Abgaben pro Tag, Wochen vor- und zurückblättern
- **Aufträge**: Liste oder Board (Offen / In Arbeit / Erledigt), Priorität, Teilschritte mit Fortschritt, Filter nach Modul
- **Noten**: Schweizer Skala 1–6, gewichteter Modulschnitt, Rundung (Zehntel, Halbe, exakt), «Was brauche ich an der nächsten Prüfung?», Was-wäre-wenn-Rechner, Notenverlauf als Diagramm
- **Notizen**: Mitschrift mit Autosave, einfache Formatierung (Überschriften, Listen, To-dos zum Abhaken, fett), anheften, durchsuchen, Text direkt als Auftrag übernehmen
- **Lernzeit**: Fokus-Timer (Pomodoro oder Stoppuhr), Auswertung pro Tag, pro Modul und über 8 Wochen
- **Suche** mit ⌘K / Ctrl K über Module, Aufträge und Notizen
- **Backup** als JSON herunterladen und wieder einlesen

## Zwei Arten, den Planer zu nutzen

1. **claude.ai-Version** (synchronisiert zwischen Mac, iPad und iPhone): Die Seite läuft als Artifact auf claude.ai und speichert in dessen Datenbank.
2. **Eigenständig** (`index.html`): Im Browser öffnen oder über GitHub Pages hosten. Ohne claude.ai speichert der Planer lokal im Browser (localStorage), also nur auf diesem Gerät. Mit «Backup herunterladen» / «Backup einlesen» lassen sich Daten zwischen den Versionen übertragen.

## Aufbau

- `src/studienplaner.html` – die eigentliche App (CSS, HTML und JavaScript in einer Datei). Hier wird entwickelt.
- `build.sh` – erzeugt daraus `index.html` mit vollständigem HTML-Gerüst.
- `index.html` – gebaute, eigenständige Version.

Nach Änderungen an `src/studienplaner.html`: `./build.sh` ausführen.

## Datenmodell

| Sammlung | Felder |
|---|---|
| `modules` | name, code, semester, teacher, weight, color (0–7), archived |
| `tasks` | title, moduleId, kind, due (JJJJ-MM-TT), status (offen / laufend / erledigt), priority (hoch / normal / tief), subtasks [{t, done}], details |
| `grades` | title, moduleId, value (1–6), weight, date |
| `notes` | title, moduleId, date, body (Markdown-ähnlich), pinned, updatedAt |
| `lessons` | moduleId, weekday (1 = Montag), start, end, room |
| `sessions` | moduleId, date, minutes, start |
| `settings/main` | rounding ('0.1' / '0.5' / 'exakt'), pass, focusMin |

## Notenregeln

Voreingestellt: Modulnote = gewichteter Schnitt, auf Zehntel gerundet, genügend ab 4.0. Anpassbar unter Einstellungen, sobald das Reglement der Schule vorliegt.
