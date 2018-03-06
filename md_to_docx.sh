#!/bin/bash

REFERENCE_DOC_OPT=""
OUTPUT_FILE="output/technical_specification_of_vdes-pandoc.docx"

while getopts ":t:" opt; do
  case $opt in
    t)
      case $OPTARG in
	pandoc)
	  echo "Using the standard pandoc template."
	  ;;
	iala)
	  echo "Using the IALA Guideline template."
          REFERENCE_DOC_OPT="--reference-doc templates/iala_template.docx"
          OUTPUT_FILE="output/technical_specification_of_vdes-iala.docx"
	  ;;
	*)
          echo "Invalid argument: $OPTARG" >&2
          exit 1
          ;;
      esac
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

pandoc -s --filter pandoc-tablenos --filter pandoc-fignos $REFERENCE_DOC_OPT introduction.md operational_characteristics.md vdes_channel_usage.md identification.md presentation_interface_protocol.md technical_characteristics.md -o $OUTPUT_FILE

