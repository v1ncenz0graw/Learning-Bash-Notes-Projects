# Alerts

## Table of Contents

- [Description](#Description)
- [Getting Started](#getting-started)
- [Gmail Alerts](#gmail-alerts)

---
## Description

Imagine that you want to be notified whenever a new host appears on the network. For example, maybe you want to know when new laptops or IT assets have connected. This could be useful if you’re testing a target in a different time zone, where device users might not be online when you are

---

## Getting Started

1. Clone this branch:
```bash
git clone --branch Alerts https://github.com/v1ncenz0graw/Learning-Bash-Notes-Projects.git
```

2. move into directory and run the _main.sh_
```bash
chmod u+x *.sh
```

## Gmail Alerts

* Check if Postfix mail transfer agent exists on your Kali
```bash
postfix
```
(if agent doesn't exist download it)

* After Successfully installing Agent, configure it to send mail properly. 
	Checkout Postfix official [doc](https://www.postfix.org/documentation.html)

* change Sender and Recipient emails in script

* Run:
```bash
./gmail.sh 192.168.1.0/24 192-168-1-hosts.txt eth0
```

## Telegram  Alerts

- add you bot-token and chat-id to required places

- Run
```bash
./telegram.sh 192.168.1.0/24 192-168-1-hosts.txt eth0
```
