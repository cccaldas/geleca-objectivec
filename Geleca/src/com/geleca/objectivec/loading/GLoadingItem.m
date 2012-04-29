/*
	GLoadingItem.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GLoadingItem.h"
#import "Event.h"
#import "ProgressEvent.h"

@implementation GLoadingItem

@synthesize weight, progress;

+(id)withURL:(NSString *)url id:(NSString *)id {
	return [[GLoadingItem alloc] initWithURL:url id:id];
}

-(id)initWithURL:(NSString *)url id:(NSString *)id {
	if((self = [super init])) {
		_url		= url;
		_id			= id;
		self.weight = 1;
		_loaded		= NO;
	}
	
	return self;
}

-(void)load {
	_data		= [NSMutableData data];
	_connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]] delegate:self];
}

-(void)cancel {
	[_connection cancel];
	_connection = nil;
	_data		= nil;
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSHTTPURLResponse *)response {
	if([response statusCode] == 200) {
		_contentLength = [response expectedContentLength];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[_data appendData:data];
	self.progress = ((float) [_data length] / (float)_contentLength);
	[self dispatchEvent:[ProgressEvent withType:[ProgressEvent PROGRESS] progress:self.progress]];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	_data		= nil;
	_connection = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	//NSLog(@"GLoadingItem::connectionDidFinishLoading()");
	
	_loaded = YES;
	[self dispatchEvent:[Event withType:[Event COMPLETE]]];
	_connection = nil;
}

-(NSData *)data		{ return _data; }
-(NSString *)id		{ return _id; }
-(NSString *)url	{ return _url; }
-(BOOL)loaded		{ return _loaded; }

-(void)dealloc {
	[self cancel];
	
	_data			= nil;
	_url			= nil;
	_id				= nil;
	_contentLength	= 0;
	_loaded			= NO;
	
	[super dealloc];
}

@end
