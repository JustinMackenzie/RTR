//
//  HowLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-24.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "HowLayer.h"

@implementation HowLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    /* Background of menu. */
    CCSprite *backgroundImage = [CCSprite spriteWithFile:@"HowScreenBackground.png"];
    backgroundImage.position = ccp(screenSize.width / 2, screenSize.height / 2);
    
    [self addChild:backgroundImage];
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"Back.png" selectedImage:nil target:_inputHandler selector:@selector(BackPressed:)];
    
    CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
    [menu alignItemsVerticallyWithPadding:screenSize.height * 0.05f];
    [menu setPosition:ccp(screenSize.width * 0.075f, screenSize.height * 0.9f)];
    
    [self addChild:menu];
}

@end
