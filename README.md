# Ping

## Table of Contents

- [Description](#overview)
- [Getting Started](#getting-started)

---
## Description
In this exercise, you’ll write a bash script that accepts two arguments: a name (for example, mysite) and a target domain (for example, nostarch​.com). The script should be able to do the following:

1. Throw an error if the arguments are missing and exit using the right exit code.
    
2. Ping the domain and return an indication of whether the ping was successful. (To learn about the ping command, run `man ping`)
    
3. Write the results to a CSV file containing the following information: 
 
	 a. The name provided to the script 
	 b. The target domain provided to the script 
	 c. The ping result (either success or failure) 
	 d. The current date and time
---

## Getting Started

1. Clone this branch:
```bash
git clone --branch Ping https://github.com/void-inject/Learning-Bash-Notes-Projects.git
```

2. move into directory and run the _main.sh_
```bash
chmod u+x main.sh
./main.sh <name> <domain>

# Don't forget to change arguments
```
