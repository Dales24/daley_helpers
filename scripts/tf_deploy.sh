#!/usr/bin/env bash
# Terraform deploy pipeline: fmt-check -> init -> validate -> plan -> apply.
# Mock helper. usage: ./tf_deploy.sh [tf_dir] [--auto-approve]
set -euo pipefail

TF_DIR="${1:-terraform}"
APPROVE="${2:-}"
PLAN_FILE="tfplan.out"

command -v terraform >/dev/null 2>&1 || { echo "terraform not installed" >&2; exit 1; }
[[ -d "$TF_DIR" ]] || { echo "no such dir: $TF_DIR" >&2; exit 1; }

cd "$TF_DIR"

echo "==> fmt (check)"
terraform fmt -check -recursive

echo "==> init"
terraform init -input=false

echo "==> validate"
terraform validate

echo "==> plan"
# -detailed-exitcode: 0 = no changes, 2 = changes, 1 = error
set +e
terraform plan -input=false -out="$PLAN_FILE" -detailed-exitcode
code=$?
set -e
if [[ $code -eq 0 ]]; then
  echo "No changes. Nothing to deploy."
  exit 0
elif [[ $code -ne 2 ]]; then
  echo "plan failed" >&2
  exit 1
fi

echo "==> apply"
if [[ "$APPROVE" == "--auto-approve" ]]; then
  terraform apply -input=false "$PLAN_FILE"
else
  read -r -p "Apply this plan? [y/N] " reply
  [[ "$reply" == "y" || "$reply" == "Y" ]] && terraform apply -input=false "$PLAN_FILE" || echo "aborted."
fi
