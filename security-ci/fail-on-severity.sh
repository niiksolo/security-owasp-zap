#!/usr/bin/env bash
set -euo pipefail

REPORT_JSON="$1"
if [ -z "${REPORT_JSON:-}" ]; then
  echo "Usage: $0 <zap_report.json>"
  exit 2
fi
if [ ! -f "$REPORT_JSON" ]; then
  echo "Report file not found: $REPORT_JSON"
  exit 2
fi

HIGH_COUNT=$(jq '[.site[]?.alerts[]? | select(.risk == "High")] | length' "$REPORT_JSON")
CRITICAL_COUNT=$(jq '[.site[]?.alerts[]? | select(.risk == "Critical")] | length' "$REPORT_JSON")

echo "High: $HIGH_COUNT, Critical: $CRITICAL_COUNT"

if [ "$HIGH_COUNT" -gt 0 ] || [ "$CRITICAL_COUNT" -gt 0 ]; then
  echo "Failing build: found High/Critical issues"
  exit 1
fi

echo "No High/Critical issues found"
exit 0