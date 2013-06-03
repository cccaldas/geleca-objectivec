/*
	URLLoader.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/29/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

//#import "EventDispatcher.h"

@protocol GURLLoaderDelegate <NSObject>

@optional
-(void)urlLoaderCancel;
-(void)urlLoaderComplete;
-(void)urlLoaderGetProgress:(float)progress;
-(void)urlLoaderPostProgress:(float)progress;

@end

@interface GURLLoader : NSObject {
	NSMutableData		*_data;
    NSURLConnection		*_connection;
	long long			_contentLength;
}

@property (nonatomic, readonly) NSData		*data;
@property (nonatomic)			float		progress;
@property (nonatomic, retain)	NSString	*url;
@property (nonatomic, retain) id<GURLLoaderDelegate> delegate;

-(void)get:(NSString *)_url;
-(void)post:(NSString *)_url postData:(NSDictionary *)postData;

+(NSData *)postSync:(NSString *)_url postData:(NSDictionary *)postData;
+(NSData *)getSync:(NSString *)_url;

-(void)cancel;

@end
