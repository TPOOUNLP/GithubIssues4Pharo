"
Resource para IssueTestCase
"
Class {
	#name : #IssueResource,
	#superclass : #TestResource,
	#instVars : [
		'client'
	],
	#category : #'TPOO-GithubIssues-Tests'
}

{ #category : #accessing }
IssueResource >> client [
	^ client
]

{ #category : #accessing }
IssueResource >> client: anObject [
	client := anObject
]

{ #category : #running }
IssueResource >> setUp [
	client := GithubClient new.
	client authenticate
]

{ #category : #running }
IssueResource >> tearDown [ 
	client release.
]
