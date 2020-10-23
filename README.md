<!-- Created 20/10/2020 -->

## Requirements
- `bash`
- `make`
- `csh`
- 32-bit version of glibc

**Tested with:**
- intel 64 bit CPU
- Linux (WSL2 with Debian and Ubuntu)
- EMERALDARCH set to i386linux

## Project setup

Extract and place your emerald project folder where you want to install it.

Copy the following to your `~/.bashrc` file.
```bash
EMERALDROOT=PATH/TO/emerald ; export EMERALDROOT
EMERALDARCH=i386linux ; export EMERALDARCH
PATH=$PATH:/$EMERALDROOT/bin/$EMERALDARCH:$EMERALDROOT/bin
```
- You may want to change the `EMERALDARCH` option to fit your setup. Legal options for `EMERALDARCH`  are equal to the directory names under `bin/` and `lib/`.


- If the `XCPFLAGS` in the `lib/$EMERALDARCH/macroMf`-file is not set you may need to set it to:
```bash
XCPFLAGS = -Di386linux -DDISTRIBUTED -DUSEDISTGC
```
Change the first flag according to your emeraldarch. We do not have a comprehensive list of legal options, but you can peek into other `macroMf`-files with similar arch and let yourself inspire. For both `i386linux` and `i386linuxmt` the flag is set to `-Di386linux`.

- NOTE: If you have previously installed a version of Emerald, make sure that your changes in `.bashrc` has taken effect ( does `type ec/emx` give a path to your new EMERALDROOT folder?).

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
