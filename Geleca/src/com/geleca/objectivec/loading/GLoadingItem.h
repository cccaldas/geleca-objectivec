/*
	GLoadingItem.h
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/6/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "EventDispatcher.h"

@interface GLoadingItem : EventDispatcher {
	NSMutableData		*_data;
    NSURLConnection		*_connection;
	long long			_contentLength;
	NSString			*_id;
	NSString			*_url;
	BOOL				_loaded;
}

@property (nonatomic, readonly) NSData		*data;
@property (nonatomic, readonly) NSString	*id;
@property (nonatomic, readonly) NSString	*url;
@property (nonatomic)			float		progress;
@property (nonatomic)			float		weight;
@property (nonatomic, readonly) BOOL		loaded;

-(void)load;
-(void)cancel;

-(id)initWithURL:(NSString *)url id:(NSString *)id;
+(id)withURL:(NSString *)url id:(NSString *)id;

@end
