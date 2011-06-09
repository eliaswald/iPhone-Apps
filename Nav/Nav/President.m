//
//  President.m
//  Nav
//
//  Created by Elias Wald on 6/9/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "President.h"


@implementation President
@synthesize number, name, toYear, fromYear, party;

-(void)dealloc {
    [name release];
    [fromYear release];
    [toYear release];
    [party release];
    [super dealloc];
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.number forKey:kPresidentNumberKey];
    [aCoder encodeObject:self.name forKey:kPresidentNameKey];
    [aCoder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [aCoder encodeObject:self.toYear forKey:kPresidentToKey];
    [aCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.number = [aDecoder decodeIntForKey:kPresidentNumberKey];
        self.name = [aDecoder decodeObjectForKey:kPresidentNameKey];
        self.party = [aDecoder decodeObjectForKey:kPresidentPartyKey];
        self.toYear = [aDecoder decodeObjectForKey:kPresidentToKey];
        self.fromYear = [aDecoder decodeObjectForKey:kPresidentFromKey];
    }
    return self;
}

@end
