//
//  TestModel.h
//  Manager封装
//
//  Created by 翟旭博 on 2022/10/8.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : JSONModel

@property (nonatomic, assign) int status;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *latest;

@end


NS_ASSUME_NONNULL_END
