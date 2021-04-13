<!-- Created 20/10/2020 -->

## Requirements
- `bash`
- `make`
- `csh`
- 32-bit version of glibc

**Tested with:**
- intel 64 bit and ARMv7l (32 bit) CPU
- Linux: Debian, Raspbian and WSL2 with Debian and Ubuntu
- EMERALDARCH set to i386linux (for 32 bit) and x86_64linux (for 64 bit)

## Project setup

Extract and place your emerald project folder where you want to install it.

Copy the following to your `~/.bashrc` file.
```bash
EMERALDROOT=PATH/TO/emerald ; export EMERALDROOT
EMERALDARCH=[YOUR ARCH] ; export EMERALDARCH
PATH=$PATH:/$EMERALDROOT/bin/$EMERALDARCH:$EMERALDROOT/bin
```
- Valid options for `EMERALDARCH`  are equal to the directory names under `bin/` and `lib/`.

- NOTE: If you have previously installed a version of Emerald, make sure that your changes in `.bashrc` has taken effect ( does `type ec/emx` give a path to your new EMERALDROOT folder?).

## Building the project
- In the Emerald root directory run `make build`. This will compile the Emerald vm and an experimental version of the compiler. Additionally this copy of Emerald features a stable version of the compiler.
- `emx`: run the Emerald vm
- `ec`: run a stable compiler
- `xemc`: run an experimental compiler

To compile single parts of Emerald alone, look at the instructions below.  

## Setup links
- Navigate to `vm/` and and create a new directory with the same name as `$EMERALDARCH`. Navigate to this new directory.
- Copy the makefile from `vm/src` into the new dir and create the links:
```bash
cp ../src/Makefile . ;  emmake links
```

## ccalls
- Navigate to `ccalls/` and compile the library:
```bash
emmake install
```

## Compiling the runtime system
- Navigate to vm/$EMERALDARCH and run `emmake`

## Compiling a new compiler
- Navigate to EC and run `newcompiler`. This will run the following commands:
    - `emmake fffs`     - Compile compiler without builtins.
    - `newversion`      - creates CP_qXX
    - `useversion`      - sets the symlink execCP to point to that version
    - `emmake bestCP`   - builds a version that understands the builtin types, called bestCP
    - `useversion best` - sets the symlink execCP to point to the bestCP version

- To run your new compiler use `xemc`

If it is desired to replace the stable compiler with the experimental, carefully run `make install` in the `EC` directory.  
