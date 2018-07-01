angular
    .module "poool-example"
    .component "home",
        template: """
            <div class="page home">
                <div class="container">
                    <header on-login="$ctrl.onLogin()"></header>
                    <h1>Home</h1>
                    <p>This is a normal page, without any paywall, with premium & free posts</p>
                    <ul>
                        <li><a ng-href="/premium">Premium post</a></li>
                        <li><a ng-href="/free">Free post</a></li>
                        <li><a ng-href="/subscribe">Subscribe now!</a></li>
                    </ul>
                </div>
            </div>
        """
        controller: class HomeCtrl

            $onInit: ->
                @sendHit()

            onLogin: ->
                @sendHit()

            sendHit: ->
                poool "config", "user_is_premium", window.test_user?.premium ? false
                poool "send", "page-view", "page"
