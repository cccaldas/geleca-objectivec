//
//  UtilTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 6/9/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "DataUtilTestCase.h"
#import "DataUtil.h"
#import "URLLoader.h"

@interface DataUtilTestCase()
-(void)loader_complete:(Event *)e;
@end

@implementation DataUtilTestCase

-(void)setup {
	[super setup];
	
	NSData *data		= [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.apple.com/home/images/ipad_hero.jpg"]];
	NSString *base64	= [DataUtil base64StringWithData:data];
	
	URLLoader *loader = [[URLLoader alloc] init];
	[loader addEventListener:[Event COMPLETE] target:self listener:@selector(loader_complete:)];
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	[dict setObject:@"image.jpg" forKey:@"file"];
	[dict setObject:base64 forKey:@"data"];
	[loader post:@"http://localhost/cccaldas/projects/geleca/objectivec/service/base64.php" postData:dict];
}

-(void)loader_complete:(Event *)e {
	[self testComplete];
}

@end
