//
// AuthenticationAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Alamofire



open class AuthenticationAPI {
    /**
     * enum for parameter grantType
     */
    public enum GrantType_publicAuthGet: String {
        case password = "password"
        case clientCredentials = "client_credentials"
        case clientSignature = "client_signature"
        case refreshToken = "refresh_token"
    }

    /**
     Authenticate
     
     - parameter grantType: (query) Method of authentication 
     - parameter username: (query) Required for grant type &#x60;password&#x60; 
     - parameter password: (query) Required for grant type &#x60;password&#x60; 
     - parameter clientId: (query) Required for grant type &#x60;client_credentials&#x60; and &#x60;client_signature&#x60; 
     - parameter clientSecret: (query) Required for grant type &#x60;client_credentials&#x60; 
     - parameter refreshToken: (query) Required for grant type &#x60;refresh_token&#x60; 
     - parameter timestamp: (query) Required for grant type &#x60;client_signature&#x60;, provides time when request has been generated 
     - parameter signature: (query) Required for grant type &#x60;client_signature&#x60;; it&#39;s a cryptographic signature calculated over provided fields using user **secret key**. The signature should be calculated as an HMAC (Hash-based Message Authentication Code) with &#x60;SHA256&#x60; hash algorithm 
     - parameter nonce: (query) Optional for grant type &#x60;client_signature&#x60;; delivers user generated initialization vector for the server token (optional)
     - parameter state: (query) Will be passed back in the response (optional)
     - parameter scope: (query) Describes type of the access for assigned token, possible values: &#x60;connection&#x60;, &#x60;session&#x60;, &#x60;session:name&#x60;, &#x60;trade:[read, read_write, none]&#x60;, &#x60;wallet:[read, read_write, none]&#x60;, &#x60;account:[read, read_write, none]&#x60;, &#x60;expires:NUMBER&#x60; (token will expire after &#x60;NUMBER&#x60; of seconds).&lt;/BR&gt;&lt;/BR&gt; **NOTICE:** Depending on choosing an authentication method (&#x60;&#x60;&#x60;grant type&#x60;&#x60;&#x60;) some scopes could be narrowed by the server. e.g. when &#x60;&#x60;&#x60;grant_type &#x3D; client_credentials&#x60;&#x60;&#x60; and &#x60;&#x60;&#x60;scope &#x3D; wallet:read_write&#x60;&#x60;&#x60; it&#39;s modified by the server as &#x60;&#x60;&#x60;scope &#x3D; wallet:read&#x60;&#x60;&#x60; (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func publicAuthGet(grantType: GrantType_publicAuthGet, username: String, password: String, clientId: String, clientSecret: String, refreshToken: String, timestamp: String, signature: String, nonce: String? = nil, state: String? = nil, scope: String? = nil, completion: @escaping ((_ data: Any?,_ error: Error?) -> Void)) {
        publicAuthGetWithRequestBuilder(grantType: grantType, username: username, password: password, clientId: clientId, clientSecret: clientSecret, refreshToken: refreshToken, timestamp: timestamp, signature: signature, nonce: nonce, state: state, scope: scope).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Authenticate
     - GET /public/auth
     - Retrieve an Oauth access token, to be used for authentication of 'private' requests.  Three methods of authentication are supported:  - <code>password</code> - using email and and password as when logging on to the website - <code>client_credentials</code> - using the access key and access secret that can be found on the API page on the website - <code>client_signature</code> - using the access key that can be found on the API page on the website and user generated signature. The signature is calculated using some fields provided in the request, using formula described here [Deribit signature credentials](#additional-authorization-method-deribit-signature-credentials) - <code>refresh_token</code> - using a refresh token that was received from an earlier invocation  The response will contain an access token, expiration period (number of seconds that the token is valid) and a refresh token that can be used to get a new set of tokens. 
     - BASIC:
       - type: http
       - name: bearerAuth
     - parameter grantType: (query) Method of authentication 
     - parameter username: (query) Required for grant type &#x60;password&#x60; 
     - parameter password: (query) Required for grant type &#x60;password&#x60; 
     - parameter clientId: (query) Required for grant type &#x60;client_credentials&#x60; and &#x60;client_signature&#x60; 
     - parameter clientSecret: (query) Required for grant type &#x60;client_credentials&#x60; 
     - parameter refreshToken: (query) Required for grant type &#x60;refresh_token&#x60; 
     - parameter timestamp: (query) Required for grant type &#x60;client_signature&#x60;, provides time when request has been generated 
     - parameter signature: (query) Required for grant type &#x60;client_signature&#x60;; it&#39;s a cryptographic signature calculated over provided fields using user **secret key**. The signature should be calculated as an HMAC (Hash-based Message Authentication Code) with &#x60;SHA256&#x60; hash algorithm 
     - parameter nonce: (query) Optional for grant type &#x60;client_signature&#x60;; delivers user generated initialization vector for the server token (optional)
     - parameter state: (query) Will be passed back in the response (optional)
     - parameter scope: (query) Describes type of the access for assigned token, possible values: &#x60;connection&#x60;, &#x60;session&#x60;, &#x60;session:name&#x60;, &#x60;trade:[read, read_write, none]&#x60;, &#x60;wallet:[read, read_write, none]&#x60;, &#x60;account:[read, read_write, none]&#x60;, &#x60;expires:NUMBER&#x60; (token will expire after &#x60;NUMBER&#x60; of seconds).&lt;/BR&gt;&lt;/BR&gt; **NOTICE:** Depending on choosing an authentication method (&#x60;&#x60;&#x60;grant type&#x60;&#x60;&#x60;) some scopes could be narrowed by the server. e.g. when &#x60;&#x60;&#x60;grant_type &#x3D; client_credentials&#x60;&#x60;&#x60; and &#x60;&#x60;&#x60;scope &#x3D; wallet:read_write&#x60;&#x60;&#x60; it&#39;s modified by the server as &#x60;&#x60;&#x60;scope &#x3D; wallet:read&#x60;&#x60;&#x60; (optional)
     - returns: RequestBuilder<Any> 
     */
    open class func publicAuthGetWithRequestBuilder(grantType: GrantType_publicAuthGet, username: String, password: String, clientId: String, clientSecret: String, refreshToken: String, timestamp: String, signature: String, nonce: String? = nil, state: String? = nil, scope: String? = nil) -> RequestBuilder<Any> {
        let path = "/public/auth"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "grant_type": grantType.rawValue, 
            "username": username, 
            "password": password, 
            "client_id": clientId, 
            "client_secret": clientSecret, 
            "refresh_token": refreshToken, 
            "timestamp": timestamp, 
            "signature": signature, 
            "nonce": nonce, 
            "state": state, 
            "scope": scope
        ])

        let requestBuilder: RequestBuilder<Any>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
