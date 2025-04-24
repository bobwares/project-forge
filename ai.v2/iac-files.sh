#!/bin/bash
# iac-files.sh - Version 2.5
# Gathers all *.tf, *.sh, and Docker-related files from project root (..) excluding ./ai directory and certain boilerplate tf files.
# Outputs file paths relative to project root, prefixed with './'

set -e

# Move to the script's directory (assumes script is in project-root/ai)
cd "$(dirname "$0")" || exit 1

# Define paths
OUTPUT_DIR="./output"
OUTPUT_FILE="$OUTPUT_DIR/iac-report.md"
ROOT_DIR=".."

# Create output directory if missing
mkdir -p "$OUTPUT_DIR"

# Start markdown output
echo "# Infrastructure-as-Code (IaC) Report" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find files recursively, excluding ./ai directory and boilerplate Terraform files
find "$ROOT_DIR" \( -path "$ROOT_DIR/ai" -o -path "$ROOT_DIR/ai/*" \) -prune -o \
  -type f \( -name "*.tf" -o -name "*.sh" -o -iname "Dockerfile" -o -iname "docker-compose*.yml" \) \
  ! -name "main.tf" ! -name "outputs.tf" ! -name "variables.tf" \
  -print | sort | while IFS= read -r file; do

    RELATIVE_PATH="./${file#../}"

    echo "Processing: $RELATIVE_PATH"
    echo "## File: $RELATIVE_PATH" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Syntax highlighting
    case "$file" in
        *.tf)                         LANG="hcl" ;;
        *.sh)                         LANG="bash" ;;
        *[Dd]ockerfile)               LANG="docker" ;;
        *docker-compose*.yml|*.yaml) LANG="yaml" ;;
        *)                            LANG="" ;;
    esac

    echo "\`\`\`$LANG" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo "\`\`\`" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
done

echo "Compilation complete. Markdown file written to: $OUTPUT_FILE"
