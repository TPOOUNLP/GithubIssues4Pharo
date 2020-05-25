"
Issue de GitHub

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #Issue,
	#superclass : #Object,
	#instVars : [
		'number',
		'state',
		'title',
		'body',
		'user',
		'tasks'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #accessing }
Issue >> body [
	^ body
]

{ #category : #accessing }
Issue >> body: anObject [
	body := anObject.
]

{ #category : #accessing }
Issue >> number [
	^ number
]

{ #category : #accessing }
Issue >> number: anObject [
	number := anObject
]

{ #category : #accessing }
Issue >> state [
	^ state
]

{ #category : #accessing }
Issue >> state: anObject [
	state := anObject
]

{ #category : #accessing }
Issue >> tasks [
	| lines |
	tasks
		ifNil: [ 
			lines := body lines select: [ :line | line beginsWithAnyOf: #('- [ ] ' '- [x] ') ].
			tasks := lines collect: [ :line | Task newText: line issue: self ] 
		].
	^ tasks
]

{ #category : #accessing }
Issue >> tasks: anObject [
	tasks := anObject
]

{ #category : #accessing }
Issue >> title [
	^ title
]

{ #category : #accessing }
Issue >> title: anObject [
	title := anObject
]

{ #category : #actions }
Issue >> updateTask: aOldText to: aNewText [
	body := body copyReplaceAll: aOldText with: aNewText.
]

{ #category : #accessing }
Issue >> user [
	^ user
]

{ #category : #accessing }
Issue >> user: anObject [
	user := anObject
]
