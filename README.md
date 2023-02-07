# MLTokenHandler

MLTokenHandler will handle keeping your api-tokens up to date if possible. If everything fails it will throw, and also delete the saved tokens.

## Basic usage

In order to instantiate the tokenHandler you need to supply a refreshURL, and a way to save and load the tokens. Tokens are loaded and saved all the time, so hooking into the `saveTokens`closure is a way of monitoring what the state of tokens is. If `nil` is saved it means that token refresh failed due to expired refreshToken and that the user should be logged out.
```swift
let authHandler = AuthenticationHandlerAsync<APITokensEnvelope>(
    refreshURL: envVars.refreshURL,
    getTokens: persistenceClient.tokens.load,
    saveTokens: persistenceClient.tokens.save
)
```

Then basic usage of the tokenHandler is as simple as

```swift
 let (data, response) = try await authHandler.performAuthenticatedRequest(request)
```

> Note: TokenHandler only makes the api call, no decoding of data to your own types is included, but building convenience for this a small task

## More advanced usage

The initializer has a couple more fields

```swift
public init(
    refreshURL: URL,
    getTokens: @escaping () -> APITokensEnvelope?,
    saveTokens: @escaping (APITokensEnvelope?) -> Void,
    now: @escaping () -> Date = Date.init,
    networkRequest: @escaping (URLRequest) async throws -> (Data, URLResponse) = URLSession.shared.data(for: ),
    refreshBodyTransform: @escaping (_ refreshToken: String) -> some Encodable = RefreshBody.init(token: )
)
```

`now` is providing the current date and can be used for testing
`networkRequest` enables you to inject a custom URLSession in case you need to handle special cases like certificate handling or to inject your own function for testing
`refreshBodyTransform` allows you to specify what the POST body for refreshing your api-token should look like. The TokenHandler comes with a default structure if none is provided