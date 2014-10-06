#!/usr/bin/env bats

@test "It should install a BASH version protected from CVE-2014-6271" {
  export X='() { f; }; echo RCE'
  run /bin/bash -c ""
  ! [[ "$output" =~ "RCE" ]]
}

@test "It should install a BASH version protected from CVE-2014-7169" {
  export X='() { (a)=>\'
  run /bin/bash -c "echo echo RCE"
  ! [[ $(cat echo) =~ "RCE" ]]
}
