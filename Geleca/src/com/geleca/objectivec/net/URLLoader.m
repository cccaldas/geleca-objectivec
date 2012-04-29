/*
	URLLoader.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "URLLoader.h"
#import "ProgressEvent.h"

@implementation URLLoader
@synthesize url, progress;

-(void)load:(NSString *)_url {
	self.url = _url;
	
	if(_data)
		[_data release];
	
	if(_connection)
		[_connection release];
	
	_data		= [[NSMutableData alloc] init];
	_connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]] delegate:self];
}

-(void)cancel {
	if(_connection)
		[_connection cancel];
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSHTTPURLResponse *)response {
	if([response statusCode] == 200) {
		_contentLength = [response expectedContentLength];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	//NSLog(@"URLLoader::didReceiveData()");
	
	[_data appendData:data];
	self.progress = ((float) [_data length] / (float)_contentLength);
	[self dispatchEvent:[ProgressEvent withType:[ProgressEvent PROGRESS] progress:self.progress]];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	_data		= nil;
	_connection = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	//NSLog(@"URLLoader::connectionDidFinishLoading()");
	
	[self dispatchEvent:[Event withType:[Event COMPLETE]]];
}

-(NSData *)data	{ return _data; }

-(void)dealloc {
	NSLog(@"URLLoader::dealloc()");
	
	[self cancel];
	
	if(_data)
		[_data release];
	
	if(_connection)
		[_connection release];
	
	_data			= nil;
	_contentLength	= 0;
	
	self.url = nil;	
	
	[super dealloc];
}

@end