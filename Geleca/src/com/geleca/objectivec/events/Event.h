/*
	Event.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface Event : NSObject {
	
}

@property (nonatomic, retain) id target;
@property (nonatomic, retain) NSString *type;

-(id)initWithType:(NSString *)type;
+(id)withType:(NSString *)type;

//constants
+(NSString *)COMPLETE;
+(NSString *)CHANGE;
+(NSString *)CANCEL;
+(NSString *)ADD;
+(NSString *)SELECT;

@end
