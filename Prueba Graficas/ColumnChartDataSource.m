//
//  ColumnChartDataSource.m
//  Prueba Graficas
//
//  Created by Pedro Contreras Nava on 02/10/14.
//  Copyright (c) 2014 Pedro Contreras Nava. All rights reserved.
//

#import "ColumnChartDataSource.h"

@implementation ColumnChartDataSource
@synthesize _diccionario;

-(id)initWithData:(NSDictionary *)data{
    self._diccionario = data;
    
    return self;
}

#pragma mark - SChartDatasource methods

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
        return 2;

}

-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
    
    if(chart.tag==1){
        SChartColumnSeries *columnSeries = [SChartColumnSeries new];
        columnSeries.selectionMode = SChartSelectionPoint;
        columnSeries.animationEnabled = YES;
        SChartAnimation *animation = [SChartAnimation growVerticalAnimation];
        columnSeries.entryAnimation = animation;
        columnSeries.title = index == 0 ? @"2013" : @"2014";

        return columnSeries;

    }else if(chart.tag==4){
        SChartBarSeries *barSeries = [SChartBarSeries new];
        barSeries.selectionMode = SChartSelectionPoint;
        barSeries.title = index == 0 ? @"2013" : @"2014";

        barSeries.animationEnabled = YES;
        SChartAnimation *animation = [SChartAnimation growAnimation];
        
        barSeries.entryAnimation = animation;
        return barSeries;
    }
    return nil;
    
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
    NSString* year = _diccionario.allKeys[seriesIndex];
    NSDictionary* registrosPorAno = _diccionario[year];
    return registrosPorAno.count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {

    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
    
    NSString* year = _diccionario.allKeys[seriesIndex];
    NSDictionary* salesForYear = _diccionario[year];
    
    NSString* key = salesForYear.allKeys[dataIndex];
    datapoint.xValue = key;
    datapoint.yValue = salesForYear[key];
    
    if(chart.tag ==4){
        datapoint.xValue = salesForYear[key];
        datapoint.yValue = key;
    }
    
    return datapoint;

    

}

@end
