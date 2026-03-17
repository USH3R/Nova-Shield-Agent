#!/bin/bash

echo "=== NOVASHIELD GOV-CLOUD AUDIT START ==="

# -------------------------
# Step 1: Python (NovaShield Agent)
# -------------------------
echo "[PYTHON] Running NovaShield Audit..."
python3 - <<'END_PYTHON' || echo "[WARN] Python step failed, continuing demo..."
import random
import json
import os
import time

# Simulated resources and checks
resources = ["production-data-storage", "user-db", "logs-bucket"]
checks = ["AES-256 Encryption", "Public Access Enabled", "Versioning Enabled", "MFA Delete Enabled"]

violations = []
for r in resources:
    violated = random.choice(checks)
    violations.append(f"- NON_COMPLIANT: {r} missing {violated}" if random.random() > 0.5 else f"- COMPLIANT: {r} passes all checks")

# Print simulated output
print("[*] Auditing AWS Config against NIST 800-171...")
for v in violations:
    print(v)

# Generate audit report JSON
os.makedirs("reports", exist_ok=True)
with open("reports/audit_report.json", "w") as f:
    json.dump({"violations": violations}, f, indent=4)

print("[+] Audit script executed successfully.")
print("[+] Audit Report Generated: reports/audit_report.json")
print("[+] Remediation Plan: Apply KMS Key & Restrict Public Access (see reports/README.md for details)")
time.sleep(1)
END_PYTHON

# -------------------------
# Step 2: Java (aws_cloud_audit)
# -------------------------
echo "[JAVA] Running Enterprise Logger..."
javac aws_cloud_audit.java && java aws_cloud_audit || echo "[WARN] Java step failed, continuing demo..."

# -------------------------
# Step 3: C++ (low_level_guardian)
# -------------------------
echo "[C++] Running System Guardian..."
g++ -o low_level_guardian low_level_guardian.cpp
./low_level_guardian || echo "[WARN] C++ step failed, continuing demo..."

echo "=== NOVASHIELD AUDIT COMPLETE ==="
