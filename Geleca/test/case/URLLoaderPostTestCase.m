//
//  URLLoaderPostTestCase.m
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "URLLoaderPostTestCase.h"
#import "GDataUtil.h"

@interface URLLoaderPostTestCase()
@end

@implementation URLLoaderPostTestCase

-(void)setup {
	[super setup];
	
	_loader = [[GURLLoader alloc] init];
	_loader.delegate = self;
	
	NSData *foto = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images.apple.com/home/images/macbookpro_hero.jpg"]];
	
	NSDictionary *data = [[NSDictionary alloc] 
									initWithObjectsAndKeys:
										@"Produto 1", @"produto", 
										@"Preço 1", @"preco", 
										@"Descrição 1", @"descricao",
										[GDataUtil base64StringWithData:foto], @"foto",
						  nil];
	
	[_loader post:@"http://localhost/cccaldas/projects/geleca/objectivec/service/post.php" postData:data];
}

-(void)urlLoaderPostProgress:(float)progress {
	NSLog(@"URLLoaderTestCase::urlLoaderPostProgress: %f", progress);	
}

-(void)urlLoaderComplete {
	NSLog(@"URLLoaderPostTestCase::loader_complete(), data: %@", [[NSString alloc] initWithData:_loader.data encoding:NSUTF8StringEncoding]);
	
	
	_loader = nil;	
	
	[self testComplete];	
}

@end
