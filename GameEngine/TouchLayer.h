//
//  TouchLayer.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "cocos2d.h"
#import "InputHandler.h"

@interface TouchLayer : CCLayerColor
{
    id<InputHandler> _inputHandler;
}

-(id)initWithInputHandler:(id<InputHandler>)inputHandler;
-(void)BuildLayer;

@end
