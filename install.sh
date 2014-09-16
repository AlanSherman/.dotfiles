#/bin/bash

required=(git vim zsh htop)

function downloadList() {
    varname=$1[@]
    list=${!varname}
    for f in $list
    do
        downloadPackage $f
    done
}

function printList() {
    varname=$1[@]
    list=${!varname}
    for f in $list
    do
        echo " - $f"
    done
}

function downloadPackage() {
    package=$1
    echo "Installing $package..."
    sudo apt-get install $package -y > /dev/null
}

function downloadDotfiles() {
    mkdir git
    cd git
    git clone https://github.com/AlanSherman/dotfiles.git
    cd ./dotfiles
    . ./setup.sh
    echo "Dotfile installation complete"
}

function wizard() {
    title=$1
    name=$2
    afterRequires=$3
    after=$4

    echo "$1 Packages: "
    printList $2
    printList $afterRequires
    read -p "Install the packages above for Alan Sherman's dotfiles? (Y/N) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        downloadList $2
        $after
    fi
}

function runPrompts() {
    wizard "Required" required
    downloadDotfiles
    echo "Done!"
}

runPrompts
