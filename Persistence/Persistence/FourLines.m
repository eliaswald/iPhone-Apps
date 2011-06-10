//
//  FourLines.m
//  Persistence
//
//  Created by Elias Wald on 6/10/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "FourLines.h"


@implementation FourLines
@synthesize field1, field2, field3, field4;
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:field1 forKey:kField1Key];
    [aCoder encodeObject:field2 forKey:kField2Key];
    [aCoder encodeObject:field3 forKey:kField3Key];
    [aCoder encodeObject:field4 forKey:kField4Key];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        self.field1 = [aDecoder decodeObjectForKey:kField1Key];
        self.field2 = [aDecoder decodeObjectForKey:kField2Key];
        self.field3 = [aDecoder decodeObjectForKey:kField3Key];
        self.field4 = [aDecoder decodeObjectForKey:kField4Key];
    }
    return self;
}

#pragma mark - NSCopying

- (id) copyWithZone:(NSZone *)zone
{
    FourLines *copy = [[[self class] allocWithZone:zone] init];
    copy.field1 = [[self.field1 copy] autorelease];
    copy.field2 = [[self.field2 copy] autorelease];
    copy.field3 = [[self.field3 copy] autorelease];
    copy.field4 = [[self.field4 copy] autorelease];
    
    return copy;
}

@end
