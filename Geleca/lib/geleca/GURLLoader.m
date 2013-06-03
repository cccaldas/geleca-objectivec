/*
	URLLoader.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import "GURLLoader.h"
//#import "ProgressEvent.h"

@implementation GURLLoader
@synthesize url, progress, delegate;

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

+(NSData *)getSync:(NSString *)_url {
	return [NSData dataWithContentsOfURL:[NSURL URLWithString:_url]];
}

+(NSData *)postSync:(NSString *)_url postData:(NSDictionary *)postData {
    //NSLog(@"GURLLoader::postSync(%@, %@)", _url, postData);
    //NSLog(@"%d", [postData count]);
    
    
	NSURLResponse *response;
	NSError *error = nil;
	
	NSString *strData = @"";
	
    if(postData) {
        if([postData count] > 0) {
            for (NSString *key in postData)
                strData = [NSString stringWithFormat:@"%@&%@=%@", strData, key, [postData objectForKey:key]];
            
            strData = [strData substringFromIndex:1];
        }
    }	
	
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
	
	return [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
}

-(void)cancel {
	if(_connection)
		[_connection cancel];
	
	//if(_data)
		//[_data release];
	
	//if(_connection)
		//[_connection release];
	
	_data		= nil;
	_connection = nil;
	
	if([self.delegate respondsToSelector:@selector(urlLoaderCancel)])
		[self.delegate urlLoaderCancel];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
	if([response statusCode] == 200) {
		_contentLength = [response expectedContentLength];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	//NSLog(@"URLLoader::didReceiveData()");
	
	[_data appendData:data];
	self.progress = ((float) [_data length] / (float)_contentLength);
	
	if([self.delegate respondsToSelector:@selector(urlLoaderGetProgress:)])
		[self.delegate urlLoaderGetProgress:self.progress];
	//[self dispatchEvent:[ProgressEvent withType:[ProgressEvent PROGRESS] progress:self.progress]];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	_data		= nil;
	_connection = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	//NSLog(@"URLLoader::connectionDidFinishLoading()");
	
	if([self.delegate respondsToSelector:@selector(urlLoaderComplete)])
		[self.delegate urlLoaderComplete];
	//[self dispatchEvent:[Event withType:[Event COMPLETE]]];
}

-(void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
	
	self.progress = [[NSNumber numberWithInteger:totalBytesWritten] floatValue] / [[NSNumber numberWithInteger:totalBytesExpectedToWrite] floatValue];
	//NSLog(@"percent: %f", percent);
	
	if([self.delegate respondsToSelector:@selector(urlLoaderPostProgress:)])
		[self.delegate urlLoaderPostProgress:self.progress];
	//[self dispatchEvent:[ProgressEvent withType:[ProgressEvent PROGRESS] progress:self.progress]];
}

-(NSData *)data	{ return _data; }

/*
-(void)dealloc {
	//NSLog(@"URLLoader::dealloc()");
	[self cancel];
	
	_data			= nil;
	_contentLength	= 0;
	
	self.url = nil;	
	
	[super dealloc];
}
 */

@end