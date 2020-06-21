"
Demo page for SpecDemoDynamicPresentersListBuilder.
"
Class {
	#name : #SpTaskList,
	#superclass : #SpPresenter,
	#instVars : [
		'listTask'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #initialization }
SpTaskList >> initializePresenters [
	listTask := self newList.
	listTask items:  #('My Tasks' ).
	self focusOrder add: listTask.
]

{ #category : #initialization }
SpTaskList >> pageClass [

	^ SpDemoDynamicMemoryGamePresenter

]
