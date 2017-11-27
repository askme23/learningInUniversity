#include "base64.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <netdb.h>
#include <stdlib.h>

#include <iostream>
#include <cstdio>
#include <string>
#include <cstdlib>

#define BUFSIZE 4096
#define SERVER_PORT 110
#define CLIENT_PORT 2323

using namespace std;

struct sockaddr_in str_server;
struct sockaddr_in str_client;
struct hostent *hp;

void execTransaction(int *descriptor, char *command) {
	int len;

	//fprintf(stderr, "bufer = %s\n", command);
	send(*descriptor, command, strlen(command), 0);
	len = recv(*descriptor, command, BUFSIZE, 0);
	command[len] = '\0';

	printf("Response: %s\n", command);
}

void createConnection(int *descriptor, char *domen, char *username, char *password) {
	int result;
	char buf[BUFSIZE];

	if((*descriptor = socket(AF_INET, SOCK_STREAM, 0)) < 0){
		perror("Socket has not risen.");
		exit(EXIT_FAILURE);
	}

	//заполнение структуры сервера
	bzero(&str_server, sizeof(str_server));
	str_server.sin_family = AF_INET;
	str_server.sin_port = htons(SERVER_PORT);
	hp = gethostbyname(domen);
	bcopy(hp->h_addr, &str_server.sin_addr, hp->h_length);


	//заполнение структуры клиента
	bzero(&str_client, sizeof(str_client));
	str_client.sin_family = AF_INET;
	str_client.sin_port = CLIENT_PORT;
	str_client.sin_addr.s_addr = INADDR_ANY;
	bind(*descriptor, (struct sockaddr *) &str_client, sizeof(str_client));

	if (result = connect(*descriptor, (sockaddr*) &str_server, sizeof(str_server)) < 0) {
		perror("Coudn't connect.");
		close(*descriptor);
		exit(EXIT_FAILURE);
	}

	result = recv(*descriptor, buf, BUFSIZE, 0);
	buf[result] = '\0';
	fprintf(stderr, "Connection: %s", buf);

	sprintf (buf, "USER %s\n", username);
    execTransaction (descriptor, buf);          
    sprintf (buf, "PASS %s\n", password);
    execTransaction (descriptor, buf);

}

int main(int argc, char **argv) {
	int sockfd, len;	
	char buf[BUFSIZE];
	char user[BUFSIZE];
	char pass[BUFSIZE];
	
	fprintf (stdout, "user: ");
    fscanf (stdin, "%s", &user);   
    fprintf (stdout, "pass: ");
    fscanf (stdin, "%s", &pass);

    system("reset");

    //этап авторизации
	createConnection(&sockfd, argv[1], user, pass);

	//этап транзакции
	while (1) {
		gets(buf);
		len = strlen(buf);
		buf[len] = '\n';
		buf[len + 1] = '\0';

		if (len > 1) {
			execTransaction(&sockfd, buf);

			if (!strcmp(buf, "END\n")) {
				close(sockfd);
				exit(0);
			}
		}
	}

	return 0;
}
