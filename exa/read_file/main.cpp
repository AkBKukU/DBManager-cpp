#include <iostream>
#include <fstream>
#include <string>
#include <streambuf>

int main () {
	std::string filename = "TestData,0001_0001.sql";

	std::ifstream t(filename);
	std::string str;

	t.seekg(0, std::ios::end);
	str.reserve(t.tellg());
	t.seekg(0, std::ios::beg);

	str.assign((std::istreambuf_iterator<char>(t)),
		std::istreambuf_iterator<char>());


	std::cout << str << '\n';
	t.close();
}
