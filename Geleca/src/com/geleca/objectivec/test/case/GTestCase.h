//
//  GTestCase.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDispatcher.h"

@interface GTestCase : EventDispatcher {
	int _assertions;
	int _passeds;
}

@property (nonatomic, readonly) int assertions;
@property (nonatomic, retain) UIView *view;

-(void)run;
-(void)setup;
-(void)testComplete;

//assert
-(void)assert:(BOOL)condition description:(NSString *)description;

@end
