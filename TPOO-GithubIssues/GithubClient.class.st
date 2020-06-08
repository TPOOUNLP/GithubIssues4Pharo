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
		'token',
		'instance'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #accessing }
GithubClient class >> instance [
	instance
		ifNil: [ 
			instance := self new.
			"TODO: Add an authenticate flow and quit delay"
			instance authenticate.			
			(Delay forSeconds: 10) wait.
			^ instance 
	].
	^ instance
]

{ #category : #auth }
GithubClient >> authenticate [
	('token.st' asFileReference exists) 
	ifTrue: [ 
		token := ('token.st' asFileReference readStream contents)
	] 
	ifFalse: [
		"Opens url in default browser"
		WebBrowser openOn: 'https://github.com/login/oauth/authorize?client_id=0f2ea5d52714d541f02c&scope=repo'
	].
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

{ #category : #issues }
GithubClient >> createIssue: anIssue repo: aRepoFullName [ 
	| res json |
	json := String streamContents: [ :stream |
					(NeoJSONWriter on: stream)
						mapInstVarsFor: Issue;
						nextPut: anIssue 
	].
	res := self post: '/repos/', aRepoFullName, '/issues' body: json.
	^ res
]

{ #category : #http }
GithubClient >> get: aUri [
	|httpClient|
	httpClient := self buildRequest: aUri.
	^ httpClient get; response.
	
]

{ #category : #issues }
GithubClient >> getAllIssues [
	|res json issues|
	res := self get: '/issues'.
	json := res contents.
	issues := (NeoJSONReader on: json readStream)
		mapInstVarsFor: Issue;
		for: #ArrayOfIssue 
      		customDo: [ :mapping | mapping listOfElementSchema: Issue ];
		nextAs: #ArrayOfIssue.
	^ issues.
	
]

{ #category : #issues }
GithubClient >> getIssuesFromRepo: aRepoFullName [
	|res json issues|
	res := self get: '/repos/' , aRepoFullName , '/issues'.
	json := res contents.
	issues := (NeoJSONReader on: json readStream)
		mapInstVarsFor: Issue;
		for: #ArrayOfIssue 
      		customDo: [ :mapping | mapping listOfElementSchema: Issue ];
		nextAs: #ArrayOfIssue.
	^ issues.
]

{ #category : #issues }
GithubClient >> getIssuesFromRepo: aRepoFullName user:aUser [
	|res json issues|
    
    res := self get: '/repos/' , aRepoFullName , '/issues' , '?assignee=', aUser.
	json := res contents.
	issues := (NeoJSONReader on: json readStream)
		mapInstVarsFor: Issue;
		for: #ArrayOfIssue 
      		customDo: [ :mapping | mapping listOfElementSchema: Issue ];
		nextAs: #ArrayOfIssue.
	^ issues.
]

{ #category : #issues }
GithubClient >> getUnassignedIssuesFromRepo: aRepoFullName matching: aBlock [
	|res json issues|
	res := self get: '/repos/' , aRepoFullName , '/issues?assignee=none'.
	json := res contents.
	issues := (NeoJSONReader on: json readStream)
		mapInstVarsFor: Issue;
		for: #ArrayOfIssue 
      		customDo: [ :mapping | mapping listOfElementSchema: Issue ];
		nextAs: #ArrayOfIssue.
	^ issues select: aBlock.
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
					'token.st' asFileReference writeStreamDo: [ :stream | stream nextPutAll: token ].
					response entity: (ZnEntity html: '<h1>Logged in!</h1>') ]).
]

{ #category : #auth }
GithubClient >> logout [
	token := nil.
	'token.st' asFileReference delete.
]

{ #category : #http }
GithubClient >> patch: anUri body: aBody [
	"Realiza un post sobre un issue de GitHub"
	"scope: class-variables  &  instance-variables"	
			
	|httpClient|
	httpClient := self buildRequest: anUri.
	^ httpClient patch:anUri contents: aBody ; response.
]

{ #category : #http }
GithubClient >> post: anUri body: aBody [
	"Realiza un post sobre un issue de GitHub"
	"scope: class-variables  &  instance-variables"	
			
	|httpClient|
	httpClient := self buildRequest: anUri.
	^ httpClient post:anUri contents: aBody ; response.
]

{ #category : #http }
GithubClient >> put: anUri body: aBody [
	"Realiza un post sobre un issue de GitHub"
	"scope: class-variables  &  instance-variables"	
			
	|httpClient|
	httpClient := self buildRequest: anUri.
	^ httpClient put:anUri contents: aBody ; response.
]

{ #category : #release }
GithubClient >> release [
	server stop. 
	server := nil.
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

{ #category : #issues }
GithubClient >> updateIssue: anIssue repo: aRepoFullName [ 
	| res json |
	json := String streamContents: [ :stream |
					(NeoJSONWriter on: stream)
						mapInstVarsFor: Issue;
						for: Task do: [ :mapping | ];
						writeNil: true;
						nextPut: anIssue 
	].
	res := self patch: '/repos/', aRepoFullName, '/issues/' , (anIssue number asString) body: json.
	^ res
]
