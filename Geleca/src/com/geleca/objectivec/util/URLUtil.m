/*
	URLUtil.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface URLUtil : NSObject {
	
}

+(void)mailto:(NSString *)email;
+(void)tel:(NSString *)tel;
+(void)sms:(NSString *)number;

@end
