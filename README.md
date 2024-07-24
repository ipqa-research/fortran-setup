# Fortran setup
Setup your system to use Fortran. For now, this script assumes that you're using
a Ubuntu-based system.

## How to run it?

Just run:

```bash
wget https://raw.githubusercontent.com/ipqa-research/fortran-setup/main/bootstrap_fortran.sh
bash bootstrap_fortran.sh
```

On your terminal.


## What does it do?

Installs:

- Python package manager for some python-based tools.
- GNU Fortran compiler
- [optional]: intel oneAPI HPC
- BLAS and LAPACK libraries (for linear algebra operations)
- Gnu debugger
- Fuzzy Finder
- Fortran tools:
    - fpm: To manage your project.
    - findent: To make your code look decent.
    - flinter: To analyze your project.
    - ford: To document your code.
    - fortls: To work with an editor.
    - fortran_project: Script to generate and open your projects.

# The `fortran_project` script
The main script installs the `fortran_project` command in your `~/.local/bin`
directory, making it available to run at any place in the terminal.

`fortran_project` is a command that eases your projects organization. It has
three fundamental uses:

- `fortran_project new <project_name>`
> Create a new project.
> The default folder will be at ~/codes, but it can be set up with
> the environment variable FORTRAN_PROJECTS.
> If the directory doesn't exist, it will be created.

- `fortran_project list`
> List all the existing Fortran projects.

- `fortran_project work`
> Open vscode on the selected project directory.

- `fortran_project update`
> Update `fortran_project`

### Install only `fortran_project`
If you only want to install the `fortran_project` script run:
```bash
script="$(curl https://raw.githubusercontent.com/ipqa-research/fortran-setup/main/fortran_project)"
echo "$script" > ~/.local/bin/fortran_project
chmod +x ~/.local/bin/fortran_project
```

### Working with our legacy (old) codes
Sometimes our old codes are not compatible with the more modern setup. When this happens to run them it is needed
to do a couple of things:

- Setup a Makefile (called `Makefile`) that handles compilation.
  It **must** be called `Makefile` and be included in the project's root directory. You can create the empty Makefile and 
  write `makeleg` and later press tab to autofill the file with a template.
- Install the intel Fortran compiler (which can be done with the script provided in this repo)
- Have installed the "Environment Configurator for Intel Software Developer Tools" vscode extension.
  Which should be installed if you installed the recommendations on one of our Fortran projects (https://github.com/ipqa-research/vscode-fortran)

```make
#Makefile file
FC=ifort -g -extend-source

# Dependencies includes the list of files that should be used
# (excluding the main program file).
dependencies:
	mkdir -p obj
	$(FC) -c src/asa057.f90
	$(FC) -c src/praxis.f
	$(FC) -c src/Pure.for
	$(FC) -c src/RKPR.for
	$(FC) -c src/SRK_PR.for
	mv *.o obj/

clean:
	rm obj/*

all: dependencies
	# Here OptimCMRKP2011.for would be the program file
	$(FC) -o executable.exe ./app/OptimCMRKP2011.for obj/* -qmkl
```

