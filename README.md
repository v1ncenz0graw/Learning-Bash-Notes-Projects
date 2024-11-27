# Recording Name and Date

## Table of Contents

- [Description](#overview)
- [Getting Started](#getting-started)

---
## Description
Write a script that does the following:

1. Accepts two arguments on the command line and assigns them to variables. The first argument should be your first name, and the second should be your last name.
2. Creates a new file named _output.txt_
3. Writes the current date to _output.txt_ by using the _date_ command. (Bonus points if you can make the date command print the date in the DD-MM-YYYY format; use `#-> man date` to learn how this works.)
4. Writes your full name to _output.txt_
5. Makes a backup copy of _output.txt_, named _backup.txt_, using the _cp_ command. (Use _man cp_ if you aren’t sure of the command’s syntax.)
6. Prints the content of the _output.txt_ file to the standard output stream.
 
---

## Getting Started

1. Clone this branch:
```bash
git clone --branch recording-name-and-date https://github.com/v1ncenz0graw/Learning-Bash-Notes-Projects.git
```

2. move into directory and run the _main.sh_
```bash
chmod u+x main.sh
./main.sh <name> <surname>

# Don't forget to change arguments with your own first and last name
```
