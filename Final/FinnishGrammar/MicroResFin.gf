resource MicroResFin = {
param
    Number = Sg | Pl ;
    Case = Nom | Gen | Part | Akk | Ine | Ela | Ill | Ade | Abl | All | Ess | Trans | Abe | Ins | Kom  ;
    
    Tense = preesens;
    Agreement = Agr Number ;
    
    Affirmation = MyönteinenPres  | MyönteinenPerf | KielteinenPres | KielteinenPerf ; 
    

   

oper
    Noun : Type = {s: Case => Number => Str} ;
    Adjective: Type = {s: Case => Number => Str} ;
    Verb : Type = {s: Tense => Number => Affirmation => Str} ;
    Verb2 : Type ={s: Tense => Number =>Affirmation => Str};
    Verb3 : Type ={s: Number  => Str};
    Personal_Noun : Type ={s: Case => Number => Str};




mkVerb : (IndPresHanMyöPres,  IndPresHeMyöPres,IndPresHanKiePres, IndPresHeKiePres,  IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf: Str) ->
Verb =\   IndPresHanMyöPres,  IndPresHeMyöPres,IndPresHanKiePres, IndPresHeKiePres,  IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf -> {
    s = table{
        preesens => table {
            Sg => table {MyönteinenPres => IndPresHanMyöPres; KielteinenPres => IndPresHanKiePres ; MyönteinenPerf => IndPresHanMyöPerf; KielteinenPerf => IndPresHanKiePerf};
            Pl => table{MyönteinenPres => IndPresHeMyöPres; KielteinenPres => IndPresHeKiePres ; MyönteinenPerf => IndPresHeMyöPerf; KielteinenPerf => IndPresHeKiePerf}
        }
    };
};

smartVerb : Str -> Verb =\s -> case s of {
    x + "sta" => mkVerb   (x +"ksee")   (x+"ksevat")  ("ei" ++ x +"kse")  ("eivät" ++x +"kse") ("on"++x +"ssut") ("ovat"++x+"ssee") ("ei ole" ++x+"ssut")  ("eivät ole"++x+"sseet") ;
    x + "la" => mkVerb  (x +"ee") (x+"evat") ("ei" ++ x +"e")  ("eivät" ++x +"e") ("on"++x +"lut")  ("ovat"++x+"leet") ("ei ole" ++x+"lut")  ("eivät ole"++x+"leet") ;
    x + "lä" => mkVerb  (x +"ee") (x+"evät")  ("ei" ++ x +"e") ("eivät" ++x +"e") ("on"++x +"lyt")  ("ovat"++x+"leet") ("ei ole" ++x+"lyt")  ("eivät ole"++x+"leet");
    x + "nä" => mkVerb  (x +"ee")(x+"evät") ("ei" ++ x +"e")  ("eivät" ++x +"e") ("on"++x +"nyt") ("ovat"++x+"neet") ("ei ole" ++x+"nyt")  ("eivät ole"++x+"neet") ;
    x + "ätä" => mkVerb (x + "pää") (x + "päävät") ("ei"++ x +"pää") ("eivät"++x + "pää") ("on"++x +"päännyt") ("ovat"++x+"pänneet") ("ei ole" ++x+"päännyt")  ("eivät ole"++x+"pänneet") ;
    x + "tä" => mkVerb  (x +"ä") (x+"ävät") ("ei" ++ x +"ä") ("eivät" ++x +"ä") ("on"++x +"nyt") ("ovat"++x+"neet") ("ei ole" ++x+"nyt") ("eivät ole"++x+"neet") ;
    x + "da" => mkVerb  (x)  (x+"ivat") ("ei" ++ x ) ("eivät" ++x) ("on"++x +"nut")("ovat"++x+"neet") ("ei ole"++x+"nut")  ("eivät ole"++x+"neet") ;
    x + "ta" => mkVerb  (x +"a")  (x+"avat") ("ei" ++ x +"a") ("eivät"++x +"a") ("on"++x +"nut")  ("ovat"++x+"neet") ("ei ole" ++x+"nut") ("eivät ole"+x+"neet") ;
    x + "kua" => mkVerb  (x +"uu")(x+"uvat") ("ei" ++ x +"u") ("eivät" ++x +"u") ("on"++x +"kunut") ("ovat"++x+"kuneet")("ei ole" ++x+"kunut")  ("eivät ole"++x+"kuneet") ;
    x + "aa" => mkVerb  (x +"aa") (x+"avat") ("ei" ++ x +"a")  ("eivät" ++x +"a")("on"++x +"anut") ("ovat"++x+"aneet") ("ei ole" ++x+"anut")  ("eivät ole"++x+"aneet") ;
    x + "ää" => mkVerb  (x +"ää") (x+"ävät") ("ei" ++ x +"ä")  ("eivät" ++x +"ä") ("on"++x +"änyt")  ("ovat"++x+"äneet") ("ei ole" ++x+"änyt") ("eivät ole"++x+"äneet") 



};

mkV = overload {
    mkV : Str -> Verb = smartVerb ;
    mkV : (IndPresHanMyöPres,  IndPresHeMyöPres, IndPresHanKiePres,  IndPresHeKiePres, IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf: Str) -> Verb = mkVerb
    };

mkVerb2 : (IndPresHanMyöPres,  IndPresHeMyöPres,IndPresHanKiePres, IndPresHeKiePres,  IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf: Str) ->
Verb =\   IndPresHanMyöPres,  IndPresHeMyöPres,IndPresHanKiePres, IndPresHeKiePres,  IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf -> {
    s = table{
        preesens => table {
            Sg => table {MyönteinenPres => IndPresHanMyöPres; KielteinenPres => IndPresHanKiePres ; MyönteinenPerf => IndPresHanMyöPerf; KielteinenPerf => IndPresHanKiePerf};
            Pl => table{MyönteinenPres => IndPresHeMyöPres; KielteinenPres => IndPresHeKiePres ; MyönteinenPerf => IndPresHeMyöPerf; KielteinenPerf => IndPresHeKiePerf}
        }
    };
};

smartVerb2 : Str -> Verb2 =\s -> case s of {
    x + "sta" => mkVerb2   (x +"ksee")   (x+"ksevat")  ("ei" ++ x +"kse")  ("eivät" ++x +"kse") ("on"++x +"ssut") ("ovat"++x+"ssee") ("ei ole" ++x+"ssut")  ("eivät ole"++x+"sseet") ;
    x + "la" => mkVerb2  (x +"ee") (x+"evat") ("ei" ++ x +"e")  ("eivät" ++x +"e") ("on"++x +"lut")  ("ovat"++x+"leet") ("ei ole" ++x+"lut")  ("eivät ole"++x+"leet") ;
    x + "lä" => mkVerb2  (x +"ee") (x+"evät")  ("ei" ++ x +"e") ("eivät" ++x +"e") ("on"++x +"lyt")  ("ovat"++x+"leet") ("ei ole" ++x+"lyt")  ("eivät ole"++x+"leet");
    x + "nä" => mkVerb2  (x +"ee")(x+"evät") ("ei" ++ x +"e")  ("eivät" ++x +"e") ("on"++x +"nyt") ("ovat"++x+"neet") ("ei ole" ++x+"nyt")  ("eivät ole"++x+"neet") ;
    x + "tä" => mkVerb2  (x +"ä") (x+"ävät") ("ei" ++ x +"ä") ("eivät" ++x +"ä") ("on"++x +"nyt") ("ovat"++x+"neet") ("ei ole" ++x+"nyt") ("eivät ole"++x+"neet") ;
    x + "da" => mkVerb2  (x)  (x+"ivat") ("ei" ++ x ) ("eivät" +x) ("on"++x +"nut")("ovat"++x+"neet") ("ei ole" ++x+"nut")  ("eivät ole"++x+"neet") ;
    x + "hdä" => mkVerb2  (x+"kee")  (x+"kevät") ("ei" ++ x +"e" ) ("eivät" ++x +"e") ("on"++x +"hnyt")("ovat"++x+"hneet") ("ei ole" ++x+"hnyt")  ("eivät ole"++x+"hneet") ;
    x + "dä" => mkVerb2  (x)  (x+"vät") ("ei" ++ x ) ("eivät" +x) ("on"++x +"nyt")("ovat"++x+"neet") ("ei ole" ++x+"nyt")  ("eivät ole"++x+"neet") ;
    x + "ta" => mkVerb2  (x +"a")  (x+"avat") ("ei" ++ x +"a") ("eivät" ++x +"a") ("on"++x +"nut")  ("ovat"++x+"neet") ("ei ole" ++x+"nut") ("eivät ole"++x+"neet") ;
    x + "tää" => mkVerb2  (x +"tää")  (x+"ävät") ("ei" ++ x +"rä") ("eivät" ++x +"rä") ("on"++x +"tänyt")  ("ovat"++x+"täneet") ("ei ole" ++x+"nut") ("eivät ole"++x+"neet") ;
    x + "aa" => mkVerb2  (x +"aa") (x+"avat") ("ei" ++ x +"a")  ("eivät" ++x +"a")("on"++x +"anut") ("ovat"++x+"aneet") ("ei ole" ++x+"anut")  ("eivät ole"++x+"aneet") ;
    x + "ttaa" => mkVerb2  (x +"ttaa") (x+"ttavat") ("ei" ++ x +"ta")  ("eivät" ++x +"ta")("on"++x +"ttanut") ("ovat"++x+"ttaneet") ("ei ole" ++x+"tänyt")  ("eivät ole"++x+"täneet") ;
    x + "tua" => mkVerb2  (x +"tuu") (x+"tuvat") ("ei" ++ x +"du")  ("eivät" ++x +"du")("on"++x +"tunut") ("ovat"++x+"tuneet") ("ei ole" ++x+"tunut")  ("eivät ole"++x+"tuneet") ;
    x + "kua" => mkVerb2  (x +"uu")(x+"uvat") ("ei" ++ x +"u") ("eivät" ++x +"u") ("on"++x +"kunut") ("ovat"++x+"kuneet")("ei ole" ++x+"kunut")  ("eivät ole"++x+"kuneet") ;
    x + "kea" => mkVerb2  (x +"kee")(x+"kevat") ("ei" ++ x +"e") ("eivät" ++x +"e") ("on"++x +"kenut") ("ovat"++x+"keneet")("ei ole" ++x+"kenut")  ("eivät ole"++x+"keneet") ;
    x + "paa" => mkVerb2  (x +"paa") (x+"pavat") ("ei" ++ x +"a")  ("eivät" ++x +"a")("on"++x +"panut") ("ovat"++x+"paneet") ("ei ole" ++x+"panut")  ("eivät ole"++x+"paneet") ;
    x + "ää" => mkVerb2  (x +"ää") (x+"ävät") ("ei" ++ x +"ä")  ("eivät" ++x +"ä") ("on"++x +"änyt")  ("ovat"++x+"äneet") ("ei ole" ++x+"änyt") ("eivät ole"++x+"äneet") 

};

mkV2 = overload {
    mkV2 : Str -> Verb2 = smartVerb2;
    mkV2 : (IndPresHanMyöPres,  IndPresHeMyöPres, IndPresHanKiePres,  IndPresHeKiePres, IndPresHanMyöPerf,  IndPresHeMyöPerf, IndPresHanKiePerf, IndPresHeKiePerf: Str) -> Verb2 = mkVerb2
};



mkNoun : (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl : Str)  ->
Noun = \NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl -> {
    s = table{
        Nom => table {Sg => NomSg; Pl => NomPl};
        Gen => table {Sg => GenSg; Pl => GenPl};
        Part => table {Sg => PartSg; Pl => PartPl};
        Akk => table {Sg => AkkSg; Pl => AkkPl};
        Ine => table {Sg => IneSg; Pl => InePl};
        Ela => table {Sg => ElaSg; Pl => ElaPl};
        Ill => table {Sg => IllSg; Pl => IllPl};
        Ade => table {Sg => AdeSg; Pl => AdePl};
        Abl => table {Sg => AblSg; Pl => AblPl};
        All => table {Sg => AllSg; Pl => AllPl};
        Ess => table {Sg => EssSg; Pl => EssPl};
        Trans => table {Sg => TransSg; Pl => TransPl};
        Abe => table {Sg => AbeSg; Pl => AbePl};
        Ins => table {Sg => InsSg; Pl => InsPl};
        Kom => table {Sg => KomSg; Pl => KomPl}
        };
    };


smartNoun : Str -> Noun = \s -> case s of {
    x +"na" => mkNoun s (x +"na" +"n") (x+"na"+"a") s (x+"na"+"ssa") (x+"na"+"sta") (x+"na"+"an") (x+"na"+"lla") (x+"na"+"lta") (x+"na"+"lle")(x+"na"+"na") (x+"na"+"ksi") (x+"na"+"tta") ("_") ("_") (x+"na"+"t") (x+"ni"+"en") (x+"ni"+"a") (x+"na"+"t") (x+"noi"+"ssa") (x+"noi"+"sta")(x+"noi"+"hin") (x+"noi"+"lla") (x+"noi"+"lta") (x+"noi"+"lle") (x+"noi"+"na") (x+"noi"+"ksi") (x+"noi"+"tta") (x+"ni"+"n") (x+"ni"+"ne");
    x +"ika" => mkNoun s (x +"ja" +"n") (x+"ika"+"a") s (x+"ja"+"ssa") (x+"ja"+"sta") (x+"ika"+"an") (x+"ja"+"lla") (x+"ja"+"lta") (x+"ja"+"lle")(x+"ika"+"na") (x+"ja"+"ksi") (x+"ja"+"tta") ("_") ("_") (x+"ja"+"t") (x+"iki"+"en") (x+"iki"+"a") (x+"ja"+"t") (x+"ji"+"ssa") (x+"ji"+"sta")(x+"iki"+"in") (x+"ji"+"lla") (x+"ji"+"lta") (x+"ji"+"lle") (x+"iki"+"na") (x+"ji"+"ksi") (x+"ji"+"tta") (x+"ji"+"n") (x+"iki"+"ne");
    x +"o" => mkNoun s (x +"o" +"n") (x+"o"+"a") s (x+"o"+"ssa") (x+"o"+"sta") (x+"o"+"on") (x+"o"+"lla") (x+"o"+"lta") (x+"o"+"lle")(x+"o"+"na") (x+"o"+"ksi") (x+"o"+"tta") ("_") ("_") (x+"o"+"t") (x+"o"+"jen") (x+"o"+"ja") (x+"o"+"t") (x+"oi"+"ssa") (x+"oi"+"sta")(x+"oi"+"hin") (x+"oi"+"lla") (x+"oi"+"lta") (x+"oi"+"lle") (x+"oi"+"na") (x+"oi"+"ksi") (x+"oi"+"tta") (x+"oi"+"n") (x+"oi"+"ne");
    x +"ö" => mkNoun s (x +"ö" +"n") (x+"ö"+"a") s (x+"ö"+"ssä") (x+"ö"+"stä") (x+"ö"+"ön") (x+"ö"+"llä") (x+"ö"+"ltä") (x+"ö"+"lle")(x+"ö"+"nä") (x+"ö"+"ksi") (x+"ö"+"ttä") ("_") ("_") (x+"ö"+"t") (x+"ö"+"jen") (x+"ö"+"jä") (x+"ö"+"t") (x+"öi"+"ssä") (x+"öi"+"stä")(x+"öi"+"hin") (x+"öi"+"llä") (x+"öi"+"ltä") (x+"öi"+"lle") (x+"öi"+"nä") (x+"öi"+"ksi") (x+"öi"+"ttä") (x+"öi"+"n") (x+"öi"+"ne");
    x +"ka" => mkNoun s (x +"ka" +"n") (x+"ka"+"a") s (x+"ka"+"ssa") (x+"ka"+"sta") (x+"ka"+"an") (x+"ka"+"lla") (x+"ka"+"lta") (x+"ka"+"lle")(x+"ka"+"na") (x+"ka"+"ksi") (x+"ka"+"tta") ("_") ("_") (x+"ka"+"t") (x+"ki"+"en") (x+"ki"+"a") (x+"ka"+"t") (x+"ki"+"ssa") (x+"ki"+"sta")(x+"ki"+"in") (x+"ki"+"lla") (x+"ki"+"lta") (x+"ki"+"lle") (x+"ki"+"na") (x+"ki"+"ksi") (x+"ki"+"tta") (x+"ki"+"n") (x+"ki"+"ne");
    x +"ra" => mkNoun s (x +"ra" +"n") (x+"ra"+"a") s (x+"ra"+"ssa") (x+"ra"+"sta") (x+"ra"+"an") (x+"ra"+"lla") (x+"ra"+"lta") (x+"ra"+"lle") (x+"ra"+"na") (x+"ra"+"ksi") (x+"ra"+"tta") ("_") ("_") (x+"ra"+"t") (x+"ri"+"en") (x+"ri"+"a") (x+"ra"+"t") (x+"ri"+"ssa") (x+"ri"+"sta")(x+"ri"+"in") (x+"ri"+"lla") (x+"ri"+"lta") (x+"ri"+"lle") (x+"ri"+"na") (x+"ri"+"ksi") (x+"ri"+"tta") (x+"ri"+"n") (x+"ri"+"ne");
    x +"a" => mkNoun s (x +"a" +"n") (x+"a"+"a") s (x+"a"+"ssa") (x+"a"+"sta") (x+"a"+"an") (x+"a"+"lla") (x+"a"+"lta") (x+"a"+"lle")(x+"a"+"na") (x+"a"+"ksi") (x+"a"+"tta") ("_") ("_") (x+"a"+"t") (x+"o"+"jen") (x+"o"+"ja") (x+"a"+"t") (x+"oi"+"ssa") (x+"oi"+"sta")(x+"oi"+"hin") (x+"oi"+"lla") (x+"oi"+"lta") (x+"oi"+"lle") (x+"oi"+"na") (x+"oi"+"ksi") (x+"oi"+"tta") (x+"oi"+"n") (x+"oi"+"ne");
    x +"to" => mkNoun s (x +"do" +"n") (x+"to"+"a") s (x+"do"+"ssa") (x+"do"+"sta") (x+"to"+"on") (x+"do"+"lla") (x+"do"+"lta") (x+"do"+"lle")(x+"to"+"na") (x+"do"+"ksi") (x+"do"+"tta") ("_") ("_") (x+"do"+"t") (x+"to"+"jen") (x+"to"+"ja") (x+"do"+"t") (x+"doi"+"ssa") (x+"doi"+"sta")(x+"toi"+"hin") (x+"doi"+"lla") (x+"doi"+"lta") (x+"doi"+"lle") (x+"toi"+"na") (x+"doi"+"ksi") (x+"doi"+"tta") (x+"doi"+"n") (x+"toi"+"ne");
    x +"u" => mkNoun s (x +"u" +"n") (x+"u"+"ta") s (x+"u"+"ssa") (x+"u"+"sta") (x+"u"+"hun") (x+"u"+"lla") (x+"u"+"lta") (x+"u"+"lle")(x+"u"+"na") (x+"u"+"ksi") (x+"u"+"tta") ("_") ("_") (x+"u"+"t") (x+"i"+"den") (x+"i"+"ta") (x+"u"+"t") (x+"i"+"ssa") (x+"ui"+"sta")(x+"i"+"hin") (x+"i"+"lla") (x+"i"+"lta") (x+"i"+"lle") (x+"i"+"na") (x+"i"+"ksi") (x+"i"+"tta") (x+"i"+"n") (x+"i"+"ne");
    x +"pä" => mkNoun s (x +"vä" +"n") (x+"pä"+"ä") s (x+"vä"+"ssä") (x+"vä"+"stä") (x+"pä"+"än") (x+"vä"+"llä") (x+"vä"+"ltä") (x+"vä"+"lle")(x+"pä"+"nä") (x+"vä"+"ksi") (x+"vä"+"ttä") ("_") ("_") (x+"vä"+"t") (x+"pi"+"en") (x+"pi"+"ä") (x+"vä"+"t") (x+"vi"+"ssä") (x+"vi"+"stä")(x+"pi"+"in") (x+"vi"+"llä") (x+"vi"+"ltä") (x+"vi"+"lle") (x+"pi"+"nä") (x+"vi"+"ksi") (x+"vi"+"ttä") (x+"vi"+"n") (x+"pi"+"ne");
    x +"ä" => mkNoun s (x +"ä" +"n") (x+"ä"+"ä") s (x+"ä"+"ssä") (x+"ä"+"stä") (x+"ä"+"än") (x+"ä"+"llä") (x+"ä"+"ltä") (x+"ä"+"lle")(x+"ä"+"nä") (x+"ä"+"ksi") (x+"ä"+"ttä") ("_") ("_") (x+"ä"+"t") (x+"i"+"en") (x+"i"+"ä") (x+"ä"+"t") (x+"i"+"ssä") (x+"i"+"stä")(x+"i"+"in") (x+"i"+"llä") (x+"i"+"ltä") (x+"i"+"lle") (x+"i"+"nä") (x+"i"+"ksi") (x+"i"+"ttä") (x+"i"+"n") (x+"i"+"ne");
    x +"e" => mkNoun s (x +"e" +"en") (x+"e"+"ttä") s (x+"ee"+"ssä") (x+"ee"+"stä") (x+"ee"+"seen") (x+"ee"+"llä") (x+"ee"+"ltä") (x+"ee"+"lle")(x+"ee"+"nä") (x+"ee"+"ksi") (x+"ee"+"ttä") ("_") ("_") (x+"ee"+"t") (x+"ei"+"den") (x+"ei"+"tä") (x+"ee"+"t") (x+"ei"+"ssä") (x+"ei"+"stä")(x+"ei"+"sin") (x+"ei"+"llä") (x+"ei"+"ltä") (x+"ei"+"lle") (x+"ei"+"nä") (x+"ei"+"ksi") (x+"ei"+"ttä") (x+"ei"+"n") (x+"ei"+"ne");
    x +"ne" => mkNoun s (x +"ne" +"en") (x+"ne"+"tta") s (x+"nee"+"ssa") (x+"nee"+"sta") (x+"nee"+"seen") (x+"nee"+"lla") (x+"nee"+"lta") (x+"nee"+"lle")(x+"nee"+"na") (x+"nee"+"ksi") (x+"nee"+"tta") ("_") ("_") (x+"nee"+"t") (x+"nei"+"den") (x+"nei"+"ta") (x+"nee"+"t") (x+"nei"+"ssa") (x+"nei"+"sta")(x+"nei"+"sin") (x+"nei"+"lla") (x+"nei"+"lta") (x+"nei"+"lle") (x+"nei"+"na") (x+"nei"+"ksi") (x+"nei"+"tta") (x+"nei"+"n") (x+"nei"+"ne");
    x +"psi" => mkNoun s (x +"pse" +"n") (x+"st"+"a") s (x+"pse"+"ssa") (x+"pse"+"sta") (x+"pse"+"en") (x+"pse"+"lla") (x+"pse"+"lta") (x+"pse"+"lle")(x+"pse"+"na") (x+"pse"+"ksi") (x+"pse"+"tta") ("_") ("_") (x+"pse"+"t") (x+"pst"+"en") (x+"psi"+"a") (x+"pse"+"t") (x+"psi"+"ssa") (x+"psi"+"sta")(x+"psi"+"in") (x+"psi"+"lla") (x+"psi"+"lta") (x+"psi"+"lle") (x+"psi"+"na") (x+"psi"+"ksi") (x+"psi"+"tta") (x+"psi"+"n") (x+"psi"+"ne");
    x +"si" => mkNoun s (x +"de" +"n") (x+"tt"+"ä") s (x+"de"+"ssä") (x+"de"+"stä") (x+"te"+"en") (x+"de"+"llä") (x+"de"+"ltä") (x+"de"+"lle")(x+"te"+"nä") (x+"de"+"ksi") (x+"de"+"ttä") ("_") ("_") (x+"de"+"t") (x+"si"+"en") (x+"si"+"ä") (x+"de"+"t") (x+"si"+"ssä") (x+"si"+"stä")(x+"si"+"in") (x+"si"+"llä") (x+"si"+"ltä") (x+"si"+"lle") (x+"si"+"nä") (x+"si"+"ksi") (x+"si"+"ttä") (x+"si"+"n") (x+"si"+"ne");
    x +"ti" => mkNoun s (x +"de" +"n") (x+"te"+"ä") s (x+"de"+"ssä") (x+"de"+"stä") (x+"te"+"en") (x+"de"+"llä") (x+"de"+"ltä") (x+"de"+"lle")(x+"te"+"nä") (x+"de"+"ksi") (x+"de"+"ttä") ("_") ("_") (x+"de"+"t") (x+"ti"+"en") (x+"ti"+"ä") (x+"de"+"t") (x+"di"+"ssä") (x+"di"+"stä")(x+"ti"+"in") (x+"di"+"llä") (x+"di"+"ltä") (x+"di"+"lle") (x+"ti"+"nä") (x+"dii"+"ksi") (x+"di"+"ttä") (x+"di"+"n") (x+"ti"+"ne");
    x +"oki" => mkNoun s (x +"oe" +"n") (x+"ok"+"a") s (x+"oe"+"ssa") (x+"oe"+"sta") (x+"oke"+"en") (x+"oe"+"lla") (x+"oe"+"lta") (x+"oe"+"lle") (x+"oke"+"na") (x+"oe"+"ksi") (x+"oe"+"tta") ("_") ("_") (x+"oe"+"t") (x+"oki"+"en") (x+"oki"+"a") (x+"oe"+"t") (x+"oi"+"ssa") (x+"oi"+"sta")(x+"oki"+"in") (x+"oi"+"lla") (x+"oi"+"lta") (x+"oi"+"lle") (x+"oki"+"na") (x+"oi"+"ksi") (x+"oi"+"tta") (x+"oi"+"n") (x+"oki"+"ne");
    x +"kki" => mkNoun s (x +"ki" +"n") (x+"kki"+"a") s (x+"ki"+"ssa") (x+"ki"+"sta") (x+"kki"+"in") (x+"ki"+"lla") (x+"ki"+"lta") (x+"ki"+"lle") (x+"kki"+"na") (x+"ki"+"ksi") (x+"ki"+"tta") ("_") ("_") (x+"ki"+"t") (x+"kki"+"en") (x+"kke"+"ja") (x+"ki"+"t") (x+"kei"+"ssa") (x+"kei"+"sta")(x+"kkei"+"hin") (x+"kei"+"lla") (x+"kei"+"lta") (x+"kei"+"lle") (x+"kkei"+"na") (x+"kei"+"ksi") (x+"kei"+"tta") (x+"kei"+"n") (x+"kkei"+"ne");
    x +"ki" => mkNoun s (x +"gi" +"n") (x+"ki"+"a") s (x+"gi"+"ssa") (x+"gi"+"sta") (x+"ki"+"in") (x+"gi"+"lla") (x+"gi"+"lta") (x+"gi"+"lle") (x+"ki"+"na") (x+"gi"+"ksi") (x+"gi"+"tta") ("_") ("_") (x+"gi"+"t") (x+"ki"+"en") (x+"ke"+"ja") (x+"gi"+"t") (x+"gei"+"ssa") (x+"gei"+"sta")(x+"kei"+"hin") (x+"gei"+"lla") (x+"gei"+"lta") (x+"gei"+"lle") (x+"kei"+"na") (x+"gei"+"ksi") (x+"gei"+"tta") (x+"gei"+"n") (x+"kei"+"ne");
    x +"vi" => mkNoun s (x +"ve" +"n") (x+"ve"+"ä") s (x+"ve"+"ssä") (x+"ve"+"stä") (x+"ve"+"en") (x+"ve"+"llä") (x+"ve"+"ltä") (x+"ve"+"lle")(x+"ve"+"nä") (x+"ve"+"ksi") (x+"ve"+"ttä") ("_") ("_") (x+"ve"+"t") (x+"vi"+"en") (x+"vi"+"ä") (x+"ve"+"t") (x+"vi"+"ssä") (x+"vi"+"stä")(x+"vi"+"in") (x+"vi"+"llä") (x+"vi"+"ltä") (x+"vi"+"lle") (x+"vi"+"nä") (x+"vi"+"ksi") (x+"vi"+"ttä") (x+"vi"+"n") (x+"vi"+"ne");
    x +"ni" => mkNoun s (x +"ni" +"n") (x+"ni"+"ä") s (x+"ni"+"ssä") (x+"ni"+"stä") (x+"ni"+"in") (x+"ni"+"llä") (x+"ni"+"ltä") (x+"ni"+"lle")(x+"ni"+"nä") (x+"ni"+"ksi") (x+"ni"+"ttä") ("_") ("_") (x+"ni"+"t") (x+"ni"+"en") (x+"ne"+"jä") (x+"ni"+"t") (x+"nei"+"ssä") (x+"nei"+"stä")(x+"nei"+"hin") (x+"nei"+"llä") (x+"nei"+"ltä") (x+"nei"+"lle") (x+"nei"+"nä") (x+"nei"+"ksi") (x+"nei"+"ttä") (x+"nei"+"n") (x+"nei"+"ne");
    x +"uli" => mkNoun s (x +"ule" +"n") (x+"ult"+"a") s (x+"ule"+"ssa") (x+"ule"+"sta") (x+"ule"+"en") (x+"ule"+"lla") (x+"ule"+"lta") (x+"ule"+"lle")(x+"ule"+"na") (x+"ule"+"ksi") (x+"ule"+"tta") ("_") ("_") (x+"ule"+"t") (x+"uli"+"en") (x+"uli"+"a") (x+"ule"+"t") (x+"uli"+"ssa") (x+"uli"+"sta")(x+"uli"+"in") (x+"uli"+"lla") (x+"uli"+"lta") (x+"uli"+"lle") (x+"uli"+"na") (x+"uli"+"ksi") (x+"uli"+"tta") (x+"uli"+"n") (x+"uli"+"ne");
    x +"li" => mkNoun s (x +"le" +"n") (x+"lt"+"ä") s (x+"le"+"ssä") (x+"le"+"stä") (x+"le"+"en") (x+"le"+"llä") (x+"le"+"ltä") (x+"le"+"lle")(x+"le"+"nä") (x+"le"+"ksi") (x+"le"+"ttä") ("_") ("_") (x+"le"+"t") (x+"li"+"en") (x+"li"+"ä") (x+"le"+"t") (x+"li"+"ssä") (x+"li"+"stä")(x+"li"+"in") (x+"li"+"llä") (x+"li"+"ltä") (x+"li"+"lle") (x+"li"+"nä") (x+"li"+"ksi") (x+"li"+"ttä") (x+"li"+"n") (x+"li"+"ne");
    x +"ri" => mkNoun s (x +"ri" +"n") (x+"ri"+"a") s (x+"ri"+"ssa") (x+"ri"+"sta") (x+"ri"+"in") (x+"ri"+"lla") (x+"ri"+"lta") (x+"ri"+"lle")(x+"ri"+"na") (x+"ri"+"ksi") (x+"ri"+"tta") ("_") ("_") (x+"ri"+"t") (x+"ri"+"en") (x+"rei"+"ta") (x+"ri"+"t") (x+"rei"+"ssa") (x+"rei"+"sta")(x+"rei"+"hin") (x+"rei"+"lla") (x+"rie"+"lta") (x+"rei"+"lle") (x+"rei"+"na") (x+"rei"+"ksi") (x+"rei"+"tta") (x+"rei"+"n") (x+"rei"+"ne");
    x +"ppi" => mkNoun s (x +"pi" +"n") (x+"pi"+"a") s (x+"pi"+"ssa") (x+"pi"+"sta") (x+"pp"+"in") (x+"pi"+"lla") (x+"pi"+"lta") (x+"pi"+"lle")(x+"pi"+"na") (x+"pi"+"ksi") (x+"pi"+"tta") ("_") ("_") (x+"pi"+"t") (x+"ppi"+"en") (x+"ppi"+"ja") (x+"pi"+"t") (x+"ppei"+"ssa") (x+"ppei"+"sta")(x+"ppei"+"hin") (x+"ppei"+"lla") (x+"ppei"+"lta") (x+"ppei"+"lle") (x+"ppei"+"na") (x+"ppei"+"ksi") (x+"ppe"+"tta") (x+"ppei"+"n") (x+"ppei"+"ne");
    x +"i" => mkNoun s (x +"e" +"n") (x+"t"+"a") s (x+"e"+"ssä") (x+"e"+"stä") (x+"e"+"en") (x+"e"+"llä") (x+"e"+"ltä") (x+"e"+"lle")(x+"e"+"nä") (x+"e"+"ksi") (x+"e"+"ttä") ("_") ("_") (x+"e"+"t") (x+"i"+"en") (x+"i"+"ä") (x+"e"+"t") (x+"i"+"ssä") (x+"i"+"stä")(x+"i"+"in") (x+"i"+"llä") (x+"i"+"ltä") (x+"i"+"lle") (x+"i"+"nä") (x+"ii"+"ksi") (x+"i"+"ttä") (x+"i"+"n") (x+"i"+"ne");
    x +"t" => mkNoun s (x +"e" +"n") (x+"tt"+"a") s (x+"e"+"ssä") (x+"e"+"stä") (x+"e"+"en") (x+"e"+"lla") (x+"e"+"lta") (x+"e"+"lle")(x+"e"+"na") (x+"e"+"ksi") (x+"e"+"tta") ("_") ("_") (x+"e"+"t") (x+"i"+"den") (x+"it"+"a") (x+"e"+"t") (x+"i"+"ssa") (x+"i"+"sta")(x+"is"+"iin") (x+"i"+"lla") (x+"i"+"lta") (x+"i"+"lle") (x+"i"+"na") (x+"i"+"ksi") (x+"i"+"tta") (x+"i"+"n") (x+"i"+"ne");
    x +"tu" => mkNoun s (x +"nnu" +"n") (x+"tu"+"a") s (x+"nu"+"ssa") (x+"nu"+"sta") (x+"tu"+"un") (x+"nu"+"lla") (x+"nu"+"lta") (x+"nu"+"lle")(x+"tu"+"na") (x+"nu"+"ksi") (x+"nu"+"tta") ("_") ("_") (x+"nu"+"t") (x+"tu"+"jen") (x+"tu"+"ja") (x+"nu"+"t") (x+"nui"+"ssa") (x+"nui"+"sta")(x+"tui"+"hin") (x+"nui"+"lla") (x+"nui"+"lta") (x+"nui"+"lle") (x+"tui"+"na") (x+"nui"+"ksi") (x+"nui"+"tta") (x+"nu"+"in") (x+"tui"+"ne");
    x +"nen" => mkNoun s (x +"s" +"en") (x+"s"+"ta") s (x+"se"+"ssa") (x+"se"+"sta") (x+"se"+"en") (x+"se"+"lla") (x+"se"+"lta") (x+"se"+"lle")(x+"se"+"na") (x+"se"+"ksi") (x+"se"+"tta") ("_") ("_") (x+"se"+"t") (x+"st"+"en") (x+"si"+"a") (x+"se"+"t") (x+"si"+"ssa") (x+"si"+"sta")(x+"si"+"in") (x+"si"+"lla") (x+"si"+"lta") (x+"si"+"lle") (x+"si"+"na") (x+"si"+"ksi") (x+"si"+"tta") (x+"si"+"n") (x+"si"+"ne") ;
    x +"s" => mkNoun s (x +"he" +"n") (x+"s"+"tä") s (x+"he"+"ssä") (x+"he"+"stä") (x+"he"+"en") (x+"he"+"llä") (x+"he"+"ltä") (x+"he"+"lle")(x+"he"+"nä") (x+"he"+"ksi") (x+"he"+"ttä") ("_") ("_") (x+"he"+"t") (x+"st"+"en") (x+"hi"+"ä") (x+"he"+"t") (x+"hi"+"ssä") (x+"hi"+"stä")(x+"hi"+"in") (x+"hi"+"llä") (x+"hi"+"ltä") (x+"hi"+"lle") (x+"hi"+"nä") (x+"hi"+"ksi") (x+"hi"+"ttä") (x+"h"+"in") (x+"hi"+"ne");
    x +"n" => mkNoun s (x +"m" +"en") (x+"n"+"tä") s (x+"me"+"ssä") (x+"me"+"stä") (x+"me"+"en") (x+"me"+"llä") (x+"me"+"ltä") (x+"me"+"lle")(x+"me"+"nä") (x+"me"+"ksi") (x+"me"+"ttä") ("_") ("_") (x+"me"+"t") (x+"mi"+"en") (x+"mi"+"ä") (x+"me"+"t") (x+"mi"+"ssä") (x+"mi"+"stä")(x+"mi"+"in") (x+"mi"+"llä") (x+"mi"+"ltä") (x+"mi"+"lle") (x+"mi"+"nä") (x+"mi"+"ksi") (x+"mi"+"ttä") (x+"mi"+"n") (x+"mi"+"ne")
    };
mkN = overload {
    mkN : Str -> Noun = smartNoun ;
    mkN : (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl: Str) -> Noun = mkNoun
    };
mkAdjective : (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl : Str) -> 
Adjective =\NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl -> {
    s = table {
        Nom => table {Sg => NomSg; Pl => NomPl};
        Gen => table {Sg => GenSg; Pl => GenPl};
        Part => table {Sg => PartSg; Pl => PartPl};
        Akk => table {Sg => AkkSg; Pl => AkkPl};
        Ine => table {Sg => IneSg; Pl => InePl};
        Ela => table {Sg => ElaSg; Pl => ElaPl};
        Ill => table {Sg => IllSg; Pl => IllPl};
        Ade => table {Sg => AdeSg; Pl => AdePl};
        Abl => table {Sg => AblSg; Pl => AblPl};
        All => table {Sg => AllSg; Pl => AllPl};
        Ess => table {Sg => EssSg; Pl => EssPl};
        Trans => table {Sg => TransSg; Pl => TransPl};
        Abe => table {Sg => AbeSg; Pl => AbePl};
        Ins => table {Sg => InsSg; Pl => InsPl};
        Kom => table {Sg => KomSg; Pl => KomPl}
        };
    };
smartAdjective: Str -> Adjective =\s -> case s of {
    x + "la" => mkAdjective s (x +"la" +"n") (x + "la" +"a") s (x +"la" + "ssa") (x + "la" +"sta") (x + "la" +"an") (x +"la" + "lla") (x + "la" +"lta") (x +"la" +"lle") (x +"la"+"na") (x +"la" +"ksi") (x +"la" +"tta") ("_") ("_") (x +"la" +"t") (x +"li" +"en") (x +"li" +"a") s (x +"li"+"ssa") (x +"li" +"sta") (x +"li" +"in") (x + "li" +"lla") (x +"li"+"lta") (x +"li"+"lle") (x +"li"+"na") (x +"li"+"ksi") (x+"li"+"tta") (x+"li"+"n") (x+"li"+"ne"); 
    x + "ha" => mkAdjective s (x+ "a"+"n") (x+"a"+"a") s (x+"a"+"ssa") (x+"a"+"sta") (x+"a"+"an") (x+"a"+"lla") (x+"a"+"lta") (x+"a"+"lle") (x+"a"+"na") (x+"a"+"ksi") (x+"a"+"tta") ("_") ("_") (x+ "at") (x+"oj"+ "en") (x+"oj"+ "a") (x+"h"+ "at") (x+"oi"+ "ssa") (x+"oi"+ "sta") (x+"hoih"+ "in") (x+ "ho"+"illa") (x+"ho" +"ilta") (x+"ho"+ "ille") (x+"ho"+ "ina") (x+"ho"+ "iksi") (x+"ho"+ "itta") (x+"ho"+ "in") (x+"ho"+ "ine");
    x + "a" => mkAdjective s (x+ "a"+"n") (x+"a"+"a") s (x+"a"+"ssa") (x+"a"+"sta") (x+"a"+"an") (x+"a"+"lla") (x+"a"+"lta") (x+"a"+"lle") (x+"a"+"na") (x+"a"+"ksi") (x+"a"+"tta") ("_") ("_") (x+ "at") (x+ "ien") (x+ "ia") (x+ "at") (x+ "issa") (x+ "ista") (x+ "iin") (x+ "illa") (x+ "ilta") (x+ "ille") (x+ "ina") (x+ "iksi") (x+ "itta") (x+ "in") (x+ "ine");
    x + "eä" => mkAdjective s (x+ "eä"+"n") (x+"eä"+"ä") s (x+"eä"+"ssä") (x+"eä"+"stä") (x+"eä"+"än") (x+"eä"+"llä") (x+"eä"+"ltä") (x+"eä"+"lle") (x+"eä"+"nä") (x+"eä"+"ksi") (x+"eä"+"ttä") ("_") ("_") (x+ "eät") (x+ "eide"+"n") (x+ "eitä") (x+ "eät") (x+ "eissä") (x+ "eistä") (x+ "eisiin") (x+ "eillä") (x+ "eiltä") (x+ "eille") (x+ "einä") (x+ "eiksi") (x+ "eittä") (x+ "ein") (x+ "eine");
    x + "ä" => mkAdjective s (x+ "ä"+"n") (x+"ä"+"ä") s (x+"ä"+"ssä") (x+"ä"+"stä") (x+"ä"+"än") (x+"ä"+"llä") (x+"ä"+"ltä") (x+"ä"+"lle") (x+"ä"+"nä") (x+"ä"+"ksi") (x+"ä"+"ttä") ("_") ("_") (x+ "ät") (x+ "ien") (x+ "iä") (x+ "ät") (x+ "issä") (x+ "istä") (x+ "iin") (x+ "illä") (x+ "iltä") (x+ "ille") (x+ "inä") (x+ "iksi") (x+ "ittä") (x+ "in") (x+ "ine");
    x + "da" + y => mkAdjective s (x +"taa" + "n") (x +"da" +"sta") s (x +"taa" +"ssa") (x +"taa" +"sta") (x + "taa" +"seen") (x +" taa" +"lla") (x + "taa" + "lta") (x + "taa" +"lle") (x +"taa" +"na") (x +"taa" +"ksi") (x +"taa" +" tta") ("_") ("_") (x +"taa" + "t") (x +"tai" + "den") (x +"tai" +"ta") (x +"taa" + "t") (x + "tai" + "ssa") (x + "tai" + "sta") (x + "tai" +"hin") (x + "tai" +"lla") (x +"tai" +"lta") (x +"tai" +"lle") (x +"tai" +"na") (x +"tai" +"ksi") (x +"tai" +"tta") (x+"tai" +"n") (x +"tai" +"ne");
    x + "oin" + y => mkAdjective s (x+ "ois" + y) (x+"ois" + "ta") s (x+ "oise"+ "ssa") (x+ "oise" +"sta") (x+"oise" +"en") (x+"oise"+"lla") (x+"oise"+"lta") (x+"oise"+"lle") (x+"oise"+"na") (x+"oise"+"ksi") (x+"oise"+"tta") ("_") ("_") (x+ "oise" +"t") (x+ "ois" +"ten")  (x+ "oisi" +"a") (x+ "oise" +"t") (x+ "oisi" +"ssa") (x+ "oisi" +"sta") (x+ "oisi" +"in") (x+ "oisi" + "lla") (x+ "oisi" +"lta") (x+ "oisi" +"lle") (x+ "oisi" +"na") (x+ "oisi" + "ksi") (x+ "oisi" +"tta") (x+"oisi"+ "n") (x+"oisi"+ "ne");
    x + "ain" + y => mkAdjective s (x+ "ais" + y) (x+"ais" + "ta") s (x+ "aise"+ "ssa") (x+ "aise" +"sta") (x+"aise" +"en") (x+"aise"+"lla") (x+"aise"+"lta") (x+"aise"+"lle") (x+"aise"+"na") (x+"aise"+"ksi") (x+"aise"+"tta") ("_") ("_") (x+ "aise" +"t") (x+ "ais" +"ten")  (x+ "aisi" +"a") (x+ "aise" +"t") (x+ "aisi" +"ssa") (x+ "aisi" +"sta") (x+ "aisi" +"in") (x+ "aisi" + "lla") (x+ "aisi" +"lta") (x+ "aisi" +"lle") (x+ "aisi" +"na") (x+ "aisi" + "ksi") (x+ "aisi" +"tta") (x+"aisi"+ "n") (x+"aisi"+ "ne");
    x + "nin" + y => mkAdjective s (x+ "nis" + y) (x+"nis" + "tä") s (x+ "nise"+ "ssä") (x+ "nise" +"stä") (x+"nise" +"en") (x+"nise"+"llä") (x+"nise"+"ltä") (x+"nise"+"lle") (x+"nise"+"nä") (x+"nise"+"ksi") (x+"nise"+"ttä") ("_") ("_") (x+ "nise" +"t") (x+ "nis" +"ten") (x+ "nisi" +"ä") (x+ "nise" +"t") (x+ "nisi" +"ssä") (x+ "nisi" +"stä") (x+ "nisi" +"in") (x+ "nisi" + "llä") (x+ "nisi" +"ltä") (x+ "nisi" +"lle") (x+ "nisi" +"nä") (x+ "nisi" + "ksi") (x+ "nisi" +"ttä") (x+"nisi"+ "n") (x+"nisi"+ "ne");
    x + "min" => mkAdjective s (x+ "pimä"+"n") (x+"min"+"tä") s (x+"pimä"+"ssä") (x+"pimä"+"stä") (x+"pimä"+"än") (x+"pimä"+"llä") (x+"pimä"+"ltä") (x+"pimä"+"lle") (x+"pimä"+"nä") (x+"pimä"+"ksi") (x+"pimä"+"ttä") ("_") ("_") (x+ "pimä"+"t") (x+ "pimi"+"en") (x+ "pimi"+"ä") (x+ "pimä" +"t") (x+ "pimi" +"ssä") (x+ "pimi" +"stä") (x+ "pimi"+"in") (x+ "pimi"+"llä") (x+"pimi" +"ltä") (x+"pimi"+ "lle") (x+"pimi"+ "nä") (x+"pimi"+ "ksi") (x+"pimi"+ "ttä") (x+"pim"+ "in") (x+"pimi"+"ne");
    x + "is" => mkAdjective s (x+ "i"+"in") (x+"is"+"ta") s (x+"is"+"ssa") (x+"is"+"sta") (x+"ise"+"en") (x+"ii"+"lla") (x+"ii"+"lta") (x+"ii"+"lle") (x+"ii"+"na") (x+"ii"+"ksi") (x+"ii"+"tta") ("_") ("_") (x+ "ii"+"t") (x+ "iid"+"en") (x+"i"+ "ita") (x+"i"+ "it") (x+ "i"+"issa") (x+"i" +"ista") (x+"i"+ "siin") (x+"i"+ "illa") (x+"i"+ "ilta") (x+"i"+ "ille") (x+"i"+ "ina") (x+"i"+ "iksi") (x+"i"+ "itta") (x+"i"+ "in") (x+"i"+ "ine");
    x + "s" => mkAdjective s (x+ "a"+"n") (x+"s"+"ta") s (x+"a"+"ssa") (x+"a"+"sta") (x+"ase"+"en") (x+"a"+"lla") (x+"a"+"lta") (x+"a"+"lle") (x+"a"+"na") (x+"a"+"ksi") (x+"a"+"tta") ("_") ("_") (x+ "a"+"t") (x+ "id"+"en") (x+ "ita") (x+ "at") (x+ "issa") (x+ "ista") (x+ "siin") (x+ "illa") (x+ "ilta") (x+ "ille") (x+ "ina") (x+ "iksi") (x+ "itta") (x+ "in") (x+ "ine");
    x + "ni" => mkAdjective s (x+ "n"+"en") (x+"n"+"tä") s (x+"ne"+"ssä") (x+"ne"+"stä") (x+"ne"+"en") (x+"ne"+"llä") (x+"ne"+"ltä") (x+"ne"+"lle") (x+"ne"+"nä") (x+"ne"+"ksi") (x+"ne"+"ttä") ("_") ("_") (x+ "ne"+"t") (x+ "nt"+"en") (x+"n"+ "iä") (x+ "n"+"et") (x+ "n"+"issä") (x+ "n"+"istä") (x+ "n"+"iin") (x+ "n"+"illä") (x+"n"+ "iltä") (x+"n"+ "ille") (x+ "n"+"inä") (x+ "n"+"iksi") (x+"n"+ "ittä") (x+ "in") (x+ "ine");
    x + "si" => mkAdjective s (x+ "de"+"n") (x+"t"+"ta") s (x+"de"+"ssa") (x+"de"+"sta") (x+"te"+"en") (x+"de"+"lla") (x+"de"+"lta") (x+"de"+"lle") (x+"te"+"na") (x+"de"+"ksi") (x+"de"+"tta") ("_") ("_") (x+ "de"+"t") (x+ "s"+"ien") (x+ "s"+"ia") (x+ "d"+"et") (x+ "s"+"issa") (x+ "s"+"ista") (x+ "s"+"iin") (x+"s"+ "illa") (x+ "s"+"ilta") (x+ "s"+"ille") (x+"s"+ "ina") (x+"s"+ "iksi") (x+"s"+ "itta") (x+"s"+ "in") (x+"s"+ "ine");
    x + "i" => mkAdjective s (x+ "e"+"n") (x+"ta") s (x+"e"+"ssa") (x+"e"+"sta") (x+"e"+"en") (x+"e"+"lla") (x+"e"+"lta") (x+"e"+"lle") (x+"e"+"na") (x+"e"+"ksi") (x+"e"+"tta") ("_") ("_") (x+ "e"+"t") (x+ "ien") (x+ "ia") (x+ "et") (x+ "issa") (x+ "ista") (x+ "iin") (x+ "illa") (x+ "ilta") (x+ "ille") (x+ "ina") (x+ "iksi") (x+ "itta") (x+ "in") (x+ "ine");
    x => mkAdjective s (x+ "n") (x+"a") s (x+"ssa") (x+"sta") (x+"on") (x+"lla") (x+"lta") (x+"lle") (x+"na") (x+"ksi") (x+"tta") ("_") ("_") (x+ "t") (x+ "jen") (x+ "ja") (x+ "t") (x+ "issa") (x+ "ista") (x+ "ihin") (x+ "illa") (x+ "ilta") (x+ "ille") (x+ "ina") (x+ "iksi") (x+ "itta") (x+ "in") (x+ "ine");
    x + "i" => mkPersonalNoun s (x + "in") (x +"iä") (x +"in") (x +"issa") (x +"ista") (x +"iin") (x+"illa") (x +"ilta") (x +"ille") (x +"ina") (x +"iksi") (x +"itta") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_");
    x + "n" => mkPersonalNoun s (x +"nin") (x + "nia") (x+"niin") (x+"nille") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") (x +"nit") (x +"nien") (x +"neja") (x+ "nehin") (x+"neille") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_")
    
    };
