# qrp_idcards
ID Card functionality

### Preface
I will provide ZERO support for this resource. It's very simple, if you want to change something about it, go for it. This resource based on code from and heavily inspired by jsfour id cards. 

### Overview
This resources generates an ID card item with metadata for linden_inventory, and allows you to show it to people around you on "use". 

### Requirements
You'll need the following resources in place to make this work - or you'll have to make changes to the code to make it work with whatever you're using. If you're not already using linden_inventory or ESX Legacy, I recommend not bothering trying to use this resource - if you know enough to adapt this resource to another system you're better equipped to just write your own system.

* es_extended LEGACY - https://github.com/esx-framework/es_extended OR (recommended) https://github.com/thelindat/es_extended
* Modified Screenshot-Basic - https://github.com/jonassvensson4/screenshot-basic
* Mugshot - https://github.com/jonassvensson4/mugshot
** Be sure to follow instructions on getting an imgur api up and running for this, or use the base64 implementation.
* Linden Inventory - https://github.com/thelindat/linden_inventory


### Installation
- Drag and drop into your resource folder
- Make sure you install the requirements
- Follow the instructions to install the other resources - especially the mugshot one for the imgur API 
- Use the test command /issueidcard to test.