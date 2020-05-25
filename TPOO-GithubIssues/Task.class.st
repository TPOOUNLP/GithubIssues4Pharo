"
comment
"
Class {
	#name : #Task,
	#superclass : #Object,
	#instVars : [
		'checked',
		'name',
		'issue',
		'text'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #'instance creation' }
Task class >> newText: aText issue: anIssue [
	|instance|
	instance := self new.
	instance text: aText.
	instance issue: anIssue.
	instance checked: (aText beginsWith: '- [x] ').
	instance name: (instance checked
		ifTrue: [ aText copyReplaceAll: '- [x] ' with: '' ]
		ifFalse: [ aText copyReplaceAll: '- [ ] ' with: '' ]).
	^instance.
]

{ #category : #actions }
Task >> check [ 
	|newText|
	checked := true.
	newText := '- [x] ' , name.
	issue updateTask: text to: newText.
	text:= newText.
]

{ #category : #accessing }
Task >> checked [
	^ checked
]

{ #category : #accessing }
Task >> checked: anObject [
	checked := anObject
]

{ #category : #accessing }
Task >> issue [
	^ issue
]

{ #category : #accessing }
Task >> issue: anObject [
	issue := anObject
]

{ #category : #accessing }
Task >> name [
	^ name
]

{ #category : #accessing }
Task >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Task >> text [
	^ text
]

{ #category : #accessing }
Task >> text: anObject [
	text := anObject
]

{ #category : #actions }
Task >> uncheck [ 
	|newText|
	checked := false.
	newText := '- [ ] ' , name.
	issue updateTask: text to: newText.
	text:= newText.
]
