
function setVar () {
    
  
  
    
    // Include app dependency on ngMaterial
    angular.module("GraphI", ["chart.js"]).controller("RadarCtrl", function ($scope) {
                                                     
                                                     console.log("Reloading chart");
                                                    // $scope.label =
                                                     
                                                     $scope.series = ["Temperatura"];
                                                    // $scope.data = [[65, 59, 80, 81, 56, 55, 40]];
                                                     
                                                     
                                                     
                                                     
                                                     $scope.label = window.labels
                                                     
                                                     $scope.data =  window.data
                                                     
                                                     
                                                     $scope.labels =  window.labels
                                                     
                                                     $scope.series = window.series;
                                                     
                                                     $scope.data = window.data;
                                                     
                                                     
                                                     
                                                     $scope.labelt = window.labels
                                                     
                                                     $scope.datat=  window.data
                                                     
                                                     
                                                     $scope.labelst =  window.labels
                                                     
                                                     $scope.seriest = window.series;
                                                     
                                                     $scope.datat = window.data;
                                                    
                                                     
                                                     
                                                     $scope.showLayout = function () {
                                                      
                                                        window.webkit.messageHandlers.channel1.postMessage({body: "layouts"});
                                                     
 
                                                    
                                                     
                                                     };
                                                      
                                                      $scope.showControls = function () {
                                                      
                                                      window.webkit.messageHandlers.channel1.postMessage({body: "controls"});
                                                      
 
                                                      
                                                      
                                                      };
                                                      
                                                      $scope.showData = function () {
                                                      
                                                      window.webkit.messageHandlers.channel1.postMessage({body: "data"});
                                                      
                                                      
                                                      
                                                      
                                                      };
                                                     
                                                     });
    
    // Include app dependency on ngMaterial
    angular.module("Graph", ["chart.js"]).controller("BarCtrl", function ($scope) {
                                                     
                                                     console.log("Reloading chart");
                                                     // $scope.label =
                                                     
                                                     $scope.series = ["Temperatura"];
                                                     // $scope.data = [[65, 59, 80, 81, 56, 55, 40]];
                                                     
                                                     
                                                     
                                                     
                                                     $scope.label = window.labels
                                                     
                                                     $scope.data =  window.data
                                                     
                                                     
                                                     $scope.labels =  window.labels
                                                     
                                                     $scope.series = window.series;
                                                     
                                                     $scope.data = window.data;
                                                     
                                                     
                                                     
                                                     $scope.labelt = window.labels
                                                     
                                                     $scope.datat=  window.data
                                                     
                                                     
                                                     $scope.labelst =  window.labels
                                                     
                                                     $scope.seriest = window.series;
                                                     
                                                     $scope.datat = window.data;
                                                     
                                                     
                                                     
                                                     $scope.showDiv = function () {
                                                     
                                                     window.webkit.messageHandlers.channel1.postMessage({body: "ABC"});
                                                     
                                                     
                                                     // $scope.labels =  ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
                                                     
                                                     
                                                     };
                                                     
                                                     });
    
    
    
    
    
    
    
    
    angular
    .module('Layout', ['ngMaterial'])
    .controller('layoutController', layoutController);
    
    
    function layoutController ($scope) {
        
        $scope.sayHello = function () {
            
            window.webkit.messageHandlers.notification.postMessage({body: ".hello"});

            
        }
    }
    
    
    
    
    angular.module("app", ["Layout", "Graph","GraphI"]);
    
    
}
