"
comment
"
Class {
	#name : #SpLeftDrawner,
	#superclass : #SpPresenter,
	#instVars : [
		'list'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #specs }
SpLeftDrawner class >> defaultSpec [
^ SpBoxLayout newHorizontal
	add: #list;
	yourself.
]

{ #category : #initialization }
SpLeftDrawner >> initializePresenters [
	list := self newList.
	list items:  #('My issues' 'Project').
	self focusOrder add: list.
]

{ #category : #initialization }
SpLeftDrawner >> initializeWindow: aWindowPresenter [
	aWindowPresenter title: 'Menu'
]

{ #category : #initialization }
SpLeftDrawner >> whenSelectedItemChanged: aBlock [
	list
		whenSelectionChangedDo: [ :selection | aBlock cull: selection selectedItem ]
]
