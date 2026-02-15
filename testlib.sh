#!/usr/bin/env bash

JUNIT_REPORT=${JUNIT_REPORT:-junit.xml}

tests=0
failures=0
errors=0
testcases=""

junit_testcase() {
  local name="$1"
  local status="$2"
  local message="${3:-}"

  ((tests++))

  case "$status" in
    pass)
      testcases+="  <testcase classname=\"bash\" name=\"$name\"/>\n"
      ;;
    fail)
      ((failures++))
      testcases+="  <testcase classname=\"bash\" name=\"$name\">
    <failure message=\"$message\"/>
  </testcase>\n"
      ;;
    error)
      ((errors++))
      testcases+="  <testcase classname=\"bash\" name=\"$name\">
    <error message=\"$message\"/>
  </testcase>\n"
      ;;
  esac
}
