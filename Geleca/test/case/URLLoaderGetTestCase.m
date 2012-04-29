/*
	URLLoaderTestCase.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "URLLoaderGetTestCase.h"
#import "ProgressEvent.h"

@interface URLLoaderGetTestCase()
-(void)loader_progress:(ProgressEvent *)e;
-(void)loader_complete:(Event *)e;
@end

@implementation URLLoaderGetTestCase

-(void)setup {
	[super setup];
	
	_loader = [[URLLoader alloc] init];
	[_loader addEventListener:[ProgressEvent PROGRESS] target:self listener:@selector(loader_progress:)];
	[_loader addEventListener:[Event COMPLETE] target:self listener:@selector(loader_complete:)];
	
	[_loader get:@"http://www.mattstow.com/images/articles/symbol_photo_montage/photo_montage_symbols.jpg"];
}

-(void)loader_progress:(ProgressEvent *)e {
	//NSLog(@"URLLoaderTestCase::loader_progress() progress: %f", _loader.progress);
}

-(void)loader_complete:(Event *)e {
	//NSLog(@"URLLoaderTestCase::loader_complete()");
	_image = [[UIImageView alloc] initWithImage:[UIImage imageWithData:_loader.data]];	
	//[self.view addSubview:_image];
	
	[_loader release];
	_loader = nil;
	
	[self testComplete];
}

@end
