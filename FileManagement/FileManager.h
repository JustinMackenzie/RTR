//
//  FileManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PropertyListReader.h"
#import "PropertyList.h"

@interface FileManager : NSObject
{
    PropertyListReader *_reader;
}

@end
