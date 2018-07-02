angular
    .module "poool-example"
    .component "header",
        template: """
            <div class="mb-5">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a ng-href="/" class="navbar-brand">Newspaper</a>
                    <div class="collapse navbar-collapse">
                        <div class="navbar-nav">
                            <a ng-href="/" class="nav-item nav-link">Home</a>
                            <a ng-href="/premium" class="nav-item nav-link">Premium post</a>
                            <a ng-href="/free" class="nav-item nav-link">Free Post</a>
                            <a ng-href="/subscribe" class="nav-item nav-link">Subscribe now!</a>
                        </div>
                    </div>

                    <span class="navbar-text">
                        <span ng-if="$ctrl.connecting">Connecting...</span>
                        <span ng-if="$ctrl.isLogged()">Signed as: <strong>Rick Sanchez</strong></span>
                        <a href ng-if="!$ctrl.connecting && !$ctrl.isLogged()" ng-click="$ctrl.login()">Sign in</a>
                    </span>
                </nav>
            </div>
        """
        bindings:
            onLogin: "&?"
        controller: class HeaderCtrl

            connecting: false

            constructor: (@$timeout) ->
                "ngInject"

            $onInit: ->
                poool "event", "onLoginClick", @onLoginClick

            onLoginClick: (e) =>
                @$timeout => @login()
                e.originalEvent?.preventDefault?()

            isLogged: ->
                window.test_user?.logged is true

            login: ->
                if @connecting is true then return

                @connecting = true

                @_loginTimeout = @$timeout =>
                    window.test_user =
                        logged: true
                        premium: true

                    @connecting = false

                    @onLogin?()
                , 2000

            $onDestroy: ->
                poool "unevent", "onLoginClick", @onLoginClick
                @$timeout.cancel @_loginTimeout
