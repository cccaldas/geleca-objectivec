/*
	DataUtil.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 6/9/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface DataUtil : NSObject {
	
}

+(NSData *)dataWithBase64EncodedString:(NSString *)string;
+(NSString *)base64StringWithData:(NSData *)data;

@end
