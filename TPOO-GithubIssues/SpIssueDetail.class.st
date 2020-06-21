"
comment
"
Class {
	#name : #SpIssueDetail,
	#superclass : #SpPresenter,
	#instVars : [
		'issueBodyDetail',
		'issueTasksDetail',
		'issue',
		'toolBar'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpIssueDetail class >> defaultSpec [
	^ 	SpBoxLayout newVertical
		add: #toolBar expand: false fill: false padding: 0;
		add: #issueBodyDetail;
		add: #issueTasksDetail;
		yourself.
]

{ #category : #initialization }
SpIssueDetail >> initializePresenters [

	toolBar := self newToolBar
		addItem: (SpToolBarButton new
			label: 'Open issue';
			action: [ issue ifNotNil:  [ issue open. self issue: issue.] ];
			yourself);
		addItem: (SpToolBarButton new
			label: 'Close issue';
			action: [ issue ifNotNil:  [ issue close. self issue: issue.] ];
			yourself);
		yourself.
	issueBodyDetail:= self instantiate: SpIssueBodyDetail.
	issueTasksDetail := self instantiate: SpIssueTasksDetail.

	self focusOrder add: issueBodyDetail; add: issueTasksDetail.
]

{ #category : #'api-shortcuts' }
SpIssueDetail >> issue: aIssue [
	|aOrderedCollection|

	issue := aIssue.
	aOrderedCollection := OrderedCollection new.
	aOrderedCollection add: (LabelAndItem newLabel: 'number' item: (issue number)).
	aOrderedCollection add: (LabelAndItem newLabel: 'title' item: (issue title)).
	aOrderedCollection add: (LabelAndItem newLabel: 'body' item: (issue body)).
	aOrderedCollection add: (LabelAndItem newLabel: 'state' item: (issue state)).
	aOrderedCollection add: (LabelAndItem newLabel: 'milestone' item: (issue milestone)).
	issueBodyDetail items: aOrderedCollection.
	issueTasksDetail items: issue tasks.
]
