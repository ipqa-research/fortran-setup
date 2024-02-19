#!/bin/bash

setup_oneapi() {
    wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB \
    |   gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null

    echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" \
    | sudo tee /etc/apt/sources.list.d/oneAPI.list
}

setup_fortran_project(){
    echo "Setting up fortran_project script..."
    mkdir -p ~/.local/bin
    script="$(curl https://raw.githubusercontent.com/ipqa-research/fortran-setup/main/fortran_project)"
    echo "$script" > ~/.local/bin/fortran_project
    chmod +x ~/.local/bin/fortran_project
}

install_packages() {
    # Setup oneapi servers
    echo ""
    echo "Incluir intel oneAPI? [y/n] -> Puede demorar bastante"

    read input
    [ "$input" = "y" ] && setup_oneapi

    # Update apt repositories
    sudo apt update && sudo apt upgrade

    sudo apt install \
        python3-pip python3-venv pipx \
        gfortran \
        libblas-dev liblapack-dev \
        gdb \
        fzf

    # Install fortran language server, fprettify and flinter
    packages=( fortls findent flinter ford fpm )
    for package in ${packages[@]}; do
        pipx install $package --force
    done
}

echo "
Bootstrap de software necesario para correr códigos Fortran en Linux

Este script instalará:
- Las librerías matemáticas (LAPACK) para resolver sistemas lineales
- Compilador y debuggeador gfortran
- OPCIONAL: intel OneAPI HPC Toolkit (compiladores de intel, pesa como 10GB)
- Herramientas de desarollo:
    - pipx: gestor de programas Python
    - fortls: Para mostrar errores y syntaxis Fortran
    - findent: Para formatear código (ordenar indentaciones)
    - flinter: Para hacer análisis de código
    - fpm: Gestor de paquetes de código, para generar y correr proyectos
    - script generador de proyecto fortran `fortran_project`
"

setup_fortran_project

echo "
Desea continuar? [y/n]
"
read input

[ "$input" = "y" ] && install_packages
