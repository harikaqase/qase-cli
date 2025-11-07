#!/usr/bin/env bash
PROJECT="${QASE_TESTOPS_PROJECT:-HRC}"
TOKEN="${QASE_TESTOPS_API_TOKEN:?required - export it before running}"

qasectl testops run create --project "$PROJECT" --token "$TOKEN" --title "CI run" --output qase.env
source qase.env
qasectl testops result upload --project "$PROJECT" --token "$TOKEN" --id "$QASE_TESTOPS_RUN_ID" --format junit --path "$1"
qasectl testops run complete --project "$PROJECT" --token "$TOKEN" --id "$QASE_TESTOPS_RUN_ID"
