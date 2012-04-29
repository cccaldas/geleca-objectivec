#import "DateUtil.h"

@implementation DateUtil

+(NSDate *)dateWithString:(NSString *)date format:(NSString *)format {
	return [DateUtil dateWithString:date format:format locale:nil];
}

+(NSDate *)dateWithString:(NSString *)date format:(NSString *)format locale:(NSLocale *)locale {
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	//NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:format];
	if(locale != nil)
		[formatter setLocale:locale];
	
	return [formatter dateFromString:date];
}

+(NSString *)stringWithDate:(NSDate *)date format:(NSString *)format {
	return [DateUtil stringWithDate:date format:format locale:nil];
}

+(NSString *)stringWithDate:(NSDate *)date format:(NSString *)format locale:(NSLocale *)locale {
	if(date == nil)
		return @"";
	
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	//NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:format];
	if(locale != nil)
		[formatter setLocale:locale];
	
	
	NSString *dateString = [formatter stringFromDate:date];
	//[formatter release];
	
	return dateString;
	//return [formatter stringFromDate:date];
}

+(BOOL)isToday:(NSDate *)date {
	NSDate *today = [[[NSDate alloc] init] autorelease];
	//NSDate *today = [[NSDate alloc] init];
	return [[DateUtil stringWithDate:today format:@"yyyyMMdd"] isEqualToString:[DateUtil stringWithDate:date format:@"yyyyMMdd"]];
}

+(NSDate *)addDays:(NSDate *)date days:(int)days {
	return [date dateByAddingTimeInterval:60 * 60 * 24 * days];
}

+(NSDate *)addHours:(NSDate *)date hours:(int)hours {
	return [date dateByAddingTimeInterval:60 * 60 * hours];
}

+(NSDate *)addMinutes:(NSDate *)date minutes:(int)minutes {
	return [date dateByAddingTimeInterval:60 * minutes];
}

@end