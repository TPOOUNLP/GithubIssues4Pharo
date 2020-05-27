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
		'assignee',
		'assignees',
		'milestone',
		'comments',
		'created_at',
		'updated_at',
		'closed_at',
		'tasks'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #accessing }
Issue >> assignee [
	^ assignee
]

{ #category : #accessing }
Issue >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
Issue >> assignees [
	^ assignees
]

{ #category : #accessing }
Issue >> assignees: anObject [
	assignees := anObject
]

{ #category : #accessing }
Issue >> body [
	^ body
]

{ #category : #accessing }
Issue >> body: anObject [
	body := anObject.
]

{ #category : #actions }
Issue >> bodyIncludes: aText [
	"verifies if a given text is included in issue's body"

	^ self body includesSubstring: aText
]

{ #category : #accessing }
Issue >> closed_at [
	^ closed_at
]

{ #category : #accessing }
Issue >> closed_at: anObject [
	closed_at := anObject
]

{ #category : #accessing }
Issue >> comments [
	^ comments
]

{ #category : #accessing }
Issue >> comments: anObject [
	comments := anObject
]

{ #category : #actions }
Issue >> createdBy: aGitHubName [
	"verifica si el issue fue creado por el usuario dado"

	^ self user login equals: aGitHubName
]

{ #category : #accessing }
Issue >> created_at [
	^ created_at
]

{ #category : #accessing }
Issue >> created_at: anObject [
	created_at := anObject
]

{ #category : #accessing }
Issue >> milestone [
	^ milestone
]

{ #category : #accessing }
Issue >> milestone: anObject [
	milestone := anObject
]

{ #category : #actions }
Issue >> newerCreation: aDate [
	"verifica que el issue es más nuevo que una fecha dada."

	^ self created_at asDateAndTime < aDate
]

{ #category : #accessing }
Issue >> number [
	^ number
]

{ #category : #accessing }
Issue >> number: anObject [
	number := anObject
]

{ #category : #actions }
Issue >> olderCreation: aDate [
	"verifica que el issue es más nuevo que una fecha dada."

	^ self created_at asDateAndTime > aDate
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
Issue >> titleIncludes: aText [
	"verifies if a given text is included in issue's title"

	^ self title includesSubstring: aText
]

{ #category : #actions }
Issue >> updateTask: aOldText to: aNewText [
	body := body copyReplaceAll: aOldText with: aNewText.
]

{ #category : #accessing }
Issue >> updated_at [
	^ updated_at
]

{ #category : #accessing }
Issue >> updated_at: anObject [
	updated_at := anObject
]

{ #category : #accessing }
Issue >> user [
	^ user
]

{ #category : #accessing }
Issue >> user: anObject [
	user := anObject
]
