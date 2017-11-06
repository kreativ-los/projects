#!/bin/zsh

NOSTYLE="\e[0m"
GREEN="\e[32m"
RED="\e[31m"
BOLD="\e[1m"

BASHSRC="${HOME}/project-manager"
PROJECTS_DIR="${BASHSRC}/projects"

function printSuccess {
  echo -e "${GREEN}${1}${NOSTYLE}"
}

function printError {
  echo -e "${RED}${1}${NOSTYLE}"
  exit
}

function add {
  if [ $1 ]; then
    projName=$1
  else
    echo -n "Please enter project name: "
    read projName
  fi

  projPath="$(pwd)"
  projScript="${PROJECTS_DIR}/${projName}.sh"

  while true; do
    echo -n "Do you want to open with atom? [Y/n]: "
    read yn
      case $yn in
          [Yy]* ) atom=true; break;;
          [Nn]* ) atom=false; break;;
          "" ) atom=true; break;;
          * ) echo "Please answer with y or n.";;
      esac
  done

  echo -n "Do you want to add additional commands?: "
  read additionalCommands

  if [ -f $projScript ]; then
    printError "Project already added!"
  fi

  if echo "#!/bin/zsh\ncd ${projPath}" > $projScript; then
    chmod +x $projScript

    if $atom; then
      echo "atom .\n" >> ${projScript}
    fi

    echo "${additionalCommands}\n" >> ${projScript}

    printSuccess  "${projName} was added!"
  else
    printError "Couldn't add project."
  fi
}

function run {
  . $PROJECTS_DIR/$1.sh
}

function list {
  for file in "$PROJECTS_DIR"/*
  do
    fileName=$(basename "$file")
    echo ${fileName%.*}
  done
}

case $1 in
  add)
    add $2
    ;;
  list)
    list
    ;;
  *)
    run $1
    ;;
esac
