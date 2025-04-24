#!/bin/bash
# source-code.sh - Version 2.3

set -e

OUTPUT_DIR="./output"
SOURCE_OUTPUT_FILE="$OUTPUT_DIR/source-code.md"
ROOT_DIR=".."

mkdir -p "$OUTPUT_DIR"

echo "# Source Code" > "$SOURCE_OUTPUT_FILE"
echo "" >> "$SOURCE_OUTPUT_FILE"

find "$ROOT_DIR" \
  -type f \( \
    -iname "*.ts" -o -iname "*.tsx" -o -iname "*.js" -o -iname "*.py" -o -iname "*.java" \
  \) \
  ! -iname "*test.java" \
  ! -path "$ROOT_DIR/ai/*" \
  | sort | while read -r file; do

    RELATIVE_PATH="./${file#../}"
    EXT="${file##*.}"

    case "$EXT" in
      py)    LANG="python" ;;
      js)    LANG="javascript" ;;
      ts|tsx) LANG="typescript" ;;
      java)  LANG="java" ;;
      *)     LANG="text" ;;
    esac

    echo "Processing: $RELATIVE_PATH"
    echo "## File: $RELATIVE_PATH" >> "$SOURCE_OUTPUT_FILE"
    echo "\`\`\`$LANG" >> "$SOURCE_OUTPUT_FILE"
    cat "$file" >> "$SOURCE_OUTPUT_FILE"
    echo "\`\`\`" >> "$SOURCE_OUTPUT_FILE"
    echo "" >> "$SOURCE_OUTPUT_FILE"
done
