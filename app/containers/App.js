angular
  .module('poool-example', [
    'ngRoute',
  ])
  .config(($routeProvider, $locationProvider) => {
    'ngInject';

    $routeProvider
      .when('/', { template: '<home></home>' })
      .when('/premium', { template: '<premium></premium>' })
      .when('/free', { template: '<free></free>' })
      .when('/subscribe', { template: '<subscription></subscription>' })
      .otherwise({ redirectTo: '/' });

    if (window.history && window.history.pushState) {
      $locationProvider.html5Mode(true);
    }
  });
