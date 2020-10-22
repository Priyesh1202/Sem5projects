#include <stdio.h>
#include <mysql.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

void raiseError(MYSQL *con) {
    fprintf(stderr,"%s\n",mysql_error(con));
    mysql_close(con);
    exit(1);
}

static int create_flag; // 0 for View and 1 for Create

int main(int argc, char **argv) {

    MYSQL *con = mysql_init(NULL);
    if(con==NULL) raiseError(con);

    if(mysql_real_connect(con,"localhost","user","user","hms",0,NULL,0) == NULL ) raiseError(con);

    int c;
    
    while(1) {
        static struct option long_options[] = {
            {"create",no_argument,&create_flag,1},
            {"view",no_argument,&create_flag,0},
            {"student",no_argument,0,'s'},
            {"employee",no_argument,0,'e'},
            {"hall",no_argument,0,'h'},
            {0,0,0,0}
        };

        int option_index = 0;

        c = getopt_long(argc,argv,"seh",long_options,&option_index);

        if(c==-1) break;

        switch(c) {
            case 0:
                break;

            case 's':
                if(create_flag) {
                    printf("\nAdd new student record\n");
                    char name[100];
                    char hall[20];
                    printf("Enter student name: ");
                    scanf("%s",name);
                    printf("Enter hall name: ");
                    scanf("%s",hall);
                    
                    char query[]="insert into student (name,hall) values('";
                    strcat(query,name); 
                    strcat(query,"','");
                    strcat(query,hall);
                    strcat(query,"')");
                    if(mysql_query(con,query)) raiseError(con);
                    printf("\nRecord successfully added\n");
                }
                else {
                    if(mysql_query(con,"select * from student")) raiseError(con);
                    MYSQL_RES *result = mysql_store_result(con);
                    int num_fields = mysql_num_fields(result);
                    MYSQL_ROW row;
                    while((row = mysql_fetch_row(result))) {
                        for(int i=0; i<num_fields; i++) {
                            printf("%s ",row[i] ? row[i] : "NULL");
                        }
                        printf("\n");
                    }
                }
                break;

            case 'e':
                if(create_flag) {
                    printf("Add new employee record");
                }
                else {
                    printf("View employee records");
                }
                break;

            case 'h':
                if(create_flag) {
                    printf("Add new hall record");
                }
                else {
                    printf("View hall records");
                }
                break;

            default:
                printf("Incorrect argument");
                return 0;
        }
    }
    return 0;
    
}
