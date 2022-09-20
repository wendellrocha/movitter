if [[ -z "$1" ]]; then
    echo "${RED}Error: No argument supplied.${END}"
    return 1;
else
    set -a; source "$1"; set +a
    melos run test
fi