/*
 ProgressEvent.m
 Geleca
 
 Created by Cristiano Coutinho Caldas on 4/6/12.
 Copyright (c) 2012 Simbionte Studios. All rights reserved.
 */

#import "ProgressEvent.h"

@implementation ProgressEvent

@synthesize progress;

-(id)initWithType:(NSString *)type progress:(float)_progress {
	if((self = [super initWithType:type])) {
		progress = _progress;
	}
	
	return self;
}

+(id)withType:(NSString *)type progress:(float)progress {
	return [[[ProgressEvent alloc] initWithType:type progress:progress] autorelease];
}

+(NSString *)PROGRESS { return @"progress"; }

@end
