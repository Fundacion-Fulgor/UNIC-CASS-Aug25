import os
import yaml
import re
from pathlib import Path

# --- CONFIGURATION ---
ROOT_DIR = Path(".")
ORG_BASE_URL = "https://github.com/Fundacion-Fulgor"
SECTION_HEADER = "## Project Status"

def get_submodules():
    """
    Parses .gitmodules to find the list of official submodule paths.
    Returns a set of strings, e.g., {'DelayLine', 'GRO-TDC'}
    """
    submodules = set()
    gitmodules_path = ROOT_DIR / ".gitmodules"
    
    if not gitmodules_path.exists():
        return submodules

    # Simple regex to find 'path = FolderName'
    # We use regex/text parsing to avoid depending on the 'git' command line tool
    with open(gitmodules_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line.startswith("path"):
                # Extracts "DelayLine" from "path = DelayLine"
                parts = line.split("=")
                if len(parts) == 2:
                    submodules.add(parts[1].strip())
    return submodules

def generate_table():
    print("Generating dashboard...")
    header = "| Project | Domain | Authors | Tapeout Target | Description |\n|---|---|---|:---:|---|\n"
    rows = []
    
    # 1. Get the list of known submodules
    known_submodules = get_submodules()
    
    # 2. Iterate over ALL directories
    for item in sorted(ROOT_DIR.iterdir()):
        if not item.is_dir():
            continue
            
        folder_name = item.name
        meta_path = item / "project.yml"
        
        # --- THE FILTER LOGIC ---
        is_submodule = folder_name in known_submodules
        has_metadata = meta_path.exists()
        
        # We only process this folder if it is a Submodule OR has a project.yml
        if not (is_submodule or has_metadata):
            # This skips 'img', 'scripts', 'slides', '.git', etc.
            continue
            
        # --- DATA EXTRACTION ---
        
        # Link Logic:
        # If it's a submodule, link to the Repo.
        # If it's just a folder (legacy), link to the Tree.
        if is_submodule:
            full_link = f"{ORG_BASE_URL}/{folder_name}"
        else:
            full_link = f"{ORG_BASE_URL}/UNIC-CASS-Aug25/tree/main/{folder_name}"

        # Default Data
        display_title = folder_name
        domain = "Unknown"
        authors = "TBD"
        tapeout = "❌"
        desc = " "

        # Try to load metadata
        if has_metadata:
            try:
                with open(meta_path, "r") as f:
                    data = yaml.safe_load(f)
                    display_title = data.get('title', folder_name)
                    domain = data.get("type", "Unknown")
                    auth_raw = data.get("authors", [])
                    if isinstance(auth_raw, list):
                        authors = ", ".join(auth_raw)
                    else:
                        authors = str(auth_raw)
                    tapeout = "✅" if data.get("tapeout_target") else "❌"
                    desc = data.get("description", " ")
            except Exception as e:
                print(f"Warning: Error parsing {meta_path}: {e}")
        else:
            # It is a submodule but has no project.yml yet
            print(f"Note: Submodule '{folder_name}' has no project.yml (yet).")

        # Format Row
        project_cell = f"[{display_title}]({full_link})"
        rows.append(f"| {project_cell} | {domain} | {authors} | {tapeout} | {desc} |")

    return header + "\n".join(rows)

def update_readme(new_table):
    readme_path = ROOT_DIR / "README.md"

    if not readme_path.exists():
        existing_content = "# UNIC-CASS Project Index\n\n"
    else:
        with open(readme_path, "r") as f:
            existing_content = f.read()

    if SECTION_HEADER in existing_content:
        clean_content = existing_content.split(SECTION_HEADER)[0].rstrip()
    else:
        clean_content = existing_content.rstrip()

    final_content = f"{clean_content}\n\n{SECTION_HEADER}\n{new_table}"

    with open(readme_path, "w") as f:
        f.write(final_content)
    print("SUCCESS: README.md updated.")

if __name__ == "__main__":
    table = generate_table()
    update_readme(table)
