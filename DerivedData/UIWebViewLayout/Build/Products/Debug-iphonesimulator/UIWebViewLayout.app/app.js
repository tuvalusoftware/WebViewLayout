var app = angular.module('plunker', ['nvd3'])

.controller('MainCtrl', function($scope, $window) {
            $scope.options = {
            chart: {
            type: 'discreteBarChart',
            height: 450,
            margin : {
            top: 20,
            right: 20,
            bottom: 60,
            left: 55
            },
            x: function(d){ return d.label; },
            y: function(d){ return d.value; },
            showValues: true,
            valueFormat: function(d){
            return d3.format(',.4f')(d);
            },
            transitionDuration: 500,
            xAxis: {
            axisLabel: 'X Axis'
            },
            yAxis: {
            axisLabel: 'Y Axis',
            axisLabelDistance: 30
            }
            }
            };
            
            $scope.myValue = 0;
            
            $scope.myValue = $window.abc;
            
            $scope.data = [{
                           key: "Cumulative Return",
                           values: [
                                    { "label" : "A" , "value" : -29.765957771107 },
                                    ]
                           }];
            
            $scope.$watch('myValue', function(newValue, oldValue) {
                          $scope.data[0].values.push({ "label" : "B" , "value" : newValue });
                          }, true);
            
            $scope.myfunc = function() {
            var messgeToPost = {'ButtonId':'clickMeButton'};
            window.webkit.messageHandlers.buttonClicked.postMessage(messgeToPost);
            };      
            });
