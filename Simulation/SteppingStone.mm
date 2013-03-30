//
//  SteppingStone.m
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-02-24.
//
//

#import "SteppingStone.h"

@implementation SteppingStone

-(id)initWithWorld:(b2World *)world
{
    self = [super init];
    
    if(self)
    {
        _world = world;
    }
    
    return self;
}

-(void)createPlatformsInWorld:(b2World *)theWorld S1:(CCSprite*)S1 size:(int)size location:(CGPoint)location Speed:(float)speed{
    
    PSize = size;
    //PLocation = location;
   
    platforms = [self createBox:theWorld withSprite:(S1) location:ccp(location.x, location.y) size:size];

        //platforms -> SetLinearVelocity(b2Vec2(-6.0f,0.0f));
    
    platforms -> SetLinearVelocity(b2Vec2(-1*speed,0.0f));
    
}


-(void) updateMovement:(float)ticker{
    
     //r = arc4random() % 9;
    

         pos =  platforms -> GetPosition();
        /*platforms -> SetLinearVelocity(b2Vec2(-1*speed,0.0f));
        if (pos.x < -(PSize)){
            platforms -> SetTransform(b2Vec2(location.x,location.y), 0);
        }*/
    

}

-(CGPoint)getPosition
{
    return ccp(pos.x, pos.y);
}

-(bool)isOffScreen
{
    if((pos.x + _size.width / 2) < 0)
    {
        return true;
    }
    if((pos.y + _size.height / 2) < 0)
    {
        return true;
    }
    
    return false;
}




-(b2Body*) createBox:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location size:(int)size {
    
    b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody;
    bodyDef.position = b2Vec2(location.x, location.y);
    bodyDef.allowSleep = false;
    b2Body *body = newWorld->CreateBody(&bodyDef);
    body -> SetUserData(withSprite);
    
    b2PolygonShape shape;
    shape.SetAsBox(0.9*size, 0.3);
    _size.width = 0.9 * size;
    _size.height = 0.3;
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &shape;
    fixtureDef.isSensor = true;
    
    body->CreateFixture(&fixtureDef);
    return body;
}


@end
