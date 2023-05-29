--# -path=.:../abstract
concrete MicroLangFin of MicroLang = open MicroResFin in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Number => Str} ; 
    Comp = {s : Str} ;
    CN = Noun ;
    AP = Adjective ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    V = Verb ;
    PN = Personal_Noun;
    Pron = {s : Case => Str; number: Number} ;
    NP = {s : Case => Str; number: Number} ;
    Prep = {s : Str} ;  
    Adv = {s: Str};

    
    lin
    
    UttS s = s ;
    UttNP np = {s = np.s ! Akk} ;

    PredVPS np vp  = {
      s = np.s ! Nom  ++ vp.verb.s ! preesens ! np.number !MyönteinenPres ++ vp.compl ! np. number ++"," ++ np.s ! Nom ++ vp.verb.s ! preesens ! np.number !MyönteinenPerf ++ vp.compl ! np.number ++
      "," ++ np.s ! Nom ++ vp.verb.s ! preesens ! np.number! KielteinenPerf ++ vp.compl ! np.number ++"," ++ np.s ! Nom ++ vp.verb.s ! preesens ! np.number ! KielteinenPres ++ vp.compl ! np.number
      } ;
      --s = np.s ! Nom ++ vp.verb.s ! preesens ! np.number ! MyönteinenPerf ++ vp.compl ! np.number
      --} ;
     


    UseV v = { verb = v ; compl = \\_ =>[] } ;


    ComplV2 v2 np = {
      verb = v2;
      compl = \\_ => np.s ! Akk 
    };

    UsePron p = p ;
    UseN n = n ; 



    AdjCN ap cn = {s = \\c,n => ap.s ! c ! n ++ cn.s ! c ! n} ;

    
    PositA a = a;

    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;

    PrepNP prep np = {s = prep.s ++ np.s ! Akk} ; 

    in_Prep = {s = "ssa"};
    on_Prep = {s = "lla"} ;
    with_Prep = {s ="kanssa"} ;

      he_Pron = {
      s = table {
        Nom => "hän" ;
        Akk => "hänet" ; 
        Gen => "hänen" ; 
        Part => "häntä"; 
        Ine => "hänessä"; 
        Ela => "hänestä"; 
        Ill => "häneen"; 
        Ade =>"hänellä";
        Abl => "häneltä"; 
        All => "hänelle"; 
        Ess => "hänenä"; 
        Trans => "häneksi"; 
        Abe => "hänettä"; 
        Ins => "_"; 
        Kom => "_"
        } ;
      number =  Sg ;
      } ;
    she_Pron = {
      s = table {
        Nom => "hän"; 
        Akk => "hänet"; 
        Gen => "hänen"; 
        Part => "häntä"; 
        Ine => "hänessä"; 
        Ela => "hänestä"; 
        Ill => "häneen"; 
        Ade =>"hänellä";
        Abl => "häneltä"; 
        All => "hänelle"; 
        Ess => "hänenä"; 
        Trans => "häneksi"; 
        Abe => "hänettä"; 
        Ins => "_"; 
        Kom => "_"
        } ;
      number=  Sg ;
      } ;
    they_Pron = {
      s = table {
        Nom => "he"; 
        Akk => "heidät"; 
        Gen => "heidän"; 
        Part => "heitä"; 
        Ine => "heissä"; 
        Ela => "heistä"; 
        Ill => "heihin"; 
        Ade =>"heillä";
        Abl => "heiltä"; 
        All => "heille"; 
        Ess => "heinä"; 
        Trans => "heiksi"; 
        Abe => "hittä"; 
        Ins => "_"; 
        Kom => "_"
        } ;
      number=  Pl ;
      } ;







