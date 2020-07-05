Class {
	#name : #SpIssueComment,
	#superclass : #SpPresenter,
	#instVars : [
		'field',
		'button1',
		'button2',
		'issue'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpIssueComment class >> defaultSpec [
	^ SpBoxLayout newVertical
			add: #field;
			add:
			(SpBoxLayout newHorizontal
				add: #button1;
				add: #button2;
				yourself)
			withConstraints: [ :constraints | constraints height: self buttonHeight ];
			yourself.
]

{ #category : #initialization }
SpIssueComment >> initializePresenters [
	field := self newTextInput autoAccept: true.
	button1 := self newButton
			label: 'Comment';
			action: [ 
				GithubClient instance commentIssue: issue comment: (IssueComment new: (field text)) repo: 'TPOOUNLP/GithubIssues4Pharo'.
				self delete.
			];
			yourself.
	button2 := self newButton
			label: 'Cancel';
			action: [ self delete. ];
			yourself.
]

{ #category : #initialization }
SpIssueComment >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Comment issue'
]

{ #category : #accessing }
SpIssueComment >> issue [
	^ issue
]

{ #category : #accessing }
SpIssueComment >> issue: anObject [
	issue := anObject
]
