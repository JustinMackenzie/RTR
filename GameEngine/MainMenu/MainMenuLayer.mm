//
//  MainMenuLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer

-(void)BuildLayer
{
    
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    /* Background of menu. */
    CCSprite *backgroundImage = [CCSprite spriteWithFile:@"Background.png"];
    backgroundImage.position = ccp(screenSize.width / 2, screenSize.height / 2);
    
    [self addChild:backgroundImage];
    
    CCSprite *rtr = [CCSprite spriteWithFile:@"RunTubbyRun.png"];
    rtr.position = ccp(screenSize.width * 0.2f, screenSize.height * 0.6f);
    
    [self addChild:rtr];
    
    CCMenuItemImage *playButton = [CCMenuItemImage itemWithNormalImage:@"Play.png" selectedImage:nil target:_inputHandler selector:@selector(PlayPressed:)];
    
    CCMenuItemImage *howButton = [CCMenuItemImage itemWithNormalImage:@"How.png" selectedImage:nil target:_inputHandler selector:@selector(HowPressed:)];
    
    CCMenuItemImage *settingsButton = [CCMenuItemImage itemWithNormalImage:@"Settings.png" selectedImage:nil target:_inputHandler selector:@selector(SettingsPressed:)];
    
    CCMenuItemImage *aboutButton = [CCMenuItemImage itemWithNormalImage:@"About.png" selectedImage:nil target:_inputHandler selector:@selector(AboutPressed:)];
    
    CCMenu *mainMenu = [CCMenu menuWithItems:playButton, howButton, settingsButton, aboutButton, nil];
    [mainMenu alignItemsVerticallyWithPadding:screenSize.height * 0.075f];
    [mainMenu setPosition:ccp(screenSize.width * 0.75f, screenSize.height * 0.45f)];
    
    [self addChild:mainMenu];
}

@end
