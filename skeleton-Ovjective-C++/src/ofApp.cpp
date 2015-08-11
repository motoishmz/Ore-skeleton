#include "ofMain.h"
#include "ofxSomeLibrary.h"

class ofApp : public ofBaseApp
{
	
	ofxSomeLibrary myclass;
	
public:
	
	void setup()
	{
		ofSetFrameRate(60);
		ofSetVerticalSync(true);
		myclass.setup();
	}
};



#pragma mark -
#pragma mark main
int main(){
	ofSetupOpenGL(1600, 900, OF_WINDOW);
	ofRunApp(new ofApp());
}
