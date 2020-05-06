"
""Github Client""
"
Class {
	#name : #GithubClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'server',
		'baseUrl'
	],
	#classInstVars : [
		'server',
		'token'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #auth }
GithubClient >> authenticate [
	"Opens url in default browser"
	WebBrowser openOn: 'https://github.com/login/oauth/authorize?client_id=0f2ea5d52714d541f02c&scope=repo'.
]

{ #category : #private }
GithubClient >> buildRequest: aUri [
	|httpClient req|
	httpClient := ZnClient new.
	req := httpClient request.
	req url: baseUrl , aUri.
	req headers at: 'Authorization' put: ('bearer ' , token).
	req headers at: 'Content-Type' put: 'application/json'.
	req headers at: 'Accept' put: 'application/json'.
	^httpClient.
]

{ #category : #http }
GithubClient >> get: aUri [
	|httpClient|
	httpClient := self buildRequest: aUri.
	^ httpClient get; response.
	
]

{ #category : #issues }
GithubClient >> getAllIssues [
	|res json|
	res := self get: '/issues'.
	json := res contents.
	"TODO: convert json to an array of 'Issue' objects"
	^ json.
	
]

{ #category : #initialization }
GithubClient >> initialize [ 
	baseUrl := 'https://api.github.com'.
	server :=  (ZnServer startDefaultOn: 1701).
	server
		delegate:
			(ZnDispatcherDelegate new
				map: '/logged_in'
				to: [ :request :response | 
					| code res |
					code := request uri queryAt: 'code'.
					self traceCr: '------ Request received ------'.
					self traceCr: '--> Code: ' , code.
					self traceCr: '------ Sending token request ------'.
					res := ZnClient new 
						https;
						host: 'www.github.com';
						addPath: 'login';
						addPath: 'oauth';
						addPath: 'access_token';
						queryAt: 'client_id' put: '0f2ea5d52714d541f02c';
						queryAt: 'client_secret'
							put: 'd89285099821e89c9ee9af24f75b1fc206163021';
						queryAt: 'code' put: code;
						post;
						response.
					self traceCr: '------ Response received ------'.
					self
						traceCr: '--> Token: ' , (res contents at: 'access_token').
					token :=  (res contents at: 'access_token').
					response entity: (ZnEntity html: '<h1>Logged in!</h1>') ]).
]

{ #category : #accessing }
GithubClient >> server [
	^ server.
]

{ #category : #accessing }
GithubClient >> server: aServer [ 
	server := aServer
]

{ #category : #accessing }
GithubClient >> token [
	^ token.
]

{ #category : #accessing }
GithubClient >> token: aToken [ 
	token := aToken
]
