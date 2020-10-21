#include <stdio.h>
#include <mysql.h>
#include <stdlib.h>

void raiseError(MYSQL *con) {
    fprintf(stderr,"%s\n",mysql_error(con));
    mysql_close(con);
    exit(1);
}

int main(int arg, char **argv) {
    MYSQL *con = mysql_init(NULL);

    if (con == NULL) {
       raiseError(con); 
    }

    if(mysql_real_connect(con,"localhost","user","user","hms",0,NULL,0) == NULL) {
       raiseError(con); 
    }

    if (mysql_query(con, "drop table if exists students")) {
        raiseError(con);
    }

    if(mysql_query(con, "create table students(id int primary key, name varchar(255))")) {
        raiseError(con);
    }

    if (mysql_query(con, "insert into students values(1,'preyes')")) {
        raiseError(con);
    }

    mysql_close(con);
    exit(0);
}
