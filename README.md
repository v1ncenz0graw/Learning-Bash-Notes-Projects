# Recording Name and Date

## Table of Contents

- [Description](#Description)
- [Getting Started](#getting-started)

---
## Description
Sorting your scan results into categories of interest is often useful. For example, you could dump results for each IP address into a dedicated file or organize the results based on the versions of the software found.

Write a script that does the following:

- Runs Nmap against hosts in a file
- Uses bash to create individual files whose filenames are open ports
- In each file, writes the IP address on which the corresponding port was open

At the end, you should have a bunch of files, such as port-22.txt, port-80.txt, and port-8080.txt, and in each file, you should see one or more IP addresses at which that port was found to be open. This can be useful when you have a large number of target hosts and want to attack them in clusters by targeting specific protocols associated with given ports.

---

## Getting Started

1. Clone this branch:
```bash
git clone --branch ip-sorter https://github.com/v1ncenz0graw/Learning-Bash-Notes-Projects.git
```

2. move into directory and run the _main.sh_
```bash
chmod u+x main.sh
./main.sh <ip-list>

# Don't forget to change arguments with your own first and last name
```
