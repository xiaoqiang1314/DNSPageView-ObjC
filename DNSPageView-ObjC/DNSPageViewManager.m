//
//  DNSPageViewManager.m
//  DNSPageView-ObjC
//
//  Created by Daniels Lau on 2018/9/25.
//  Copyright © 2018年 Daniels. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "DNSPageViewManager.h"
#import "DNSPageTitleView.h"
#import "DNSPageContentView.h"

@interface DNSPageViewManager ()

@property (nonatomic, strong) DNSPageStyle *style;

@property (nonatomic, strong) NSArray<NSString *> *titles;

@property (nonatomic, strong) NSArray<UIViewController *> *childViewControllers;

@property (nonatomic, assign) NSInteger startIndex;

@property (nonatomic, strong) DNSPageTitleView *titleView;

@property (nonatomic, strong) DNSPageContentView *contentView;

@end

@implementation DNSPageViewManager

- (DNSPageTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[DNSPageTitleView alloc] initWithFrame:CGRectZero style:self.style titles:self.titles currentIndex:self.startIndex];
    }
    return _titleView;
}

- (DNSPageContentView *)contentView {
    if (!_contentView) {
        _contentView = [[DNSPageContentView alloc] initWithFrame:CGRectZero style:self.style childViewControllers:self.childViewControllers startIndex:self.startIndex];
    }
    return _contentView;
}

- (instancetype)initWithStyle:(DNSPageStyle *)style titles:(NSArray<NSString *> *)titles childViewControllers:(NSArray<UIViewController *> *)childViewControllers startIndex:(NSInteger)startIndex {
    self = [super init];
    if (self) {
        self.style = style;
        self.titles = titles;
        self.childViewControllers = childViewControllers;
        self.startIndex = startIndex;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.titleView.delegate = self.contentView;
    self.contentView.delegate = self.titleView;
}

@end
