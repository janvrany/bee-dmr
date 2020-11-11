"
    Copyright (c) 2020 LabWare.
    See (MIT) license in root directory.
"

Class {
	#name : #Kernel,
	#superclass : #Module,
	#instVars : [
		'runtime' ,
		'entrypointReceiver',
		'entrypointMethod'
	],
	#category : #Kernel
}

Kernel >> entry: argc argv: argv [	
	^5 factorial

]
