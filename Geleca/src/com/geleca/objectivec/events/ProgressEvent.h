/*
 ProgressEvent.h
 Geleca
 
 Created by Cristiano Coutinho Caldas on 4/6/12.
 Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
 */

#import "Event.h"

@interface ProgressEvent : Event {
	
	
}

@property (readonly) float progress;

-(id)initWithType:(NSString *)type progress:(float)_progress;

+(id)withType:(NSString *)type progress:(float)progress;

//constants
+(NSString *)PROGRESS;

@end
