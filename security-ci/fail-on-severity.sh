#!/usr/bin/env bash
set -e

REPORT_JSON="$1"
if [ -z "$REPORT_JSON" ]; then
  echo "Usage: $0 <zap_report.json>"
  exit 2
fi

HIGH_COUNT=$(jq '.site[]?.alerts[]? | select(.risk == "High")' "$REPORT_JSON" | jq -s 'length')
CRITICAL_COUNT=$(jq '.site[]?.alerts[]? | select(.risk == "Critical")' "$REPORT_JSON" | jq -s 'length')

echo "High: $HIGH_COUNT, Critical: $CRITICAL_COUNT"

if [ "$HIGH_COUNT" -gt 0 ] || [ "$CRITICAL_COUNT" -gt 0 ]; then
  echo "Failing build: found High/Critical issues"
  exit 1
fi

echo "No High/Critical issues found"
exit 0