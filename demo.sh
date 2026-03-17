#!/bin/bash

echo "=== NOVASHIELD Demo Start ==="

# -------------------------
# Step 1: Python (NovaShield Audit)
# -------------------------
echo "[PYTHON] Running NovaShield Audit..."
python3 - <<'END_PYTHON' || echo "[WARN] Python step failed, continuing demo..."
import subprocess
import sys
import time

# Inline fallback: install TextBlob if not present
try:
    from textblob import TextBlob
except ImportError:
    print("[WARN] TextBlob not found. Installing...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "textblob"])

# Import NovaShield audit (ensure file name matches repo)
import nova_agent

nova_agent.run_audit()  # Call the main audit function

END_PYTHON

# -------------------------
# Step 2: Java (Enterprise Logger)
# -------------------------
echo "[JAVA] Running Enterprise Logger..."
javac AWSCloudAudit.java && java AWSCloudAudit || echo "[WARN] Java step failed, continuing demo..."

# -------------------------
# Step 3: C++ (System Guardian)
# -------------------------
echo "[C++] Running System Guardian..."
g++ -o low_level_guardian low_level_guardian.cpp
./low_level_guardian || echo "[WARN] C++ step failed, continuing demo..."

echo "=== NOVASHIELD Demo Complete ==="
