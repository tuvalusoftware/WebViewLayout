
// Include app dependency on ngMaterial
angular.module("Graph", ["chart.js"]).controller("RadarCtrl", function ($scope) {
                                                 
                                                 
                                                 $scope.ReloadChart = function () {
                                                 console.log("Reloading chart");
                                                 $scope.label =
                                                 ["January", "February", "March", "April", "May", "June", "July"];
                                                 $scope.series = ["Temperatura"];
                                                 $scope.data = [[65, 59, 80, 81, 56, 55, 40]];
                                                 $scope.$apply();
                                                 }
                                                 $scope.label =["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"];
                                                 
                                                 $scope.data = [
                                                                [65, 59, 90, 81, 56, 55, 40],
                                                                [28, 48, 40, 19, 96, 27, 100]
                                                                ];
                                                 $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
                                                 
                                                 $scope.series = ['Series A', 'Series B'];
                                                 
                                                 $scope.data = [
                                                                [65, 59, 80, 81, 56, 55, 40],
                                                                [28, 48, 40, 19, 86, 27, 90]
                                                                ];
                                                 });

var goo = "hello"
alert(goodvariablename);






angular
.module('Layout', ['ngMaterial'])
.controller('layoutController', layoutController);


function layoutController ($scope) {
}

angular.module("app", ["Layout", "Graph"]);