{-

         UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ; 
          CompAP ap = ap ;
-}   
-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin apple_N = mkN "omena" ;
lin baby_N = mkN "vauva" ;
lin blood_N = mkN "veri" ;
lin animal_N = mkN "eläin" ;
lin bike_N = mkN "pyörä" ; 
lin beer_N = mkN "olut" ;
lin bird_N = mkN "lintu" ; 
lin boat_N = mkN "vene" ;
lin ship_N = mkN "laiva" ;
lin book_N = mkN "kirja" ;
lin water_N = mkN "vesi" ;
lin tree_N = mkN "puu" ;
lin train_N = mkN "juna" ;
lin star_N = mkN "tähti" ;
lin boy_N = mkN "poika" ;
lin bread_N = mkN "leipä" ;
lin car_N = mkN "auto" ;
lin cat_N = mkN "kissa" ;
lin city_N = mkN "kaupunki" ;
lin cloud_N = mkN "pilvi" ;
lin computer_N = mkN "tietokone" ;
lin wine_N = mkN "viini" ;
lin sea_N = mkN "meri" ;
lin river_N = mkN "joki" ;
lin woman_N = mkN "nainen" ;
lin music_N = mkN "musiikki" ;
lin milk_N = mkN "maito" ;
lin man_N = mkN "mies";
lin language_N = mkN "kieli" ;
lin house_N = mkN "talo" ;
lin horse_N = mkN "hevonen" ;
lin girl_N = mkN "tyttö" ;
lin friend_N = mkN "kaveri" ;
lin flower_N = mkN "kukka" ;
lin fish_N = mkN "kala";
lin fire_N = mkN "tuli" ;
lin dog_N = mkN "koira" ;
lin cow_N = mkN "lehmä" ;
lin child_N = mkN "lapsi" ;
lin grammar_N = mkN "kielioppi" ;


lin big_A = mkA "iso" ;
lin bad_A = mkA "huono" ;
lin black_A = mkA "musta" ;
lin blue_A = mkA "sininen" ;
lin clean_A = mkA "puhdas" ;
lin young_A = mkA "nuori" ;
lin clever_A = mkA "nokkela" ;
lin yellow_A = mkA "keltainen" ;
lin green_A = mkA "vihreä" ;
lin white_A = mkA "valkoinen" ;
lin red_A = mkA "punainen" ;
lin cold_A = mkA "kylmä" ;
lin good_A = mkA "hyvä" ;
lin dirty_A = mkA "likainen" ;
lin heavy_A = mkA "raskas" ;
lin hot_A = mkA "kuuma" ;
lin warm_A = mkA "lämmin" ;
lin small_A = mkA "pieni" ;
lin new_A = mkA "uusi" ;
lin ready_A = mkA "valmis" ;
lin old_A = mkA "vanha" ;
--lin paris_PN = mkPN "Pariisi" ;

lin run_V = mkV "juosta"  ;
lin come_V = mkV "tulla" ;
lin travel_V = mkV "matkustaa" ;
lin walk_V = mkV "kävellä" ;
lin go_V = mkV "mennä" ;
lin jump_V = mkV "hypätä" ;
lin sleep_V = mkV "nukkua" ;
lin play_V = mkV "pelata" ;
lin live_V = mkV "elää" ;
lin swim_V = mkV "uida" ;


lin break_V2 = mkV2 "rikkoutua" ;
lin buy_V2 = mkV2 "ostaa" ;
lin wait_V2 = mkV2 "odottaa" ;
lin drink_V2 = mkV2 "juoda" ;
lin eat_V2 = mkV2 "syödä" ;
lin find_V2 = mkV2 "löytää" ;
lin kill_V2 = mkV2 "tappaa" ;
lin love_V2 = mkV2 "rakastaa" ;
lin read_V2 = mkV2 "lukea" ;
lin understand_V2 = mkV2 "ymmärtää" ;
lin teach_V2 = mkV2 "opettaa" ;
lin see_V2 = mkV2 "nähdä" ;

--lin paris_PN = mkA "Pariisi" ;

--lin now_Adv = mkAdv "nyt" ;
--lin already_Adv = mkAdv "jo" ;



{-


-- lin john_PN = mkPN "John" ;
-- lin know_VS = mkVS (mkV "know" "knew" "known") ;













---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;
-}
}