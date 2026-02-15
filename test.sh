#!/usr/bin/env bash
source ./testlib.sh

test_deployref_tag() {
  grep -q "deployref" index.html 2>&1
}


test_deployref_tag && junit_testcase "find deployref on index.html" pass \
         || junit_testcase "deployref tag found on site" fail "deployref tag missing - site is not ready for launch"

cat <<EOF > "$JUNIT_REPORT"
<?xml version="1.0" encoding="UTF-8"?>
<testsuite name="bash-tests"
           tests="$tests"
           failures="$failures"
           errors="$errors">
$(echo -e "$testcases")
</testsuite>
EOF
