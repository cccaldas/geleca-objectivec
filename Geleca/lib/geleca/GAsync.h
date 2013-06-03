//
//  Async.h
//  Geleca
//
//  Created by Cristiano Caldas on 11/29/12.
//
//

#import <Foundation/Foundation.h>

@interface GAsync : NSObject {
	
}

+(void)dispatch:(void(^)())block;
+(void)getMainQueue:(void(^)())callBack;

@end
