
script_location=$(dirname "$(realpath "$0")")

if [ ! -d "$script_location/.venv" ]; then
    python3 -m venv "$script_location/.venv"
fi

./$script_location/.venv/bin/pip install -r "$script_location/server/requirements.txt"

./$script_location/.venv/bin/python3 -m pytest --maxfail=1 ./server/src/test/
