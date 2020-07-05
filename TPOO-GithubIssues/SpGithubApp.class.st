"
comment
"
Class {
	#name : #SpGithubApp,
	#superclass : #SpPresenter,
	#instVars : [
		'leftDrawner',
		'issues',
		'app',
		'issueDetail',
		'allIssues',
		'myIssues',
		'actualSection'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpGithubApp class >> defaultSpec [
^ SpBoxLayout newHorizontal
	add: #leftDrawner; add: #issues; add: #issueDetail;
	yourself.
]

{ #category : #accessing }
SpGithubApp >> allIssues [
	^ allIssues
]

{ #category : #accessing }
SpGithubApp >> allIssues: anObject [
	allIssues := anObject.
]

{ #category : #initialization }
SpGithubApp >> connectPresenters [
leftDrawner whenSelectedItemChanged: [ :item |
	item 
		ifNil: [ issues items: #(). ]
		ifNotNil: [
			actualSection := item.
			item = 'My issues' ifTrue: [ 
				issues items: self allIssues.
			].
		
			item = 'Project' ifTrue: [ 
				issues items: self myIssues.
			].
		].
]
]

{ #category : #initialization }
SpGithubApp >> displayTask: aIssue [
	| registeredTaskList  |
	
	
	registeredTaskList := SpListPresenter new.
	registeredTaskList
		items: aIssue tasks;
		display: [ :item | item names].
	registeredTaskList openWithSpec title: 'Registered Tasks'
]

{ #category : #initialization }
SpGithubApp >> initializePresenters [
leftDrawner  := self instantiate: SpLeftDrawner.
issues  := self instantiate: SpIssuesList.
issueDetail:= self instantiate: SpIssueDetail.

issues whenSelectedItemChanged: [ :issue | 
	issueDetail issue: issue.
].

self focusOrder add: leftDrawner; add: issueDetail; add: issueDetail.

[ 
	[ 1 > 0 ]	 whileTrue: [ 
		
		 self allIssues:(GithubClient instance getAllIssues).
		 self myIssues: (GithubClient instance getUnassignedIssuesFromRepo:'TPOOUNLP/GithubIssues4Pharo' matching: [:elem | true]).
		 actualSection  = 'My issues' ifTrue: [ 
			issues items: self allIssues.
		 ].
		
		 actualSection  = 'Project' ifTrue: [ 
			issues items: self myIssues.
		 ].
		(Delay forSeconds: 10) wait. 
	 ]
] fork.
]

{ #category : #initialization }
SpGithubApp >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Github App'
]

{ #category : #accessing }
SpGithubApp >> myIssues [
	^ myIssues
]

{ #category : #accessing }
SpGithubApp >> myIssues: anObject [
	myIssues := anObject.
]
