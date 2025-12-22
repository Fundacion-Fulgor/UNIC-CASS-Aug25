import os
import yaml # Requires: pip install PyYAML
from pathlib import Path

# --- CONFIGURATION ---
ROOT_DIR = Path(".")
IGNORE_DIRS = {".github", ".git", "img", "slides", "scripts", "common"}
REPO_BASE_URL = "https://github.com/Fundacion-Fulgor/UNIC-CASS-Aug25"
SECTION_HEADER = "## Project Status"

def generate_table():
    print("Generating dashboard with absolute URLs...")
    header = "| Project | Domain | Authors | Tapeout Target | Description |\n|---|---|---|:---:|---|\n"
    rows = []

    for item in sorted(ROOT_DIR.iterdir()):
        if item.is_dir() and item.name not in IGNORE_DIRS:
            meta_path = item / "project.yml"

            # 1. Base Data
            folder_name = item.name
            # BEST PRACTICE: Absolute URL to the folder on main branch
            full_link = f"{REPO_BASE_URL}/tree/main/{folder_name}"

            # Defaults
            display_title = folder_name
            domain = "Unknown"
            authors = "TBD"
            tapeout = "❌"
            desc = "-"

            # 2. Parse Metadata
            if meta_path.exists():
                try:
                    with open(meta_path, "r") as f:
                        data = yaml.safe_load(f)

                        display_title = data.get('title', folder_name)
                        domain = data.get("type", "Unknown")

                        # Handle author list
                        auth_raw = data.get("authors", [])
                        if isinstance(auth_raw, list):
                            authors = ", ".join(auth_raw)
                        else:
                            authors = str(auth_raw)

                        tapeout = "✅" if data.get("tapeout_target") else "❌"
                        desc = data.get("description", "")
                except Exception as e:
                    print(f"Warning: Error parsing {meta_path}: {e}")

            # 3. Format Row
            project_cell = f"[{display_title}]({full_link})"
            rows.append(f"| {project_cell} | {domain} | {authors} | {tapeout} | {desc} |")

    return header + "\n".join(rows)

def update_readme(new_table):
    readme_path = ROOT_DIR / "README.md"

    if not readme_path.exists():
        print("README.md not found. Creating new one.")
        existing_content = "# UNIC-CASS Project Index\n\n"
    else:
        with open(readme_path, "r") as f:
            existing_content = f.read()

    # --- SAFE UPDATE LOGIC ---
    # We find the header. We keep everything BEFORE it. We discard everything AFTER it.
    if SECTION_HEADER in existing_content:
        # Split once, take the first part (the intro text)
        clean_content = existing_content.split(SECTION_HEADER)[0].rstrip()
    else:
        # Header not found, keep the whole file
        clean_content = existing_content.rstrip()

    # Reconstruct: Intro + Header + New Table
    final_content = f"{clean_content}\n\n{SECTION_HEADER}\n{new_table}"

    with open(readme_path, "w") as f:
        f.write(final_content)
    print("SUCCESS: README.md updated.")

if __name__ == "__main__":
    table = generate_table()
    update_readme(table)
