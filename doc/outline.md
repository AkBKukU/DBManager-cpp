# Project outline

 - [Done] define DBManager requirements
 - [Done] create SQL files to make the DBM tables
 - create example DB that just holds a varchar and a number
 - load sql files into c++
 - create sql admin user
 - create example mysql interface in c++
 - execute sql files
 - create c++ example file to read data from DB


# Requirements

## files

 - filename format "DATABASE,\#\#\#\#\_\#\#\#\#.sql"
     - Database the patch is for
     - MSB patch number
     - LSB patch number

 - comments
     - description
     - data validity


## SQL server

### dbm patch table

Unique on the database and order numbers

 - file name
 - file md5
 - patch order number MSB
 - patch order number LSB
 - description
 - file contents
 - database
 - data integrity
 - installation status
 - date added
 - date installed

### procedures

 - patch list(filter by install status)
 - patch contents
 - add patch
 - set patch installed


### funtions

 - patch exists

