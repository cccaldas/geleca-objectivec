/*
	GCell.h
	Geleca
 
	Created by Cristiano Coutinho Caldas on 5/29/12.
	Copyright (c) 2012 Cristiano Coutinho Caldas. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface GCell : UITableViewCell {
	id _datasource;
}

@property (nonatomic, retain) id datasource;

-(void)setup;
-(void)bind;

@end
