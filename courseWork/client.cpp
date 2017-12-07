#include "base64.h"
#include "base64.cpp"
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
string buf1;

void execTransaction(int *descriptor, char *buf) {
	int len;
	int sizeOfMsg = 0;
	char *tmpStr = new char;
	bool checkForRetr = false;
	string command = buf;

	//проверка на то, была ли эта команда "получения сообщения"
	if (command.find("RETR") != -1) {
		checkForRetr = true;
	}

	send(*descriptor, buf, strlen(buf), 0);
	len = recv(*descriptor, buf, BUFSIZE, 0);
	buf[len] = '\0';
	printf("Response: %s\n", buf);

	if (checkForRetr) {
		//получаем размер принятого сообщения
		for (int i = 0, j = 0; i < strlen(buf); i++) {
			if (buf[i] >= '0' && buf[i] <= '9') {
				tmpStr[j++] = buf[i];
			}
		}
		sizeOfMsg = atoi(tmpStr);

		cout << sizeOfMsg << endl;
		int size = 0;
		char bufForBodyMsg[sizeOfMsg + 2];
		while (size < sizeOfMsg) {
			len = recv(*descriptor, bufForBodyMsg, sizeOfMsg, 0);
			size += len;
			buf1.append(bufForBodyMsg);
			fprintf(stdout, "%s", bufForBodyMsg);	
		}
		cout << "buf1 = " << buf1 << endl;
	
	}

	delete(tmpStr);
}

void writeToFile() {
	FILE  *decodeMsg, *finishMsg;
	int length = buf1.length();
	int index = buf1.rfind("base64") + 10;
	string tmp;

	buf1 = buf1.substr(index);
	index = buf1.find("=");
	tmp = buf1.substr(0, index + 1);
	length = tmp.length();
	
	decodeMsg = fopen("message", "wb");
	//tmp = base64_decode(tmp);
	
	for (int i = 0 ; i < length; i++) {
		if (tmp.at(i) >= 'a' && tmp.at(i) <= 'z' || tmp.at(i) >= 'A' && tmp.at(i) <= 'Z' || tmp.at(i) >= '0'&&
			tmp.at(i) <= '9' || tmp.at(i) == '+' || tmp.at(i) == '/' || tmp.at(i) == '=') {
			fputc(tmp.at(i), decodeMsg);
		}
	}
	fclose(decodeMsg);

	decodeMsg = fopen("message", "rb");
	finishMsg = fopen("image.png", "wb");

	string image;
	char c;
	while(!feof(decodeMsg)) {
		c = fgetc(decodeMsg);
		if (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0'&&
			c <= '9' || c == '+' || c == '/' || c == '=') {
			image.push_back(c);
		}
	}

	// cout << "image = " << image.size() << endl;
	// cout << "image = " << base64_decode(image) << endl;
	image = base64_decode(image);
	// cout << "image = " << image << endl;
	fwrite(image.c_str(), sizeof(char), image.size(), finishMsg);
	fclose(finishMsg);
	fclose(decodeMsg);
}

void createConnection(int *descriptor, char *domen, char *username, char *password) {
	int result, len = 0;
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
	send(*descriptor, buf, strlen(buf), 0);
	len = recv(*descriptor, buf, BUFSIZE, 0);
	buf[len] = '\0';
	printf("Response: %s\n", buf);

    sprintf (buf, "PASS %s\n", password);
	send(*descriptor, buf, strlen(buf), 0);
	len = recv(*descriptor, buf, BUFSIZE, 0);
	buf[len] = '\0';
	printf("Response: %s\n", buf);

}

int main(int argc, char **argv) {
	int sockfd, len;	
	char buf[BUFSIZE];
	char user[BUFSIZE];
	char pass[BUFSIZE];

	system("clear");
	fprintf(stdout, "********** АВТОРИЗАЦИЯ ************\n");
	fprintf(stdout, "LOGIN: ");
    fscanf(stdin, "%s", &user);   
    fprintf(stdout, "PASSWORD: ");
    fscanf(stdin, "%s", &pass);

    system("reset");

    //Этап авторизации
	createConnection(&sockfd, argv[1], user, pass);

	//Этап транзакции
	while (1) {
		gets(buf);
		len = strlen(buf);
		buf[len] = '\n';
		buf[len + 1] = '\0';

		if (len > 1) {
			if (!strcmp(buf, "QUIT\n")) {
				execTransaction(&sockfd, buf);
				close(sockfd);
				exit(0);
			}
			
			execTransaction(&sockfd, buf);
			writeToFile();
		}
	}

	return 0;
}
