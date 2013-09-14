//  CountryStateHandler.m
//  Created by Iftekhar Qurashi on 1/1/13.

#import "IQCountryStateHandler.h"

static NSDictionary *countryDictionary;
static NSDictionary *stateDictionary;

@implementation IQCountryStateHandler

+(void)initialize
{
    [super initialize];
    countryDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"Country" ofType: @"plist"]];
    stateDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"State" ofType: @"plist"]];
}

+(NSArray*)countries
{
    return [[countryDictionary allValues] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

+(NSArray*)statesForCountry:(NSString*)country
{
    return [[stateDictionary objectForKey:country] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

@end
