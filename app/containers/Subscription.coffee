angular
    .module "poool-example"
    .component "subscription",
        template: """
            <div class="page home">
                <div class="container">
                    <header on-login="$ctrl.onLogin()"></header>

                    <h1>Our offers</h1>
                    <p>This is a subscription page, without any paywall, where you list all your subscription offers.</p>
                    <ul>
                        <li><a ng-href="/">Home</Link></li>
                        <li><a ng-href="/premium">Premium post</Link></li>
                        <li><a ng-href="/free">Free post</Link></li>
                    </ul>
                </div>
            </div>
        """
        controller: class SubscriptionCtrl

            $onInit: ->
                @sendHit()

            onLogin: ->
                @sendHit()

            sendHit: ->
                poool "config", "user_is_premium", window.test_user?.premium ? false
                poool "send", "page-view", "subscription"
