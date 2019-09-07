////  ScrollWithImage.m//  UI_PhotoClass////  Created by lgy on 15/11/7.//  Copyright © 2015年 zhw. All rights reserved.//#import "ScrollWithImage.h"#import "UIImageView+WebCache.h"@interface ScrollWithImage ()<UIScrollViewDelegate>@property (nonatomic, retain) UIScrollView *scrollView;@property (nonatomic, retain) NSMutableArray *array;@property (nonatomic, retain) UIPageControl *page;@property (nonatomic, retain) NSTimer *timer;@property (nonatomic, retain) NSMutableArray *otherArray;@property (nonatomic, retain) UIButton *button;@property (nonatomic, retain) NSString *chuanString; @end@implementation ScrollWithImage//从写初始化- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array withTimer:(NSTimeInterval)timeinterval withOtherArray:(NSArray *)otherArray{    self = [super initWithFrame:frame];    if (self) {        _array = [[NSMutableArray alloc] initWithArray:array];        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeinterval target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];        if (otherArray) {            _otherArray = [[NSMutableArray alloc]initWithArray:otherArray];        }        [self creatScrollView];    }    //NSLog(@"轮播图数组值%@", array);    return self;}//私有初始化方法- (void)creatScrollView {    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];    _scrollView.delegate = self;    _scrollView.pagingEnabled = YES;    _scrollView.showsHorizontalScrollIndicator = NO;//隐藏滚动条    [self addSubview:_scrollView];    _scrollView.bounces = NO;    //    设置偏移量    _scrollView.contentSize = CGSizeMake(self.frame.size.width * _array.count, 0);        if (_otherArray) {        if (_array.count) {        [_array insertObject:[self.array lastObject] atIndex:0];        [_array addObject:self.array[1]];        [_otherArray insertObject:[self.otherArray lastObject] atIndex:0];        [_otherArray addObject:self.otherArray[1]];        for (int i = 0; i < _array.count; i++) {            //判断数组里面的元素是不是字符串类型            if ([_array[i]isKindOfClass:[NSString class]]) {                UIImageView *imageView = [[UIImageView alloc] init];                imageView.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);                //  正常//                imageView.image = [UIImage imageNamed:_array[i]];                // 网络                [imageView sd_setImageWithURL:[NSURL URLWithString:_array[i]]];                imageView.contentMode = UIViewContentModeScaleAspectFill;                imageView.clipsToBounds = YES;//超越父视图边界以外不显示。                [_scrollView addSubview:imageView];                                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];                [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];                button.frame=CGRectMake(i * self.frame.size.width, 0, self.frame.size.width-10, self.frame.size.height);                button.tag = 1000 + i;                [_scrollView addSubview:button];                //NSLog(@"跳地址%@", _chuanString);            }                    }    }    }else{        [_array insertObject:[self.array lastObject] atIndex:0];        [_array addObject:self.array[1]];        [_otherArray insertObject:[self.otherArray lastObject] atIndex:0];        [_otherArray addObject:self.otherArray[1]];        for (int i = 0; i < _array.count; i++) {            //        判断数组里面的元素是不是字符串类型            if ([_array[i]isKindOfClass:[NSString class]]) {                UIImageView *imageView = [[UIImageView alloc] init];                imageView.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);                //  正常                //  imageView.image = [UIImage imageNamed:_array[i]];                // 网络                [imageView sd_setImageWithURL:[NSURL URLWithString:_array[i]]placeholderImage:[UIImage imageNamed:@"nonPic"]];                imageView.contentMode = UIViewContentModeScaleAspectFill;                imageView.clipsToBounds = YES;//超越父视图边界以外不显示。                [_scrollView addSubview:imageView];}}    }        //滑动小点    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(self.frame.size.width-250,self.frame.size.height - 25, self.frame.size.width, 30)];    [self addSubview:_page];    _page.numberOfPages = _array.count - 2;    [_page addTarget:self action:@selector(pageChang) forControlEvents:UIControlEventValueChanged];}//实现循环播放- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {    if (scrollView.contentOffset.x == scrollView.frame.size.width * (_page.numberOfPages + 1)) {        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);            }    else if (scrollView.contentOffset.x == 0) {        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width * _page.numberOfPages, 0);    }    if (scrollView.contentOffset.x / scrollView.frame.size.width < _page.numberOfPages) {        _page.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;    }else {        _page.currentPage = 0;    }    }//下标跟随- (void)pageChang {    [_scrollView setContentOffset:CGPointMake(self.frame.size.width * _page.currentPage, 0) animated:YES];    //NSLog(@"%ld", _page.currentPage);}//定时器- (void)timeChange:(NSTimeInterval)timer {    CATransition *animation = [CATransition animation];    animation.duration = 1;    [animation setType:@"rippleEffect"];    animation.subtype = kCATransitionFromRight;    [self.scrollView.layer addAnimation:animation forKey:nil];    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + self.frame.size.width, 0) animated:YES];    if (_scrollView.contentOffset.x > _scrollView.frame.size.width * _page.numberOfPages ) {        [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width , 0)];    }    if (_page.currentPage == _page.numberOfPages - 1) {        _page.currentPage = 0;    }else {        _page.currentPage++;    }}//  button  向外传值- (void)buttonPress:(UIButton *)sender{        _chuanString = [[NSString alloc]init];    _chuanString = _otherArray[sender.tag - 1000];    [self.delegate loopUrl:_chuanString];    //NSLog(@"%@", _chuanString);    }/*// Only override drawRect: if you perform custom drawing.// An empty implementation adversely affects performance during animation.- (void)drawRect:(CGRect)rect {    // Drawing code}*/@end