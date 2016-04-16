//
//  TeacherProfile.m
//  HackathonWix
//
//  Created by Nir Gofman on 15/04/2016.
//  Copyright © 2016 Nir Gofman. All rights reserved.
//

#import "TeacherProfile.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TeacherProfile (){
    
    CGFloat width;
    CGFloat height;
    UIView *backdrop;
    NSString *checkingDidAppear;
    NSArray *data;
}

@end

@implementation TeacherProfile
@synthesize profileImg, scroller, studentView, scrollerStudent, teacherId;
@synthesize loadingView, spinner, BlackLoadView;

-(NSString *)DataFromUrl:(NSString *)theUrl{
    NSData *DataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:[theUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSString *Result = [[NSString alloc]initWithData:DataURL encoding:NSUTF8StringEncoding];
    return Result;
}
-(void) myTask{
    
        
            NSString *res = [self DataFromUrl:[NSString stringWithFormat:@"http://squidwurd.rapidapi.io/fetchone?action=getTeacher&id=%@", teacherId]];
            NSLog(@"%@", [NSString stringWithFormat:@"http://squidwurd.rapidapi.io/fetchone?action=getTeacher&id=%@", teacherId]);
        NSLog(@"%@", res);
            data = [res componentsSeparatedByString:@"---"];
        
    _cost.text = [NSString stringWithFormat:@"%@₪",[data objectAtIndex:5]];
        _sumStdLbl.text = [NSString stringWithFormat:@"%i", [[data objectAtIndex:1] intValue]+13];
    _cityLbl.text = [data objectAtIndex:2];
    _name.text = [data objectAtIndex:0];
    _rr.text = [NSString stringWithFormat:@"(%@)", [data objectAtIndex:3]];
        _age.text = [NSString stringWithFormat:@"גיל %@",[data objectAtIndex:1]];
    
    NSLog(@"img: %@", [data objectAtIndex:7]);
    NSURL *url1 = [NSURL URLWithString:[data objectAtIndex:7]];
    NSData *data2 = [[NSData alloc] initWithContentsOfURL:url1];
    UIImage *tmpImage = [[UIImage alloc] initWithData:data2];
    profileImg.image = tmpImage;
    
        UIImageView *star1;
        UIImageView *star2;
        UIImageView *star3;
        UIImageView *star4;
        UIImageView *star5;
        if([[data objectAtIndex:4] isEqual:@"5.0"]){
            star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star1.frame = CGRectMake(82, 280, 38, 38);
            star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star2.frame = CGRectMake(82+37, 280, 38, 38);
            star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star3.frame = CGRectMake(82+(37)*2, 280, 38, 38);
            star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star4.frame = CGRectMake(82+(37)*3, 280, 38, 38);
            star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star5.frame = CGRectMake(82+(37)*4, 280, 38, 38);
        }else if([[data objectAtIndex:4] isEqual:@"4.0"]){
            star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star1.frame = CGRectMake(82, 280, 38, 38);
            star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star2.frame = CGRectMake(82+37, 280, 38, 38);
            star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star3.frame = CGRectMake(82+(37)*2, 280, 38, 38);
            star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star4.frame = CGRectMake(82+(37)*3, 280, 38, 38);
            star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star5.frame = CGRectMake(82+(37)*4, 280, 38, 38);
        }else if([[data objectAtIndex:4] isEqual:@"3.0"]){
            star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star1.frame = CGRectMake(82, 280, 38, 38);
            star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star2.frame = CGRectMake(82+37, 280, 38, 38);
            star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star3.frame = CGRectMake(82+(37)*2, 280, 38, 38);
            star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star4.frame = CGRectMake(82+(37)*3, 280, 38, 38);
            star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star5.frame = CGRectMake(82+(37)*4, 280, 38, 38);
        }else if([[data objectAtIndex:4] isEqual:@"2.0"]){
            star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star1.frame = CGRectMake(82, 280, 38, 38);
            star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star2.frame = CGRectMake(82+37, 280, 38, 38);
            star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star3.frame = CGRectMake(82+(37)*2, 280, 38, 38);
            star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star4.frame = CGRectMake(82+(37)*3, 280, 38, 38);
            star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star5.frame = CGRectMake(82+(37)*4, 280, 38, 38);
        }else if([[data objectAtIndex:4] isEqual:@"1.0"]){
            star1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarY.png"]];
            star1.frame = CGRectMake(82, 280, 38, 38);
            star2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star2.frame = CGRectMake(82+37, 280, 38, 38);
            star3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star3.frame = CGRectMake(82+(37)*2, 280, 38, 38);
            star4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star4.frame = CGRectMake(82+(37)*3, 280, 38, 38);
            star5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"StarG.png"]];
            star5.frame = CGRectMake(82+(37)*4, 280, 38, 38);
        }
        
        
        [scroller addSubview:star1];
        [scroller addSubview:star2];
        [scroller addSubview:star3];
        [scroller addSubview:star4];
        [scroller addSubview:star5];
          //  formsTitles = [[data objectAtIndex:1] componentsSeparatedByString:@"---"];
          //  NSArray *formsSecs = [[data objectAtIndex:0] componentsSeparatedByString:@"---"];
          //  NSArray *formTypes = [[data objectAtIndex:2] componentsSeparatedByString:@"---"];
        

    
    checkingDidAppear = @"yes";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", teacherId);
    checkingDidAppear = @"";
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    
    profileImg.layer.masksToBounds = YES;
    profileImg.layer.cornerRadius = 40;
    
   
    
    scroller.contentSize = CGSizeMake(width, height*1.6);
    
    UIImageView *cm = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Speech Bubble-96.png"]];
    cm.frame = CGRectMake(width-46, 744, 20, 20);
    [scroller addSubview:cm];
    
    UILabel *commentsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 740, width-50, 30)];
    commentsLabel.text = @"תגובות ובקורות";
    commentsLabel.font = [UIFont fontWithName:@"AlmoniTzar-400" size:17];
    commentsLabel.textColor = UIColorFromRGB(0x333333);
    commentsLabel.textAlignment = NSTextAlignmentRight;
    [scroller addSubview:commentsLabel];
    
    UIView *border2 = [[UIView alloc] initWithFrame:CGRectMake(0, 767, width, 1)];
    border2.backgroundColor = UIColorFromRGB(0xE9E9E9);
    [scroller addSubview:border2];
    
    
    NSArray *msgs = @[@"מורה מעולה! מגיב טוב לטעויות ונותן יחס אישי מדהים.",
                      @"מורה דואג ואכפתי, אמליץ להפחית במחיר אך חוץ מזה תודה רבה.",
                      @"אין אין על יוסי",
                      @"למה המחיר כל כך גבוה, אני מכיר אחד יותר זול יותר קרוב."];
    NSArray *befores = @[@"אתמול",
                      @"לפני 3 שבועות",
                      @"לפני חודש",
                      @"לפני חודש וחצי"];
    for(int i=0;i<[msgs count];i++){
        UIView *commentBox = [[UIView alloc] initWithFrame:CGRectMake(0, 770+70*i, width, 70)];
        
        UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, 65, width, 1)];
        border.backgroundColor = UIColorFromRGB(0xE9E9E9);
        
        UILabel *anonyStu = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, width-13, 20)];
        anonyStu.text = @"תלמיד אנונימי";
        anonyStu.font = [UIFont fontWithName:@"AlmoniTzar-400" size:17];
        anonyStu.textColor = UIColorFromRGB(0x333333);
        anonyStu.textAlignment = NSTextAlignmentRight;
        [commentBox addSubview:anonyStu];
        
        UITextView *anonyMsg = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, width-10, 50-3)];
        anonyMsg.text = [msgs objectAtIndex:i];
        anonyMsg.font = [UIFont fontWithName:@"AlmoniTzar-300" size:17];
        anonyMsg.textColor = UIColorFromRGB(0x555555);
        anonyMsg.textAlignment = NSTextAlignmentRight;
        [commentBox addSubview:anonyMsg];
        
        [commentBox addSubview:border];
        
        UILabel *beform = [[UILabel alloc] initWithFrame:CGRectMake(6, 45, width-13, 20)];
        beform.text = [befores objectAtIndex:i];
        beform.font = [UIFont fontWithName:@"AlmoniTzar-300" size:14];
        beform.textColor = UIColorFromRGB(0xB2B2B2);
        beform.textAlignment = NSTextAlignmentLeft;
        [commentBox addSubview:beform];
        
        [scroller addSubview:commentBox];
    }
    
    backdrop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    backdrop.backgroundColor = UIColorFromRGB(0x000000);
    backdrop.alpha = 0.7;
   // studentView = [[UIView alloc] initWithFrame:CGRectMake(20, height/2-200, width-40, 400)];
    studentView.layer.masksToBounds = YES;
    studentView.layer.cornerRadius = 5;
    studentView.backgroundColor = UIColorFromRGB(0xffffff);
    studentView.layer.shadowOpacity = 0.3;
    studentView.layer.shadowRadius = 3;
    studentView.layer.shadowColor = [UIColor blackColor].CGColor;
    studentView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    
    [self.view addSubview:backdrop];
    [self.view bringSubviewToFront:studentView];
    
    backdrop.hidden = YES;
    NSLog(@"%@", teacherId);
    
}
-(void) viewWillAppear:(BOOL)animated{
    spinner.transform = CGAffineTransformMakeScale(1.5, 1.5);
    [spinner startAnimating];
}
-(void) viewDidAppear:(BOOL)animated{
    if([checkingDidAppear isEqual:@""]){
        loadingView.hidden = NO;
        [self myTask];
        BlackLoadView.hidden = YES;
        loadingView.hidden = YES;
        
        [spinner stopAnimating];
    }
    
    NSLog(@"%@", teacherId);
}

-(IBAction) closeStudentView:(id)sender{
    studentView.hidden = YES;
    backdrop.hidden = YES;
}

-(IBAction) openStudentView:(id)sender{
    studentView.hidden = NO;
    backdrop.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
