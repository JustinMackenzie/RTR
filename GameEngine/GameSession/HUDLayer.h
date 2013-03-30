//
//  HUDLayer.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "TouchLayer.h"

@interface HUDLayer : TouchLayer
{
    CCLabelTTF *_score;
}

-(void)SetScoreString:(int)score;

@end
