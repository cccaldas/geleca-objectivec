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

-(void)get:(NSString *)_url {
	self.url = _url;
	[self cancel];
	
	_data		= [[NSMutableData alloc] init];
	_connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]] delegate:self];
}

-(void)post:(NSString *)_url postData:(NSDictionary *)postData {
	self.url = _url;
	[self cancel];
	
	NSString *strData = @"";
	
	for (NSString *key in postData) {
		strData = [NSString stringWithFormat:@"%@&%@=%@", strData, key, [postData objectForKey:key]];
	}
	
	strData = [strData substringFromIndex:1];
	//strData = [strData stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	//NSLog(@"URLLoader, strData %@", strData);
	
	NSData *sendData = [strData dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
	
	
	NSMutableURLRequest *request = [NSMutableURLRequest 
									requestWithURL:[NSURL URLWithString:_url] 
									cachePolicy:NSURLRequestUseProtocolCachePolicy 
									timeoutInterval:15.0
									];
	
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
	[request setHTTPMethod:@"POST"];
	[request setValue:[NSString stringWithFormat:@"%d", [sendData length]] forHTTPHeaderField:@"Content-Length"];
	[request setHTTPBody: sendData];
	
	_data		= [[NSMutableData alloc] init];
	_connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];	
}

-(void)cancel {
	if(_connection)
		[_connection cancel];
	
	if(_data)
		[_data release];
	
	if(_connection)
		[_connection release];
	
	_data		= nil;
	_connection = nil;
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
	//NSLog(@"URLLoader::dealloc()");
	[self cancel];
	
	_data			= nil;
	_contentLength	= 0;
	
	self.url = nil;	
	
	[super dealloc];
}

@end