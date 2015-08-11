#include "ofxSomeLibrary.h"

#import "OurObjcBridge.h"

void ofxSomeLibrary::setup() {
	
	cout << __PRETTY_FUNCTION__ << endl;
	bridge = (__bridge void*)[[OurObjcBridge alloc] initWithInterface:this];

}

void ofxSomeLibrary::method1() {
	cout << __PRETTY_FUNCTION__ << endl;
}

void ofxSomeLibrary::method2() {
	cout << __PRETTY_FUNCTION__ << endl;
}