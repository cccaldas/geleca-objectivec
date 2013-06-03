//
//  URLLoaderPostTestCase.h
//  Geleca
//
//  Created by Cristiano Coutinho Caldas on 4/29/12.
//  Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
//

#import "GTestCase.h"
#import "GURLLoader.h"

@interface URLLoaderPostTestCase : GTestCase <GURLLoaderDelegate> {
	GURLLoader		*_loader;
}

@end
