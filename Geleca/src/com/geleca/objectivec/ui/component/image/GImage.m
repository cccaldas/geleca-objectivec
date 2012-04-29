/*
	GImage.m
	TVShows
	
	Created by Cristiano Coutinho Caldas on 4/1/12.
	Copyright (c) 2012 Simbionte Studios. All rights reserved.
*/

#import "GImage.h"

@implementation GImage

-(id)initWithImage:(UIImage *)image {
	self = [super init];
	
	if(self) {
		self.image = image;
	}
	
	return self;
}

-(void)setup {
	//NSLog(@"GImage::setup()");
	
}

-(void)setWidth:(float)width {
	super.width = width;
	
	img_image.frame = CGRectMake(0, 0, self.width, self.height);
}

-(void)setHeight:(float)height {
	super.height = height;
	
	img_image.frame = CGRectMake(0, 0, self.width, self.height);
}

-(void)setImage:(UIImage *)image {
	//NSLog(@"GImage::setImage(), width: %f height: %f", image.size.width, image.size.height);
	
	img_image	= [[UIImageView alloc] initWithImage:image];
	[self addSubview:img_image];
	
	if(self.width != 0 || self.height != 0)
		img_image.frame = CGRectMake(0, 0, self.width, self.height);
	
	//self.width		= image.size.width;
	//self.height		= image.size.height;
}

-(UIImage *)image {
	return img_image.image;
}

@end
