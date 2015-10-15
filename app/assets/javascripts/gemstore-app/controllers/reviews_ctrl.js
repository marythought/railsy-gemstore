(function(){
  var app = angular.module('gemStoreApp');
  app.controller('ReviewController', [ '$scope', '$http', function($scope, $http) {
    $scope.reviews = [];
    $scope.errors = [];

    $scope.index = function() {
      $http.get( "/api/v1/gemstones/" + gemstone.id + "/")
        .success(function(data) {
          $scope.reviews = data.gemstones;
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
          $scope.reviews.unshift(data.gemstone);
          $scope.newGemstone = {};
        })
        .error(function(data, status) {
          $scope.errors = (data);
          console.log(data);
          console.log(status);
        });
    };

    $scope.update = function(gemstone){
      //save temp version
      $http.patch( "/api/v1/gemstones/" + gemstone.id,
        { gemstone: gemstone })
        .success(function(data) {
          gemstone.editing = false;
      })
        .error(function(data, status) {
          $scope.errors = data;
      });
    };

    $scope.destroy = function(gemstone){
      $http({
        method: 'DELETE',
        url: "/api/v1/gemstones/" + gemstone.id
      })
        .success(function(data) {
          gemstone.deleteConfirm = false;
          $scope.reviews.splice($scope.reviews.indexOf(gemstone), 1);
      })
        .error(function(data, status) {
          $scope.errors.push(data);
          // console.log(data);
          // console.log(status);
      });
    };

  }]);
})();
