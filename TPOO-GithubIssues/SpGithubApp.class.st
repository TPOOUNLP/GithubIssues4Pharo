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
		'issueDetail'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpGithubApp class >> defaultSpec [
^ SpBoxLayout newHorizontal
	add: #leftDrawner; add: #issues; add: #issueDetail;
	yourself.
]

{ #category : #initialization }
SpGithubApp >> connectPresenters [
leftDrawner whenSelectedItemChanged: [ :item |
	item 
		ifNil: [ issues items: #(). ]
		ifNotNil: [
			item = 'My issues' ifTrue: [ 
				issues items: (GithubClient instance getAllIssues).
			].
		
			item = 'Project' ifTrue: [ 
				issues items: (GithubClient instance getUnassignedIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo' matching: [:elem | true]).
			].
		].
]
]

{ #category : #initialization }
SpGithubApp >> displayTask: aIssue [
	| registeredTaskList|
	registeredTaskList := SpListPresenter new.
	registeredTaskList
		items: aIssue tasks;
		display: [ :item | item ].
	registeredTaskList openWithSpec title: 'Registered Tasks'
]

{ #category : #initialization }
SpGithubApp >> initializePresenters [
leftDrawner  := self instantiate: SpLeftDrawner.
issues  := self instantiate: SpIssuesList.
issueDetail:= self instantiate: SpIssueDetail.

issues whenSelectedItemChanged: [ :issue | 
	|aOrderedCollection|
	aOrderedCollection := OrderedCollection new.
	aOrderedCollection add: (LabelAndItem newLabel: 'number' item: (issue number)).
	aOrderedCollection add: (LabelAndItem newLabel: 'title' item: (issue title)).
	aOrderedCollection add: (LabelAndItem newLabel: 'body' item: (issue body)).
	aOrderedCollection add: (LabelAndItem newLabel: 'state' item: (issue state)).
	aOrderedCollection add: (LabelAndItem newLabel: 'milestone' item: (issue milestone)).
	aOrderedCollection add: (LabelAndItem newLabel: 'task' item: (issue tasks)).
	issueDetail items: aOrderedCollection
].

self focusOrder add: leftDrawner; add: issueDetail; add: issueDetail.
]

{ #category : #initialization }
SpGithubApp >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Github App'
]
