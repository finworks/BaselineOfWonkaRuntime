baselines
baseline: spec
    <lint: #WonkaLongMethodsRule rationale:
        'Metacello baseline methods by design are just long boring laundry lists of dependencies and not idiomatically split into pieces'>
    <lint: #WonkaUtilityMethodsRule rationale: 'Metacello wants these baseline methods on the instance side'>
    <baseline>
    | webTesterRepository pier2Repository |
    webTesterRepository := 'http://www.squeaksource.com/WebTester/'.
    pier2Repository := 'http://www.smalltalkhub.com/mc/Pier/Pier2/main'.
    spec
        for: #common do: [ 
            spec
                description: 'Wonka Runtime Project. This is the base on which other projects are loaded';
		configuration: 'XMLSupport' with: [ 
		   spec
		     versionString: '1.3.0';
		     operator: #=;
		     repository: 'http://www.squeaksource.com/MetacelloRepository';
		     loads: #('Core')
		];
                configuration: 'XMLWriter' with: [
		   spec
		     versionString: '2.8.3';
                     repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLWriter/main';
		     operator: #=;
		     loads: #('Core')
                ];
                configuration: 'OrderPreservingDictionary' with: [
		   spec
		     versionString: '1.3.8';
                     repository: 'http://smalltalkhub.com/mc/PharoExtras/OrderPreservingDictionary/main';
		     operator: #=;
		     loads: #('Core')
                ];
		baseline: 'Seaside3' with: [
		   spec
		      repository: 'github://SeasideSt/Seaside:v3.2.4/repository';
"		      repository: 'github://SeasideSt/Seaside/repository';"
    "		  versionString: 'v3.2.4';"
    "		  versionString: #'3.2.2';"
    "		  versionString: #'release3.2';"

		      operator: #=;
		      loads: #('Core' 'Scriptaculous' 'Swazoo' 'Zinc').
		];
                project: 'SeasideDevelopment' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Development') ];
		configuration: 'Magritte3' with: [
		   spec
		      repository: 'github://GsDevKit/Magritte3/repository';
		      versionString: '3.5.0';
		      operator: #=;
		      loads: #('Seaside' 'Deprecated').
		];
		project: 'XMLPullParser' with: [ 
		  spec
		      className: 'ConfigurationOfXMLPullParser';
		      versionString: '1.5';
		      operator: #=;
		      repository: 'http://smalltalkhub.com/mc/hernan/XMLPullParser/main'
		];
		package: 'CSV' with: [ 
		  spec
		    file: 'CSV-topa.14';
		    repository: 'http://www.squeaksource.com/CSV'
		];		
		package: 'Pier-Model' with: [ 
		  spec
		      file: 'Pier-Model-AvO.422';
		      repository: 'http://www.smalltalkhub.com/mc/Pier/Pier2/main';
		      requires: 'Magritte3' 
		];		
		package: 'Pier-Seaside' with: [ 
		  spec
		      file: 'Pier-Seaside-NickAger.526';
		      repository: 'http://www.smalltalkhub.com/mc/Pier/Pier2/main';
		      requires: 'Pier-Model'
		];
		package: 'Pier-EditorEnh' with: [ 
		  spec
		      file: 'Pier-EditorEnh-NickAger.62';
		      repository: 'http://www.smalltalkhub.com/mc/Pier/Pier2Addons/main';
		      requires: 'Pier-Seaside'
		];		  
		package: 'WebTester-API' with: [ 
		  spec
		      file: 'WebTester-API-BartGauquie.1';
		      repository: 'http://www.squeaksource.com/WebTester/';
		      requires: 'Seaside3' 
		];
		package: 'WebTester-Selenium' with: [ 
		  spec
		      file: 'WebTester-Selenium-PatrickRein.24';
		      repository: 'http://www.squeaksource.com/WebTester/';
		      requires: 'WebTester-API' ];
		package: 'HudsonBuildTools' with: [ 
		  spec
		      file: 'HudsonBuildTools-lr.53';
		      repository: 'http://www.smalltalkhub.com/mc/pdebruic/HudsonBuildTools/main'
		];
                group: 'Core' with: #('Seaside3' 'Magritte3' 'CSV' 'XMLPullParser' 'Pier-EditorEnh' 'XMLSupport' 'XMLWriter');
                group: 'default' with: #('Core');
                group: 'AcceptanceTesting' with: #('Core' 'SeasideDevelopment');
                group: 'CI' with: #('AcceptanceTesting' 'HudsonBuildTools' 'WebTester-Selenium') ];
        for: #squeakCommon do: [ 
           spec
               configuration: 'SoapOpera' with: [ 
                   spec
                       versionString: '1.0';
                       operator: #=;
                       repository: 'http://www.squeaksource.com/MetacelloRepository';
                       loads: #('SOAP-Core' 'SOAP-Client' 'SoXML') ];
               configuration: 'ZincHTTPComponents' with: [ 
                   "As of 13 Aug 2014 Pharo1.4 cannot use the same Zinc baseline that GemStone does, due to syntax error in
                     Base64MimeConverter>>mimeEncodeOneLine (underscore for assignment), and DNUs while loading "
                   spec
                       versionString: '2.4.3';
                       operator: #=;
                       repository: 'http://www.smalltalkhub.com/mc/SvenVanCaekenberghe/ZincHTTPComponents/main' ];
               project: 'Magritte3 Tools' copyFrom: 'Magritte3' with: [ spec loads: #('Tools') ];
               configuration: 'CommandShell' with: [ 
                   spec
                       versionString: '4.6.9';
                       operator: #=;
                       repository: 'http://www.squeaksource.com/MetacelloRepository';
                       loads: #('Core');
                       postLoadDoIt: #addToPharoStartupList ];
               package: 'WebTester-Pharo-Selenium' with: [ 
                   spec
                       file: 'WebTester-Pharo-Selenium-BKBAG.5';
                       repository: webTesterRepository;
                       requires: #('WebTester-Selenium') ];
               group: 'Core' with: #('ZincHTTPComponents' 'CommandShell' 'SoapOpera');
               group: 'CI' with: #('WebTester-Pharo-Selenium' 'Magritte3 Tools') ];
        for: #gemstone do: [ 
            spec
		baseline: 'SOAP' with: [ 
		   spec
		      repository: 'github://JupiterJones/SOAP:cb098312b6f0cc46f89884cb904b3c60b17741fb/repository';
		      loads: #('SOAP-Client') ];
		baseline: 'ZincHTTPComponents' with: [ 
		   spec
		      repository: 'github://GsDevKit/zinc:v2.4.3.6/repository'
		];
                project: 'SeasideFastCGI' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Adaptors-FastCGI') ];
		package: 'WebTester-Gemstone-Selenium' with: [ 
		   spec
		      file: 'WebTester-Gemstone-Selenium-BartGauquie.6';
		      repository: 'http://www.squeaksource.com/WebTester/';
		      requires: 'WebTester-Selenium' ];
                group: 'Core' with: #('ZincHTTPComponents' 'SOAP' 'SeasideFastCGI');
                group: 'CI' with: #('WebTester-Gemstone-Selenium') ]