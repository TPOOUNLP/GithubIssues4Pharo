"
comment
"
Class {
	#name : #SpIssueDetail,
	#superclass : #SpPresenter,
	#instVars : [
		'issueDetail',
		'issueTask'
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
		addColumn: (SpStringTableColumn title: 'task' evaluated: #task);
		yourself.
]

{ #category : #'api-shortcuts' }
SpIssueDetail >> items: aCollection [
	issueDetail items: aCollection.
]
