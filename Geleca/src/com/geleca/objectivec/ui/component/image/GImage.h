/*
	GImage.h
	TVShows
	
	Created by Cristiano Coutinho Caldas on 4/1/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GComponent.h"

@interface GImage : GComponent {
	UIImageView		*img_image;
}

@property (nonatomic, strong) UIImage *image;

-(id)initWithImage:(UIImage *)image;

@end
