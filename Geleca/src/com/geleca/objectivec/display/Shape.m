//
//  Shape.m
//
//  Created by Cristiano Coutinho Caldas on 2012-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Shape.h"

@implementation Shape
	-(id)initWithFrame:(CGRect)frame color:(UIColor *)color {
		self = [super initWithFrame:frame];
		self.backgroundColor = color;
		
		return self;
	}
@end
