var app = angular.module('my_app', ['chart.js']);
app.controller("LineCtrl", function ($scope) {
               
               $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
               $scope.series = ['Series A', 'Series B'];
               $scope.data = [
                              [65, 59, 80, 81, 56, 55, 40],
                              [28, 48, 40, 19, 86, 27, 90]
                              ];
               $scope.onClick = function (points, evt) {
               var messgeToPost = {'ButtonId':''};
               window.webkit.messageHandlers.buttonClicked.postMessage(messgeToPost);
               console.log(points, evt);
               };
               
               });
app.controller("BarCtrl", function ($scope) {
               $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
               $scope.series = ['Series A', 'Series B'];
               
               $scope.data = [
                              [65, 59, 80, 81, 56, 55, 40],
                              [28, 48, 40, 19, 86, 27, 90]
                              ];
               });
app.controller("DoughnutCtrl", function ($scope) {
               $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
               $scope.data = [300, 500, 100];
               });
app.controller("RadarCtrl", function ($scope) {
               $scope.labels =["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"];
               
               $scope.data = [
                              [65, 59, 90, 81, 56, 55, 40],
                              [28, 48, 40, 19, 96, 27, 100]
                              ];
               });
app.controller("PieCtrl", function ($scope) {
               $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
               $scope.data = [300, 500, 100];
               });
app.controller("PolarAreaCtrl", function ($scope) {
               $scope.labels = ["Download Sales", "In-Store Sales", "Mail-Order Sales", "Tele Sales", "Corporate Sales"];
               $scope.data = [300, 500, 100, 40, 120];
               });
app.controller("BarCtrl",
               function ($scope) {
               $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
               $scope.series = ['Series A', 'Series B'];
               
               $scope.data = [
                              [65, 59, 80, 81, 56, 55, 40],
                              [28, 48, 40, 19, 86, 27, 90]
                              ];
               });
