//
//  SettingsLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-24.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "SettingsLayer.h"
#import "Simulator.h"

@implementation SettingsLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    /* Background of menu. */
    CCSprite *backgroundImage = [CCSprite spriteWithFile:@"Background.png"];
    backgroundImage.position = ccp(screenSize.width / 2, screenSize.height / 2);
    
    [self addChild:backgroundImage];
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"Back.png" selectedImage:nil target:_inputHandler selector:@selector(BackPressed:)];
    
    CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
    [menu alignItemsVerticallyWithPadding:screenSize.height * 0.05f];
    [menu setPosition:ccp(screenSize.width * 0.075f, screenSize.height * 0.9f)];
    
    NSString *difficulty = [[Simulator SharedSimulator]Difficulty];
    
    if([difficulty isEqualToString:@"Easy"])
    {
        easyButton = [CCMenuItemImage itemWithNormalImage:@"EasySelected.png" selectedImage:nil target:_inputHandler selector:@selector(EasyPressed:)];
    }
    else
    {
        easyButton = [CCMenuItemImage itemWithNormalImage:@"Easy.png" selectedImage:nil target:_inputHandler selector:@selector(EasyPressed:)];
    }
    
    if([difficulty isEqualToString:@"Medium"])
    {
        mediumButton = [CCMenuItemImage itemWithNormalImage:@"MediumSelected.png" selectedImage:nil target:_inputHandler selector:@selector(MediumPressed:)];
    }
    else
    {
        mediumButton = [CCMenuItemImage itemWithNormalImage:@"Medium.png" selectedImage:nil target:_inputHandler selector:@selector(MediumPressed:)];
    }
    
    if([difficulty isEqualToString:@"Hard"])
    {
         hardButton = [CCMenuItemImage itemWithNormalImage:@"HardSelected.png" selectedImage:nil target:_inputHandler selector:@selector(HardPressed:)];
    }
    else
    {
         hardButton = [CCMenuItemImage itemWithNormalImage:@"Hard.png" selectedImage:nil target:_inputHandler selector:@selector(HardPressed:)];
    }
    
    CCMenu *settingsMenu = [CCMenu menuWithItems:easyButton, mediumButton, hardButton, nil];
    [settingsMenu alignItemsHorizontallyWithPadding:screenSize.width * 0.05f];
    [settingsMenu setPosition:ccp(screenSize.width/2,screenSize.height/2)];
    
    [self addChild:menu];
    [self addChild:settingsMenu];
}

-(void)SelectedButton:(NSString *)difficulty
{
    if([difficulty isEqualToString:@"Easy"])
    {
        easyButton = [CCMenuItemImage itemWithNormalImage:@"EasySelected.png" selectedImage:nil target:_inputHandler selector:@selector(EasyPressed:)];
    }
    else
    {
        easyButton = [CCMenuItemImage itemWithNormalImage:@"Easy.png" selectedImage:nil target:_inputHandler selector:@selector(EasyPressed:)];
    }
    
    if([difficulty isEqualToString:@"Medium"])
    {
        mediumButton = [CCMenuItemImage itemWithNormalImage:@"MediumSelected.png" selectedImage:nil target:_inputHandler selector:@selector(MediumPressed:)];
    }
    else
    {
        mediumButton = [CCMenuItemImage itemWithNormalImage:@"Medium.png" selectedImage:nil target:_inputHandler selector:@selector(MediumPressed:)];
    }
    
    if([difficulty isEqualToString:@"Hard"])
    {
        hardButton = [CCMenuItemImage itemWithNormalImage:@"HardSelected.png" selectedImage:nil target:_inputHandler selector:@selector(HardPressed:)];
    }
    else
    {
        hardButton = [CCMenuItemImage itemWithNormalImage:@"Hard.png" selectedImage:nil target:_inputHandler selector:@selector(HardPressed:)];
    }
}

@end
