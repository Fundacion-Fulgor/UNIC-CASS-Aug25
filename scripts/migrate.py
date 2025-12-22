import re
import os
import yaml
import subprocess
from pathlib import Path

# Config
REPO_URL = "https://github.com/Fundacion-Fulgor/UNIC-CASS-Aug25"
README_FILE = "README.md"

def parse_readme():
    with open(README_FILE, "r") as f:
        content = f.read()

    # Regex to find Project blocks: # [Title](Link) ... content ...
    # Stops at the next line starting with # [ or end of file
    pattern = r"# \[(.*?)\]\((.*?)\)([\s\S]*?)(?=\n# \[|$)"
    matches = re.findall(pattern, content)

    projects = []
    for title, link, body in matches:
        # Extract Folder Name from link (e.g., .../tree/main/GRO-TDC -> GRO-TDC)
        folder = link.split("/")[-1]
        if not folder or folder == "main": # Handle empty links like ()
             # Fallback: Create a folder slug from the title
             folder = title.replace(" ", "_").replace("-", "_")

        # Extract Metadata
        status_match = re.search(r"- Status: (.*)", body)
        type_match = re.search(r"- Design Type: (.*)", body)
        designers_match = re.search(r"- Designers:([\s\S]*?)(?=\n-|$)", body)

        status = status_match.group(1).strip() if status_match else "Proposed"
        design_type = type_match.group(1).strip() if type_match else "Unknown"

        # Clean up designers list
        authors_raw = designers_match.group(1).strip() if designers_match else "TBD"
        # Remove newlines and extra spaces
        authors_clean = " ".join(authors_raw.split())

        projects.append({
            "title": title,
            "folder": folder,
            "status": status,
            "type": design_type,
            "authors": authors_clean,
            "link": link
        })
    return projects
# ... (imports remain the same) ...

def clean_authors(author_str):
    # Remove (graduates), (undergraduates) and extra whitespace
    cleaned = re.sub(r'\s*\(.*?\)', '', author_str)
    # Replace semicolons/newlines with commas
    cleaned = cleaned.replace(';', ',').replace('\n', ',')
    # Split and strip
    return [name.strip() for name in cleaned.split(',') if name.strip()]

def create_project_yml(proj):
    folder_path = Path(proj["folder"])
    folder_path.mkdir(exist_ok=True)

    yml_path = folder_path / "project.yml"

    # Use the new cleaner
    author_list = clean_authors(proj["authors"])

    is_accepted = "✅" in proj["status"] or "Accepted" in proj["status"]

    data = {
        "title": proj["title"],
        "authors": author_list,
        "type": proj["type"],
        "tapeout_target": is_accepted,
        "status_text": proj["status"]
    }

    with open(yml_path, "w") as f:
        yaml.dump(data, f, sort_keys=False, allow_unicode=True)
    print(f"✅ Created {yml_path}")

def create_github_issue(proj):
    # Define labels
    labels = ["proposal"]
    if "Analog" in proj["type"]: labels.append("analog")
    if "Digital" in proj["type"]: labels.append("digital")
    if "Accepted" in proj["status"] or "✅" in proj["status"]: labels.append("accepted")

    label_str = ",".join(labels)

    # Improved Body
    author_list = clean_authors(proj["authors"])
    author_display = ", ".join(author_list)

    body = f"""
### Project Details
**Domain:** {proj['type']}
**Authors:** {author_display}
**Current Status:** {proj['status']}

📂 **Source Code:** [{proj['folder']}]({REPO_URL}/tree/main/{proj['folder']})

---
### Tapeout Checklist
- [ ] Specs Defined
- [ ] Schematic/RTL Complete
- [ ] Simulation Verified
- [ ] LVS Clean
- [ ] DRC Clean
- [ ] GDS Submitted
    """

    cmd = [
        "gh", "issue", "create",
        "--title", f"[Track] {proj['title']}",
        "--body", body,
        "--label", label_str
    ]

    print(f"🚀 Creating issue for {proj['title']}...")
    # We add check=False so if one fails, the script doesn't crash entirely
    subprocess.run(cmd, check=False)

# ... (main block remains the same) ...

if __name__ == "__main__":
    projects = parse_readme()
    print(f"Found {len(projects)} projects in README.")

    for p in projects:
        create_project_yml(p)
        create_github_issue(p)
