#include <stdio.h>
#include <mysql.h>
#include <stdlib.h>
#include <getopt.h>

void raiseError(MYSQL *con) {
    fprintf(stderr,"%s\n",mysql_error(con));
    mysql_close(con);
    exit(1);
}

int main(int argc, char **argv) {
    int option_index = 0;
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

    char *userName = NULL;

    while ((option_index = getopt(argc,argv,"u:g")) != -1) {
        switch(option_index) {
            case 'u':
                userName=optarg;
                printf("USER\n");
                printf("Username: %s",userName);
                break;
            case 'g':
                printf("GROUP\n");
                break;
            default:
                printf("Incorrect option!\n");
                return 0;
        }
    }

    if (mysql_query(con, "insert into students values(1,'preyes')")) {
        raiseError(con);
    }

    mysql_close(con);
    return 0;
}
