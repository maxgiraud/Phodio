#include <iostream>

#include "process.h"

using namespace std;

int main(int argc, char* argv[]) {


	if (argc > 1) {

		string file(argv[1]);

		Process proc(file);

		proc.Convert();
		proc.WriteAudio();
	}

	return 0;
}
