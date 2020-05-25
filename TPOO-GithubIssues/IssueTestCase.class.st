"
comment
"
Class {
	#name : #IssueTestCase,
	#superclass : #TestCase,
	#instVars : [
		'resource',
		'client'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #accessing }
IssueTestCase class >> resources [
	^ Array with: IssueResource
]

{ #category : #running }
IssueTestCase >> setUp [
	super setUp.
	resource := IssueResource current.
	client := resource client.
]

{ #category : #tests }
IssueTestCase >> testGetAllIssues [
	| issues |
	issues := client getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'.
	self deny: issues isEmpty.

	self assert: issues size equals: 2
]

{ #category : #tests }
IssueTestCase >> testGetIssuesFromRepo [
	|issues issue|
	issues := client getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'.
	self deny: (issues isEmpty).
	issue := issues reverse  at: 1.
	self assert: (issue title) equals: 'sample'.
	self assert: (issue body) equals: 'body sample'.
	self assert: (issue state) equals: 'open'.
	self assert: (issue number) equals: 1.
]
