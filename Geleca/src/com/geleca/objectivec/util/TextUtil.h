//
//  TextUtil.h
//  CandidatoMobile
//
//  Created by Cristiano Coutinho Caldas on 5/30/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextUtil : NSObject {
	
}

+(NSString *)resume:(NSString *)text length:(int)length;
+(NSString *)resume:(NSString *)text length:(int)length limiter:(NSString *)limiter;

@end
