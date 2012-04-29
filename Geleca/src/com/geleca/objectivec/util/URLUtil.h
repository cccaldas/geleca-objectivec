/*
	URLUtil.m
	Geleca
	
	Created by Cristiano Coutinho Caldas on 4/28/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "URLUtil.h"

static UIWebView *webView;

@interface URLUtil()
+(void)navigateURL:(NSString *)url;
@end

@implementation URLUtil

+(void)mailto:(NSString *)email {
	[self navigateURL:[NSString stringWithFormat:@"mailto:%@", email]];
}

+(void)tel:(NSString *)tel {
	[self navigateURL:[NSString stringWithFormat:@"tel:%@", tel]];	
}

+(void)sms:(NSString *)number {
	[self navigateURL:[NSString stringWithFormat:@"sms:%@", number]];
}

+(void)navigateURL:(NSString *)url {
	webView = [[UIWebView alloc] init];
	
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
