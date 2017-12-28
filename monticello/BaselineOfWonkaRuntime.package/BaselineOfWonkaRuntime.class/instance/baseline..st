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
                        versionString: '1.2.2';
                        operator: #=;
                        repository: 'http://www.squeaksource.com/MetacelloRepository';
                        loads: #('Core') ].
            spec
                configuration: 'Parasol' with: [ 
                    spec
                        versionString: '0.24';
                        operator: #=;
                        repository: 'http://ss3.gemstone.com/ss/Parasol' ].
            WonkaSourceCode instance isOnGemStonePlatform
                ifTrue: [ 
                    " FIXME: once this works, refactor this to use the standard spec for: #squeakCommon, spec for: #gemstone stuff"
                    spec
                        baseline: 'Seaside3' with: [ 
                            spec
                                repository: WonkaSourceCode instance localThirdPartySeaside31Repository;
                                loads: #('Core' 'Scriptaculous' 'Swazoo' 'Zinc') ] ]
                ifFalse: [ 
                    spec
                        configuration: 'Seaside3' with: [ 
                            spec
                                version: '3.1.4';
                                operator: #=;
                                repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
                                loads: #('Core' 'Scriptaculous' 'Swazoo' 'Zinc') ] ].
            spec
                project: 'SeasideDevelopment' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Development') ];
                configuration: 'Magritte3' with: [ 
                    spec
                        versionString: '3.3.1';
                        operator: #=;
                        repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main';
                        loads: #('Magritte-Seaside' 'Deprecated') ];
                configuration: 'XMLPullParser' with: [ 
                    spec
                        versionString: '1.5';
                        operator: #=;
                        repository: 'http://smalltalkhub.com/mc/hernan/XMLPullParser/main' ];
                package: 'CSV' with: [ 
                    "Note: the newest repository now seems to be http://www.smalltalkhub.com/mc/JohanBrichau/CSVParser/main but the versions there don't (yet) work"
                    spec
                        file: 'CSV-avi.3';
                        repository: 'http://www.squeaksource.com/CSV' ];
                package: 'Pier-Model' with: [ 
                     spec
                         file: 'Pier-Model-lr.416';
                         repository: pier2Repository;
                         requires: 'Magritte3' ];
                package: 'Pier-Seaside' with: [ 
                     spec
                         file: 'Pier-Seaside-lr.517';
                         repository: pier2Repository;
                         requires: 'Pier-Model' ];
                package: 'Pier-EditorEnh' with: [ 
                     spec
                         file: 'Pier-EditorEnh-NickAger.61';
                         repository: 'http://source.lukas-renggli.ch/pier2addons/';
                         requires: 'Pier-Seaside' ];
                package: 'WebTester-API' with: [ 
                     spec
                         file: 'WebTester-API-BartGauquie.1';
                         repository: webTesterRepository;
                         requires: 'Seaside3' ];
                package: 'WebTester-Selenium' with: [ 
                     spec
                         file: 'WebTester-Selenium-BartGauquie.22';
                         repository: webTesterRepository;
                         requires: 'WebTester-API' ];
                package: 'HudsonBuildTools' with: [ 
                     spec
                         file: 'HudsonBuildTools-lr.53';
                         repository: 'http://www.smalltalkhub.com/mc/pdebruic/HudsonBuildTools/main' ];
                group: 'Core' with: #('Seaside3' 'Magritte3' 'CSV' 'XMLPullParser' 'Pier-EditorEnh' 'XMLSupport');
                group: 'default' with: #('Core');
                group: 'AcceptanceTesting' with: #('Core' 'SeasideDevelopment');
                group: 'Tests' with: #('AcceptanceTesting' 'HudsonBuildTools' 'WebTester-Selenium') ];
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
               group: 'Tests' with: #('WebTester-Pharo-Selenium' 'Magritte3 Tools') ];
        for: #gemstone do: [ 
            spec
                baseline: 'SOAP' with: [ 
                    spec
                        repository: 'github://JupiterJones/SOAP:cb098312b6f0cc46f89884cb904b3c60b17741fb/repository';
                        loads: #('SOAP-Client') ];
                baseline: 'Zinc' with: [ 
                    spec
                        repository: 'github://GsDevKit/zinc:ecb237675a40aee8dee8b8d9ad42da301e928767/repository';
                        postLoadDoIt: #reinitializeZinc ];
                project: 'SeasideFastCGI' copyFrom: 'Seaside3' with: [ spec loads: #('Seaside-Adaptors-FastCGI') ];
                package: 'WebTester-Gemstone-Selenium' with: [ 
                    spec
                        file: 'WebTester-Gemstone-Selenium-BartGauquie.6';
                        repository: webTesterRepository;
                        requires: 'WebTester-Selenium' ];
                group: 'Core' with: #('Zinc' 'SeasideFastCGI' 'SOAP');
                group: 'Tests' with: #('WebTester-Gemstone-Selenium') ]