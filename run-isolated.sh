#!/bin/bash

. settings.sh

if [ ! -d "$FLATFISH_PATH" ]; then
    mkdir -p "$FLATFISH_PATH"

    if [ ! -d "$FLATFISH_PATH" ]; then
        echo "Could not create Flatfish's home"
        exit 1
    fi
fi

if [ ! -d "$FLATFISH_PATH/.ssh" ]; then
    if [ ! -d "$HOME/.ssh" ]; then
        printf "Please, setup ssh keys before running the container\n"

        exit 1
    fi
    cp -R "$HOME/.ssh" "$FLATFISH_PATH/"
fi

if [ ! -f "$FLATFISH_PATH/.gitconfig" ]; then
    if [ ! -f "$HOME/.gitconfig" ]; then
        printf "Please, setup git before running the container\n\n"
        printf "Use: \n"
        printf "git config --global user.name \"John Doe\"\n"
        printf "git config --global user.email johndoe@example.com\n"

        exit 1
    fi
    cp "$HOME/.gitconfig" "$FLATFISH_PATH/"
fi

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -it \
        --rm \
        --net host \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume=$FLATFISH_PATH:$HOME:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        --env="TERM" \
        --user="$USER" \
        --workdir="$HOME" \
        --name flatfish \
        flatfish:isolated \
        /bin/bash
