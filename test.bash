
ROOT_DIR = $(dirname "$(realpath "$0")")
SERVER_DIR = "$ROOT_DIR/server"
CLIENT_DIR = "$ROOT_DIR/client"

# server test

if [ ! -d "$SERVER_DIR" ]; then
    echo "Server directory [ $SERVER_DIR ] does not exist."
    exit 1
fi

if [ ! -d "$SERVER_DIR/.venv" ]; then

    echo "Creating Python virtual environment in [ $SERVER_DIR/.venv ]."
    python3 -m venv "$SERVER_DIR/.venv"

    REQUIREMENTS_FILE = "$SERVER_DIR/requirements.txt"
    echo "Installing Python dependencies from [ $REQUIREMENTS_FILE ].\n"
    cat "$REQUIREMENTS_FILE"
    echo 
    ./$ROOT_DIR/.venv/bin/pip install -r "$REQUIREMENTS_FILE"

fi

echo "Running Python tests in [ $SERVER_DIR/src/test/ ].\n"
./$ROOT_DIR/.venv/bin/python3 -m pytest ./server/src/test/

EXIT_CODE = $?

if [ $EXIT_CODE -ne 0 ]; then
    echo "Server tests failed with exit code [ $EXIT_CODE ].\n"
    exit $EXIT_CODE
else 
    echo "Server tests passed.\n"
fi

# client test

if [ ! -d "$CLIENT_DIR" ]; then
    echo "Client directory [ $CLIENT_DIR ] does not exist."
    exit 1
fi

cd "$CLIENT_DIR"

if [ ! -d "$script-location/client/node_modules" ]; then
    npm install
fi

echo "Running JavaScript tests in [ $CLIENT_DIR/src/test/ ].\n"
npm test

EXIT_CODE = $?

if [ $EXIT_CODE -ne 0 ]; then
    echo "Client tests failed with exit code [ $EXIT_CODE ].\n"
    exit $EXIT_CODE
else 
    echo "Client tests passed.\n"
fi

exit 0
