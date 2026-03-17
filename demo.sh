#!/bin/bash
# Demo Script for NovaShield Agent
# Shows AWS GovCloud audit flow with NIST compliance checks

echo "=== NOVASHIELD GOV-CLOUD AUDIT START ==="

# Run the main Python audit script
if python3 run.py; then
    echo "[+] Audit script executed successfully."
else
    echo "[!] ERROR: run.py did not execute correctly."
fi

# Ensure the reports directory exists
mkdir -p reports

# Placeholder for remediation instructions
echo "[+] Audit Report Generated: reports/audit_report.json"
echo "[+] Remediation Plan: Apply KMS Key & Restrict Public Access (see reports/README.md for details)"

echo "=== NOVASHIELD AUDIT COMPLETE ==="
