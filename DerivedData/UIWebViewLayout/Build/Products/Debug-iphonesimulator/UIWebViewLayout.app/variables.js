
function setVar () {
    
    window.goodvariablename = "thisismyvariablename"
  
    
    // Include app dependency on ngMaterial
    angular.module("Graph", ["chart.js"]).controller("RadarCtrl", function ($scope) {
                                                     
                                                     
                                                     $scope.ReloadChart = function () {
                                                     
                                                     console.log("Reloading chart");
                                                     $scope.label = 
                                                 
                                                     $scope.series = ["Temperatura"];
                                                     $scope.data = [[65, 59, 80, 81, 56, 55, 40]];
                                                     $scope.$apply();
                                                     }
                                                    
                                                     
                                                     $scope.label = window.labels
                                                     
                                                     $scope.data =  window.data
                                                     
                                                     
                                                     $scope.labels =  window.labels
                                                     
                                                     $scope.series = ['Series A', 'Series B'];
                                                     
                                                     $scope.data = [
                                                                    [65, 59, 80, 81, 56, 55, 40],
                                                                    [28, 48, 40, 19, 86, 27, 90]
                                                                    ];
                                                     });
    
    
    
    
    
    angular
    .module('Layout', ['ngMaterial'])
    .controller('layoutController', layoutController);
    
    
    function layoutController ($scope) {
    }
    
    
    
    
    angular.module("app", ["Layout", "Graph"]);
    
    
}
