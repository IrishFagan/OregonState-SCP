# Oregon State - SCP Script

This is a bash script that makes using SCP for OSU students inside your terminal a lot faster and simpler. The script is just a quick workaround for those who don't want to take the time to use an additional application to move files between their computer and any OSU server.

Enjoy! :)

## Commands

### `-h` - Help Menu

Bring up a menu that lists all of the commands

### `-s` - Set Source

Sets the following argument to the directory where the files will be retrieved from

### `-d` - Set Destination

Sets the following argument to the directory where the files listed in the source directory will be stored

### `-u` - Set User

The following argument sets the username that will be used to access the server

**NOTE:** This argument must either be specified or changed inside of the script.

### `-r` - Grab Multiple Files or Directories

Grabs each file and subdirectory listed within the directory provided in source

### `-o` - Optional Server

Sets the optional server to be accessed something different than the default

Default is currently `access`

## Notes

### `-s` and `-d` Functionality

When accessing a directory on an OSU server, the user must assume that a `~/` has already been placed in front of either the `-s` or `-d` command.
The shell already expands the `~` character on execution. Therefore, when the user inputs a `~` when trying to access a directory on a server, it won't be able to find it

Input: `directory/sub/desiredfile.txt`

Actual: `~/directory/sub/desiredfile.txt`