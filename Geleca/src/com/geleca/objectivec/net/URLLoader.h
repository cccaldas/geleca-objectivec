/*
	URLLoader.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "EventDispatcher.h"

@interface URLLoader : EventDispatcher {
	NSMutableData		*_data;
    NSURLConnection		*_connection;
	long long			_contentLength;
}

@property (nonatomic, readonly) NSData		*data;
@property (nonatomic)			float		progress;
@property (nonatomic, retain)	NSString	*url;

-(void)get:(NSString *)_url;
-(void)post:(NSString *)_url postData:(NSDictionary *)postData;
-(void)cancel;

@end
