//
//  GTestSuite.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTestCase.h"

@interface GTestSuite : NSObject <GTestCaseDelegate> {
	NSMutableArray *_cases;
	int				_current;
}

@property (nonatomic, readonly) int length;
@property (nonatomic, readonly) int assertions;

-(void)setup;
-(void)suiteComplete;
-(void)run;

-(void)addTestCase:(GTestCase *)testCase;

@end
