@interface DateUtil : NSObject {
	
}

+(NSDate *)dateWithString:(NSString *)date format:(NSString *)format locale:(NSLocale *)locale;
+(NSDate *)dateWithString:(NSString *)date format:(NSString *)format;

+(NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;
+(NSString *)stringWithDate:(NSDate *)date format:(NSString *)format locale:(NSLocale *)locale;

+(BOOL)isToday:(NSDate *)date;

+(NSDate *)addDays:(NSDate *)date days:(int)days;
+(NSDate *)addHours:(NSDate *)date hours:(int)hours;
+(NSDate *)addMinutes:(NSDate *)date minutes:(int)minutes;

@end