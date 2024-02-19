# Fortran setup
Setup your system to use Fortran. For now, this script assumes that you're using
a Ubuntu-based system.

## How to run it?

just do

```bash
wget https://raw.githubusercontent.com/ipqa-research/fortran-setup/main/bootstrap_fortran.sh
bash bootstrap_fortran.sh
```

## What does it do exactly?

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
    - ford: To documentate your code.
    - fortls: To work with an editor.
    - fortran_project: Script to generate and open your projects.
