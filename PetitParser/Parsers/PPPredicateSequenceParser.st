"
    Copyright (c) 2020 Aucerna. 
    Copyright (c) 2008-2019 The Pharo Project, and Contributors.
    See (MIT) license in root directory.
"

Class {
	#name : #PPPredicateSequenceParser,
	#superclass : #PPPredicateParser,
	#instVars : [
		'size'
	],
	#category : #Parsers
}

{ #category : #'instance creation' }
PPPredicateSequenceParser class >> on: aBlock
message: aString
negated: aNegatedBlock
message: aNegatedString
size: anInteger [
	^self new
		initializeOn: aBlock
		message: aString
		negated: aNegatedBlock
		message: aNegatedString
		size: anInteger
]

{ #category : #'instance creation' }
PPPredicateSequenceParser class >> on: aBlock message: aString size: anInteger [
	^self
		on: aBlock
		message: aString
		negated: [:each | (aBlock value: each) not]
		message: 'no ' , aString
		size: anInteger
]

{ #category : #initialization }
PPPredicateSequenceParser >> initializeOn: aBlock
message: aString
negated: aNegatedBlock
message: aNegatedString
size: anInteger [
	predicate := aBlock.
	predicateMessage := aString.
	negated := aNegatedBlock.
	negatedMessage := aNegatedString.
	size := anInteger
]

{ #category : #operators }
PPPredicateSequenceParser >> negate [
	"Answer a parser that is the negation of the receiving predicate parser."

	^ self class
		on: negated message: negatedMessage
		negated: predicate message: predicateMessage
		size: size
]

{ #category : #parsing }
PPPredicateSequenceParser >> parseOn: aStream [
	| position result |
	position := aStream position.
	result := aStream next: size.
	(result size = size and: [predicate value: result]) ifTrue: [^result].
	aStream position: position.
	^PPFailure message: predicateMessage from: aStream
]

{ #category : #accessing }
PPPredicateSequenceParser >> size [
	"Answer the sequence size of the receiver."

	^ size
]

