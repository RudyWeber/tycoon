set -e
mkdir -p ./build/

hotReload=0
run=0

for arg in "$@"; do
    if [[ "$arg" = "--hot-reload" ]]; then
        hotReload=1
    fi

    if [[ "$arg" = "--run" ]]; then
        run=1
    fi
done

echo "=================================";
if [ $hotReload == 1 ]; then
    ./build-game-mac.sh
fi

echo "Building main..."
gcc ./src/main-mac.cpp -o ./build/main \
    -Wall \
    -g \
    -I ./include/mac/** \
    -L ./lib/mac/** \
    -l SDL2 -l SDL2_image \
    -D HOT_RELOAD=$hotReload
echo "=================================";

if [ $run == 1 ]; then
    ./build/main
fi