//
//  SettingsScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "SettingsScene.h"
#import "SettingsLayer.h"

@implementation SettingsScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _settingsLayer = [[SettingsLayer alloc]initWithInputHandler:inputHandler];
        
        [self addChild:_settingsLayer];
    }
    
    return self;
}

-(SettingsLayer *)GetSettingsLayer
{
    return _settingsLayer;
}

-(void)dealloc
{
    [_settingsLayer release];
    [super dealloc];
}

@end
