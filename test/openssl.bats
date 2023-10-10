#!/usr/bin/env bats

# http://www.ubuntu.com/usn/usn-2165-1/
# http://people.canonical.com/~ubuntu-security/cve/2014/CVE-2014-0160.html

@test "It should install an OpenSSL version protected from CVE-2014-0224" {
  if [ -z "$LIBSSL_MIN" ]; then
    skip "OS is greater than Focal Fossa"
  fi

  actual_version="$(dpkg-query --showformat='${Version}' --show openssl)"
  echo "Installed openssl: $actual_version"
  echo "Desired openssl:   $LIBC_MIN"
  dpkg --compare-versions "$actual_version" "ge" "$LIBSSL_MIN"
}

@test "It should install a libssl version protected from CVE-2014-0224" {
  if [ -z "$LIBSSL_MIN" ]; then
    skip "OS is greater than Focal Fossa"
  fi

  actual_version="$(dpkg-query --showformat='${Version}' --show libssl1.0.0)"
  echo "Installed libssl1.0.0: $actual_version"
  echo "Desired libssl1.0.0:   $LIBC_MIN"
  dpkg --compare-versions "$actual_version" "ge" "$LIBSSL_MIN"
}
