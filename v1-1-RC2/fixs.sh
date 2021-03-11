#!/bin/bash

echo Compilation started...
# Script is expected to start running in the folder where it is located (together with the source files)
SOURCE="$PWD"
# There is only one disclaimer and style docx file for all FIX Technical Standards and it is stored with the FIX Session Layer
# Repository has local copies with the specific names and dates of the standard
DISCLAIMER="FIXDisclaimerTechStd.md"
STYLE="FIX_TechStd_Style_MASTER.docx"
TARGET="$SOURCE/target"
YAML="$SOURCE/fixs.yaml"
FILES="fixs.md"
WPFOLDER="/wp-content/uploads/2021/03/"

# Create document version with disclaimer
pandoc "$DISCLAIMER" $FILES -o "$TARGET/docx/FIXS V1.1 RC1.docx" --reference-doc="$STYLE" --metadata-file="$YAML" --toc --toc-depth=4
echo FIXS document version created

# Create base online version without disclaimer
pandoc $FILES -o "$TARGET/debug/FIXSONLINE.html" --metadata-file="$YAML" -s --toc --toc-depth=2

# Create separate online versions for production and test website by including appropriate link prefixes
sed 's,img src="media/,img src="https://www.fixtrading.org'$WPFOLDER',g' "$TARGET/debug/FIXSONLINE.html" > "$TARGET/html/FIXSONLINE_PROD.html"
sed s/www.fixtrading.org/www.technical-fixprotocol.org/g "$TARGET/html/FIXSONLINE_PROD.html" > "$TARGET/html/FIXSONLINE_TEST.html"
echo FIXS ONLINE version created for PROD and TEST

echo Compilation ended!
