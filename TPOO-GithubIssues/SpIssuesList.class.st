"
comment
"
Class {
	#name : #SpIssuesList,
	#superclass : #SpPresenter,
	#instVars : [
		'issuesList'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #initialization }
SpIssuesList class >> defaultSpec [
^ SpBoxLayout newVertical
	add: #issuesList;
	yourself.
]

{ #category : #initialization }
SpIssuesList >> initializePresenters [
	issuesList := self newTable
		addColumn: (SpStringTableColumn title: '#' evaluated: #number);
		addColumn: (SpStringTableColumn title: 'Title' evaluated: #title);
		yourself.
]

{ #category : #initialization }
SpIssuesList >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Issues'
]

{ #category : #initialization }
SpIssuesList >> items: aCollection [
	issuesList items: aCollection.
]

{ #category : #initialization }
SpIssuesList >> whenSelectedItemChanged: aBlock [
	issuesList
		whenSelectionChangedDo: [ :selection | aBlock cull: selection selectedItem ]
]
