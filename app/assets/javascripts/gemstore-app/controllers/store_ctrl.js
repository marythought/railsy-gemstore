(function(){
  var app = angular.module('gemStoreApp');
  app.controller('StoreController', [ '$scope', '$http', function($scope, $http) {
    $scope.products = [];
    $scope.errors = [];

    $scope.index = function() {
      $http.get( "/api/v1/gemstones" )
        .success(function(data) {
          $scope.products = data.gemstones;
        })
        .error(function(data) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.create = function(gemstone){
      $http.post( "/api/v1/gemstones", { gemstone: gemstone })
        .success(function(data) {
          $scope.products.push(data.gemstones);
        })
        .error(function(data, status) {
          $scope.errors.push(data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.update = function(gemstone){
      $http({
        method: 'PATCH',
        url: "/api/v1/gemstones/" + gemstone.id,
        data: gemstone
      })
        .success(function(data) {
          console.log(gemstone)
          gemstone.editing = false;
      })
        .error(function(data, status) {
          $scope.errors.push(data);
          // console.log(data);
          // console.log(status);
      });
    };

    $scope.destroy = function(gemstone){
      $http({
        method: 'DELETE',
        url: "/api/v1/gemstones/" + gemstone.id
      })
        .success(function(data) {
          gemstone.deleteConfirm = false;
          $scope.products.splice($scope.products.indexOf(gemstone), 1);
      })
        .error(function(data, status) {
          $scope.errors.push(data);
          // console.log(data);
          // console.log(status);
      });
    };

  }]);
})();
