#!/bin/bash
pandoc -s --filter pandoc-tablenos --filter pandoc-fignos introduction.md operational_characteristics.md vdes_channel_usage.md identification.md presentation_interface_protocol.md technical_characteristics.md -o output/technical_specification_of_vdes.docx

