#!/usr/bin/env bash
# List running EC2 instances (id, type, name tag) in a region.
# Mock helper — requires AWS CLI configured.
set -euo pipefail

REGION="${1:-us-east-1}"

aws ec2 describe-instances \
  --region "$REGION" \
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[].Instances[].[InstanceId,InstanceType,Tags[?Key=='Name']|[0].Value]" \
  --output table
