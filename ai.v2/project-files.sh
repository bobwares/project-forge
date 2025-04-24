#!/bin/bash
#
# Combined Project Compilation Script
# @application Project Documentation Builder
# @source ./combine-project-docs.sh
# @author bobwares codebot
# @version 1.1
# @description Executes multiple content-generating scripts, collects their outputs, and appends additional project metadata from the about directory into a single markdown file.
# @exports
# - output/project.md
# @updated 2025-04-02

# Paths to scripts
CONFIG_SCRIPT="./config-files.sh"
SOURCE_SCRIPT="./source-code.sh"
IAC_SCRIPT="./iac-files.sh"

# Execute the scripts
bash "$CONFIG_SCRIPT"
bash "$SOURCE_SCRIPT"
bash "$IAC_SCRIPT"

# Create or clear the combined markdown file
COMBINED_FILE="output/project.md"
echo "# Project Documentation" > "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"

# Append about/project.md
if [ -f "./about/project-about.md" ]; then
    echo "" >> "$COMBINED_FILE"
    echo "## About This Project" >> "$COMBINED_FILE"
    echo "" >> "$COMBINED_FILE"
    cat ./about/project-about.md >> "$COMBINED_FILE"
else
    echo "Warning: about/project-about.md not found."
fi

# Append about/tech-stack.md
if [ -f "./about/tech-stack.md" ]; then
    echo "" >> "$COMBINED_FILE"
    echo "## Technology Stack" >> "$COMBINED_FILE"
    echo "" >> "$COMBINED_FILE"
    cat ./about/tech-stack.md >> "$COMBINED_FILE"
else
    echo "Warning: about/tech-stack.md not found."
fi


# Append config-files.md
if [ -f "output/config-files.md" ]; then
    cat output/config-files.md >> "$COMBINED_FILE"
else
    echo "Warning: config-files.md not found." >&2
fi

# Append source-code.md
if [ -f "output/source-code.md" ]; then
    cat output/source-code.md >> "$COMBINED_FILE"
else
    echo "Warning: source-code.md not found."
fi

# Append unit-test-files.md
if [ -f "output/unit-test-files.md" ]; then
    cat output/unit-test-files.md >> "$COMBINED_FILE"
else
    echo "Warning: unit-test-files.md not found."
fi

# Append iac-report.md
if [ -f "output/iac-report.md" ]; then
    cat ./output/iac-report.md >> "$COMBINED_FILE"
else
    echo "Warning: iac-report.md not found."
fi



# Notify completion
echo "Combined project compilation complete. See $COMBINED_FILE."
