#include "Header.h"
#include "UFrac.h"

TFrac :: TFrac(int numerator, int denominator) {
	int numer = numerator;
	int denom = denominator;

	if (denom < 0 && numer > 0) {
		numer *= -1;
		denom *= -1;
	}

	int dif = this->gcd(abs(numer), abs(denom));

	if (numer != 0) {
		this->numer = numer / dif;
		this->denom = denom / dif;
	} else {
		this->numer = numer;
		this->denom = denom;
	}
}

TFrac :: TFrac(string fracStr) {
	string str(fracStr);
	int flag = str.find('/');
	string dem = str.substr(flag + 1);
	string num = str.erase(flag);

	int numer = atoi(num.c_str());
	int denom = atoi(dem.c_str());

	if (denom < 0 && numer > 0) {
		numer *= -1;
		denom *= -1;
	}

	int dif = this->gcd(abs(numer), abs(denom));

	if (numer != 0) {
		this->numer = numer / dif;
		this->denom = denom / dif;
	} else {
		this->numer = numer;
		this->denom = denom;
	}	
}

TFrac :: TFrac(const TFrac &c) { 
	numer = c.numer;
	denom = c.denom;
}

int TFrac :: gcd(int a, int b) {
	while (b > 0) {
		long long c = a % b;
		a = b;
		b = c;
	}

	return a;
}

void TFrac :: printFrac() {
	cout << "��������� = " << this->numer << endl;
	cout << "����������� = " << this->denom << endl;
	cout << endl;
}

void printFrac(TFrac *obj) {
	cout << "��������� = " << obj->numer << endl;
	cout << "����������� = " << obj->denom << endl;
	cout << endl;
}

TFrac TFrac :: addFraction(TFrac obj) { //��������
	if (this->denom == obj.denom) {
		return TFrac(this->numer + obj.numer, this->denom + obj.denom);
	}

	return TFrac((this->numer * obj.denom) + (obj.numer * this->denom), this->denom * obj.denom);
}

TFrac TFrac :: subFraction(TFrac obj) { //���������
	if (this->denom == obj.denom) {
		return TFrac(this->numer - obj.numer, this->denom - obj.denom);
	}

	return TFrac((this->numer * obj.denom) - (obj.numer * this->denom), this->denom * obj.denom);
}

TFrac TFrac :: mulFraction(TFrac obj) { // ���������
	return TFrac(this->numer * obj.numer, this->denom * obj.denom);
}

TFrac TFrac :: splitFraction(TFrac obj) { // �������
	return TFrac(this->numer * obj.denom, this->denom * obj.numer);
}

TFrac TFrac :: toSquare() { // ���������� � �������
	return TFrac(this->numer * this->numer, this->denom * this->denom);
}

TFrac TFrac :: backFraction() { // �������� �����
	return TFrac(this->denom, this->numer);
}

TFrac TFrac :: makeMinusFraction() { // ������������� �����
	return TFrac(this->numer * (-1), this->denom);
}

bool TFrac :: checkForEqual(TFrac obj) { // ��������� �� ��������� ���� ������
	if (this->numer == obj.numer && this->denom == obj.denom) {
		return true;
	} else {
		return false;
	}
}

bool TFrac :: compareToMost(TFrac obj) { // ��������� �� ����������� ������ �����
	if ((this->numer * obj.denom) > (obj.numer * this->denom)) {
		return true;
	} else {
		return false;
	}
}

double TFrac :: getNumerNumber() { // ��������� ��������� � �������� �������
	return (double)this->numer;
}

double TFrac :: getDenomNumber() { // ��������� ����������� � �������� �������
	return (double)this->denom;
}

string TFrac :: getNumerString() { // ��������� ��������� � ��������� �������
	return to_string(this->numer);
}

string TFrac :: getDenomString() { // ��������� ����������� � ��������� �������
	return to_string(this->denom);
}

string TFrac :: getFractionString() { // ��������� ����� � ��������� �������
	return to_string(this->numer) + "/" + to_string(this->denom);
}

int main() {
	setlocale(LC_ALL, "Russian");

	TFrac a("300/50");
	TFrac b("1/-2");

	a.printFrac();

	printFrac(&a.addFraction(b));
	printFrac(&a.subFraction(b));
	printFrac(&a.mulFraction(b));
	printFrac(&a.splitFraction(b));
	printFrac(&b.toSquare());
	printFrac(&a.backFraction());
	printFrac(&b.makeMinusFraction());

	cout << a.checkForEqual(b) << endl;
	cout << a.compareToMost(b) << endl;
	system("pause");
	return 0;
}