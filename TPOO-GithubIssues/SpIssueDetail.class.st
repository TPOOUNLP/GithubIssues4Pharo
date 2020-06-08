"
comment
"
Class {
	#name : #SpIssueDetail,
	#superclass : #SpPresenter,
	#instVars : [
		'issueDetail'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpIssueDetail class >> defaultSpec [
	^ 	SpBoxLayout newVertical
		add: #issueDetail;
		yourself.
]

{ #category : #initialization }
SpIssueDetail >> initializePresenters [
	issueDetail := self newTable
		addColumn: (SpStringTableColumn title: 'Label' evaluated: #label);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: #item);
		yourself.
]

{ #category : #'api-shortcuts' }
SpIssueDetail >> items: aCollection [
	issueDetail items: aCollection.
]
