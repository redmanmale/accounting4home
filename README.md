# Accounting4Home

This is the first part of ongoing project of home accounting system.

It's quite self-sufficient and almost full featured though.  
Its main purpose is importing of SMS with banking transactions from Android-based phone into Excel accounting file.


## Requirements

* Python 3.x (maybe Python 2.x will do, I've checked);
* ADB (in your PATH);
* Android phone must be rooted (to be able to copy sms database from system space);


## How it works

* Connect the phone to PC and run `copy.bat`. It will copy sms database from the phone to the PC.
* `importer.py` will read the sms database (SQLite) from hardcoded message thread (see line 39 and `thread_id`) and process all messages after `last_id` in `config.json`).
* Each message will be parsed and assigned a type based on message pattern provided for it (all types and corresponding patterns are in `config.json`). Sample types are: buy, salary, reject, cash in, etc.
* All messages with `buy` type will be processed and assigned a category (merchant name, MCC). After that all entries will be added to Excel accounting file into provided sheet with columns: date, amount, category, comment, MCC.
* After that `config.json` will be updated with last `sheet_row` and `last_id`.
* New categories could be added in `config.json`.
