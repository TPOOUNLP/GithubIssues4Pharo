"
usuario de github 

login nickname o nombre visible del usuario
name nombre completo del usuario de github 

"
Class {
	#name : #UserGit,
	#superclass : #Object,
	#instVars : [
		'id',
		'login',
		'name',
		'location',
		'email'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #accesing }
UserGit >> email [
^ email
]

{ #category : #accesing }
UserGit >> email: anObject [
	email := anObject
]

{ #category : #accesing }
UserGit >> id [
^ id
]

{ #category : #accesing }
UserGit >> id: anObject [
	id := anObject
]

{ #category : #accesing }
UserGit >> location [
^ location
]

{ #category : #accesing }
UserGit >> location: anObject [
	location := anObject
]

{ #category : #accesing }
UserGit >> name [
^ name
]

{ #category : #accesing }
UserGit >> name: anObject [
	name := anObject
]
