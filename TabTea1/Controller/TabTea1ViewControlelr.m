//
//  TabTea1ViewControlelr.m
//  GraduateProj
//
//  Created by jay on 2018/11/28.
//  Copyright © 2018 mlg. All rights reserved.
//

#import "TabTea1ViewControlelr.h"
#import "DVPieChartTeacher.h"
#import "DVFoodPieModel.h"
#import "InfoViewController.h"


#define k_MainBoundsWidth [UIScreen mainScreen].bounds.size.width

@interface TabTea1ViewControlelr()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;
@property (nonatomic,strong)NSArray *nameArr;//名字
@property (nonatomic,strong)NSArray *numberArr;//学号
@property (nonatomic,strong)NSArray *gradeArr;//等级
@property (nonatomic,strong)NSArray *scoreArr;//分数

@end

@implementation TabTea1ViewControlelr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    [self setUI];
   
}
- (void)setData{
    _nameArr = @[@"宋 江",@"卢俊义",@"关 胜",@"秦 明",@"呼延灼",@"李 应",@"张 清",@"徐 宁",@"戴 宗",@"刘 唐",@"穆 弘",@"扬 雄",@"燕 青",@"朱 武",@"孙 立",@"郝思文",@"韩 滔",@"邓 飞",@"杨 林",@"皇甫端"];
    _numberArr = @[@"2017534001",@"2017534002",@"2017534003",@"2017534004",@"2017534005",@"2017534006",@"2017534007",@"2017534008",@"2017534009",@"2017534010",@"2017534011",@"2017534012",@"2017534013",@"2017534014",@"2017534015",@"2017534016",@"2017534017",@"2017534018",@"2017534019",@"2017534020"];
    _gradeArr = @[@"优秀",@"良好",@"良好",@"及格",@"优秀",@"优秀",@"良好",@"及格",@"不及格",@"良好",@"及格",@"良好",@"优秀",@"及格",@"良好",@"不及格",@"优秀",@"良好",@"良好",@"良好"];
    _scoreArr = @[@"92",@"83",@"84",@"70",@"95",@"94",@"87",@"66",@"58",@"84",@"97",@"60",@"78",@"57",@"90",@"89",@"88",@"86",@"88",@"89"];
}
- (void)setUI{
    _myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.tableHeaderView = [self setTableViewHeader];
    [self.view addSubview:_myTableView];
}
- (UIView *)setTableViewHeader{
    UIView *bgTeacherView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 270)];
    bgTeacherView.backgroundColor = [UIColor whiteColor];
    
    DVPieChartTeacher *chart = [[DVPieChartTeacher alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 270)];
    chart.backgroundColor = [UIColor colorWithRed:0 green:191/255.f blue:242/255.f alpha:1];
    
    [bgTeacherView addSubview:chart];
    
    DVFoodPieModel *model1 = [[DVFoodPieModel alloc] init];
    model1.rate = 0.22;
    model1.name = @"优秀";
    
    DVFoodPieModel *model2 = [[DVFoodPieModel alloc] init];
    model2.rate = 0.51;
    model2.name = @"良好";
    
    DVFoodPieModel *model3 = [[DVFoodPieModel alloc] init];
    model3.rate = 0.16;
    model3.name = @"及格";
    
    DVFoodPieModel *model4 = [[DVFoodPieModel alloc] init];
    model4.rate = 0.11;
    model4.name = @"不及格";
   
    
    NSArray *dataArray = @[model1, model2,model3,model4];
    
    chart.dataArray = dataArray;
    
    chart.title = @"成绩";
    
    [chart draw];
   
    return bgTeacherView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgSectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 30)];
    
    NSArray *titleArr = @[@"学号",@"姓名",@"等级",@"分数"];
    float widthLabel = (k_MainBoundsWidth-2-120)/3;
    for (int i = 0; i<4; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        if (i == 0) {
            titleLabel.frame = CGRectMake(0, 1, 119, 29);
        }else{
            titleLabel.frame = CGRectMake(120+(widthLabel+1)*(i-1), 1, widthLabel, 29);
        }
        
        titleLabel.text = [titleArr objectAtIndex:i];
        titleLabel.backgroundColor = [UIColor colorWithRed:0 green:191/255.f blue:242/255.f alpha:1];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [bgSectionHeaderView addSubview:titleLabel];
        
    }
    
    return bgSectionHeaderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifyTeacher = @"teacherCell";
    UITableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifyTeacher];
        cell.textLabel.text = [NSString stringWithFormat:@"%@      %@",[_numberArr objectAtIndex:indexPath.row],[_nameArr objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@             %@",[_gradeArr objectAtIndex:indexPath.row],[_scoreArr objectAtIndex:indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoViewController *vc = [[InfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
