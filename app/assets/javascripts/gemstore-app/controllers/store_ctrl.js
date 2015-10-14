(function(){
  var app = angular.module('gemStoreApp');
  app.controller('StoreController', [ '$scope', '$http', function($scope, $http) {
    $scope.products = [];
    $scope.errors = [];

    $scope.index = function() {
      $http.get( "/api/v1/gemstones" )
        .success(function(data) {
          $scope.products = data;
        });
    };

    $scope.create = function(gemstone){
      $http.post( "/api/v1/gemstones", { gemstone: gemstone })
        .success(function(data) {
          $scope.products.push(data);
        });
        // .error(function(data) {
        //   $scope.errors.push(something);
        // })
    };

  }]);
})();
