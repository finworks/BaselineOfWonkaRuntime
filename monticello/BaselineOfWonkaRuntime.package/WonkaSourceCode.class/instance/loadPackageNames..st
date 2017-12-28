actions
loadPackageNames: packageNames
	| gofer |
	gofer := self localGofer.
	packageNames do: [ :packageName | gofer package: packageName ].
	gofer load