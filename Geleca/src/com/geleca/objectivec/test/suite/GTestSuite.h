//
//  GTestSuite.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTestCase.h"

@interface GTestSuite : NSObject {
	NSMutableArray *_cases;
	int				_current;
}

@property (nonatomic, readonly) int length;
@property (nonatomic, readonly) int assertions;
@property (nonatomic, retain) UIView *view;

-(void)setup;
-(void)suiteComplete;
-(void)run;

-(void)addTestCase:(GTestCase *)testCase;

@end
