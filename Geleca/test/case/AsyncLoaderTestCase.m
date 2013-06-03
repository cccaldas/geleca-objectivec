//
//  AsyncLoaderTestCase.m
//  Geleca
//
//  Created by Cristiano Caldas on 6/2/13.
//  Copyright (c) 2013 Cristiano Coutinho Caldas. All rights reserved.
//

#import "AsyncLoaderTestCase.h"

@interface AsyncLoaderTestCase()
-(void)testGet;
-(void)testPost;
@end

@implementation AsyncLoaderTestCase

-(void)setup {
	[super setup];
    
    [self testGet];
}

-(void)testGet {
    [GAsync dispatch:^{
        NSData *data = [GURLLoader getSync:@"http://www.twitter.com"];
        [self assert:(data != nil) description:@"getSync: twitter.com retornou nil"];
        [self testPost];
    }];
}

-(void)testPost {
    [GAsync dispatch:^{
        NSData *data = [GURLLoader postSync:@"http://www.twitter.com/" postData:@{} ];
        [self assert:(data != nil) description:@"postSync: twitter.com retornou nil"];
        [self testComplete];
    }];
}

@end
