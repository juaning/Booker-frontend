'use strict'

angular.module( 'bookerApp' )
  .controller 'BooksCtrl', ( $scope, $http ) ->
    $http.get( booker.api.url )
      .success(( data ) -> 
        for i in data
          do (i) ->
            i.size = 'medium' if i.title.length >= 9
            i.size = 'small' if i.title.length >= 11
            return data
      
        $scope.books = data
      )
      .error(( data ) ->
        $scope.books = 'Oops, error'
      )