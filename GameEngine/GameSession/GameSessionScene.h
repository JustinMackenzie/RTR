//
//  GameSessionScene.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameScene.h"

@class HUDLayer;
@class WorldLayer;
@class BackgroundLayer;
@class HelloWorldLayer;

@interface GameSessionScene : GameScene
{
    HUDLayer *_hudLayer;
    WorldLayer *_worldLayer;
    BackgroundLayer *_backgroundLayer;
}

-(WorldLayer *)getWorldLayer;
-(HUDLayer *)getHudLayer;
-(BackgroundLayer *)getBackgroundLayer;

@end