mkA = overload {
    mkA : Str -> Adjective = smartAdjective;
    mkA : (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl: Str) -> Adjective = mkAdjective
    };

mkPersonalNoun : (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl : Str)  ->
Personal_Noun = \NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl -> {
    s = table{
        Nom => table {Sg => NomSg; Pl => NomPl};
        Gen => table {Sg => GenSg; Pl => GenPl};
        Part => table {Sg => PartSg; Pl => PartPl};
        Akk => table {Sg => AkkSg; Pl => AkkPl};
        Ine => table {Sg => IneSg; Pl => InePl};
        Ela => table {Sg => ElaSg; Pl => ElaPl};
        Ill => table {Sg => IllSg; Pl => IllPl};
        Ade => table {Sg => AdeSg; Pl => AdePl};
        Abl => table {Sg => AblSg; Pl => AblPl};
        All => table {Sg => AllSg; Pl => AllPl};
        Ess => table {Sg => EssSg; Pl => EssPl};
        Trans => table {Sg => TransSg; Pl => TransPl};
        Abe => table {Sg => AbeSg; Pl => AbePl};
        Ins => table {Sg => InsSg; Pl => InsPl};
        Kom => table {Sg => KomSg; Pl => KomPl}
        };
};

smartPersonalNoun : Str -> Personal_Noun =\s -> case s of {
    x + "i" => mkPersonalNoun s (x + "in") (x +"iä") (x +"in") (x +"issa") (x +"ista") (x +"iin") (x+"illa") (x +"ilta") (x +"ille") (x +"ina") (x +"iksi") (x +"itta") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_");
    x + "n" => mkPersonalNoun s (x +"nin") (x + "nia") (x+"niin") (x+"nille") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") (x +"nit") (x +"nien") (x +"neja") (x+ "nehin") (x+"neille") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_") ("_")
};

mkPN = overload {
    mkPN : Str ->Personal_Noun = smartPersonalNoun;
    mkPN: (NomSg, GenSg, PartSg, AkkSg, IneSg, ElaSg, IllSg, AdeSg,AblSg, AllSg, EssSg, TransSg, AbeSg, InsSg, KomSg, NomPl, GenPl, PartPl,  AkkPl, InePl, ElaPl, IllPl, AdePl, AblPl, AllPl, EssPl, TransPl, AbePl, InsPl, KomPl: Str) -> Personal_Noun = mkPersonalNoun
};

mkVerb3: (Sg, Pl : Str) -> Verb3 = \Sg, Pl -> {
    s = table{
        Sg3 => Sg;
        Pl3 => Pl
        };
};
be_Verb : Verb3 = mkVerb3 "on" "ovat" ;

};
