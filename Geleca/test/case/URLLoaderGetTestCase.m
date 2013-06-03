/*
	URLLoaderTestCase.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "URLLoaderGetTestCase.h"

@interface URLLoaderGetTestCase()
@end

@implementation URLLoaderGetTestCase

-(void)setup {
	[super setup];
	
	_loader = [[GURLLoader alloc] init];
	_loader.delegate = self;
	//[_loader addEventListener:[ProgressEvent PROGRESS] target:self listener:@selector(loader_progress:)];
	//[_loader addEventListener:[Event COMPLETE] target:self listener:@selector(loader_complete:)];
	
	[_loader get:@"http://www.mattstow.com/images/articles/symbol_photo_montage/photo_montage_symbols.jpg"];
}

-(void)urlLoaderGetProgress:(float)progress {
	NSLog(@"URLLoaderTestCase::urlLoaderGetProgress(): %f", progress);
}

-(void)urlLoaderComplete {
	//NSLog(@"URLLoaderTestCase::urlLoaderComplete()");
	_image = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_loader.data]];	
	//[self.view addSubview:_image];
	
	_loader = nil;
	
	[self testComplete];
}

@end
