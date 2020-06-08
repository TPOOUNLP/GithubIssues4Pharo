"
comment
"
Class {
	#name : #LabelAndItem,
	#superclass : #Object,
	#instVars : [
		'label',
		'item'
	],
	#category : #'TPOO-GithubIssues'
}

{ #category : #'instance creation' }
LabelAndItem class >> newLabel: aString item: aString2 [
	|inst|
	inst := self new.
	inst label: aString.
	inst item: aString2.
	^inst.
]

{ #category : #accessing }
LabelAndItem >> item [
	^ item
]

{ #category : #accessing }
LabelAndItem >> item: anObject [
	item := anObject
]

{ #category : #accessing }
LabelAndItem >> label [
	^ label
]

{ #category : #accessing }
LabelAndItem >> label: anObject [
	label := anObject
]
