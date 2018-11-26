//
//  Tab1ViewController.m
//  GraduationProject
//
//  Created by 焦英博 on 2018/11/13.
//  Copyright © 2018年 mlg. All rights reserved.
//

#import "Tab1ViewController.h"
#import "JHChartHeader.h"
#import "DVPieChart.h"
#import "DVFoodPieModel.h"


#define k_MainBoundsWidth [UIScreen mainScreen].bounds.size.width
#define k_MainBoundsHeight [UIScreen mainScreen].bounds.size.height


@interface Tab1ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;

@property (nonatomic,strong)NSArray *proNameArr;
@property (nonatomic,strong)NSArray *scoreArr;

@end

@implementation Tab1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    [self setUI];
}
- (void)setData{
    _proNameArr = @[@"身高: 175cm",@"体重: 54kg",@"BMI: 20.3",@"肺活量: 2000ml",@"50米跑: 10s",@"坐位体前屈: 20cm",@"立定跳远: 2.5m",@"引体向上: 12",@"1000跑: 3min"];
    _scoreArr = @[@" ",@" ",@"良好   75分",@"优秀   90分",@"优秀   85分",@"良好   75分",@"及格   69分",@"良好   79分",@"优秀   95分",];
}
- (void)setUI{
    _myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    //_myTableView.backgroundColor = [UIColor colorWithRed:0 green:191/255.f blue:242/255.f alpha:1];
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.tableHeaderView = [self myHeaderView];
    _myTableView.tableFooterView = [self myFooterView];
    [self.view addSubview:_myTableView];
}
//设置一个表头
- (UIView *)myHeaderView{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 264)];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:191/255.f blue:242/255.f alpha:1];
    
    DVPieChart *chart = [[DVPieChart alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 250)];
    chart.backgroundColor = [UIColor colorWithRed:0 green:191/255.f blue:242/255.f alpha:1];
    
    [bgView addSubview:chart];
    
    DVFoodPieModel *model1 = [[DVFoodPieModel alloc] init];
    
    model1.rate = 0.78;
    model1.name = @"1";
    //model1.value = 4;
    
    DVFoodPieModel *model2 = [[DVFoodPieModel alloc] init];
    
    model2.rate = 0.22;
    model2.name = @"1";
    //model2.value = 4;
    
    NSArray *dataArray = @[model1, model2];
    
    chart.dataArray = dataArray;
    
    chart.title = @"达标\n总分：78";
    
    [chart draw];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, k_MainBoundsWidth, 24)];
    infoLabel.text = @"张三  排名24，已超越76%的同学";
    infoLabel.textColor = [UIColor whiteColor];
    //infoLabel.backgroundColor = [UIColor greenColor];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:infoLabel];
    return bgView;
}
- (UIView *)myFooterView{
    UIView *footBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 300)];
    footBgView.backgroundColor = [UIColor redColor];
    
    JHRadarChart *radarChart = [[JHRadarChart alloc] initWithFrame:CGRectMake(0, 0, k_MainBoundsWidth, 300)];
    radarChart.backgroundColor = [UIColor whiteColor];
    /*       Each point of the description text, according to the number of the array to determine the number of basic modules         */
    radarChart.valueDescArray = @[@"身体形态",@"身体机能",@"反应能力",@"柔韧性",@"下肢爆发力",@"上肢肌肉",@"耐力"];
    
    /*         Number of basic module layers        */
    radarChart.layerCount = 5;
    
    /*        Array of data sources, the need to add an array of arrays         */
   // radarChart.valueDataArray = @[@[@"80",@"40",@"100",@"76",@"75",@"50"],@[@"50",@"80",@"30",@"46",@"35",@"50"]];
     radarChart.valueDataArray = @[@[@"80",@"56",@"90",@"76",@"75",@"66",@"83"]];
    
    /*        Color of each basic module layer         */
    radarChart.layerFillColor = [UIColor colorWithRed:94/ 256.0 green:187/256.0 blue:242 / 256.0 alpha:0.5];
    
    /*        The fill color of the value module is required to specify the color for each value module         */
    radarChart.valueDrawFillColorArray = @[[UIColor colorWithRed:57/ 256.0 green:137/256.0 blue:21 / 256.0 alpha:0.5],[UIColor colorWithRed:149/ 256.0 green:68/256.0 blue:68 / 256.0 alpha:0.5]];
    
    /*       show        */
    [radarChart showAnimation];
    
    [footBgView addSubview:radarChart];
    
    return footBgView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _proNameArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifyCell = @"cellStr";
    UITableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifyCell];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        cell.textLabel.text = [_proNameArr objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [_scoreArr objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row >1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hello java");
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
