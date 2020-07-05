Class {
	#name : #IssueComment,
	#superclass : #Object,
	#instVars : [
		'body'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #'instance creation' }
IssueComment class >> new: aString [
	|issueComment|
	issueComment  := self new.
	issueComment body: aString.
	^ issueComment.
]

{ #category : #accessing }
IssueComment >> body [
	^ body
]

{ #category : #accessing }
IssueComment >> body: anObject [
	body := anObject
]
