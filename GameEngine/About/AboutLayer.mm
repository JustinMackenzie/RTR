//
//  AboutLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-23.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "AboutLayer.h"

@implementation AboutLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    /* Background of menu. */
    CCSprite *backgroundImage = [CCSprite spriteWithFile:@"AboutScreenBackground.png"];
    backgroundImage.position = ccp(screenSize.width / 2, screenSize.height / 2);
    
    [self addChild:backgroundImage];
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"Back.png" selectedImage:nil target:_inputHandler selector:@selector(BackPressed:)];
    
    CCMenu *aboutMenu = [CCMenu menuWithItems:backButton, nil];
    [aboutMenu alignItemsVerticallyWithPadding:screenSize.height * 0.05f];
    [aboutMenu setPosition:ccp(screenSize.width * 0.075f, screenSize.height * 0.9f)];
    
    [self addChild:aboutMenu];
}

@end
