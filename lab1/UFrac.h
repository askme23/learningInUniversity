#pragma once

class TFrac {
	public:
		int numer, denom;

		TFrac(int, int); //����������� ��� �����, �������������� 2-�� �������
		TFrac(string); // ����������� ��� �����, �������������� � ���� ������. ������ '7/9'
		TFrac(const TFrac &); // ���������� �����������

		int gcd(int, int);
		void printFrac();

		TFrac addFraction(TFrac);
		TFrac subFraction(TFrac);
		TFrac mulFraction(TFrac);
		TFrac splitFraction(TFrac);
		TFrac toSquare();
		TFrac backFraction();
		TFrac makeMinusFraction();

		bool checkForEqual(TFrac);
		bool compareToMost(TFrac);

		double getNumerNumber();
		double getDenomNumber();

		string getNumerString();
		string getDenomString();
		string getFractionString();
};