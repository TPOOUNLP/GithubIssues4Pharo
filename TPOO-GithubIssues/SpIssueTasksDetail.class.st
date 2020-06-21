"
Demo page for SpecDemoDynamicPresentersListBuilder.
"
Class {
	#name : #SpIssueTasksDetail,
	#superclass : #SpPresenter,
	#instVars : [
		'tasksTable'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpIssueTasksDetail class >> defaultSpec [
	^ 	SpBoxLayout newVertical
		add: #tasksTable;
		yourself.
]

{ #category : #initialization }
SpIssueTasksDetail >> initializePresenters [
	tasksTable  := self newTable.
	tasksTable 
		addColumn: ((SpCheckBoxTableColumn title: ' ' evaluated: [ :task | task checked ])
				onActivation: [ :task | 
					task check. ];
				onDesactivation: [ :task | 
					task uncheck. ];
				width: 20;
				yourself);
		addColumn: (SpStringTableColumn title: 'Tasks' evaluated: #name).
]

{ #category : #initialization }
SpIssueTasksDetail >> items: aTasksCollection [
	tasksTable items: aTasksCollection.

]
