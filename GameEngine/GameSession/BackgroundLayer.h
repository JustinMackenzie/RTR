//
//  BackgroundLayer.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "TouchLayer.h"
#import "Updatable.h"

@interface BackgroundLayer : TouchLayer <Updatable>
{
    CCSprite *backgroundImage1;
    CCSprite *backgroundImage2;
    float _scrollSpeed;
    CGSize _screenSize;
}

@end
