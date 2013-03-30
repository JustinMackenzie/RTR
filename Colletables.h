//
//  Colletables.h
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-03-12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "PhysicalMan.h"

@interface Collectables : NSObject {
    b2World *_world;
    b2Body *burgers;
    b2Vec2 pos;
    //int r;
    //CGPoint CLocation;
    bool hit;
}

-(bool)Hit;

-(CGPoint)getPosition;

-(id)initWithWorld:(b2World *)world;

-(void)createCollectablesInWorld:(b2World*)theWorld S1:(CCSprite*)S1 location:(CGPoint)location speed:(float)speed;

-(void)updateMovementSpeed:(float)dt;

-(b2Body*)createCollectableBox:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location size:(CGSize)size;

@end
