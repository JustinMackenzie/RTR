//
//  BackgroundLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "BackgroundLayer.h"
#import "Simulator.h"
#import "SessionManager.h"

@implementation BackgroundLayer

-(void)BuildLayer
{
    _screenSize = [[CCDirector sharedDirector]winSize];
    
    /* Background of menu. */
    backgroundImage1 = [[CCSprite spriteWithFile:@"Background.png"] retain];
    backgroundImage1.position = ccp(_screenSize.width / 2, _screenSize.height / 2);
    
    backgroundImage2 = [[CCSprite spriteWithFile:@"Background.png"] retain];
    backgroundImage2.position = ccp(_screenSize.width + _screenSize.width / 2, _screenSize.height/2);
    
    [self addChild:backgroundImage1];
    [self addChild:backgroundImage2];
    
    [backgroundImage2 setFlipX:YES];
    
    _scrollSpeed = [[[Simulator SharedSimulator]getSessionManager] getScrollSpeed] * 10.0f;
}

-(void)update:(float)dt
{
    float scrolling = _scrollSpeed * dt;
    
    [backgroundImage1 setPosition:ccpAdd(backgroundImage1.position, ccp(-1.0f * scrolling, 0))];
    [backgroundImage2 setPosition:ccpAdd(backgroundImage2.position, ccp(-1.0f * scrolling, 0))];
    
    if(backgroundImage1.position.x < -1.0f * _screenSize.width/2)
    {
        [backgroundImage1 setPosition:ccpAdd(backgroundImage1.position, ccp(2.0f * _screenSize.width, 0))];
    }
    
    if(backgroundImage2.position.x < -1.0f * _screenSize.width/2)
    {
        [backgroundImage2 setPosition:ccpAdd(backgroundImage2.position, ccp(2.0f * _screenSize.width, 0))];
    }
}

-(void)dealloc
{
    [backgroundImage1 release];
    [backgroundImage2 release];
    [super dealloc];
}

@end
