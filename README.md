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
