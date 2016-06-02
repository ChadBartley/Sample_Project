
#include <iostream>
using namespace std;

extern "C" unsigned int Modibonacci(unsigned int n);


void main()
{
	unsigned int N;

	cout << "Calculate the Nth Modibonacci: ";
	cin >> N;

	cout << N << " Modibonacci = " << Modibonacci(N);
	cout << endl;
}