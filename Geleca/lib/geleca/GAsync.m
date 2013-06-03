//
//  Async.m
//  Geleca
//
//  Created by Cristiano Caldas on 11/29/12.
//
//

#import "GAsync.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation GAsync

+(void)dispatch:(void (^)())block {
	dispatch_async(kBgQueue, ^{
		block();		
	});
}

+(void)getMainQueue:(void (^)())callBack {
	//returning main thread (UI)
	dispatch_async(dispatch_get_main_queue(), ^(void) {
		callBack();
	});
}

@end
