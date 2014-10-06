//
//  PieChartDataSource.m
//  Prueba Graficas
//
//  Created by Pedro Contreras Nava on 02/10/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "PieChartDataSource.h"

@implementation PieChartDataSource
@synthesize _diccionario;

-(id)initWithData:(NSDictionary *)data{
    self._diccionario = data;
    
    return self;
}

#pragma mark - SChartDatasource methods

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 1;
}


- (NSDictionary*)dataForYear:(NSString *)year {
    NSDictionary* salesForYear = _diccionario[year];
    return salesForYear;
}


-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
    if(chart.tag==2){
        SChartPieSeries *pieSeries = [SChartPieSeries new];
        pieSeries.selectionMode = SChartSelectionPoint;
        pieSeries.animationEnabled = YES;
        SChartAnimation *animation = [SChartAnimation growAnimation];
        
        pieSeries.entryAnimation = animation;
        return pieSeries;
        
    }else if(chart.tag==3){
        SChartDonutSeries *donutSeries = [SChartDonutSeries new];
        donutSeries.selectionMode = SChartSelectionPoint;
        donutSeries.animationEnabled = YES;
        SChartAnimation *animation = [SChartAnimation growAnimation];
        
        donutSeries.entryAnimation = animation;
        return donutSeries;
        
    }
    return nil;
    
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    return [self dataForYear:@"2013"].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
    
    NSDictionary* salesForYear = [self dataForYear:@"2013"];
    
    NSString* key = salesForYear.allKeys[dataIndex];
    datapoint.xValue = key;
    datapoint.yValue = salesForYear[key];
    return datapoint;
}
@end
