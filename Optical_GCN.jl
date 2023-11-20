using HTTP , CSV, DataFrames
function doanalysis()
    dfg=nothing
       for x in 1:36000
           print("\r peeking at GCN $x ")
			try
               #url = "https://gcn.nasa.gov/circulars/$x.txt"
               #resp = HTTP.get(url) 
               #status=resp.status
               #print(" ",status," "); 
               #if status == 404 ; println("status=",status); continue; end          
               #txt = String(resp.body)
               txt=read("/home/raman/Documents/archive/archive.txt/$x.txt", String)
               tch=match(r"(\sJean int Zand\s)|(\sbehalf of the Fermi-?\s?GBM\s)|(\bbehalf of the AstroSat CZTI\b)|(\bbehalf of the HEND/Mars Odyssey\b)|(\bon behalf of the Fermi-?\s?LAT\b)|(\bIceCube Collaboration .* reports:\s)|(\bbehalf of the Insight-?\s?HXMT team:\s)|(\bon behalf of the HAWC)|(\son behalf of BeppoSAX\s)|(\bbehalf of the BATSE GRB\b)|(\bbehalf of the RXTE\b)|(\son behalf of the Ulysses\s)|(\son behalf of the HETE\s)|(\son\sbehalf\sof\sthe\sINTEGRAL\s)|(\sbehalf\sof\sthe\sSwift-?\s?BAT\s)|(\sbehalf\sof\sthe\sSwift-?\s?XRT\s)|(\bon\bbehalf\bof the MAXI team:\b)|(\son\sbehalf\sof\sthe AGILE Team:\s)|(\sand\sthe\sCALET collaboration:\s)|(\sbehalf\sof\sthe H\.E\.S\.S\. collaboration\s)|(\sbehalf\sof\sthe\sANTARES Collaboration:\s)"m,txt)
				if tch!=nothing; println(tch.match); continue; end
			    ptxt=first(txt,600)
				ys=match(r"(\breport on behalf of the Swift/UVOT\b)|(V. Lipunov)|(\bMASTER-Net\b)|(\bGROND\b)|(\bRATIR\b)|(\bMPG-ESO\b)|(\bHaroldJohnson\b)|(\b60inches\b)|(\bLiverpool\b)|(\bRTT150\b)|(\bKAIT\b)|(\bPAIRITEL\b)|(\bF555W\b)|(\bFaulkes-North\b)|(\bB&C\b)|(\bSMARTS\b)|(\bLiverpool\b)|(\bMITSuME\b)|(\bSampurnanand\b)|(\b25cm\b)|(\b30cm\b)|(\bRAPTOR\b)|(\bHiltner\b)|(\bMcGrawHill\b)|(\bTAROT\b)|(\bHCT\b)|(\bTNT\b)|(\bZTSH\b)|(\bAZT-11\b)|(\bYatsugatakeCamera\b)|(\bOttoStruve\b)|(\bTNG\b)|(\bMASTER-SAAO\b)|(\b1m\b)|(\bKAIT\b)|(\bDanish\b)|(\bFaulkes-South\b)|(\bMASTER-Tunka\b)|(\bROTSE-IIIc\b)|(\bAZT-22\b)|(\bNUTTelA-TAO\b)|(\bMASTER-OAFA\b)|(\bREM\b)|(\bWatcher\b)|(\bRAPTOR-S\b)|(\bTAROT-S\b)|(\bCOATLI\b)|(\bROTSE-IIIa\b)|(\bPAIRITEL\b)|(\bVLT\b)|(\bMASTER-Kislovodsk\b)|(\bVLT\b)|(\bAZT-33VM\b)|(\bHiltner\b)|(\bGTC\b)|(\bT150\b)|(\bREM\b)|(\bZeiss-1000\b)|(\bZeiss-600\b)|(\bTautenberg\b)|(\bGemini-South\b)|(\bGemini-North\b)|(\b1m\b)|(\bMITSuME\b)|(\bKeck-1\b)|(\bSimeiz\b)|(\bMASTER-IAC\b)|(\bMURIKABUSHI\b)|(\bLiverpool\b)|(\bROTSE-III\b)|(\bSARA-\w\w\b)|(\bB&C\b)|(\bMASTER-Tavrida\b)|(\bGWAC-F60A\b)|(\bUKIRT\b)|(\b1.2m\b)|(\bANTU-VLT-UT1\b)|(\bFaulkes-South\b)|(\bBOK\b)|(\bAS-32\b)|(\bPROMPT-4\b)|(\bCassini\b)|(\bANTU-VLT\b)|(\bVT-50\b)|(\bMASTER-Progenitor\b)|(\bNickel\b)|(\bZeiss-1000\b)|(\bPROMPT-1\b)|(\bBTA\b)|(\bKANATA\b)|(\bBOOTES-2-TELMA\b)|(\bMASTER-Amur\b)|(\bSwope\b)|(\bLCOGT\b)|(\bPROMPT-3\b)|(\bANTU-VLT-UT1\b)|(\bGMG\b)|(\bPAIRITEL\b)|(\bduPont\b)|(\bSuper-LOTIS\b)|(\bNTT\b)|(\bPROMPT-2\b)|(\b1m\b)|(\bPioftheSkySouth\b)|(\bNicholasUMayall\b)|(\bHiltner\b)|(\b1m\b)|(\bNEXT\b)|(\bSamuelOschin\b)|(\biTelescope\b)|(\bHST\b)|(\bNTT\b)|(\bUSNO-FS\b)|(\bHST\b)|(\bMagellan2Clay\b)|(\b1.23m\b)|(\bLiverpool\b)|(\bKuiper\b)|(\bBOOTES-1B\b)|(\bHST\b)|(\b1.3m\b)|(\b2.2m\b)|(\bAEOS\b)|(\bMcGrawHill\b)|(\bMercator\b)|(\bAZT-20\b)|(\bTAOS-B\b)|(\bIRSF\b)|(\b0.4m\b)|(\bNMSU\b)|(\bCichoki\b)|(\bIAC80\b)|(\b1m\b)|(\b1m\b)|(\bKISO\b)|(\bISON-NM\b)|(\b6.5m\b)|(\bVLT-UT4-Yepun\b)|(\bHST\b)|(\bAZT-22\b)|(\bDCT\b)|(\b1.3m\b)|(\bGROWTH-India\b)|(\b2.2m\b)|(\bGemini-North\b)|(\bHale\b)|(\bBTA\b)|(\bMASTER-II-West\b)|(\bNTT\b)|(\bSMARTS\b)|(\bSMARTS\b)|(\bVLT-Yepun\b)|(\bMAGNUM\b)|(\bAZT-8\b)|(\bMagellan1Baade\b)|(\bREM\b)|(\bD50\b)|(\bMeerLICHT\b)|(\b0.35m\b)|(\bISON-SANTEL-650\b)|(\bMagellan2Clay\b)|(\bESO-VISTA\b)|(\bPROMPT-5\b)|(\bINT\b)|(\bVLT-UT3-Melipal\b)|(\b3.5m\b)|(\bMASTER-II-East\b)|(\bWHT\b)|(\bROTSEI-IIId\b)|(\bWarsaw\b)|(\bSDSS-PT\b)|(\bYale\b)|(\bRC-360\b)|(\bMOA-I\b)|(\bVBT\b)|(\b2.16m\b)|(\bTAROT\b)|(\bTNG\b)|(\bBOOTES-IR\b)|(\bVLT-UT2-Kueyen\b)|(\bKeck-1\b)|(\bMagellan2Clay\b)|(\bTNG\b)|(\bWHT\b)|(\bDOT\b)|(\bHST\b)|(\bT21\b)|(\bFRAM\b)|(\bT100\b)|(\b1.3m\b)|(\bUKIRT\b)|(\biTelescope32\b)|(\bbehalf of the ARC\b)|(\bCopernico\b)|(\bKeck-2\b)|(\bMagellan1Baade\b)|(\bLBT\b)|(\bRIMOTS\b)|(\bT11\b)|(\bSwope\b)|(\b32cm\b)|(\bSchmidt\b)|(\bLiverpool\b)|(\bGemini-South\b)|(\bMagellan1Baade\b)|(\bVLT\b)|(\bSwope\b)|(\bLBT\b)|(\bStrand\b)|(\bAAT\b)|(\bDall-Kirkham\b)|(\bMASTER-Ural\b)|(\bORI-40\b)|(\bRC80\b)|(\bREM\b)|(\bUKIRT\b)|(\b1.5m\b)|(\b0.5m\b)|(\b3.5m\b)|(\bWIYN\b)|(\bMagellan1Baade\b)|(\bSALT\b)|(\bBTA\b)|(\bANU\b)|(\biTelescope\b)|(\bZeiss-2000\b)|(\bXinglong\b)|(\bGnosca\b)|(\b1.2m\b)|(\b0.35m\b)|(\bVictorMBlanco\b)|(\bSubaru\b)|(\bSamuelOschin\b)|(\b1m\b)|(\bCrimean-MSU-ZTE\b)|(\bBTA\b)|(\b0.4m\b)|(\bNOWT\b)|(\bSintesz\b)|(\b1m\b)|(\bKANATA\b)|(\b0.53m\b)|(\b0.5m\b)|(\b2.3m\b)|(\bSMARTS\b)|(\bSubaru\b)|(\bMOA\b)|(\bWHT\b)|(\bVLT-Kueyen\b)|(\bVLT-UT3-Melipal\b)|(\bSOAR\b)|(\bVictorMBlanco\b)|(\b0.8m\b)|(\bGORT\b)|(\bKeck-2\b)|(\b2.1m\b)|(\bMPG-ESO\b)|(\bNAYUTA\b)|(\b0.5m\b)|(\b1.5m\b)|(\bT18\b)|(\bStella-I\b)|(\bNTT\b)|(\bCFHT\b)|(\bHale\b)|(\b0.35m\b)|(\bRC-1000\b)|(\b0.30m\b)|(\bTIRGO\b)|(\bWarsaw\b)|(\bHiltner\b)|(\bCFHT\b)|(\bIRTF\b)|(\b40cm\b)|(\bWHT\b)|(\bVLT-UT3-Melipal\b)|(\bLCOGT-SAAO\b)|(\bBTA\b)|(\bminiTAO\b)|(\bT-CAT\b)|(\bSOAR\b)|(\b1.5m\b)|(\bK-800\b)|(\bOttoStruve\b)|(\bVATT\b)|(\bBOOTES-3-YA\b)|(\bJKT\b)|(\bANU\b)|(\b0.4m\b)|(\b1m\b)|(\bMASTER-Vostrykovo\b)|(\bCelestron\b)|(\bAZT-24\b)|(\b60-90cm\b)|(\bWIYN\b)|(\bLB-0001\b)|(\bAZT-22\b)|(\bGRAS-05\b)|(\bOttoStruve\b)|(\bVLT(4x8.2m+AT4x1.8m)\b)|(\bZeiss-1000\b)|(\b1m\b)|(\bOM\b)|(\bYerkes-41\b)|(\bAZT-8\b)|(\bVictorMBlanco\b)|(\bHST\b)|(\bKeck-1\b)|(\bLOTIS\b)|(\bCFHT\b)|(\bSubaru\b)|(\bUSNO\b)|(\bJAST80\b)|(\bBOOTES-5-JGT\b)|(\bWHT\b)|(\b1m\b)|(\bR-COP\b)|(\bHale\b)|(\b0.81m\b)|(\bART-3b\b)|(\bT7\b)|(\bKISO\b)|(\bKISO\b)|(\b1.23m\b)|(\bPROMPT-8\b)|(\bFaulkes-North\b)|(\bKANATA\b)|(\bSBG\b)|(\bNicholasUMayall\b)|(\bPerkins\b)|(\bTAOS-D\b)|(\bLBT\b)|(\bLBT\b)|(\b188cm\b)|(\b1.5m\b)|(\b0.28m\b)|(\bART\b)|(\bANU\b)|(\b0.43m\b)|(\b0.35m\b)|(\b25cm\b)|(\b15.5cm\b)|(\b1.23m\b)|(\b14inch\b)|(\b6.5m\b)|(\bATLAS\b)|(\b1.2m\b)|(\bAZT-8\b)|(\bKeck-2\b)|(\bNicholasUMayall\b)|(\bWIYN\b)|(\bBOOTES-4\b)|(\bSLT\b)|(\bATLAS\b)|(\bSubaru\b)|(\b0.6m\b)|(\b1.2m\b)|(\bTuria2\b)|(\bFRAM\b)|(\bGOTO\b)|(\bART\b)|(\bRIBOTS\b)|(\bAROMA-N\b)|(\bLSGT\b)|(\bCarlosSanchez\b)|(\b32cm\b)|(\bOAN\b)|(\bAT-64\b)|(\b6.5m\b)|(\bAshra-AFT\b)|(\bPS2\b)|(\bORI-25\b)|(\bHGB-500\b)|(\bGRAS-04\b)|(\bUH88\b)|(\bDDOTI\b)|(\bMITSuME\b)|(\bGTC\b)|(\bT90\b)|(\bT24\b)|(\bAST3-3\b)|(\b1.8m\b)|(\bISON-ORI-22\b)|(\bK-380\b)|(\b16inches\b)|(\bGRT\b)|(\bSANTEL-400\b)|(\bNRIAG\b)|(\bMagellan1Baade\b)|(\bShane\b)|(\bBlackGEM\b)|(\bTAOS-A\b)|(\bGRAS-04\b)|(\b0.8m\b)|(\bHobbyEberly\b)|(\bHiltner\b)|(\bMOA-II\b)|(\bRCC\b)|(\b0.8m\b)|(\b0.6m\b)|(\bBART\b)|(\bRIKEN\b)|(\biTelescope\b)|(\bPROMPT-7\b)|(\b0.8m\b)|(\b0.9m\b)|(\b0.3m\b)|(\bSposetti\b)|(\bStoneEdge\b)|(\bLOTTI\b)|(\bGRAS-017\b)|(\bKISO\b)|(\b3.5m\b)|(\bT50-Banon\b)|(\bMTM-500\b)|(\bPROMPT-6\b)|(\bSMARTS\b)|(\b1.2m\b)|(\bGETS\b)|(\bHST\b)|(\bKeck-2\b)|(\bRAPTOR-B\b)|(\b1m\b)|(\bMagellan1Baade\b)|(\b0.5m\b)|(\bDutch\b)|(\bST-60cm\b)|(\b0.25m\b)|(\bLCOGT\b)|(\bCFHT\b)|(\bCOATLI\b)|(\b65cm\b)|(\bPT5M\b)|(\bWHT\b)|(\bESO-VST\b)|(\bVLT-Kueyen\b)|(\bVLT(4x8.2m+AT4x1.8m)\b)|(\bHale\b)|(\bBTA\b)|(\bminiMegaTORTORA\b)|(\bAZT-33VM\b)|(\b32cm\b)|(\b0.61m\b)|(\bGRAS-002\b)|(\bART-3a\b)|(\bT60\b)|(\b2.3m\b)|(\bGWAC-F60A\b)|(\bGWAC-F60B\b)|(\bABT\b)|(\b1.01m\b)|(\b1.01m\b)|(\bBAO\b)|(\bVT\b)|(\b0.30m\b)|(\b1.52m\b)|(\b1m\b)|(\bCAT\b)|(\bSpirex\b)|(\bRSV-2048B\b)|(\bTNT\b)|(\bC2PU\b)|(\bC11\b)|(\bFARO\b)|(\bZeiss\b)|(\bBOOTES\b)|(\b6.5m\b)|(\bTTT\b)|(\bAstrolab-IRIS\b)|(\bAtlas\b)|(\bBGO\b)|(\bCO-K26\b)|(\bCrous-Gats\b)|(\bEHEA-WL\b)|(\bGPO\b)|(\bHVO\b)|(\bLCO-MDO\b)|(\bNMSkies\b)|(\bSRO-Auberry\b)|(\bSte-Sophie\b)|(\bT-BRO\b)|(\b1.5m\b)|(\bSSS-220\b)|(\bIGO\b)|(\bRC-25\b)|(\bKeck-1\b)|(\bKeck-2\b)|(\b1m\b)|(\bZeiss\b)|(\bWIYN\b)|(\bC40\b)|(\bMagellan1Baade\b)|(\bMagellan2Clay\b)|(\b0.5m\b)|(\bLB-0002\b)|(\bVega\b)|(\bNTT\b)|(\bNTT\b)|(\bTAOS\b)|(\b30cm\b)|(\bIRTF\b)|(\bIRTF\b)|(\bMorrisOffit\b)|(\bKT-50\b)|(\b40cm\b)|(\b0.3m\b)|(\b2.1m\b)|(\b1.5m\b)|(\b0.51m\b)|(\bLiverpool\b)|(\bTNG\b)|(\bWHT\b)|(\bWHT\b)|(\bWHT\b)|(\bOTSK\b)|(\bKNC-HAO\b)|(\b1.8m\b)|(\bBTA\b)|(\bRC500-2\b)|(\b1m\b)|(\b0.6m\b)|(\biTelescope\b)|(\bKMTNet\b)|(\bUST\b)|(\bCOAST\b)|(\bOGS\b)|(\bTCS\b)|(\b0.30m\b)|(\bGRAS-007\b)|(\b0.35m\b)|(\b0.4m\b)|(\bSR-22\b)|(\b0.4m\b)|(\bSNOVA\b)|(\bWFT\b)|(\bGTC\b)|(\b24inches\b)|(\bWIDGET\b)|(\b1.3m\b)|(\b28cm\b)|(\b1.02m\b)|(\b0.28m\b)|(\bLBT\b)|(\b6.5m\b)|(\bKMTNet\b)|(\b0.36m\b)|(\b60cm\b)|(\bSCT\b)|(\bOMEGON-200F5\b)|(\bParent\b)|(\bNicholasUMayall\b)|(\b35cm\b)|(\bIAG-USP\b)|(\bKoppelman\b)|(\bHMT\b)|(\bGHOST\b)|(\b25cm\b)|(\b45cm\b)"im,ptxt)
				MACH=ys.match
				print("\t $MACH")
				if ys==RegexMatch[]
					continue
				end
                grb_rexp=r"GRB ?\d{6}([A-G]|(\.\d{2}))?"
				m=match(grb_rexp,txt)
				grb="nogrb"
                if occursin(grb_rexp,txt)
				    println("\t$(m.match)")
					grb=m.match
			    end
			    function dframe(df)
					df.GCN=[x for i in 1:1]
    				df.GRB=[grb for i in 1:1]
					df.Matched=[MACH for i in 1:1]
    				if isnothing(dfg) 
    					dfg=df
    				else
        				dfg=vcat(dfg,df,cols=:union)
        			end # if x is first
    			end  # dframe
    			df=DataFrame()
    			dframe(df)
    		catch
    		end
    			 if !isnothing(dfg)
        	CSV.write("data-all.csv",dfg)
        else
        @info "no dfg to write"
        end # !isnothing
        end
end # function doanalysis
doanalysis()
