#!/usr/bin/env bats
setup() {
  EDITOR=$(which echo)
  # Set up a temporary $HOME directory
  HOME=$(mktemp -d)
  PROJECT_DIR=$HOME/test_project
  mkdir $PROJECT_DIR
  echo "test_project = $PROJECT_DIR" >> $HOME/.workon
  echo 'echo pwd $(pwd); exit' >> $PROJECT_DIR/.workon
}

teardown() {
  rm -rf $HOME
}

@test "workon can add a project" {
  NEW_PROJECT=$HOME/new_project
  mkdir $NEW_PROJECT

  run ./workon add new_project $NEW_PROJECT

  # Ensure our new project directory is referenced in the output
  [ "$status" -eq 0 ]
  [[ "$output" == *"new_project/.workon"* ]]

  # Ensure we added an entry to the .workon config
  grep new_project $HOME/.workon
}

@test "workon can list existing projects" {
  run ./workon list

  # Verify it lists the test project
  [ "$status" -eq 0 ]
  [[ "$output" == *"test_project"* ]]
}

@test "workon can edit an existing project" {
  skip "pending"
}

@test "workon warns if a project doesn't exist" {
  run ./workon missing_project
  [ "$status" -eq 0 ]
  [[ "$output" == *"Project missing_project is not defined."* ]]
}

@test "workon can run an existing project" {
  skip "pending"
  run ./workon test_project
  echo $output
  [ "$status" -eq 0 ]
  [[ "$output" == *"/test_project"* ]]
}

