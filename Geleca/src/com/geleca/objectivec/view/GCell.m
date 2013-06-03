/*
	GCell.m
	Geleca
 
	Created by Cristiano Coutinho Caldas on 5/29/12.
	Copyright (c) 2012 Geleca. All rights reserved.
*/

#import "GCell.h"

@implementation GCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setup];
	}
	return self;
}

-(void)setup {
	
}

-(id)datasource { return _datasource; }
-(void)setDatasource:(id)value {	
	if(_datasource == value)
		return;
	
	if(_datasource)
		[_datasource release];
	
	if(value == nil)
		return;
	
	_datasource = [value retain];
	[self bind];
}

-(void)bind {
	
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
}

-(void)dealloc {
	self.datasource = nil;
	
	[super dealloc];
}

@end
