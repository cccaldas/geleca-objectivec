//
//  TextUtil.m
//  CandidatoMobile
//
//  Created by Cristiano Coutinho Caldas on 5/30/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "TextUtil.h"

@implementation TextUtil

+(NSString *)resume:(NSString *)text length:(int)length {
	return [self resume:text length:length limiter:@"..."];
}


+(NSString *)resume:(NSString *)text length:(int)length limiter:(NSString *)limiter {
	if(text.length > length)
		return [NSString stringWithFormat:@"%@%@", [text substringToIndex:length - 1], limiter];
	
	return text;
}

@end
