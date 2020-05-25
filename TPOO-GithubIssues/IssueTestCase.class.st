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

{ #category : #accessing }
IssueTestCase >> client [
	^ client
]

{ #category : #accessing }
IssueTestCase >> client: anObject [
	client := anObject
]

{ #category : #accessing }
IssueTestCase >> resource [
	^ resource
]

{ #category : #accessing }
IssueTestCase >> resource: anObject [
	resource := anObject
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
	issues := self client
		getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'.
	self deny: issues isEmpty.
	self assert: issues size equals: 4
]

{ #category : #tests }
IssueTestCase >> testGetIssuesFromRepo [
	| issues issue |
	issues := self client
		getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'.
	self deny: issues isEmpty.
	issue := issues reverse at: 1.
	self assert: issue title equals: 'sample'.
	self assert: issue body equals: 'body sample'.
	self assert: issue state equals: 'open'.
	self assert: issue number equals: 1
]

{ #category : #tests }
IssueTestCase >> testGetIssuesFromUser [
	| assignedIssues issueAssigned |
		assignedIssues := client
		getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'
		user: 'JuanJoseBarrera'.
	self deny: assignedIssues isEmpty.
	issueAssigned := assignedIssues reverse at: 1.
	self assert: issueAssigned title equals: 'test 1'.
	self
		assert: issueAssigned body
		equals: 'Test to return an issue from a user.'.
	self assert: issueAssigned state equals: 'open'.
	self assert: issueAssigned number equals: 4
]
