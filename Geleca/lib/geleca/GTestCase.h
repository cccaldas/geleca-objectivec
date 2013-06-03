//
//  GTestCase.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/20/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GTestCaseDelegate <NSObject>

-(void)testCaseComplete:(id)testCase;

@end

@interface GTestCase : NSObject {
	int _assertions;
	int _passeds;
}

@property (nonatomic, readonly) int assertions;
@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) id<GTestCaseDelegate> delegate;

-(void)run;
-(void)setup;
-(void)testComplete;

//assert
-(void)assert:(BOOL)condition description:(NSString *)description;

@end
