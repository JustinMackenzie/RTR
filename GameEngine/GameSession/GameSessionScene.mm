//
//  GameSessionScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameSessionScene.h"
#import "HUDLayer.h"
#import "WorldLayer.h"
#import "BackgroundLayer.h"

@implementation GameSessionScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _hudLayer = [[[HUDLayer alloc]initWithInputHandler:inputHandler] retain];
        _worldLayer = [[[WorldLayer alloc]init] retain];
        _backgroundLayer = [[[BackgroundLayer alloc]initWithInputHandler:inputHandler] retain];
        
        [self addChild:_backgroundLayer z:0];
        [self addChild:_worldLayer z:2];
        [self addChild:_hudLayer z:3];
    }
    
    return self;
}

-(WorldLayer *)getWorldLayer
{
    return _worldLayer;
}

-(HUDLayer *)getHudLayer
{
    return _hudLayer;
}

-(BackgroundLayer *)getBackgroundLayer
{
    return _backgroundLayer;
}

-(void)dealloc
{
    [_hudLayer release];
    [_worldLayer release];
    [_backgroundLayer release];
    [super dealloc];
}

@end
