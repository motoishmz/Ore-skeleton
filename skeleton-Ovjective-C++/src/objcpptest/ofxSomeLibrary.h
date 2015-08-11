#pragma once

#include <iostream>
#include "ofxSomeLibraryInterface.h"

using namespace std;

class ofxSomeLibrary : public ofxSomeLibraryInterface {
	
public:
	
	void setup();
	void method1();
	void method2();
	
private:
	
	void *bridge;
};

