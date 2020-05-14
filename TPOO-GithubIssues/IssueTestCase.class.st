Class {
	#name : #IssueTestCase,
	#superclass : #TestCase,
	#instVars : [
		'client'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #running }
IssueTestCase >> defaultTimeLimit [
	^ 30 seconds.	
]

{ #category : #running }
IssueTestCase >> setUp [
	client := GithubClient new.
	
]

{ #category : #tests }
IssueTestCase >> testGetIssuesOfRepo [
	|issues issue|
	client authenticate.
	(Delay forSeconds: 10) wait.
	issues := client getIssuesFromRepo: 'TPOOUNLP/GithubIssues4Pharo'.
	self deny: (issues isEmpty).
	issue := issues at: 1.
	self assert: (issue title) equals: 'sample'.
	self assert: (issue body) equals: 'body sample'.
	self assert: (issue state) equals: 'open'.
	self assert: (issue number) equals: 1.
]
