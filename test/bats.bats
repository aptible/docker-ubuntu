#!/usr/bin/env bats

@test "It should have Bats installed" {
  which bats
}

@test "Bats should be v0.4.0" {
  bats -v | grep '0\.4\.0'
}
