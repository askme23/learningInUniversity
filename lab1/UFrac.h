#pragma once

class TFrac {
	public:
		int numer, denom;

		TFrac(int, int); //конструктор для дроби, представленной 2-мя числами
		TFrac(string); // конструктор для дроби, представленной в виде строки. Пример '7/9'
		TFrac(const TFrac &); // копирующий конструктор

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