//
//  URLLoaderPostTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Simbionte Studios. All rights reserved.
//

#import "URLLoaderPostTestCase.h"
#import "ProgressEvent.h"

@interface URLLoaderPostTestCase()
-(void)loader_progress:(ProgressEvent *)e;
-(void)loader_complete:(Event *)e;
@end

@implementation URLLoaderPostTestCase

-(void)setup {
	[super setup];
	
	_loader = [[URLLoader alloc] init];
	[_loader addEventListener:[ProgressEvent PROGRESS] target:self listener:@selector(loader_progress:)];
	[_loader addEventListener:[Event COMPLETE] target:self listener:@selector(loader_complete:)];
	
	NSDictionary *data = [[[NSDictionary alloc] 
									initWithObjectsAndKeys:
										@"Produto 1", @"produto", 
										@"Preço 1", @"preco", 
										@"Descrição 1", @"descricao", 
						  nil] autorelease];
	
	[_loader post:@"http://localhost/projects/geleca/objectivec/Geleca/service/post.php" postData:data];
}

-(void)loader_progress:(ProgressEvent *)e {
	//NSLog(@"URLLoaderTestCase::loader_progress() progress: %f", _loader.progress);
}

-(void)loader_complete:(Event *)e {
	NSLog(@"URLLoaderPostTestCase::loader_complete(), data: %@", [[NSString alloc] initWithData:_loader.data encoding:NSUTF8StringEncoding]);
	
	
	[_loader release];
	_loader = nil;	
	
	[self testComplete];
}

@end
