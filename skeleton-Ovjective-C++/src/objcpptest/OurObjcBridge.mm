#import "OurObjcBridge.h"

@interface OurObjcBridge ()

@end


@implementation OurObjcBridge

- (instancetype) initWithInterface:(ofxSomeLibraryInterface *)interface
{
	self = [super init];
	
	if (self) {
		interface_ = interface;
		interface->method1();
		interface->method2();
	}
	
	return self;
}

@end