# Hostel Management System

## Instructions to run

```bash
gcc main.c -o hms -std=c99 `mysql_config --cflags --libs`

./hms

```

Create a new database in MySQL/MariaDB named ```hms``` and then execute the ```db.sql``` script.

Change the username and password in main.c
```
MySQL> source /path/to/db.sql;
```

## Usage

* Students ```./hms --student``` or ```./hms -s```
* Employees ```./hms --employee``` or ```./hms -e```
* Halls ```./hms --hall``` or ```./hms -h```
* For adding a new record, use the ```--create``` flag before the s/e/h argument

## Examples

* Add a new student ```./hms --create --student```
* View all employee records ```./hms -e```
