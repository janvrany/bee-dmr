"
    Copyright (c) 2020 Aucerna.
	Copyright (c) 2009-2018 Stefan Marr <git@stefan-marr.de>
    See license in root and /Performance/Benchmarks directories.
"

Class {
	#name : #DBEqualityConstraint,
	#superclass : #DBBinaryConstraint,
	#category : #SMDeltaBlue
}

{ #category : #'instance creation' }
DBEqualityConstraint class >> var: variable1 var: variable2 strength: strengthSymbol [
	"Install a constraint with the given strength equating the given
	 variables."

	^(self new) var: variable1 var: variable2 strength: strengthSymbol
]

{ #category : #planning }
DBEqualityConstraint >> execute [
	"Enforce this constraint. Assume that it is satisfied."
 
	(direction == #forward)
		ifTrue: [v2 value: v1 value]
		ifFalse: [v1 value: v2 value].
]

