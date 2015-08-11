#import "ofxSomeLibraryInterface.h"
#import <Foundation/foundation.h>

@interface OurObjcBridge : NSObject
{
	ofxSomeLibraryInterface *interface_;
}

- (instancetype) initWithInterface:(ofxSomeLibraryInterface *)interface;
@end