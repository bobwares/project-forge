#!/bin/bash
# config-file.sh - Version 2.1
# A script to gather all config files in the project into a markdown file.
# Outputs to ./output/config-files.md and searches recursively from project root (..).

set -e

# Define the output file
OUTPUT_DIR="./output"
OUTPUT_FILE="$OUTPUT_DIR/config-files.md"
ROOT_DIR=".."

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create or clear the markdown file
echo "# Configuration Files Compilation" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# List of configuration files to include
CONFIG_FILES=(
  ".eslintrc.js"
  ".gitignore"
  ".prettierrc"
  "nest-cli.json"
  "package.json"
  "tsconfig.build.json"
  "tsconfig.json"
  "jest.config.ts"
  ".env"
  "serverless.yml"
  "Dockerfile"
  # Java-related config files
  "pom.xml"
  "application.properties"
  "application.yml"
  "maven-wrapper.properties"
  "build.gradle"
  "settings.gradle"
)

# Track found files
FOUND_FILES=()

# Process each config file
for file in "${CONFIG_FILES[@]}"; do
    MATCHED_PATH=$(find "$ROOT_DIR" -type f -name "$file" 2>/dev/null | head -n 1)

    if [ -n "$MATCHED_PATH" ]; then
        FOUND_FILES+=("$MATCHED_PATH")
        RELATIVE_PATH="${MATCHED_PATH#../}"

        # Write markdown section
        echo "## File: $RELATIVE_PATH" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"

        # Determine language for syntax highlighting
        case "$file" in
            *.json)         LANG="json" ;;
            *.ts)           LANG="typescript" ;;
            *.js)           LANG="javascript" ;;
            *.yml|*.yaml)   LANG="yaml" ;;
            *.env)          LANG="dotenv" ;;
            Dockerfile)     LANG="docker" ;;
            *.xml)          LANG="xml" ;;
            *.properties)   LANG="ini" ;;
            *.gradle)       LANG="groovy" ;;
            *)              LANG="bash" ;;
        esac

        echo "\`\`\`$LANG" >> "$OUTPUT_FILE"
        cat "$MATCHED_PATH" >> "$OUTPUT_FILE"
        echo "\`\`\`" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
done

# Output found files
echo ""
echo "Files included in config-files.md:"
printf "%s\n" "${FOUND_FILES[@]}"

echo ""
echo "Compilation complete. Markdown file written to: $OUTPUT_FILE"
