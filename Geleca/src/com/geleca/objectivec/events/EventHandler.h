/*
	EventHandler.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface EventHandler : NSObject {
	
}

-(id)initWithObject:(id)_obj method:(SEL)_method;

@property (readonly) id obj;
@property (readonly) SEL method;

@end
