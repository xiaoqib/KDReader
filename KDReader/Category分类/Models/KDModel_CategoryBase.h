//
//  KDModel_CategoryBase.h
//
//  Created by   on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface KDModel_CategoryBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *previews;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
