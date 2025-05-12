# ManageFiles

Implementierung für Gruppenarbeit in Klasse FI-23

<br><br>

# Requirements

<br>

### Problem

Dateien werden unstrukturiert in verschiedenen Verzeichnissen abgelegt.

### Auftrag 

Erstellen Anwendung die es ermöglicht Lernmaterialien systematisch zu speichern, gezielt zu durchsuchen, zu kommentieren und revisionssicher abzulegen.

- Dateien bis 1 MB: Direkt in der Datenbank speichern
- Dateien über 1 MB: Zu einem definierten Speicherort speichern

### Unterstützte Dateiformate:
- PDF
- DOCX
- JPEG
- Python-Dateien

<br><br>

# Dependencies

<br>

### Techstack

- Python3 @3.13
- FastAPI @0.115.25
- Uvicorn @0.34.2
- ReactJS @19.1
- TailwindCSS @3.4.17
- Typescript @4.9.5

### Zusätzliche Libraries

- PyTest @8.3.5

# Setup

    cd client && npm install && cd ../server && python3 -m venv ./.venv && ./.venv/bin/pip install -r requirements.txt
