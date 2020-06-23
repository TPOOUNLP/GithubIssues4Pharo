"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPOOGithubIssues,
	#superclass : #PackageManifest,
	#category : #'TPOO-GithubIssues-Manifest'
}

{ #category : #'code-critics' }
ManifestTPOOGithubIssues class >> ruleRBImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'TPOO-GithubIssues')) #'2020-05-25T03:11:22.940284-03:00') )
]

{ #category : #'code-critics' }
ManifestTPOOGithubIssues class >> ruleRBLiteralArrayContainsCommaRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Issue #body: #false)) #'2020-05-25T04:21:27.820284-03:00') )
]

{ #category : #'code-critics' }
ManifestTPOOGithubIssues class >> ruleRBUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SpGithubApp #displayTask: #false)) #'2020-06-10T17:04:24.46487-03:00') )
]
