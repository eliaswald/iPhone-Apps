//
//  NavAppDelegate_iPhone.m
//  Nav
//
//  Created by Elias Wald on 6/8/11.
//  Copyright 2011 Brown University. All rights reserved.
//

#import "NavAppDelegate_iPhone.h"

@implementation NavAppDelegate_iPhone
@synthesize navController;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [window addSubview: navController.view];
    [super applicationDidFinishLaunching:application];
}

- (void)dealloc
{
    [navController release];
	[super dealloc];
}

@end
