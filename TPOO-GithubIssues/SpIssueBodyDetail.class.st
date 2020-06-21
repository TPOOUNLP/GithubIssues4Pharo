"
a comment
"
Class {
	#name : #SpIssueBodyDetail,
	#superclass : #SpPresenter,
	#instVars : [
		'issueBodyDetail'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpIssueBodyDetail class >> defaultSpec [
	^ 	SpBoxLayout newVertical
		add: #issueBodyDetail;
		yourself.
]

{ #category : #initialization }
SpIssueBodyDetail >> initializePresenters [
	issueBodyDetail := self newTable
	
		addColumn: (SpStringTableColumn title: 'Label' evaluated: #label);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: #item);
		yourself.
]

{ #category : #'api-shortcuts' }
SpIssueBodyDetail >> items: aCollection [
	issueBodyDetail items: aCollection.
]
