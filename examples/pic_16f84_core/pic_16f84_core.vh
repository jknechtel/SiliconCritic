module pic_16f84_core (
	prog_dat_i, 
	prog_adr_o, 
	ram_dat_i, 
	ram_dat_o, 
	ram_adr_o, 
	readram_o, 
	writeram_o, 
	existeeprom_i, 
	eep_dat_i, 
	eep_dat_o, 
	eep_adr_o, 
	rd_eep_req_o, 
	rd_eep_ack_i, 
	wr_eep_req_o, 
	wr_eep_ack_i, 
	porta_i, 
	porta_o, 
	porta_dir_o, 
	portb_i, 
	portb_o, 
	portb_dir_o, 
	rbpu_o, 
	int0_i, 
	int4_i, 
	int5_i, 
	int6_i, 
	int7_i, 
	t0cki_i, 
	wdt_ena_i, 
	wdt_clk_i, 
	wdt_full_o, 
	powerdown_o, 
	startclk_o, 
	pon_rst_n_i, 
	mclr_n_i, 
	clk_i, 
	clk_o);
   input [13:0] prog_dat_i;
   output [12:0] prog_adr_o;
   input [7:0] ram_dat_i;
   output [7:0] ram_dat_o;
   output [8:0] ram_adr_o;
   output readram_o;
   output writeram_o;
   input existeeprom_i;
   input [7:0] eep_dat_i;
   output [7:0] eep_dat_o;
   output [7:0] eep_adr_o;
   output rd_eep_req_o;
   input rd_eep_ack_i;
   output wr_eep_req_o;
   input wr_eep_ack_i;
   input [4:0] porta_i;
   output [4:0] porta_o;
   output [4:0] porta_dir_o;
   input [7:0] portb_i;
   output [7:0] portb_o;
   output [7:0] portb_dir_o;
   output rbpu_o;
   input int0_i;
   input int4_i;
   input int5_i;
   input int6_i;
   input int7_i;
   input t0cki_i;
   input wdt_ena_i;
   input wdt_clk_i;
   output wdt_full_o;
   output powerdown_o;
   output startclk_o;
   input pon_rst_n_i;
   input mclr_n_i;
   input clk_i;
   output clk_o;

   // Internal wires
   wire [7:0] tmr0_reg;
   wire [7:0] status_reg;
   wire [1:0] inc_tmr_sync_reg;
   wire [12:0] inc_pc_node;
   wire [7:0] pscale_reg;
   wire [7:0] option_reg;
   wire [7:0] aluinp1_reg;
   wire [7:0] w_reg;
   wire [7:0] ram_i_node;
   wire [2:0] state_reg;
   wire [7:0] rateval;
   wire [8:0] add_node;
   wire [4:0] eecon1_reg;
   wire [7:0] intcon_reg;
   wire [13:0] inst_reg;
   wire [7:0] fsr_reg;
   wire [7:0] aluinp2_reg;
   wire [4:0] pclath_reg;
   wire [12:0] \stack_reg[0] ;
   wire [12:0] \stack_reg[6] ;
   wire [2:0] stack_pnt_reg;
   wire [12:0] \stack_reg[2] ;
   wire [4:0] addlow_node;
   wire [12:0] \stack_reg[7] ;
   wire [12:0] \stack_reg[1] ;
   wire [12:0] \stack_reg[5] ;
   wire [7:0] wdt_reg;
   wire [12:0] \stack_reg[3] ;
   wire [12:0] \stack_reg[4] ;
   wire [2:0] wdt_full_sync_reg;
   wire [4:0] intclr_reg;
   wire [7:0] portb_i_sync_reg;
   wire [4:0] porta_i_sync_reg;
   wire [4:0] intdown_reg;
   wire [4:0] intrise_reg;
   wire UNCONNECTED;
   wire UNCONNECTED0;
   wire UNCONNECTED1;
   wire UNCONNECTED2;
   wire UNCONNECTED3;
   wire UNCONNECTED4;
   wire UNCONNECTED5;
   wire UNCONNECTED6;
   wire UNCONNECTED7;
   wire UNCONNECTED8;
   wire UNCONNECTED9;
   wire UNCONNECTED10;
   wire UNCONNECTED11;
   wire UNCONNECTED12;
   wire UNCONNECTED13;
   wire UNCONNECTED14;
   wire UNCONNECTED15;
   wire UNCONNECTED16;
   wire UNCONNECTED17;
   wire UNCONNECTED18;
   wire UNCONNECTED19;
   wire UNCONNECTED20;
   wire UNCONNECTED21;
   wire UNCONNECTED22;
   wire UNCONNECTED23;
   wire UNCONNECTED24;
   wire UNCONNECTED25;
   wire UNCONNECTED26;
   wire UNCONNECTED27;
   wire UNCONNECTED28;
   wire UNCONNECTED29;
   wire UNCONNECTED30;
   wire UNCONNECTED31;
   wire UNCONNECTED32;
   wire UNCONNECTED33;
   wire UNCONNECTED34;
   wire UNCONNECTED35;
   wire UNCONNECTED36;
   wire UNCONNECTED37;
   wire UNCONNECTED38;
   wire UNCONNECTED39;
   wire UNCONNECTED40;
   wire UNCONNECTED41;
   wire UNCONNECTED42;
   wire UNCONNECTED43;
   wire UNCONNECTED44;
   wire UNCONNECTED45;
   wire UNCONNECTED46;
   wire UNCONNECTED47;
   wire UNCONNECTED48;
   wire UNCONNECTED49;
   wire UNCONNECTED50;
   wire UNCONNECTED51;
   wire UNCONNECTED52;
   wire UNCONNECTED53;
   wire UNCONNECTED54;
   wire UNCONNECTED55;
   wire UNCONNECTED56;
   wire UNCONNECTED57;
   wire UNCONNECTED58;
   wire UNCONNECTED59;
   wire UNCONNECTED60;
   wire UNCONNECTED61;
   wire UNCONNECTED62;
   wire UNCONNECTED63;
   wire UNCONNECTED64;
   wire UNCONNECTED65;
   wire UNCONNECTED66;
   wire UNCONNECTED67;
   wire UNCONNECTED68;
   wire UNCONNECTED69;
   wire UNCONNECTED70;
   wire UNCONNECTED71;
   wire UNCONNECTED72;
   wire UNCONNECTED73;
   wire UNCONNECTED74;
   wire UNCONNECTED75;
   wire UNCONNECTED76;
   wire UNCONNECTED77;
   wire UNCONNECTED78;
   wire UNCONNECTED79;
   wire UNCONNECTED80;
   wire UNCONNECTED81;
   wire UNCONNECTED82;
   wire UNCONNECTED83;
   wire UNCONNECTED84;
   wire UNCONNECTED85;
   wire UNCONNECTED86;
   wire UNCONNECTED87;
   wire UNCONNECTED88;
   wire UNCONNECTED89;
   wire UNCONNECTED90;
   wire UNCONNECTED91;
   wire UNCONNECTED92;
   wire UNCONNECTED93;
   wire UNCONNECTED94;
   wire UNCONNECTED95;
   wire UNCONNECTED96;
   wire UNCONNECTED97;
   wire UNCONNECTED98;
   wire UNCONNECTED99;
   wire UNCONNECTED100;
   wire UNCONNECTED101;
   wire UNCONNECTED102;
   wire UNCONNECTED103;
   wire UNCONNECTED104;
   wire UNCONNECTED105;
   wire UNCONNECTED106;
   wire UNCONNECTED107;
   wire UNCONNECTED108;
   wire UNCONNECTED109;
   wire UNCONNECTED110;
   wire UNCONNECTED111;
   wire UNCONNECTED112;
   wire UNCONNECTED113;
   wire UNCONNECTED114;
   wire UNCONNECTED115;
   wire UNCONNECTED116;
   wire UNCONNECTED117;
   wire UNCONNECTED118;
   wire UNCONNECTED119;
   wire UNCONNECTED120;
   wire UNCONNECTED121;
   wire UNCONNECTED122;
   wire UNCONNECTED123;
   wire UNCONNECTED124;
   wire UNCONNECTED125;
   wire UNCONNECTED126;
   wire UNCONNECTED127;
   wire UNCONNECTED128;
   wire UNCONNECTED129;
   wire UNCONNECTED130;
   wire UNCONNECTED131;
   wire UNCONNECTED132;
   wire UNCONNECTED133;
   wire UNCONNECTED134;
   wire UNCONNECTED135;
   wire UNCONNECTED136;
   wire UNCONNECTED137;
   wire UNCONNECTED138;
   wire UNCONNECTED139;
   wire UNCONNECTED140;
   wire UNCONNECTED141;
   wire UNCONNECTED142;
   wire UNCONNECTED143;
   wire UNCONNECTED144;
   wire UNCONNECTED145;
   wire UNCONNECTED146;
   wire UNCONNECTED147;
   wire UNCONNECTED148;
   wire UNCONNECTED149;
   wire UNCONNECTED150;
   wire UNCONNECTED151;
   wire UNCONNECTED152;
   wire UNCONNECTED153;
   wire UNCONNECTED154;
   wire UNCONNECTED155;
   wire UNCONNECTED156;
   wire UNCONNECTED157;
   wire UNCONNECTED158;
   wire UNCONNECTED159;
   wire UNCONNECTED160;
   wire UNCONNECTED161;
   wire UNCONNECTED162;
   wire UNCONNECTED163;
   wire UNCONNECTED164;
   wire UNCONNECTED165;
   wire UNCONNECTED166;
   wire UNCONNECTED167;
   wire UNCONNECTED168;
   wire UNCONNECTED169;
   wire UNCONNECTED170;
   wire UNCONNECTED171;
   wire UNCONNECTED172;
   wire UNCONNECTED173;
   wire UNCONNECTED174;
   wire UNCONNECTED175;
   wire UNCONNECTED176;
   wire UNCONNECTED177;
   wire UNCONNECTED178;
   wire UNCONNECTED179;
   wire UNCONNECTED180;
   wire UNCONNECTED181;
   wire UNCONNECTED182;
   wire UNCONNECTED183;
   wire UNCONNECTED184;
   wire UNCONNECTED185;
   wire UNCONNECTED186;
   wire UNCONNECTED187;
   wire UNCONNECTED188;
   wire UNCONNECTED189;
   wire UNCONNECTED190;
   wire UNCONNECTED191;
   wire UNCONNECTED192;
   wire UNCONNECTED193;
   wire UNCONNECTED194;
   wire UNCONNECTED195;
   wire UNCONNECTED196;
   wire UNCONNECTED197;
   wire UNCONNECTED198;
   wire UNCONNECTED199;
   wire UNCONNECTED200;
   wire UNCONNECTED201;
   wire UNCONNECTED202;
   wire UNCONNECTED203;
   wire UNCONNECTED204;
   wire UNCONNECTED205;
   wire UNCONNECTED206;
   wire UNCONNECTED207;
   wire UNCONNECTED208;
   wire UNCONNECTED209;
   wire UNCONNECTED210;
   wire UNCONNECTED211;
   wire UNCONNECTED212;
   wire UNCONNECTED213;
   wire UNCONNECTED214;
   wire UNCONNECTED215;
   wire UNCONNECTED216;
   wire UNCONNECTED217;
   wire UNCONNECTED218;
   wire UNCONNECTED219;
   wire UNCONNECTED220;
   wire UNCONNECTED221;
   wire UNCONNECTED222;
   wire UNCONNECTED223;
   wire UNCONNECTED224;
   wire UNCONNECTED225;
   wire UNCONNECTED226;
   wire UNCONNECTED227;
   wire UNCONNECTED228;
   wire UNCONNECTED229;
   wire UNCONNECTED230;
   wire UNCONNECTED231;
   wire UNCONNECTED232;
   wire UNCONNECTED233;
   wire UNCONNECTED234;
   wire UNCONNECTED235;
   wire UNCONNECTED236;
   wire UNCONNECTED237;
   wire UNCONNECTED238;
   wire UNCONNECTED239;
   wire UNCONNECTED240;
   wire UNCONNECTED241;
   wire UNCONNECTED242;
   wire UNCONNECTED243;
   wire UNCONNECTED244;
   wire UNCONNECTED245;
   wire UNCONNECTED246;
   wire UNCONNECTED247;
   wire UNCONNECTED248;
   wire UNCONNECTED249;
   wire UNCONNECTED250;
   wire UNCONNECTED251;
   wire UNCONNECTED252;
   wire UNCONNECTED253;
   wire UNCONNECTED254;
   wire UNCONNECTED255;
   wire UNCONNECTED256;
   wire UNCONNECTED257;
   wire UNCONNECTED258;
   wire UNCONNECTED259;
   wire UNCONNECTED260;
   wire UNCONNECTED261;
   wire UNCONNECTED262;
   wire UNCONNECTED263;
   wire UNCONNECTED264;
   wire UNCONNECTED265;
   wire UNCONNECTED266;
   wire \aluout_reg[0]_3001 ;
   wire \aluout_reg[1]_3002 ;
   wire \aluout_reg[2]_3003 ;
   wire \aluout_reg[3]_3004 ;
   wire \aluout_reg[4]_3005 ;
   wire \aluout_reg[5]_3006 ;
   wire \aluout_reg[6]_3007 ;
   wire \aluout_reg[7]_3008 ;
   wire aluout_zero_node;
   wire c_in_1014;
   wire exec_op_reg;
   wire inc_tmr_hold_reg;
   wire int_node;
   wire inte_sync_reg;
   wire intstart_reg;
   wire mclr_sync_reg;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_248;
   wire n_249;
   wire n_250;
   wire n_251;
   wire n_252;
   wire n_253;
   wire n_254;
   wire n_255;
   wire n_256;
   wire n_257;
   wire n_258;
   wire n_259;
   wire n_260;
   wire n_261;
   wire n_262;
   wire n_263;
   wire n_264;
   wire n_265;
   wire n_266;
   wire n_267;
   wire n_268;
   wire n_269;
   wire n_270;
   wire n_271;
   wire n_272;
   wire n_273;
   wire n_274;
   wire n_275;
   wire n_276;
   wire n_277;
   wire n_278;
   wire n_279;
   wire n_280;
   wire n_281;
   wire n_282;
   wire n_283;
   wire n_284;
   wire n_285;
   wire n_286;
   wire n_287;
   wire n_288;
   wire n_289;
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_295;
   wire n_296;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_303;
   wire n_304;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_309;
   wire n_310;
   wire n_311;
   wire n_312;
   wire n_313;
   wire n_314;
   wire n_315;
   wire n_316;
   wire n_317;
   wire n_318;
   wire n_319;
   wire n_320;
   wire n_321;
   wire n_322;
   wire n_323;
   wire n_324;
   wire n_325;
   wire n_326;
   wire n_327;
   wire n_328;
   wire n_329;
   wire n_330;
   wire n_331;
   wire n_332;
   wire n_333;
   wire n_334;
   wire n_335;
   wire n_336;
   wire n_337;
   wire n_338;
   wire n_339;
   wire n_340;
   wire n_341;
   wire n_342;
   wire n_343;
   wire n_344;
   wire n_345;
   wire n_346;
   wire n_347;
   wire n_348;
   wire n_349;
   wire n_350;
   wire n_351;
   wire n_352;
   wire n_353;
   wire n_354;
   wire n_355;
   wire n_356;
   wire n_357;
   wire n_358;
   wire n_359;
   wire n_360;
   wire n_361;
   wire n_362;
   wire n_363;
   wire n_364;
   wire n_365;
   wire n_366;
   wire n_367;
   wire n_368;
   wire n_369;
   wire n_370;
   wire n_371;
   wire n_372;
   wire n_373;
   wire n_374;
   wire n_375;
   wire n_376;
   wire n_377;
   wire n_378;
   wire n_379;
   wire n_380;
   wire n_381;
   wire n_382;
   wire n_383;
   wire n_384;
   wire n_385;
   wire n_386;
   wire n_387;
   wire n_388;
   wire n_389;
   wire n_390;
   wire n_391;
   wire n_392;
   wire n_393;
   wire n_394;
   wire n_395;
   wire n_396;
   wire n_397;
   wire n_398;
   wire n_399;
   wire n_400;
   wire n_401;
   wire n_402;
   wire n_403;
   wire n_404;
   wire n_405;
   wire n_406;
   wire n_407;
   wire n_408;
   wire n_409;
   wire n_410;
   wire n_411;
   wire n_412;
   wire n_413;
   wire n_414;
   wire n_415;
   wire n_416;
   wire n_417;
   wire n_418;
   wire n_419;
   wire n_420;
   wire n_421;
   wire n_422;
   wire n_423;
   wire n_424;
   wire n_425;
   wire n_427;
   wire n_428;
   wire n_429;
   wire n_430;
   wire n_431;
   wire n_432;
   wire n_433;
   wire n_434;
   wire n_435;
   wire n_436;
   wire n_437;
   wire n_438;
   wire n_439;
   wire n_440;
   wire n_441;
   wire n_442;
   wire n_443;
   wire n_444;
   wire n_445;
   wire n_446;
   wire n_447;
   wire n_448;
   wire n_449;
   wire n_450;
   wire n_451;
   wire n_452;
   wire n_453;
   wire n_454;
   wire n_455;
   wire n_456;
   wire n_457;
   wire n_458;
   wire n_459;
   wire n_460;
   wire n_461;
   wire n_462;
   wire n_463;
   wire n_464;
   wire n_465;
   wire n_466;
   wire n_467;
   wire n_468;
   wire n_469;
   wire n_470;
   wire n_471;
   wire n_472;
   wire n_473;
   wire n_474;
   wire n_475;
   wire n_476;
   wire n_477;
   wire n_478;
   wire n_479;
   wire n_480;
   wire n_481;
   wire n_482;
   wire n_483;
   wire n_484;
   wire n_485;
   wire n_486;
   wire n_487;
   wire n_488;
   wire n_489;
   wire n_490;
   wire n_492;
   wire n_493;
   wire n_494;
   wire n_495;
   wire n_496;
   wire n_497;
   wire n_498;
   wire n_502;
   wire n_503;
   wire n_504;
   wire n_505;
   wire n_506;
   wire n_507;
   wire n_508;
   wire n_509;
   wire n_510;
   wire n_511;
   wire n_512;
   wire n_513;
   wire n_514;
   wire n_515;
   wire n_516;
   wire n_517;
   wire n_518;
   wire n_519;
   wire n_520;
   wire n_521;
   wire n_522;
   wire n_523;
   wire n_524;
   wire n_525;
   wire n_526;
   wire n_527;
   wire n_528;
   wire n_529;
   wire n_530;
   wire n_531;
   wire n_532;
   wire n_533;
   wire n_534;
   wire n_535;
   wire n_536;
   wire n_537;
   wire n_538;
   wire n_539;
   wire n_540;
   wire n_541;
   wire n_542;
   wire n_543;
   wire n_544;
   wire n_545;
   wire n_546;
   wire n_547;
   wire n_548;
   wire n_549;
   wire n_550;
   wire n_551;
   wire n_552;
   wire n_553;
   wire n_554;
   wire n_555;
   wire n_556;
   wire n_557;
   wire n_558;
   wire n_559;
   wire n_560;
   wire n_561;
   wire n_562;
   wire n_563;
   wire n_564;
   wire n_565;
   wire n_566;
   wire n_567;
   wire n_568;
   wire n_569;
   wire n_570;
   wire n_571;
   wire n_572;
   wire n_573;
   wire n_574;
   wire n_575;
   wire n_576;
   wire n_577;
   wire n_578;
   wire n_579;
   wire n_580;
   wire n_581;
   wire n_582;
   wire n_583;
   wire n_584;
   wire n_585;
   wire n_586;
   wire n_587;
   wire n_588;
   wire n_589;
   wire n_590;
   wire n_591;
   wire n_592;
   wire n_593;
   wire n_594;
   wire n_595;
   wire n_596;
   wire n_597;
   wire n_598;
   wire n_599;
   wire n_600;
   wire n_601;
   wire n_602;
   wire n_603;
   wire n_604;
   wire n_605;
   wire n_606;
   wire n_607;
   wire n_609;
   wire n_610;
   wire n_611;
   wire n_612;
   wire n_613;
   wire n_614;
   wire n_616;
   wire n_617;
   wire n_618;
   wire n_619;
   wire n_621;
   wire n_622;
   wire n_623;
   wire n_624;
   wire n_625;
   wire n_626;
   wire n_627;
   wire n_628;
   wire n_629;
   wire n_630;
   wire n_631;
   wire n_632;
   wire n_633;
   wire n_634;
   wire n_635;
   wire n_636;
   wire n_637;
   wire n_638;
   wire n_639;
   wire n_640;
   wire n_642;
   wire n_643;
   wire n_644;
   wire n_645;
   wire n_646;
   wire n_647;
   wire n_648;
   wire n_649;
   wire n_650;
   wire n_651;
   wire n_652;
   wire n_653;
   wire n_654;
   wire n_655;
   wire n_656;
   wire n_657;
   wire n_658;
   wire n_659;
   wire n_660;
   wire n_661;
   wire n_662;
   wire n_663;
   wire n_664;
   wire n_665;
   wire n_666;
   wire n_667;
   wire n_668;
   wire n_669;
   wire n_670;
   wire n_671;
   wire n_672;
   wire n_673;
   wire n_674;
   wire n_675;
   wire n_676;
   wire n_677;
   wire n_678;
   wire n_679;
   wire n_680;
   wire n_681;
   wire n_682;
   wire n_683;
   wire n_684;
   wire n_685;
   wire n_686;
   wire n_687;
   wire n_689;
   wire n_690;
   wire n_691;
   wire n_692;
   wire n_693;
   wire n_694;
   wire n_695;
   wire n_696;
   wire n_697;
   wire n_698;
   wire n_699;
   wire n_700;
   wire n_701;
   wire n_702;
   wire n_703;
   wire n_705;
   wire n_706;
   wire n_707;
   wire n_708;
   wire n_709;
   wire n_710;
   wire n_711;
   wire n_712;
   wire n_713;
   wire n_714;
   wire n_715;
   wire n_716;
   wire n_717;
   wire n_718;
   wire n_719;
   wire n_720;
   wire n_721;
   wire n_722;
   wire n_723;
   wire n_724;
   wire n_725;
   wire n_726;
   wire n_727;
   wire n_728;
   wire n_729;
   wire n_730;
   wire n_731;
   wire n_732;
   wire n_733;
   wire n_734;
   wire n_735;
   wire n_736;
   wire n_737;
   wire n_738;
   wire n_739;
   wire n_740;
   wire n_741;
   wire n_742;
   wire n_743;
   wire n_744;
   wire n_745;
   wire n_746;
   wire n_747;
   wire n_748;
   wire n_749;
   wire n_750;
   wire n_751;
   wire n_752;
   wire n_753;
   wire n_754;
   wire n_755;
   wire n_756;
   wire n_757;
   wire n_758;
   wire n_759;
   wire n_760;
   wire n_761;
   wire n_762;
   wire n_763;
   wire n_764;
   wire n_765;
   wire n_766;
   wire n_767;
   wire n_768;
   wire n_769;
   wire n_770;
   wire n_771;
   wire n_772;
   wire n_773;
   wire n_774;
   wire n_775;
   wire n_776;
   wire n_777;
   wire n_778;
   wire n_779;
   wire n_780;
   wire n_781;
   wire n_782;
   wire n_783;
   wire n_784;
   wire n_786;
   wire n_787;
   wire n_788;
   wire n_789;
   wire n_790;
   wire n_791;
   wire n_792;
   wire n_793;
   wire n_794;
   wire n_795;
   wire n_796;
   wire n_797;
   wire n_798;
   wire n_799;
   wire n_800;
   wire n_801;
   wire n_802;
   wire n_803;
   wire n_804;
   wire n_805;
   wire n_806;
   wire n_807;
   wire n_808;
   wire n_809;
   wire n_810;
   wire n_811;
   wire n_812;
   wire n_813;
   wire n_814;
   wire n_815;
   wire n_816;
   wire n_817;
   wire n_818;
   wire n_819;
   wire n_820;
   wire n_821;
   wire n_822;
   wire n_823;
   wire n_824;
   wire n_825;
   wire n_826;
   wire n_827;
   wire n_828;
   wire n_829;
   wire n_830;
   wire n_831;
   wire n_832;
   wire n_833;
   wire n_834;
   wire n_835;
   wire n_836;
   wire n_837;
   wire n_838;
   wire n_839;
   wire n_840;
   wire n_841;
   wire n_842;
   wire n_843;
   wire n_845;
   wire n_846;
   wire n_847;
   wire n_848;
   wire n_849;
   wire n_850;
   wire n_851;
   wire n_852;
   wire n_853;
   wire n_854;
   wire n_855;
   wire n_856;
   wire n_857;
   wire n_858;
   wire n_859;
   wire n_861;
   wire n_862;
   wire n_863;
   wire n_864;
   wire n_865;
   wire n_866;
   wire n_867;
   wire n_868;
   wire n_869;
   wire n_870;
   wire n_871;
   wire n_872;
   wire n_873;
   wire n_874;
   wire n_875;
   wire n_876;
   wire n_877;
   wire n_878;
   wire n_879;
   wire n_880;
   wire n_881;
   wire n_882;
   wire n_883;
   wire n_884;
   wire n_885;
   wire n_886;
   wire n_887;
   wire n_888;
   wire n_889;
   wire n_890;
   wire n_891;
   wire n_892;
   wire n_893;
   wire n_894;
   wire n_895;
   wire n_896;
   wire n_897;
   wire n_898;
   wire n_899;
   wire n_900;
   wire n_901;
   wire n_902;
   wire n_903;
   wire n_904;
   wire n_905;
   wire n_906;
   wire n_907;
   wire n_908;
   wire n_909;
   wire n_910;
   wire n_911;
   wire n_912;
   wire n_913;
   wire n_914;
   wire n_915;
   wire n_916;
   wire n_917;
   wire n_919;
   wire n_920;
   wire n_921;
   wire n_923;
   wire n_925;
   wire n_926;
   wire n_927;
   wire n_928;
   wire n_929;
   wire n_931;
   wire n_932;
   wire n_933;
   wire n_934;
   wire n_935;
   wire n_936;
   wire n_937;
   wire n_938;
   wire n_939;
   wire n_940;
   wire n_941;
   wire n_942;
   wire n_943;
   wire n_944;
   wire n_945;
   wire n_946;
   wire n_947;
   wire n_948;
   wire n_949;
   wire n_950;
   wire n_951;
   wire n_952;
   wire n_953;
   wire n_954;
   wire n_955;
   wire n_956;
   wire n_957;
   wire n_958;
   wire n_959;
   wire n_960;
   wire n_961;
   wire n_962;
   wire n_963;
   wire n_964;
   wire n_965;
   wire n_966;
   wire n_967;
   wire n_968;
   wire n_969;
   wire n_970;
   wire n_971;
   wire n_972;
   wire n_973;
   wire n_980;
   wire n_983;
   wire n_984;
   wire n_985;
   wire n_986;
   wire n_987;
   wire n_988;
   wire n_989;
   wire n_990;
   wire n_991;
   wire n_992;
   wire n_993;
   wire n_994;
   wire n_995;
   wire n_996;
   wire n_997;
   wire n_998;
   wire n_999;
   wire n_1000;
   wire n_1001;
   wire n_1002;
   wire n_1003;
   wire n_1004;
   wire n_1005;
   wire n_1006;
   wire n_1007;
   wire n_1009;
   wire n_1010;
   wire n_1011;
   wire n_1012;
   wire n_1013;
   wire n_1014;
   wire n_1015;
   wire n_1016;
   wire n_1017;
   wire n_1018;
   wire n_1019;
   wire n_1020;
   wire n_1021;
   wire n_1022;
   wire n_1023;
   wire n_1024;
   wire n_1025;
   wire n_1026;
   wire n_1027;
   wire n_1028;
   wire n_1029;
   wire n_1030;
   wire n_1164;
   wire n_1165;
   wire \pc_reg[0]_2967 ;
   wire \pc_reg[1]_2968 ;
   wire \pc_reg[2]_2969 ;
   wire \pc_reg[3]_2970 ;
   wire \pc_reg[4]_2971 ;
   wire \pc_reg[5]_2972 ;
   wire \pc_reg[6]_2973 ;
   wire \pc_reg[7]_2974 ;
   wire \pc_reg[8]_2975 ;
   wire \pc_reg[9]_2976 ;
   wire \pc_reg[10]_2977 ;
   wire \pc_reg[11]_2978 ;
   wire poweron_sync_reg;
   wire ps_full_reg;
   wire rbint_sync_reg;
   wire rd_eep_sync_reg;
   wire reset_cond;
   wire wdt_full_node;
   wire wdt_rst_node;
   wire wr_eep_sync_reg;
   wire writeram_node;
   wire writew_node;

   DFF_X1 \tmr0_reg_reg[7]  (.D(n_1029),
	.CK(clk_i),
	.Q(n_467),
	.QN(tmr0_reg[7]));
   DFF_X1 \tmr0_reg_reg[6]  (.D(n_1030),
	.CK(clk_i),
	.Q(n_652),
	.QN(tmr0_reg[6]));
   OAI221_X1 g30745 (.A(n_1017),
	.B1(n_1028),
	.B2(tmr0_reg[6]),
	.C1(n_1027),
	.C2(\aluout_reg[6]_3007 ),
	.ZN(n_1030));
   OAI222_X1 g30746 (.A1(n_1028),
	.A2(tmr0_reg[7]),
	.B1(n_468),
	.B2(n_1025),
	.C1(n_1027),
	.C2(\aluout_reg[7]_3008 ),
	.ZN(n_1029));
   DFF_X1 \tmr0_reg_reg[4]  (.D(n_1019),
	.CK(clk_i),
	.Q(UNCONNECTED),
	.QN(tmr0_reg[4]));
   DFF_X1 \tmr0_reg_reg[3]  (.D(n_1026),
	.CK(clk_i),
	.Q(n_13),
	.QN(tmr0_reg[3]));
   DFF_X1 \tmr0_reg_reg[5]  (.D(n_1024),
	.CK(clk_i),
	.Q(n_17),
	.QN(tmr0_reg[5]));
   DFF_X1 \tmr0_reg_reg[1]  (.D(n_1021),
	.CK(clk_i),
	.Q(n_84),
	.QN(tmr0_reg[1]));
   DFF_X1 \tmr0_reg_reg[0]  (.D(n_1020),
	.CK(clk_i),
	.Q(n_564),
	.QN(tmr0_reg[0]));
   DFF_X1 \tmr0_reg_reg[2]  (.D(n_1022),
	.CK(clk_i),
	.Q(n_14),
	.QN(tmr0_reg[2]));
   OAI222_X1 g30754 (.A1(n_1023),
	.A2(tmr0_reg[3]),
	.B1(n_1025),
	.B2(n_217),
	.C1(n_1027),
	.C2(\aluout_reg[3]_3004 ),
	.ZN(n_1026));
   OAI222_X1 g30755 (.A1(n_1023),
	.A2(tmr0_reg[5]),
	.B1(n_323),
	.B2(n_1025),
	.C1(n_1027),
	.C2(\aluout_reg[5]_3006 ),
	.ZN(n_1024));
   OAI222_X1 g30750 (.A1(n_1023),
	.A2(tmr0_reg[2]),
	.B1(n_1025),
	.B2(n_168),
	.C1(n_1027),
	.C2(\aluout_reg[2]_3003 ),
	.ZN(n_1022));
   OAI222_X1 g30751 (.A1(n_1023),
	.A2(tmr0_reg[1]),
	.B1(n_1025),
	.B2(n_85),
	.C1(n_1027),
	.C2(\aluout_reg[1]_3002 ),
	.ZN(n_1021));
   OAI222_X1 g30752 (.A1(n_1023),
	.A2(tmr0_reg[0]),
	.B1(n_1025),
	.B2(n_564),
	.C1(n_1027),
	.C2(\aluout_reg[0]_3001 ),
	.ZN(n_1020));
   OAI222_X1 g30753 (.A1(n_1023),
	.A2(tmr0_reg[4]),
	.B1(n_267),
	.B2(n_1025),
	.C1(n_1027),
	.C2(\aluout_reg[4]_3005 ),
	.ZN(n_1019));
   AOI21_X1 g30759 (.A(n_1018),
	.B1(n_1016),
	.B2(n_1014),
	.ZN(n_1028));
   INV_X1 g30762 (.A(n_1023),
	.ZN(n_1018));
   DFF_X1 inc_tmr_hold_reg_reg (.D(n_1015),
	.CK(clk_i),
	.Q(UNCONNECTED0),
	.QN(inc_tmr_hold_reg));
   OR3_X1 g30761 (.A1(n_1016),
	.A2(n_1025),
	.A3(n_652),
	.ZN(n_1017));
   NAND3_X1 g30764 (.A1(n_1027),
	.A2(n_1025),
	.A3(n_1011),
	.ZN(n_1023));
   OAI22_X1 g30763 (.A1(n_247),
	.A2(n_1013),
	.B1(n_1014),
	.B2(inc_tmr_hold_reg),
	.ZN(n_1015));
   INV_X1 g30769 (.A(n_1014),
	.ZN(n_1025));
   AOI21_X1 g30771 (.A(n_950),
	.B1(inc_tmr_hold_reg),
	.B2(n_1013),
	.ZN(n_1014));
   DFF_X1 \status_reg_reg[3]  (.D(n_1012),
	.CK(clk_i),
	.Q(n_25),
	.QN(status_reg[3]));
   NAND2_X1 g30774 (.A1(inc_tmr_sync_reg[0]),
	.A2(inc_tmr_sync_reg[1]),
	.ZN(n_1013));
   DFF_X1 \inc_tmr_sync_reg_reg[1]  (.D(inc_tmr_sync_reg[0]),
	.CK(clk_i),
	.Q(UNCONNECTED1),
	.QN(inc_tmr_sync_reg[1]));
   OAI221_X1 g30800 (.A(n_959),
	.B1(n_996),
	.B2(n_1011),
	.C1(n_1005),
	.C2(status_reg[3]),
	.ZN(n_1012));
   DFF_X1 \inc_pc_node_reg[12]  (.D(n_1164),
	.CK(clk_i),
	.Q(UNCONNECTED2),
	.QN(inc_pc_node[12]));
   DFFR_X1 \pscale_reg_reg[3]  (.D(n_1006),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[3]),
	.QN(UNCONNECTED3));
   DFFR_X1 \pscale_reg_reg[5]  (.D(n_1007),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[5]),
	.QN(n_569));
   DFF_X1 sleepflag_reg_reg (.D(n_1009),
	.CK(clk_i),
	.Q(powerdown_o),
	.QN(n_9));
   SDFF_X1 \inc_tmr_sync_reg_reg[0]  (.D(ps_full_reg),
	.SE(option_reg[3]),
	.SI(n_1010),
	.CK(clk_i),
	.Q(inc_tmr_sync_reg[0]),
	.QN(UNCONNECTED4));
   DFF_X1 \aluinp1_reg_reg[1]  (.D(n_1003),
	.CK(clk_i),
	.Q(n_372),
	.QN(aluinp1_reg[1]));
   DFF_X1 \aluinp1_reg_reg[0]  (.D(n_1004),
	.CK(clk_i),
	.Q(n_387),
	.QN(aluinp1_reg[0]));
   DFF_X1 \aluinp1_reg_reg[3]  (.D(n_999),
	.CK(clk_i),
	.Q(n_382),
	.QN(aluinp1_reg[3]));
   DFF_X1 \aluinp1_reg_reg[4]  (.D(n_1000),
	.CK(clk_i),
	.Q(n_390),
	.QN(aluinp1_reg[4]));
   DFF_X1 \aluinp1_reg_reg[2]  (.D(n_997),
	.CK(clk_i),
	.Q(n_400),
	.QN(aluinp1_reg[2]));
   DFF_X1 \inc_pc_node_reg[11]  (.D(n_987),
	.CK(clk_i),
	.Q(UNCONNECTED5),
	.QN(inc_pc_node[11]));
   OAI21_X1 g30856 (.A(n_960),
	.B1(n_970),
	.B2(n_762),
	.ZN(n_1009));
   DFFR_X1 \pscale_reg_reg[2]  (.D(n_990),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[2]),
	.QN(n_162));
   DFF_X1 \status_reg_reg[0]  (.D(n_993),
	.CK(clk_i),
	.Q(n_618),
	.QN(status_reg[0]));
   INV_X1 g30829 (.A(n_995),
	.ZN(n_1007));
   INV_X1 g30828 (.A(n_998),
	.ZN(n_1006));
   DFFR_X1 \pscale_reg_reg[4]  (.D(n_986),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[4]),
	.QN(n_350));
   SDFF_X1 \status_reg_reg[4]  (.D(status_reg[4]),
	.SE(n_1005),
	.SI(n_188),
	.CK(clk_i),
	.Q(status_reg[4]),
	.QN(UNCONNECTED6));
   DFFR_X1 \pscale_reg_reg[6]  (.D(n_992),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[6]),
	.QN(n_341));
   OAI221_X1 g30855 (.A(n_402),
	.B1(n_1002),
	.B2(w_reg[0]),
	.C1(n_1001),
	.C2(ram_i_node[0]),
	.ZN(n_1004));
   OAI221_X1 g30877 (.A(n_405),
	.B1(n_1002),
	.B2(n_671),
	.C1(n_1001),
	.C2(ram_i_node[1]),
	.ZN(n_1003));
   OAI221_X1 g30879 (.A(n_411),
	.B1(n_1002),
	.B2(n_265),
	.C1(n_1001),
	.C2(ram_i_node[4]),
	.ZN(n_1000));
   OAI221_X1 g30883 (.A(n_409),
	.B1(n_1002),
	.B2(n_16),
	.C1(n_1001),
	.C2(ram_i_node[3]),
	.ZN(n_999));
   DFFR_X1 \pscale_reg_reg[7]  (.D(n_969),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[7]),
	.QN(n_909));
   DFFR_X1 \pscale_reg_reg[0]  (.D(n_972),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[0]),
	.QN(UNCONNECTED7));
   OAI211_X1 g30830 (.A(n_994),
	.B(n_984),
	.C1(n_989),
	.C2(pscale_reg[3]),
	.ZN(n_998));
   OAI221_X1 g30886 (.A(n_401),
	.B1(n_1002),
	.B2(n_173),
	.C1(n_1001),
	.C2(ram_i_node[2]),
	.ZN(n_997));
   AOI21_X1 g30834 (.A(poweron_sync_reg),
	.B1(n_1005),
	.B2(n_9),
	.ZN(n_996));
   OAI211_X1 g30831 (.A(n_994),
	.B(n_991),
	.C1(n_985),
	.C2(pscale_reg[5]),
	.ZN(n_995));
   DFFR_X1 \pscale_reg_reg[1]  (.D(n_983),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(pscale_reg[1]),
	.QN(UNCONNECTED8));
   DFF_X1 \w_reg_reg[0]  (.D(n_971),
	.CK(clk_i),
	.Q(UNCONNECTED9),
	.QN(w_reg[0]));
   OAI221_X1 g30790 (.A(n_794),
	.B1(n_792),
	.B2(n_938),
	.C1(n_793),
	.C2(\aluout_reg[0]_3001 ),
	.ZN(n_993));
   DFF_X1 \pc_reg_reg[4]  (.D(n_965),
	.CK(clk_i),
	.Q(prog_adr_o[4]),
	.QN(\pc_reg[4]_2971 ));
   DFF_X1 \pc_reg_reg[1]  (.D(n_967),
	.CK(clk_i),
	.Q(prog_adr_o[1]),
	.QN(\pc_reg[1]_2968 ));
   DFF_X1 \aluinp1_reg_reg[7]  (.D(n_964),
	.CK(clk_i),
	.Q(n_406),
	.QN(aluinp1_reg[7]));
   DFF_X1 \aluinp1_reg_reg[6]  (.D(n_962),
	.CK(clk_i),
	.Q(n_384),
	.QN(aluinp1_reg[6]));
   DFF_X1 \aluinp1_reg_reg[5]  (.D(n_963),
	.CK(clk_i),
	.Q(n_376),
	.QN(aluinp1_reg[5]));
   AOI211_X1 g30821 (.A(n_469),
	.B(n_988),
	.C1(n_991),
	.C2(n_341),
	.ZN(n_992));
   AOI211_X1 g30819 (.A(n_989),
	.B(n_988),
	.C1(n_161),
	.C2(n_162),
	.ZN(n_990));
   AOI21_X1 g30735 (.A(n_973),
	.B1(n_961),
	.B2(\pc_reg[11]_2978 ),
	.ZN(n_987));
   AOI211_X1 g30822 (.A(n_985),
	.B(n_988),
	.C1(n_984),
	.C2(n_350),
	.ZN(n_986));
   DFF_X1 \pc_reg_reg[3]  (.D(n_966),
	.CK(clk_i),
	.Q(prog_adr_o[3]),
	.QN(\pc_reg[3]_2970 ));
   DFF_X1 \pc_reg_reg[0]  (.D(n_968),
	.CK(clk_i),
	.Q(prog_adr_o[0]),
	.QN(\pc_reg[0]_2967 ));
   DFF_X1 \inc_pc_node_reg[10]  (.D(n_948),
	.CK(clk_i),
	.Q(UNCONNECTED10),
	.QN(inc_pc_node[10]));
   NOR3_X1 g30836 (.A1(n_988),
	.A2(n_35),
	.A3(n_163),
	.ZN(n_983));
   SDFF_X1 \w_reg_reg[1]  (.D(ram_dat_o[1]),
	.SE(n_980),
	.SI(w_reg[1]),
	.CK(clk_i),
	.Q(w_reg[1]),
	.QN(n_671));
   SDFF_X1 \w_reg_reg[4]  (.D(ram_dat_o[4]),
	.SE(n_980),
	.SI(w_reg[4]),
	.CK(clk_i),
	.Q(w_reg[4]),
	.QN(n_265));
   SDFF_X1 \w_reg_reg[2]  (.D(ram_dat_o[2]),
	.SE(n_980),
	.SI(w_reg[2]),
	.CK(clk_i),
	.Q(w_reg[2]),
	.QN(n_173));
   SDFF_X1 \w_reg_reg[6]  (.D(ram_dat_o[6]),
	.SE(n_980),
	.SI(w_reg[6]),
	.CK(clk_i),
	.Q(w_reg[6]),
	.QN(n_369));
   SDFF_X1 \w_reg_reg[7]  (.D(ram_dat_o[7]),
	.SE(n_980),
	.SI(w_reg[7]),
	.CK(clk_i),
	.Q(w_reg[7]),
	.QN(n_15));
   DFF_X1 \pc_reg_reg[6]  (.D(n_949),
	.CK(clk_i),
	.Q(prog_adr_o[6]),
	.QN(\pc_reg[6]_2973 ));
   DFF_X1 \pc_reg_reg[7]  (.D(n_944),
	.CK(clk_i),
	.Q(prog_adr_o[7]),
	.QN(\pc_reg[7]_2974 ));
   DFF_X1 \pc_reg_reg[5]  (.D(n_958),
	.CK(clk_i),
	.Q(prog_adr_o[5]),
	.QN(\pc_reg[5]_2972 ));
   SDFF_X1 \w_reg_reg[5]  (.D(ram_dat_o[5]),
	.SE(n_980),
	.SI(w_reg[5]),
	.CK(clk_i),
	.Q(w_reg[5]),
	.QN(n_10));
   SDFF_X1 \w_reg_reg[3]  (.D(ram_dat_o[3]),
	.SE(n_980),
	.SI(w_reg[3]),
	.CK(clk_i),
	.Q(w_reg[3]),
	.QN(n_16));
   DFF_X1 \aluout_reg_reg[7]  (.D(n_946),
	.CK(clk_i),
	.Q(ram_dat_o[7]),
	.QN(\aluout_reg[7]_3008 ));
   DFF_X1 \aluout_reg_reg[5]  (.D(n_947),
	.CK(clk_i),
	.Q(ram_dat_o[5]),
	.QN(\aluout_reg[5]_3006 ));
   NOR2_X1 g30823 (.A1(n_988),
	.A2(pscale_reg[0]),
	.ZN(n_972));
   OAI22_X1 g30898 (.A1(n_980),
	.A2(\aluout_reg[0]_3001 ),
	.B1(n_937),
	.B2(w_reg[0]),
	.ZN(n_971));
   DFFR_X1 ps_full_reg_reg (.D(n_988),
	.RN(pon_rst_n_i),
	.CK(n_1010),
	.Q(ps_full_reg),
	.QN(UNCONNECTED11));
   AOI21_X1 g30891 (.A(n_115),
	.B1(n_936),
	.B2(powerdown_o),
	.ZN(n_970));
   NOR2_X1 g30814 (.A1(n_988),
	.A2(n_470),
	.ZN(n_969));
   DFF_X1 \pc_reg_reg[2]  (.D(n_957),
	.CK(clk_i),
	.Q(prog_adr_o[2]),
	.QN(\pc_reg[2]_2969 ));
   DFF_X1 \state_reg_reg[0]  (.D(n_954),
	.CK(clk_i),
	.Q(n_33),
	.QN(state_reg[0]));
   DFF_X1 \pc_reg_reg[9]  (.D(n_942),
	.CK(clk_i),
	.Q(prog_adr_o[9]),
	.QN(\pc_reg[9]_2976 ));
   DFF_X1 \pc_reg_reg[10]  (.D(n_941),
	.CK(clk_i),
	.Q(prog_adr_o[10]),
	.QN(\pc_reg[10]_2977 ));
   DFF_X1 \state_reg_reg[1]  (.D(n_953),
	.CK(clk_i),
	.Q(UNCONNECTED12),
	.QN(state_reg[1]));
   DFF_X1 \pc_reg_reg[8]  (.D(n_943),
	.CK(clk_i),
	.Q(prog_adr_o[8]),
	.QN(\pc_reg[8]_2975 ));
   DFF_X1 \pc_reg_reg[11]  (.D(n_940),
	.CK(clk_i),
	.Q(prog_adr_o[11]),
	.QN(\pc_reg[11]_2978 ));
   DFF_X1 \pc_reg_reg[12]  (.D(n_939),
	.CK(clk_i),
	.Q(prog_adr_o[12]),
	.QN(n_23));
   NAND4_X1 g30962 (.A1(n_927),
	.A2(n_843),
	.A3(n_835),
	.A4(n_698),
	.ZN(n_968));
   NAND4_X1 g30959 (.A1(n_931),
	.A2(n_853),
	.A3(n_840),
	.A4(n_685),
	.ZN(n_967));
   NAND4_X1 g30957 (.A1(n_923),
	.A2(n_856),
	.A3(n_837),
	.A4(n_680),
	.ZN(n_966));
   NAND4_X1 g30875 (.A1(n_919),
	.A2(n_870),
	.A3(n_836),
	.A4(n_682),
	.ZN(n_965));
   INV_X1 g30849 (.A(n_988),
	.ZN(n_994));
   OAI221_X1 g30876 (.A(n_407),
	.B1(n_1002),
	.B2(n_15),
	.C1(n_1001),
	.C2(ram_i_node[7]),
	.ZN(n_964));
   OAI221_X1 g30881 (.A(n_404),
	.B1(n_1002),
	.B2(n_10),
	.C1(n_1001),
	.C2(ram_i_node[5]),
	.ZN(n_963));
   OAI221_X1 g30882 (.A(n_403),
	.B1(n_1002),
	.B2(n_369),
	.C1(n_1001),
	.C2(ram_i_node[6]),
	.ZN(n_962));
   NOR2_X1 g30740 (.A1(n_961),
	.A2(\pc_reg[11]_2978 ),
	.ZN(n_973));
   OAI211_X1 g30890 (.A(n_960),
	.B(n_959),
	.C1(n_1011),
	.C2(n_868),
	.ZN(n_1005));
   DFF_X1 \state_reg_reg[2]  (.D(n_935),
	.CK(clk_i),
	.Q(n_74),
	.QN(state_reg[2]));
   DFF_X1 \ram_i_node_reg[1]  (.D(n_921),
	.CK(clk_i),
	.Q(UNCONNECTED13),
	.QN(ram_i_node[1]));
   DFF_X1 \ram_i_node_reg[4]  (.D(n_929),
	.CK(clk_i),
	.Q(UNCONNECTED14),
	.QN(ram_i_node[4]));
   DFF_X1 \ram_i_node_reg[3]  (.D(n_933),
	.CK(clk_i),
	.Q(UNCONNECTED15),
	.QN(ram_i_node[3]));
   DFF_X1 \ram_i_node_reg[2]  (.D(n_928),
	.CK(clk_i),
	.Q(UNCONNECTED16),
	.QN(ram_i_node[2]));
   OAI221_X1 g30838 (.A(n_831),
	.B1(n_956),
	.B2(inc_pc_node[5]),
	.C1(n_955),
	.C2(\pc_reg[5]_2972 ),
	.ZN(n_958));
   OAI221_X1 g30961 (.A(n_913),
	.B1(n_956),
	.B2(inc_pc_node[2]),
	.C1(n_955),
	.C2(\pc_reg[2]_2969 ),
	.ZN(n_957));
   AOI21_X1 g30964 (.A(n_952),
	.B1(n_207),
	.B2(n_951),
	.ZN(n_954));
   AOI21_X1 g30966 (.A(n_952),
	.B1(n_951),
	.B2(n_950),
	.ZN(n_953));
   OAI221_X1 g30792 (.A(n_830),
	.B1(n_956),
	.B2(inc_pc_node[6]),
	.C1(n_955),
	.C2(\pc_reg[6]_2973 ),
	.ZN(n_949));
   OAI22_X1 g30858 (.A1(n_911),
	.A2(rateval[7]),
	.B1(n_910),
	.B2(n_909),
	.ZN(n_988));
   AOI21_X1 g30749 (.A(n_934),
	.B1(n_920),
	.B2(\pc_reg[10]_2977 ),
	.ZN(n_948));
   OAI21_X1 g30812 (.A(n_916),
	.B1(n_945),
	.B2(aluinp1_reg[5]),
	.ZN(n_947));
   OAI21_X1 g30813 (.A(n_917),
	.B1(n_945),
	.B2(aluinp1_reg[7]),
	.ZN(n_946));
   OAI221_X1 g30773 (.A(n_829),
	.B1(n_956),
	.B2(inc_pc_node[7]),
	.C1(n_955),
	.C2(\pc_reg[7]_2974 ),
	.ZN(n_944));
   DFF_X1 \ram_i_node_reg[0]  (.D(n_932),
	.CK(clk_i),
	.Q(UNCONNECTED17),
	.QN(ram_i_node[0]));
   OAI221_X1 g30924 (.A(n_828),
	.B1(n_956),
	.B2(inc_pc_node[8]),
	.C1(n_955),
	.C2(\pc_reg[8]_2975 ),
	.ZN(n_943));
   OAI221_X1 g30925 (.A(n_827),
	.B1(n_956),
	.B2(inc_pc_node[9]),
	.C1(n_955),
	.C2(\pc_reg[9]_2976 ),
	.ZN(n_942));
   OAI221_X1 g30926 (.A(n_841),
	.B1(n_956),
	.B2(inc_pc_node[10]),
	.C1(n_955),
	.C2(\pc_reg[10]_2977 ),
	.ZN(n_941));
   OAI221_X1 g30927 (.A(n_825),
	.B1(n_956),
	.B2(inc_pc_node[11]),
	.C1(n_955),
	.C2(\pc_reg[11]_2978 ),
	.ZN(n_940));
   OAI221_X1 g30928 (.A(n_824),
	.B1(n_956),
	.B2(inc_pc_node[12]),
	.C1(n_955),
	.C2(n_23),
	.ZN(n_939));
   MUX2_X1 g30837 (.A(n_282),
	.B(add_node[8]),
	.S(n_455),
	.Z(n_938));
   INV_X1 g30953 (.A(n_980),
	.ZN(n_937));
   NAND2_X1 g30956 (.A1(n_229),
	.A2(reset_cond),
	.ZN(n_936));
   DFF_X1 \inc_pc_node_reg[9]  (.D(n_912),
	.CK(clk_i),
	.Q(UNCONNECTED18),
	.QN(inc_pc_node[9]));
   OAI21_X1 g30965 (.A(reset_cond),
	.B1(n_75),
	.B2(state_reg[2]),
	.ZN(n_935));
   INV_X1 g30758 (.A(n_934),
	.ZN(n_961));
   DFF_X1 \aluout_reg_reg[6]  (.D(n_914),
	.CK(clk_i),
	.Q(ram_dat_o[6]),
	.QN(\aluout_reg[6]_3007 ));
   NAND4_X1 g31021 (.A1(n_845),
	.A2(n_746),
	.A3(n_648),
	.A4(n_635),
	.ZN(n_933));
   NAND3_X1 g30960 (.A1(n_891),
	.A2(n_834),
	.A3(n_740),
	.ZN(n_932));
   AOI22_X1 g31031 (.A1(n_926),
	.A2(inc_pc_node[1]),
	.B1(n_925),
	.B2(prog_adr_o[1]),
	.ZN(n_931));
   NAND4_X1 g31022 (.A1(n_1165),
	.A2(n_741),
	.A3(n_650),
	.A4(n_638),
	.ZN(n_929));
   NAND4_X1 g31020 (.A1(n_846),
	.A2(n_742),
	.A3(n_607),
	.A4(n_609),
	.ZN(n_928));
   AOI22_X1 g31014 (.A1(n_926),
	.A2(inc_pc_node[0]),
	.B1(n_925),
	.B2(prog_adr_o[0]),
	.ZN(n_927));
   AOI22_X1 g31016 (.A1(n_926),
	.A2(inc_pc_node[3]),
	.B1(n_925),
	.B2(prog_adr_o[3]),
	.ZN(n_923));
   NAND4_X1 g31019 (.A1(n_847),
	.A2(n_744),
	.A3(n_610),
	.A4(n_612),
	.ZN(n_921));
   NOR2_X1 g30760 (.A1(n_920),
	.A2(\pc_reg[10]_2977 ),
	.ZN(n_934));
   NAND3_X1 g30929 (.A1(n_273),
	.A2(n_761),
	.A3(n_876),
	.ZN(n_960));
   DFF_X1 \eep_dat_reg_reg[2]  (.D(n_885),
	.CK(clk_i),
	.Q(eep_dat_o[2]),
	.QN(UNCONNECTED19));
   DFF_X1 \eep_dat_reg_reg[0]  (.D(n_883),
	.CK(clk_i),
	.Q(eep_dat_o[0]),
	.QN(UNCONNECTED20));
   DFF_X1 \eep_dat_reg_reg[7]  (.D(n_888),
	.CK(clk_i),
	.Q(eep_dat_o[7]),
	.QN(UNCONNECTED21));
   DFF_X1 \eep_dat_reg_reg[6]  (.D(n_890),
	.CK(clk_i),
	.Q(eep_dat_o[6]),
	.QN(UNCONNECTED22));
   DFF_X1 \eep_dat_reg_reg[5]  (.D(n_881),
	.CK(clk_i),
	.Q(eep_dat_o[5]),
	.QN(UNCONNECTED23));
   NAND2_X1 g30972 (.A1(n_668),
	.A2(writew_node),
	.ZN(n_980));
   DFF_X1 \aluout_reg_reg[3]  (.D(n_887),
	.CK(clk_i),
	.Q(ram_dat_o[3]),
	.QN(\aluout_reg[3]_3004 ));
   DFF_X1 \aluout_reg_reg[4]  (.D(n_892),
	.CK(clk_i),
	.Q(ram_dat_o[4]),
	.QN(\aluout_reg[4]_3005 ));
   AOI22_X1 g30905 (.A1(n_926),
	.A2(inc_pc_node[4]),
	.B1(n_925),
	.B2(prog_adr_o[4]),
	.ZN(n_919));
   AOI211_X1 g30832 (.A(n_568),
	.B(n_525),
	.C1(n_915),
	.C2(add_node[7]),
	.ZN(n_917));
   AOI211_X1 g30833 (.A(n_559),
	.B(n_541),
	.C1(n_915),
	.C2(add_node[5]),
	.ZN(n_916));
   DFF_X1 \trisa_reg_reg[3]  (.D(n_889),
	.CK(clk_i),
	.Q(porta_dir_o[3]),
	.QN(n_708));
   DFF_X1 \trisa_reg_reg[4]  (.D(n_895),
	.CK(clk_i),
	.Q(porta_dir_o[4]),
	.QN(n_705));
   DFF_X1 \eep_dat_reg_reg[1]  (.D(n_884),
	.CK(clk_i),
	.Q(eep_dat_o[1]),
	.QN(UNCONNECTED24));
   DFF_X1 \eep_dat_reg_reg[3]  (.D(n_886),
	.CK(clk_i),
	.Q(eep_dat_o[3]),
	.QN(UNCONNECTED25));
   DFF_X1 \trisa_reg_reg[0]  (.D(n_903),
	.CK(clk_i),
	.Q(porta_dir_o[0]),
	.QN(n_714));
   DFF_X1 \trisa_reg_reg[2]  (.D(n_906),
	.CK(clk_i),
	.Q(porta_dir_o[2]),
	.QN(n_730));
   DFF_X1 \eep_dat_reg_reg[4]  (.D(n_882),
	.CK(clk_i),
	.Q(eep_dat_o[4]),
	.QN(UNCONNECTED26));
   DFF_X1 \trisa_reg_reg[1]  (.D(n_907),
	.CK(clk_i),
	.Q(porta_dir_o[1]),
	.QN(n_711));
   DFF_X1 \trisb_reg_reg[2]  (.D(n_893),
	.CK(clk_i),
	.Q(portb_dir_o[2]),
	.QN(n_87));
   DFF_X1 \trisb_reg_reg[5]  (.D(n_899),
	.CK(clk_i),
	.Q(portb_dir_o[5]),
	.QN(n_122));
   DFF_X1 \trisb_reg_reg[6]  (.D(n_898),
	.CK(clk_i),
	.Q(portb_dir_o[6]),
	.QN(n_93));
   DFF_X1 \trisb_reg_reg[1]  (.D(n_894),
	.CK(clk_i),
	.Q(portb_dir_o[1]),
	.QN(n_91));
   DFF_X1 \trisb_reg_reg[4]  (.D(n_896),
	.CK(clk_i),
	.Q(portb_dir_o[4]),
	.QN(n_121));
   DFF_X1 \trisb_reg_reg[7]  (.D(n_902),
	.CK(clk_i),
	.Q(portb_dir_o[7]),
	.QN(n_94));
   DFF_X1 \trisb_reg_reg[3]  (.D(n_897),
	.CK(clk_i),
	.Q(portb_dir_o[3]),
	.QN(n_88));
   DFF_X1 \trisb_reg_reg[0]  (.D(n_908),
	.CK(clk_i),
	.Q(portb_dir_o[0]),
	.QN(n_90));
   DFF_X1 \ram_i_node_reg[6]  (.D(n_877),
	.CK(clk_i),
	.Q(UNCONNECTED27),
	.QN(ram_i_node[6]));
   DFF_X1 \ram_i_node_reg[5]  (.D(n_879),
	.CK(clk_i),
	.Q(UNCONNECTED28),
	.QN(ram_i_node[5]));
   OAI21_X1 g30854 (.A(n_875),
	.B1(n_945),
	.B2(aluinp1_reg[6]),
	.ZN(n_914));
   AND4_X1 g31023 (.A1(n_806),
	.A2(n_839),
	.A3(n_699),
	.A4(n_669),
	.ZN(n_913));
   AOI21_X1 g30765 (.A(n_880),
	.B1(n_842),
	.B2(\pc_reg[9]_2976 ),
	.ZN(n_912));
   DFF_X1 \ram_i_node_reg[7]  (.D(n_871),
	.CK(clk_i),
	.Q(UNCONNECTED29),
	.QN(ram_i_node[7]));
   SDFF_X1 \status_reg_reg[2]  (.D(n_782),
	.SE(n_747),
	.SI(status_reg[2]),
	.CK(clk_i),
	.Q(status_reg[2]),
	.QN(UNCONNECTED30));
   AND2_X1 g30892 (.A1(n_910),
	.A2(n_909),
	.ZN(n_911));
   DFF_X1 \eecon1_reg_reg[3]  (.D(n_850),
	.CK(clk_i),
	.Q(UNCONNECTED31),
	.QN(eecon1_reg[3]));
   DFF_X1 \intcon_reg_reg[1]  (.D(n_873),
	.CK(clk_i),
	.Q(UNCONNECTED32),
	.QN(intcon_reg[1]));
   DFF_X1 \eecon1_reg_reg[4]  (.D(n_872),
	.CK(clk_i),
	.Q(UNCONNECTED33),
	.QN(eecon1_reg[4]));
   DFF_X1 reset_cond_reg (.D(n_869),
	.CK(clk_i),
	.Q(n_952),
	.QN(reset_cond));
   DFF_X1 \aluout_reg_reg[1]  (.D(n_852),
	.CK(clk_i),
	.Q(ram_dat_o[1]),
	.QN(\aluout_reg[1]_3002 ));
   DFF_X1 \aluout_reg_reg[2]  (.D(n_878),
	.CK(clk_i),
	.Q(ram_dat_o[2]),
	.QN(\aluout_reg[2]_3003 ));
   DFF_X1 \aluout_reg_reg[0]  (.D(n_851),
	.CK(clk_i),
	.Q(ram_dat_o[0]),
	.QN(\aluout_reg[0]_3001 ));
   OAI221_X1 g31148 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[0]_3001 ),
	.C1(n_900),
	.C2(n_90),
	.ZN(n_908));
   OAI221_X1 g31140 (.A(n_1011),
	.B1(n_905),
	.B2(n_711),
	.C1(n_904),
	.C2(\aluout_reg[1]_3002 ),
	.ZN(n_907));
   OAI221_X1 g31141 (.A(n_1011),
	.B1(n_905),
	.B2(n_730),
	.C1(n_904),
	.C2(\aluout_reg[2]_3003 ),
	.ZN(n_906));
   OAI221_X1 g31142 (.A(n_1011),
	.B1(n_905),
	.B2(n_714),
	.C1(n_904),
	.C2(\aluout_reg[0]_3001 ),
	.ZN(n_903));
   OAI221_X1 g31143 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[7]_3008 ),
	.C1(n_900),
	.C2(n_94),
	.ZN(n_902));
   OAI221_X1 g31144 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[5]_3006 ),
	.C1(n_900),
	.C2(n_122),
	.ZN(n_899));
   OAI221_X1 g31145 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[6]_3007 ),
	.C1(n_900),
	.C2(n_93),
	.ZN(n_898));
   OAI221_X1 g31146 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[3]_3004 ),
	.C1(n_900),
	.C2(n_88),
	.ZN(n_897));
   OAI221_X1 g31147 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[4]_3005 ),
	.C1(n_900),
	.C2(n_121),
	.ZN(n_896));
   OAI221_X1 g31139 (.A(n_1011),
	.B1(n_905),
	.B2(n_705),
	.C1(n_904),
	.C2(\aluout_reg[4]_3005 ),
	.ZN(n_895));
   OAI221_X1 g31149 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[1]_3002 ),
	.C1(n_900),
	.C2(n_91),
	.ZN(n_894));
   OAI221_X1 g31150 (.A(n_1011),
	.B1(n_901),
	.B2(\aluout_reg[2]_3003 ),
	.C1(n_900),
	.C2(n_87),
	.ZN(n_893));
   DFF_X1 \inc_pc_node_reg[8]  (.D(n_808),
	.CK(clk_i),
	.Q(UNCONNECTED34),
	.QN(inc_pc_node[8]));
   OAI21_X1 g30853 (.A(n_826),
	.B1(n_945),
	.B2(aluinp1_reg[4]),
	.ZN(n_892));
   DFF_X1 \add_node_reg[8]  (.D(n_809),
	.CK(clk_i),
	.Q(UNCONNECTED35),
	.QN(add_node[8]));
   DFF_X1 writew_node_reg (.D(n_813),
	.CK(clk_i),
	.Q(writew_node),
	.QN(UNCONNECTED36));
   AND4_X1 g31035 (.A1(n_790),
	.A2(n_617),
	.A3(n_565),
	.A4(n_619),
	.ZN(n_891));
   SDFF_X1 \intcon_reg_reg[7]  (.D(n_359),
	.SE(n_763),
	.SI(intcon_reg[7]),
	.CK(clk_i),
	.Q(intcon_reg[7]),
	.QN(n_203));
   INV_X1 g31160 (.A(n_926),
	.ZN(n_956));
   INV_X1 g31051 (.A(n_867),
	.ZN(n_890));
   OAI221_X1 g31138 (.A(n_1011),
	.B1(n_905),
	.B2(n_708),
	.C1(n_904),
	.C2(\aluout_reg[3]_3004 ),
	.ZN(n_889));
   INV_X1 g31107 (.A(n_874),
	.ZN(n_888));
   OAI21_X1 g30900 (.A(n_814),
	.B1(n_945),
	.B2(aluinp1_reg[3]),
	.ZN(n_887));
   INV_X1 g31057 (.A(n_857),
	.ZN(n_886));
   INV_X1 g31056 (.A(n_858),
	.ZN(n_885));
   INV_X1 g31055 (.A(n_859),
	.ZN(n_884));
   INV_X1 g31054 (.A(n_861),
	.ZN(n_883));
   INV_X1 g31053 (.A(n_862),
	.ZN(n_882));
   INV_X1 g31052 (.A(n_863),
	.ZN(n_881));
   INV_X1 g30768 (.A(n_880),
	.ZN(n_920));
   DFF_X1 \eecon1_reg_reg[2]  (.D(n_811),
	.CK(clk_i),
	.Q(UNCONNECTED37),
	.QN(eecon1_reg[2]));
   DFF_X1 \intcon_reg_reg[2]  (.D(n_815),
	.CK(clk_i),
	.Q(UNCONNECTED38),
	.QN(intcon_reg[2]));
   DFF_X1 \intcon_reg_reg[0]  (.D(n_810),
	.CK(clk_i),
	.Q(UNCONNECTED39),
	.QN(intcon_reg[0]));
   DFF_X1 exec_op_reg_reg (.D(n_833),
	.CK(clk_i),
	.Q(UNCONNECTED40),
	.QN(exec_op_reg));
   DFF_X1 \intcon_reg_reg[5]  (.D(n_817),
	.CK(clk_i),
	.Q(UNCONNECTED41),
	.QN(intcon_reg[5]));
   DFF_X1 \intcon_reg_reg[6]  (.D(n_812),
	.CK(clk_i),
	.Q(n_21),
	.QN(intcon_reg[6]));
   DFF_X1 \intcon_reg_reg[3]  (.D(n_820),
	.CK(clk_i),
	.Q(UNCONNECTED42),
	.QN(intcon_reg[3]));
   DFF_X1 \intcon_reg_reg[4]  (.D(n_816),
	.CK(clk_i),
	.Q(UNCONNECTED43),
	.QN(intcon_reg[4]));
   NAND4_X1 g31044 (.A1(n_759),
	.A2(n_758),
	.A3(n_651),
	.A4(n_616),
	.ZN(n_879));
   OAI21_X1 g30963 (.A(n_737),
	.B1(n_945),
	.B2(aluinp1_reg[2]),
	.ZN(n_878));
   NAND4_X1 g31045 (.A1(n_760),
	.A2(n_707),
	.A3(n_654),
	.A4(n_621),
	.ZN(n_877));
   DFF_X1 \add_node_reg[5]  (.D(n_775),
	.CK(clk_i),
	.Q(add_node[5]),
	.QN(UNCONNECTED44));
   DFF_X1 \add_node_reg[7]  (.D(n_773),
	.CK(clk_i),
	.Q(add_node[7]),
	.QN(UNCONNECTED45));
   NOR4_X1 g31013 (.A1(n_272),
	.A2(wdt_rst_node),
	.A3(inst_reg[2]),
	.A4(n_5),
	.ZN(n_876));
   AOI211_X1 g30885 (.A(n_522),
	.B(n_661),
	.C1(n_915),
	.C2(add_node[6]),
	.ZN(n_875));
   DFF_X1 \fsr_reg_reg[1]  (.D(n_801),
	.CK(clk_i),
	.Q(n_108),
	.QN(fsr_reg[1]));
   AOI22_X1 g30930 (.A1(n_710),
	.A2(n_28),
	.B1(pscale_reg[6]),
	.B2(rateval[6]),
	.ZN(n_910));
   DFF_X1 \status_reg_reg[6]  (.D(n_770),
	.CK(clk_i),
	.Q(n_312),
	.QN(status_reg[6]));
   DFF_X1 \status_reg_reg[5]  (.D(n_771),
	.CK(clk_i),
	.Q(n_224),
	.QN(status_reg[5]));
   DFF_X1 \aluinp2_reg_reg[7]  (.D(n_774),
	.CK(clk_i),
	.Q(n_76),
	.QN(aluinp2_reg[7]));
   DFF_X1 \pclath_reg_reg[0]  (.D(n_766),
	.CK(clk_i),
	.Q(UNCONNECTED46),
	.QN(pclath_reg[0]));
   DFF_X1 \option_reg_reg[7]  (.D(n_791),
	.CK(clk_i),
	.Q(rbpu_o),
	.QN(UNCONNECTED47));
   DFF_X1 \option_reg_reg[2]  (.D(n_781),
	.CK(clk_i),
	.Q(n_216),
	.QN(option_reg[2]));
   DFF_X1 \option_reg_reg[4]  (.D(n_784),
	.CK(clk_i),
	.Q(UNCONNECTED48),
	.QN(option_reg[4]));
   DFF_X1 \option_reg_reg[3]  (.D(n_788),
	.CK(clk_i),
	.Q(option_reg[3]),
	.QN(UNCONNECTED49));
   DFF_X1 \option_reg_reg[0]  (.D(n_783),
	.CK(clk_i),
	.Q(n_116),
	.QN(option_reg[0]));
   DFF_X1 \option_reg_reg[1]  (.D(n_772),
	.CK(clk_i),
	.Q(n_117),
	.QN(option_reg[1]));
   DFF_X1 \pclath_reg_reg[1]  (.D(n_767),
	.CK(clk_i),
	.Q(UNCONNECTED50),
	.QN(pclath_reg[1]));
   DFF_X1 \status_reg_reg[7]  (.D(n_768),
	.CK(clk_i),
	.Q(n_18),
	.QN(status_reg[7]));
   DFF_X1 \fsr_reg_reg[0]  (.D(n_804),
	.CK(clk_i),
	.Q(n_26),
	.QN(fsr_reg[0]));
   DFF_X1 \pclath_reg_reg[2]  (.D(n_776),
	.CK(clk_i),
	.Q(UNCONNECTED51),
	.QN(pclath_reg[2]));
   DFF_X1 \pclath_reg_reg[4]  (.D(n_780),
	.CK(clk_i),
	.Q(n_11),
	.QN(pclath_reg[4]));
   DFF_X1 \pclath_reg_reg[3]  (.D(n_779),
	.CK(clk_i),
	.Q(n_12),
	.QN(pclath_reg[3]));
   DFF_X1 \option_reg_reg[6]  (.D(n_807),
	.CK(clk_i),
	.Q(n_2),
	.QN(option_reg[6]));
   OAI211_X1 g31196 (.A(n_722),
	.B(n_832),
	.C1(n_720),
	.C2(n_456),
	.ZN(n_926));
   INV_X1 g31159 (.A(n_925),
	.ZN(n_955));
   AOI222_X1 g31108 (.A1(n_866),
	.A2(eep_dat_o[7]),
	.B1(n_865),
	.B2(ram_dat_o[7]),
	.C1(n_864),
	.C2(eep_dat_i[7]),
	.ZN(n_874));
   OAI221_X1 g31137 (.A(n_230),
	.B1(n_819),
	.B2(intcon_reg[1]),
	.C1(n_818),
	.C2(\aluout_reg[1]_3002 ),
	.ZN(n_873));
   OAI221_X1 g31131 (.A(n_305),
	.B1(n_849),
	.B2(eecon1_reg[4]),
	.C1(n_848),
	.C2(\aluout_reg[4]_3005 ),
	.ZN(n_872));
   NAND4_X1 g31046 (.A1(n_694),
	.A2(n_703),
	.A3(n_656),
	.A4(n_642),
	.ZN(n_871));
   AOI221_X1 g31121 (.A(n_752),
	.B1(n_855),
	.B2(\stack_reg[0] [4]),
	.C1(n_854),
	.C2(\stack_reg[6] [4]),
	.ZN(n_870));
   INV_X1 g31058 (.A(n_868),
	.ZN(n_869));
   AOI222_X1 g31060 (.A1(n_866),
	.A2(eep_dat_o[6]),
	.B1(n_865),
	.B2(ram_dat_o[6]),
	.C1(n_864),
	.C2(eep_dat_i[6]),
	.ZN(n_867));
   AOI222_X1 g31061 (.A1(n_866),
	.A2(eep_dat_o[5]),
	.B1(n_865),
	.B2(ram_dat_o[5]),
	.C1(n_864),
	.C2(eep_dat_i[5]),
	.ZN(n_863));
   AOI222_X1 g31063 (.A1(n_866),
	.A2(eep_dat_o[4]),
	.B1(n_865),
	.B2(ram_dat_o[4]),
	.C1(n_864),
	.C2(eep_dat_i[4]),
	.ZN(n_862));
   AOI222_X1 g31065 (.A1(n_866),
	.A2(eep_dat_o[0]),
	.B1(n_865),
	.B2(ram_dat_o[0]),
	.C1(n_864),
	.C2(eep_dat_i[0]),
	.ZN(n_861));
   AOI222_X1 g31066 (.A1(n_866),
	.A2(eep_dat_o[1]),
	.B1(n_865),
	.B2(ram_dat_o[1]),
	.C1(n_864),
	.C2(eep_dat_i[1]),
	.ZN(n_859));
   AOI222_X1 g31067 (.A1(n_866),
	.A2(eep_dat_o[2]),
	.B1(n_865),
	.B2(ram_dat_o[2]),
	.C1(n_864),
	.C2(eep_dat_i[2]),
	.ZN(n_858));
   AOI222_X1 g31068 (.A1(n_866),
	.A2(eep_dat_o[3]),
	.B1(n_865),
	.B2(ram_dat_o[3]),
	.C1(n_864),
	.C2(eep_dat_i[3]),
	.ZN(n_857));
   AOI221_X1 g31120 (.A(n_751),
	.B1(n_855),
	.B2(\stack_reg[0] [3]),
	.C1(n_854),
	.C2(\stack_reg[6] [3]),
	.ZN(n_856));
   AOI221_X1 g31119 (.A(n_749),
	.B1(n_855),
	.B2(\stack_reg[0] [1]),
	.C1(n_854),
	.C2(\stack_reg[6] [1]),
	.ZN(n_853));
   OAI21_X1 g31111 (.A(n_739),
	.B1(n_945),
	.B2(aluinp1_reg[1]),
	.ZN(n_852));
   OAI21_X1 g31110 (.A(n_738),
	.B1(n_945),
	.B2(aluinp1_reg[0]),
	.ZN(n_851));
   OAI221_X1 g31112 (.A(n_191),
	.B1(n_849),
	.B2(eecon1_reg[3]),
	.C1(n_848),
	.C2(\aluout_reg[3]_3004 ),
	.ZN(n_850));
   AND3_X1 g31114 (.A1(n_789),
	.A2(n_562),
	.A3(n_614),
	.ZN(n_847));
   AND3_X1 g31115 (.A1(n_787),
	.A2(n_561),
	.A3(n_748),
	.ZN(n_846));
   AND3_X1 g31116 (.A1(n_786),
	.A2(n_560),
	.A3(n_764),
	.ZN(n_845));
   AOI221_X1 g31118 (.A(n_750),
	.B1(n_855),
	.B2(\stack_reg[0] [0]),
	.C1(n_854),
	.C2(\stack_reg[6] [0]),
	.ZN(n_843));
   NOR2_X1 g30770 (.A1(n_842),
	.A2(\pc_reg[9]_2976 ),
	.ZN(n_880));
   DFF_X1 \option_reg_reg[5]  (.D(n_797),
	.CK(clk_i),
	.Q(UNCONNECTED52),
	.QN(option_reg[5]));
   DFF_X1 \fsr_reg_reg[2]  (.D(n_800),
	.CK(clk_i),
	.Q(UNCONNECTED53),
	.QN(fsr_reg[2]));
   DFF_X1 \fsr_reg_reg[3]  (.D(n_799),
	.CK(clk_i),
	.Q(UNCONNECTED54),
	.QN(fsr_reg[3]));
   DFF_X1 \fsr_reg_reg[4]  (.D(n_798),
	.CK(clk_i),
	.Q(UNCONNECTED55),
	.QN(fsr_reg[4]));
   DFF_X1 \fsr_reg_reg[5]  (.D(n_805),
	.CK(clk_i),
	.Q(n_8),
	.QN(fsr_reg[5]));
   AND4_X1 g31041 (.A1(n_676),
	.A2(n_580),
	.A3(n_581),
	.A4(n_579),
	.ZN(n_841));
   OR3_X1 g31200 (.A1(n_838),
	.A2(pclath_reg[1]),
	.A3(\aluout_reg[1]_3002 ),
	.ZN(n_840));
   OR3_X1 g31202 (.A1(n_838),
	.A2(pclath_reg[2]),
	.A3(\aluout_reg[2]_3003 ),
	.ZN(n_839));
   OR3_X1 g31203 (.A1(n_838),
	.A2(\aluout_reg[3]_3004 ),
	.A3(pclath_reg[3]),
	.ZN(n_837));
   OR3_X1 g31205 (.A1(n_838),
	.A2(\aluout_reg[4]_3005 ),
	.A3(pclath_reg[4]),
	.ZN(n_836));
   OR3_X1 g31216 (.A1(n_838),
	.A2(pclath_reg[0]),
	.A3(\aluout_reg[0]_3001 ),
	.ZN(n_835));
   AOI221_X1 g31226 (.A(n_670),
	.B1(n_655),
	.B2(n_26),
	.C1(n_613),
	.C2(rd_eep_req_o),
	.ZN(n_834));
   OAI221_X1 g31233 (.A(n_832),
	.B1(n_721),
	.B2(n_718),
	.C1(n_821),
	.C2(exec_op_reg),
	.ZN(n_833));
   AND4_X1 g31036 (.A1(n_681),
	.A2(n_634),
	.A3(n_600),
	.A4(n_593),
	.ZN(n_831));
   AND4_X1 g31037 (.A1(n_690),
	.A2(n_591),
	.A3(n_592),
	.A4(n_623),
	.ZN(n_830));
   AND4_X1 g31038 (.A1(n_679),
	.A2(n_589),
	.A3(n_590),
	.A4(n_588),
	.ZN(n_829));
   AND4_X1 g31039 (.A1(n_678),
	.A2(n_586),
	.A3(n_587),
	.A4(n_585),
	.ZN(n_828));
   AND4_X1 g31040 (.A1(n_677),
	.A2(n_583),
	.A3(n_584),
	.A4(n_582),
	.ZN(n_827));
   DFF_X1 \status_reg_reg[1]  (.D(n_700),
	.CK(clk_i),
	.Q(n_611),
	.QN(status_reg[1]));
   AOI211_X1 g30884 (.A(n_538),
	.B(n_528),
	.C1(n_915),
	.C2(add_node[4]),
	.ZN(n_826));
   AND4_X1 g31042 (.A1(n_675),
	.A2(n_622),
	.A3(n_578),
	.A4(n_624),
	.ZN(n_825));
   AND4_X1 g31043 (.A1(n_687),
	.A2(n_631),
	.A3(n_626),
	.A4(n_632),
	.ZN(n_824));
   SDFF_X1 \portb_o_reg_reg[7]  (.D(portb_o[7]),
	.SE(n_822),
	.SI(ram_dat_o[7]),
	.CK(clk_i),
	.Q(portb_o[7]),
	.QN(UNCONNECTED56));
   SDFF_X1 \porta_o_reg_reg[4]  (.D(porta_o[4]),
	.SE(n_823),
	.SI(ram_dat_o[4]),
	.CK(clk_i),
	.Q(porta_o[4]),
	.QN(UNCONNECTED57));
   SDFF_X1 \porta_o_reg_reg[1]  (.D(porta_o[1]),
	.SE(n_823),
	.SI(ram_dat_o[1]),
	.CK(clk_i),
	.Q(porta_o[1]),
	.QN(UNCONNECTED58));
   SDFF_X1 \portb_o_reg_reg[1]  (.D(portb_o[1]),
	.SE(n_822),
	.SI(ram_dat_o[1]),
	.CK(clk_i),
	.Q(portb_o[1]),
	.QN(UNCONNECTED59));
   SDFF_X1 \portb_o_reg_reg[5]  (.D(portb_o[5]),
	.SE(n_822),
	.SI(ram_dat_o[5]),
	.CK(clk_i),
	.Q(portb_o[5]),
	.QN(UNCONNECTED60));
   DFF_X1 \aluinp2_reg_reg[6]  (.D(n_756),
	.CK(clk_i),
	.Q(UNCONNECTED61),
	.QN(aluinp2_reg[6]));
   DFF_X1 \aluinp2_reg_reg[5]  (.D(n_702),
	.CK(clk_i),
	.Q(UNCONNECTED62),
	.QN(aluinp2_reg[5]));
   DFF_X1 \aluinp2_reg_reg[4]  (.D(n_701),
	.CK(clk_i),
	.Q(UNCONNECTED63),
	.QN(aluinp2_reg[4]));
   NAND2_X1 g31195 (.A1(n_719),
	.A2(n_821),
	.ZN(n_925));
   OAI22_X1 g31123 (.A1(n_819),
	.A2(intcon_reg[3]),
	.B1(n_818),
	.B2(\aluout_reg[3]_3004 ),
	.ZN(n_820));
   OAI22_X1 g31126 (.A1(n_819),
	.A2(intcon_reg[5]),
	.B1(n_818),
	.B2(\aluout_reg[5]_3006 ),
	.ZN(n_817));
   OAI22_X1 g31125 (.A1(n_819),
	.A2(intcon_reg[4]),
	.B1(n_818),
	.B2(\aluout_reg[4]_3005 ),
	.ZN(n_816));
   OAI22_X1 g31124 (.A1(n_819),
	.A2(intcon_reg[2]),
	.B1(n_818),
	.B2(\aluout_reg[2]_3003 ),
	.ZN(n_815));
   AOI211_X1 g30923 (.A(n_539),
	.B(n_660),
	.C1(n_915),
	.C2(add_node[3]),
	.ZN(n_814));
   AOI21_X1 g31062 (.A(n_667),
	.B1(n_673),
	.B2(n_574),
	.ZN(n_813));
   OAI22_X1 g31127 (.A1(n_819),
	.A2(intcon_reg[6]),
	.B1(n_818),
	.B2(\aluout_reg[6]_3007 ),
	.ZN(n_812));
   OAI21_X1 g31064 (.A(n_717),
	.B1(n_849),
	.B2(eecon1_reg[2]),
	.ZN(n_811));
   OAI221_X1 g31122 (.A(n_257),
	.B1(n_595),
	.B2(intcon_reg[0]),
	.C1(n_818),
	.C2(\aluout_reg[0]_3001 ),
	.ZN(n_810));
   OAI21_X1 g30902 (.A(n_524),
	.B1(n_684),
	.B2(n_567),
	.ZN(n_809));
   AOI21_X1 g30776 (.A(n_765),
	.B1(n_733),
	.B2(\pc_reg[8]_2975 ),
	.ZN(n_808));
   NOR2_X1 g31069 (.A1(n_433),
	.A2(wdt_rst_node),
	.ZN(n_868));
   SDFF_X1 \portb_o_reg_reg[6]  (.D(portb_o[6]),
	.SE(n_822),
	.SI(ram_dat_o[6]),
	.CK(clk_i),
	.Q(portb_o[6]),
	.QN(UNCONNECTED64));
   SDFF_X1 \porta_o_reg_reg[0]  (.D(porta_o[0]),
	.SE(n_823),
	.SI(ram_dat_o[0]),
	.CK(clk_i),
	.Q(porta_o[0]),
	.QN(UNCONNECTED65));
   SDFF_X1 \porta_o_reg_reg[2]  (.D(porta_o[2]),
	.SE(n_823),
	.SI(ram_dat_o[2]),
	.CK(clk_i),
	.Q(porta_o[2]),
	.QN(UNCONNECTED66));
   SDFF_X1 \porta_o_reg_reg[3]  (.D(porta_o[3]),
	.SE(n_823),
	.SI(ram_dat_o[3]),
	.CK(clk_i),
	.Q(porta_o[3]),
	.QN(UNCONNECTED67));
   SDFF_X1 \portb_o_reg_reg[0]  (.D(portb_o[0]),
	.SE(n_822),
	.SI(ram_dat_o[0]),
	.CK(clk_i),
	.Q(portb_o[0]),
	.QN(UNCONNECTED68));
   SDFF_X1 \portb_o_reg_reg[2]  (.D(portb_o[2]),
	.SE(n_822),
	.SI(ram_dat_o[2]),
	.CK(clk_i),
	.Q(portb_o[2]),
	.QN(UNCONNECTED69));
   SDFF_X1 \portb_o_reg_reg[3]  (.D(portb_o[3]),
	.SE(n_822),
	.SI(ram_dat_o[3]),
	.CK(clk_i),
	.Q(portb_o[3]),
	.QN(UNCONNECTED70));
   DFF_X1 \stack_pnt_reg_reg[2]  (.D(n_753),
	.CK(clk_i),
	.Q(n_175),
	.QN(stack_pnt_reg[2]));
   SDFF_X1 \portb_o_reg_reg[4]  (.D(portb_o[4]),
	.SE(n_822),
	.SI(ram_dat_o[4]),
	.CK(clk_i),
	.Q(portb_o[4]),
	.QN(UNCONNECTED71));
   DFF_X1 \aluinp2_reg_reg[3]  (.D(n_736),
	.CK(clk_i),
	.Q(UNCONNECTED72),
	.QN(aluinp2_reg[3]));
   DFF_X1 \eecon1_reg_reg[0]  (.D(n_755),
	.CK(clk_i),
	.Q(rd_eep_req_o),
	.QN(n_1));
   DFF_X1 \eecon1_reg_reg[1]  (.D(n_754),
	.CK(clk_i),
	.Q(wr_eep_req_o),
	.QN(n_190));
   DFF_X1 \aluinp2_reg_reg[2]  (.D(n_724),
	.CK(clk_i),
	.Q(UNCONNECTED73),
	.QN(aluinp2_reg[2]));
   DFF_X1 \stack_pnt_reg_reg[1]  (.D(n_729),
	.CK(clk_i),
	.Q(n_47),
	.QN(stack_pnt_reg[1]));
   DFF_X1 \stack_pnt_reg_reg[0]  (.D(n_727),
	.CK(clk_i),
	.Q(n_367),
	.QN(stack_pnt_reg[0]));
   OAI221_X1 g31026 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[6]_3007 ),
	.C1(n_795),
	.C2(option_reg[6]),
	.ZN(n_807));
   AOI221_X1 g31183 (.A(n_636),
	.B1(n_855),
	.B2(\stack_reg[0] [2]),
	.C1(n_695),
	.C2(\stack_reg[2] [2]),
	.ZN(n_806));
   OAI22_X1 g31227 (.A1(n_803),
	.A2(\aluout_reg[5]_3006 ),
	.B1(n_802),
	.B2(fsr_reg[5]),
	.ZN(n_805));
   OAI22_X1 g31228 (.A1(n_803),
	.A2(\aluout_reg[0]_3001 ),
	.B1(n_802),
	.B2(fsr_reg[0]),
	.ZN(n_804));
   OAI22_X1 g31229 (.A1(n_803),
	.A2(\aluout_reg[1]_3002 ),
	.B1(n_802),
	.B2(fsr_reg[1]),
	.ZN(n_801));
   OAI22_X1 g31230 (.A1(n_803),
	.A2(\aluout_reg[2]_3003 ),
	.B1(n_802),
	.B2(fsr_reg[2]),
	.ZN(n_800));
   OAI22_X1 g31231 (.A1(n_803),
	.A2(\aluout_reg[3]_3004 ),
	.B1(n_802),
	.B2(fsr_reg[3]),
	.ZN(n_799));
   OAI22_X1 g31232 (.A1(n_803),
	.A2(\aluout_reg[4]_3005 ),
	.B1(n_802),
	.B2(fsr_reg[4]),
	.ZN(n_798));
   OAI221_X1 g31025 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[5]_3006 ),
	.C1(n_795),
	.C2(option_reg[5]),
	.ZN(n_797));
   NAND3_X1 g31173 (.A1(n_793),
	.A2(n_792),
	.A3(n_618),
	.ZN(n_794));
   OAI211_X1 g31027 (.A(n_645),
	.B(n_1011),
	.C1(n_796),
	.C2(\aluout_reg[7]_3008 ),
	.ZN(n_791));
   INV_X1 g31330 (.A(n_716),
	.ZN(n_790));
   INV_X1 g31331 (.A(n_712),
	.ZN(n_789));
   OAI211_X1 g31028 (.A(n_646),
	.B(n_1011),
	.C1(n_796),
	.C2(\aluout_reg[3]_3004 ),
	.ZN(n_788));
   INV_X1 g31332 (.A(n_731),
	.ZN(n_787));
   INV_X1 g31334 (.A(n_709),
	.ZN(n_786));
   OAI221_X1 g31029 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[4]_3005 ),
	.C1(n_795),
	.C2(option_reg[4]),
	.ZN(n_784));
   OAI221_X1 g31032 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[0]_3001 ),
	.C1(n_795),
	.C2(option_reg[0]),
	.ZN(n_783));
   OAI22_X1 g31113 (.A1(n_757),
	.A2(n_639),
	.B1(n_437),
	.B2(\aluout_reg[2]_3003 ),
	.ZN(n_782));
   OAI221_X1 g31034 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[2]_3003 ),
	.C1(n_795),
	.C2(option_reg[2]),
	.ZN(n_781));
   OAI22_X1 g31136 (.A1(n_778),
	.A2(pclath_reg[4]),
	.B1(n_777),
	.B2(\aluout_reg[4]_3005 ),
	.ZN(n_780));
   OAI22_X1 g31135 (.A1(n_778),
	.A2(pclath_reg[3]),
	.B1(n_777),
	.B2(\aluout_reg[3]_3004 ),
	.ZN(n_779));
   OAI22_X1 g31134 (.A1(n_778),
	.A2(pclath_reg[2]),
	.B1(n_777),
	.B2(\aluout_reg[2]_3003 ),
	.ZN(n_776));
   XNOR2_X1 g30903 (.A(n_643),
	.B(n_540),
	.ZN(n_775));
   NAND3_X1 g30775 (.A1(n_665),
	.A2(n_449),
	.A3(n_735),
	.ZN(n_774));
   XNOR2_X1 g30904 (.A(n_683),
	.B(n_523),
	.ZN(n_773));
   DFF_X1 \inc_pc_node_reg[7]  (.D(n_674),
	.CK(clk_i),
	.Q(UNCONNECTED74),
	.QN(inc_pc_node[7]));
   OAI221_X1 g31033 (.A(n_1011),
	.B1(n_796),
	.B2(\aluout_reg[1]_3002 ),
	.C1(n_795),
	.C2(option_reg[1]),
	.ZN(n_772));
   OAI22_X1 g31128 (.A1(n_769),
	.A2(status_reg[5]),
	.B1(n_793),
	.B2(\aluout_reg[5]_3006 ),
	.ZN(n_771));
   OAI22_X1 g31129 (.A1(n_769),
	.A2(status_reg[6]),
	.B1(n_793),
	.B2(\aluout_reg[6]_3007 ),
	.ZN(n_770));
   OAI22_X1 g31130 (.A1(n_769),
	.A2(status_reg[7]),
	.B1(n_793),
	.B2(\aluout_reg[7]_3008 ),
	.ZN(n_768));
   OAI22_X1 g31133 (.A1(n_778),
	.A2(pclath_reg[1]),
	.B1(n_777),
	.B2(\aluout_reg[1]_3002 ),
	.ZN(n_767));
   OAI22_X1 g31132 (.A1(n_778),
	.A2(pclath_reg[0]),
	.B1(n_777),
	.B2(\aluout_reg[0]_3001 ),
	.ZN(n_766));
   INV_X1 g30781 (.A(n_765),
	.ZN(n_842));
   SDFF_X1 \fsr_reg_reg[7]  (.D(fsr_reg[7]),
	.SE(n_802),
	.SI(ram_dat_o[7]),
	.CK(clk_i),
	.Q(fsr_reg[7]),
	.QN(UNCONNECTED75));
   SDFF_X1 \fsr_reg_reg[6]  (.D(fsr_reg[6]),
	.SE(n_802),
	.SI(ram_dat_o[6]),
	.CK(clk_i),
	.Q(fsr_reg[6]),
	.QN(n_27));
   DFF_X1 \aluinp2_reg_reg[1]  (.D(n_672),
	.CK(clk_i),
	.Q(UNCONNECTED76),
	.QN(aluinp2_reg[1]));
   INV_X1 g31335 (.A(n_664),
	.ZN(n_764));
   AOI21_X1 g31155 (.A(n_762),
	.B1(n_555),
	.B2(n_761),
	.ZN(n_763));
   INV_X1 g31156 (.A(n_693),
	.ZN(n_760));
   INV_X1 g31157 (.A(n_692),
	.ZN(n_759));
   AOI22_X1 g31384 (.A1(n_745),
	.A2(portb_dir_o[5]),
	.B1(n_757),
	.B2(n_224),
	.ZN(n_758));
   OAI211_X1 g30789 (.A(n_552),
	.B(n_723),
	.C1(n_734),
	.C2(n_427),
	.ZN(n_756));
   OAI33_X1 g31161 (.A1(n_848),
	.A2(\aluout_reg[0]_3001 ),
	.A3(ram_dat_o[1]),
	.B1(n_864),
	.B2(n_762),
	.B3(n_1),
	.ZN(n_755));
   OAI33_X1 g31174 (.A1(n_848),
	.A2(n_73),
	.A3(\aluout_reg[2]_3003 ),
	.B1(n_304),
	.B2(n_190),
	.B3(n_762),
	.ZN(n_754));
   OAI221_X1 g31176 (.A(n_625),
	.B1(n_725),
	.B2(n_176),
	.C1(n_728),
	.C2(n_165),
	.ZN(n_753));
   NAND2_X1 g31177 (.A1(n_594),
	.A2(n_596),
	.ZN(n_752));
   NAND2_X1 g31178 (.A1(n_598),
	.A2(n_599),
	.ZN(n_751));
   NAND2_X1 g31181 (.A1(n_603),
	.A2(n_644),
	.ZN(n_750));
   NAND2_X1 g31182 (.A1(n_601),
	.A2(n_602),
	.ZN(n_749));
   INV_X1 g31333 (.A(n_666),
	.ZN(n_748));
   OAI21_X1 g31186 (.A(n_761),
	.B1(n_757),
	.B2(n_547),
	.ZN(n_747));
   AOI221_X1 g31198 (.A(n_484),
	.B1(n_743),
	.B2(ram_dat_i[3]),
	.C1(n_745),
	.C2(portb_dir_o[3]),
	.ZN(n_746));
   AOI221_X1 g31214 (.A(n_483),
	.B1(n_743),
	.B2(ram_dat_i[1]),
	.C1(n_745),
	.C2(portb_dir_o[1]),
	.ZN(n_744));
   AOI221_X1 g31215 (.A(n_474),
	.B1(n_743),
	.B2(ram_dat_i[2]),
	.C1(n_745),
	.C2(portb_dir_o[2]),
	.ZN(n_742));
   AOI221_X1 g31217 (.A(n_486),
	.B1(n_743),
	.B2(ram_dat_i[4]),
	.C1(n_745),
	.C2(portb_dir_o[4]),
	.ZN(n_741));
   AOI221_X1 g31218 (.A(n_488),
	.B1(n_743),
	.B2(ram_dat_i[0]),
	.C1(n_745),
	.C2(portb_dir_o[0]),
	.ZN(n_740));
   AOI211_X1 g31219 (.A(n_536),
	.B(n_530),
	.C1(n_915),
	.C2(add_node[1]),
	.ZN(n_739));
   AOI211_X1 g31220 (.A(n_554),
	.B(n_532),
	.C1(n_915),
	.C2(add_node[0]),
	.ZN(n_738));
   AOI211_X1 g31024 (.A(n_535),
	.B(n_529),
	.C1(n_915),
	.C2(add_node[2]),
	.ZN(n_737));
   OAI211_X1 g31012 (.A(n_519),
	.B(n_735),
	.C1(n_734),
	.C2(n_218),
	.ZN(n_736));
   NOR2_X1 g30784 (.A1(n_733),
	.A2(\pc_reg[8]_2975 ),
	.ZN(n_765));
   DFF_X1 wdt_rst_node_reg (.D(n_629),
	.CK(clk_i),
	.Q(wdt_rst_node),
	.QN(UNCONNECTED77));
   SDFF_X1 \eep_adr_reg_reg[3]  (.D(ram_dat_o[3]),
	.SE(n_732),
	.SI(eep_adr_o[3]),
	.CK(clk_i),
	.Q(eep_adr_o[3]),
	.QN(UNCONNECTED78));
   SDFF_X1 \eep_adr_reg_reg[2]  (.D(ram_dat_o[2]),
	.SE(n_732),
	.SI(eep_adr_o[2]),
	.CK(clk_i),
	.Q(eep_adr_o[2]),
	.QN(UNCONNECTED79));
   OAI22_X1 g31371 (.A1(n_715),
	.A2(n_730),
	.B1(n_713),
	.B2(intcon_reg[2]),
	.ZN(n_731));
   OAI221_X1 g31345 (.A(n_425),
	.B1(n_726),
	.B2(stack_pnt_reg[1]),
	.C1(n_728),
	.C2(n_423),
	.ZN(n_729));
   OAI221_X1 g31346 (.A(n_310),
	.B1(n_726),
	.B2(stack_pnt_reg[0]),
	.C1(n_725),
	.C2(n_367),
	.ZN(n_727));
   OAI211_X1 g31349 (.A(n_533),
	.B(n_723),
	.C1(n_734),
	.C2(n_174),
	.ZN(n_724));
   OR3_X1 g31355 (.A1(n_721),
	.A2(n_720),
	.A3(n_358),
	.ZN(n_722));
   OR3_X1 g31357 (.A1(n_721),
	.A2(n_718),
	.A3(int_node),
	.ZN(n_719));
   NAND3_X1 g31359 (.A1(n_577),
	.A2(ram_dat_o[2]),
	.A3(existeeprom_i),
	.ZN(n_717));
   OAI22_X1 g31365 (.A1(n_715),
	.A2(n_714),
	.B1(n_713),
	.B2(intcon_reg[0]),
	.ZN(n_716));
   OAI22_X1 g31367 (.A1(n_715),
	.A2(n_711),
	.B1(n_713),
	.B2(intcon_reg[1]),
	.ZN(n_712));
   OAI22_X1 g31030 (.A1(n_571),
	.A2(rateval[5]),
	.B1(n_570),
	.B2(n_569),
	.ZN(n_710));
   OAI22_X1 g31375 (.A1(n_715),
	.A2(n_708),
	.B1(n_713),
	.B2(intcon_reg[3]),
	.ZN(n_709));
   AOI22_X1 g31386 (.A1(n_745),
	.A2(portb_dir_o[6]),
	.B1(n_757),
	.B2(n_312),
	.ZN(n_707));
   OAI22_X1 g31380 (.A1(n_715),
	.A2(n_705),
	.B1(n_713),
	.B2(intcon_reg[4]),
	.ZN(n_706));
   AOI22_X1 g31388 (.A1(n_745),
	.A2(portb_dir_o[7]),
	.B1(n_757),
	.B2(n_18),
	.ZN(n_703));
   OAI211_X1 g30835 (.A(n_520),
	.B(n_735),
	.C1(n_734),
	.C2(n_322),
	.ZN(n_702));
   DFF_X1 \add_node_reg[6]  (.D(n_657),
	.CK(clk_i),
	.Q(add_node[6]),
	.QN(UNCONNECTED80));
   OAI211_X1 g30901 (.A(n_534),
	.B(n_723),
	.C1(n_734),
	.C2(n_266),
	.ZN(n_701));
   OAI221_X1 g30899 (.A(n_628),
	.B1(n_793),
	.B2(\aluout_reg[1]_3002 ),
	.C1(n_627),
	.C2(addlow_node[4]),
	.ZN(n_700));
   SDFF_X1 \eep_adr_reg_reg[7]  (.D(ram_dat_o[7]),
	.SE(n_732),
	.SI(eep_adr_o[7]),
	.CK(clk_i),
	.Q(eep_adr_o[7]),
	.QN(UNCONNECTED81));
   SDFF_X1 \eep_adr_reg_reg[0]  (.D(ram_dat_o[0]),
	.SE(n_732),
	.SI(eep_adr_o[0]),
	.CK(clk_i),
	.Q(eep_adr_o[0]),
	.QN(UNCONNECTED82));
   SDFF_X1 \eep_adr_reg_reg[1]  (.D(ram_dat_o[1]),
	.SE(n_732),
	.SI(eep_adr_o[1]),
	.CK(clk_i),
	.Q(eep_adr_o[1]),
	.QN(UNCONNECTED83));
   SDFF_X1 \eep_adr_reg_reg[4]  (.D(ram_dat_o[4]),
	.SE(n_732),
	.SI(eep_adr_o[4]),
	.CK(clk_i),
	.Q(eep_adr_o[4]),
	.QN(UNCONNECTED84));
   SDFF_X1 \eep_adr_reg_reg[5]  (.D(ram_dat_o[5]),
	.SE(n_732),
	.SI(eep_adr_o[5]),
	.CK(clk_i),
	.Q(eep_adr_o[5]),
	.QN(UNCONNECTED85));
   SDFF_X1 \eep_adr_reg_reg[6]  (.D(ram_dat_o[6]),
	.SE(n_732),
	.SI(eep_adr_o[6]),
	.CK(clk_i),
	.Q(eep_adr_o[6]),
	.QN(UNCONNECTED86));
   INV_X1 g31442 (.A(n_905),
	.ZN(n_904));
   NAND2_X1 g31429 (.A1(n_721),
	.A2(n_478),
	.ZN(n_838));
   INV_X1 g31443 (.A(n_901),
	.ZN(n_900));
   NAND2_X1 g31432 (.A1(n_597),
	.A2(n_518),
	.ZN(n_945));
   AOI222_X1 g31201 (.A1(n_697),
	.A2(\stack_reg[7] [2]),
	.B1(n_689),
	.B2(\stack_reg[1] [2]),
	.C1(n_696),
	.C2(\stack_reg[5] [2]),
	.ZN(n_699));
   AOI222_X1 g31162 (.A1(n_697),
	.A2(\stack_reg[7] [0]),
	.B1(n_696),
	.B2(\stack_reg[5] [0]),
	.C1(n_695),
	.C2(\stack_reg[2] [0]),
	.ZN(n_698));
   AOI222_X1 g31163 (.A1(n_506),
	.A2(intcon_reg[7]),
	.B1(n_563),
	.B2(rbpu_o),
	.C1(n_649),
	.C2(eep_dat_o[7]),
	.ZN(n_694));
   OAI221_X1 g31165 (.A(n_545),
	.B1(n_691),
	.B2(option_reg[6]),
	.C1(n_713),
	.C2(intcon_reg[6]),
	.ZN(n_693));
   OAI221_X1 g31168 (.A(n_550),
	.B1(n_691),
	.B2(option_reg[5]),
	.C1(n_713),
	.C2(intcon_reg[5]),
	.ZN(n_692));
   AOI222_X1 g31170 (.A1(n_855),
	.A2(\stack_reg[0] [6]),
	.B1(n_689),
	.B2(\stack_reg[1] [6]),
	.C1(n_686),
	.C2(inst_reg[6]),
	.ZN(n_690));
   AOI222_X1 g31213 (.A1(n_855),
	.A2(\stack_reg[0] [12]),
	.B1(n_689),
	.B2(\stack_reg[1] [12]),
	.C1(n_686),
	.C2(n_11),
	.ZN(n_687));
   AOI222_X1 g31199 (.A1(n_697),
	.A2(\stack_reg[7] [1]),
	.B1(n_696),
	.B2(\stack_reg[5] [1]),
	.C1(n_695),
	.C2(\stack_reg[2] [1]),
	.ZN(n_685));
   INV_X1 g30952 (.A(n_683),
	.ZN(n_684));
   AOI222_X1 g31204 (.A1(n_697),
	.A2(\stack_reg[7] [4]),
	.B1(n_696),
	.B2(\stack_reg[5] [4]),
	.C1(n_695),
	.C2(\stack_reg[2] [4]),
	.ZN(n_682));
   AOI222_X1 g31206 (.A1(n_855),
	.A2(\stack_reg[0] [5]),
	.B1(n_689),
	.B2(\stack_reg[1] [5]),
	.C1(n_686),
	.C2(inst_reg[5]),
	.ZN(n_681));
   AOI222_X1 g31207 (.A1(n_697),
	.A2(\stack_reg[7] [3]),
	.B1(n_696),
	.B2(\stack_reg[5] [3]),
	.C1(n_695),
	.C2(\stack_reg[2] [3]),
	.ZN(n_680));
   AOI222_X1 g31208 (.A1(n_855),
	.A2(\stack_reg[0] [7]),
	.B1(n_689),
	.B2(\stack_reg[1] [7]),
	.C1(n_686),
	.C2(inst_reg[7]),
	.ZN(n_679));
   AOI222_X1 g31209 (.A1(n_855),
	.A2(\stack_reg[0] [8]),
	.B1(n_689),
	.B2(\stack_reg[1] [8]),
	.C1(n_686),
	.C2(inst_reg[8]),
	.ZN(n_678));
   AOI222_X1 g31210 (.A1(n_855),
	.A2(\stack_reg[0] [9]),
	.B1(n_689),
	.B2(\stack_reg[1] [9]),
	.C1(n_686),
	.C2(inst_reg[9]),
	.ZN(n_677));
   AOI222_X1 g31211 (.A1(n_855),
	.A2(\stack_reg[0] [10]),
	.B1(n_689),
	.B2(\stack_reg[1] [10]),
	.C1(n_686),
	.C2(inst_reg[10]),
	.ZN(n_676));
   AOI222_X1 g31212 (.A1(n_855),
	.A2(\stack_reg[0] [11]),
	.B1(n_689),
	.B2(\stack_reg[1] [11]),
	.C1(n_686),
	.C2(n_12),
	.ZN(n_675));
   DFFR_X1 \wdt_reg_reg[7]  (.D(n_566),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED87),
	.QN(wdt_reg[7]));
   AOI21_X1 g30799 (.A(n_606),
	.B1(n_543),
	.B2(\pc_reg[7]_2974 ),
	.ZN(n_674));
   NAND2_X1 g31343 (.A1(n_549),
	.A2(n_337),
	.ZN(n_673));
   OAI211_X1 g31353 (.A(n_482),
	.B(n_735),
	.C1(n_452),
	.C2(n_671),
	.ZN(n_672));
   OAI22_X1 g31354 (.A1(n_573),
	.A2(n_256),
	.B1(n_576),
	.B2(n_306),
	.ZN(n_670));
   AOI222_X1 g31358 (.A1(n_633),
	.A2(\stack_reg[3] [2]),
	.B1(n_686),
	.B2(inst_reg[2]),
	.C1(n_668),
	.C2(n_667),
	.ZN(n_669));
   OAI22_X1 g31372 (.A1(n_663),
	.A2(eecon1_reg[2]),
	.B1(n_662),
	.B2(fsr_reg[2]),
	.ZN(n_666));
   AOI22_X1 g30782 (.A1(n_503),
	.A2(n_481),
	.B1(n_551),
	.B2(w_reg[7]),
	.ZN(n_665));
   OAI22_X1 g31376 (.A1(n_663),
	.A2(eecon1_reg[3]),
	.B1(n_662),
	.B2(fsr_reg[3]),
	.ZN(n_664));
   OAI21_X1 g31504 (.A(n_516),
	.B1(n_659),
	.B2(n_605),
	.ZN(n_661));
   OAI21_X1 g31501 (.A(n_513),
	.B1(n_659),
	.B2(n_419),
	.ZN(n_660));
   OAI22_X1 g31381 (.A1(n_663),
	.A2(eecon1_reg[4]),
	.B1(n_662),
	.B2(fsr_reg[4]),
	.ZN(n_658));
   DFF_X1 \add_node_reg[4]  (.D(n_553),
	.CK(clk_i),
	.Q(add_node[4]),
	.QN(UNCONNECTED88));
   DFF_X1 writeram_reg_reg (.D(n_556),
	.CK(clk_i),
	.Q(writeram_o),
	.QN(n_19));
   DFF_X1 \ram_adr_reg_reg[6]  (.D(n_509),
	.CK(clk_i),
	.Q(ram_adr_o[6]),
	.QN(UNCONNECTED89));
   DFF_X1 \ram_adr_reg_reg[8]  (.D(n_510),
	.CK(clk_i),
	.Q(ram_adr_o[8]),
	.QN(n_7));
   NAND2_X1 g31426 (.A1(n_848),
	.A2(n_1011),
	.ZN(n_849));
   NAND2_X1 g31431 (.A1(n_818),
	.A2(n_1011),
	.ZN(n_819));
   NOR2_X1 g31472 (.A1(n_715),
	.A2(n_575),
	.ZN(n_905));
   NOR2_X1 g31435 (.A1(n_865),
	.A2(n_864),
	.ZN(n_866));
   NAND2_X1 g31475 (.A1(n_745),
	.A2(n_542),
	.ZN(n_901));
   XNOR2_X1 g30955 (.A(n_604),
	.B(n_515),
	.ZN(n_657));
   AOI222_X1 g31164 (.A1(n_653),
	.A2(n_467),
	.B1(n_655),
	.B2(fsr_reg[7]),
	.C1(n_743),
	.C2(ram_dat_i[7]),
	.ZN(n_656));
   AOI222_X1 g31166 (.A1(n_653),
	.A2(n_652),
	.B1(n_655),
	.B2(fsr_reg[6]),
	.C1(n_743),
	.C2(ram_dat_i[6]),
	.ZN(n_654));
   AOI222_X1 g31169 (.A1(n_653),
	.A2(n_17),
	.B1(n_655),
	.B2(n_8),
	.C1(n_743),
	.C2(ram_dat_i[5]),
	.ZN(n_651));
   AOI22_X1 g31383 (.A1(n_649),
	.A2(eep_dat_o[4]),
	.B1(n_647),
	.B2(eep_adr_o[4]),
	.ZN(n_650));
   AOI22_X1 g31379 (.A1(n_649),
	.A2(eep_dat_o[3]),
	.B1(n_647),
	.B2(eep_adr_o[3]),
	.ZN(n_648));
   NAND2_X1 g31171 (.A1(n_796),
	.A2(option_reg[3]),
	.ZN(n_646));
   NAND2_X1 g31172 (.A1(n_796),
	.A2(rbpu_o),
	.ZN(n_645));
   AOI22_X1 g31390 (.A1(n_689),
	.A2(\stack_reg[1] [0]),
	.B1(n_686),
	.B2(inst_reg[0]),
	.ZN(n_644));
   OAI21_X1 g30967 (.A(n_527),
	.B1(n_460),
	.B2(n_537),
	.ZN(n_643));
   AOI22_X1 g31389 (.A1(n_647),
	.A2(eep_adr_o[7]),
	.B1(n_637),
	.B2(prog_adr_o[7]),
	.ZN(n_642));
   OAI22_X1 g31225 (.A1(n_463),
	.A2(tmr0_reg[4]),
	.B1(n_691),
	.B2(option_reg[4]),
	.ZN(n_640));
   XNOR2_X1 g31378 (.A(n_546),
	.B(n_270),
	.ZN(n_639));
   AOI22_X1 g31382 (.A1(n_637),
	.A2(prog_adr_o[4]),
	.B1(n_757),
	.B2(status_reg[4]),
	.ZN(n_638));
   INV_X1 g31338 (.A(n_572),
	.ZN(n_636));
   AOI22_X1 g31341 (.A1(n_637),
	.A2(prog_adr_o[3]),
	.B1(n_757),
	.B2(n_25),
	.ZN(n_635));
   AOI22_X1 g31348 (.A1(n_630),
	.A2(\stack_reg[4] [5]),
	.B1(n_633),
	.B2(\stack_reg[3] [5]),
	.ZN(n_634));
   AOI22_X1 g31350 (.A1(n_854),
	.A2(\stack_reg[6] [12]),
	.B1(n_696),
	.B2(\stack_reg[5] [12]),
	.ZN(n_632));
   AOI22_X1 g31351 (.A1(n_630),
	.A2(\stack_reg[4] [12]),
	.B1(n_633),
	.B2(\stack_reg[3] [12]),
	.ZN(n_631));
   NOR2_X1 g31352 (.A1(wdt_full_sync_reg[2]),
	.A2(wdt_full_sync_reg[1]),
	.ZN(n_629));
   NAND3_X1 g31356 (.A1(n_793),
	.A2(n_627),
	.A3(n_611),
	.ZN(n_628));
   AOI22_X1 g31360 (.A1(n_695),
	.A2(\stack_reg[2] [12]),
	.B1(n_697),
	.B2(\stack_reg[7] [12]),
	.ZN(n_626));
   OAI21_X1 g31361 (.A(n_175),
	.B1(n_471),
	.B2(n_334),
	.ZN(n_625));
   AOI22_X1 g31362 (.A1(n_854),
	.A2(\stack_reg[6] [11]),
	.B1(n_696),
	.B2(\stack_reg[5] [11]),
	.ZN(n_624));
   AOI22_X1 g31377 (.A1(n_854),
	.A2(\stack_reg[6] [6]),
	.B1(n_696),
	.B2(\stack_reg[5] [6]),
	.ZN(n_623));
   AOI22_X1 g31363 (.A1(n_630),
	.A2(\stack_reg[4] [11]),
	.B1(n_633),
	.B2(\stack_reg[3] [11]),
	.ZN(n_622));
   AOI22_X1 g31387 (.A1(n_647),
	.A2(eep_adr_o[6]),
	.B1(n_637),
	.B2(prog_adr_o[6]),
	.ZN(n_621));
   AOI22_X1 g31364 (.A1(n_637),
	.A2(prog_adr_o[0]),
	.B1(n_757),
	.B2(n_618),
	.ZN(n_619));
   AOI22_X1 g31366 (.A1(n_649),
	.A2(eep_dat_o[0]),
	.B1(n_647),
	.B2(eep_adr_o[0]),
	.ZN(n_617));
   AOI22_X1 g31385 (.A1(n_647),
	.A2(eep_adr_o[5]),
	.B1(n_637),
	.B2(prog_adr_o[5]),
	.ZN(n_616));
   AOI22_X1 g31368 (.A1(n_613),
	.A2(wr_eep_req_o),
	.B1(n_655),
	.B2(n_108),
	.ZN(n_614));
   AOI22_X1 g31369 (.A1(n_637),
	.A2(prog_adr_o[1]),
	.B1(n_757),
	.B2(n_611),
	.ZN(n_612));
   AOI22_X1 g31370 (.A1(n_649),
	.A2(eep_dat_o[1]),
	.B1(n_647),
	.B2(eep_adr_o[1]),
	.ZN(n_610));
   AOI22_X1 g31373 (.A1(n_637),
	.A2(prog_adr_o[2]),
	.B1(n_757),
	.B2(status_reg[2]),
	.ZN(n_609));
   AOI22_X1 g31374 (.A1(n_649),
	.A2(eep_dat_o[2]),
	.B1(n_647),
	.B2(eep_adr_o[2]),
	.ZN(n_607));
   INV_X1 g30810 (.A(n_606),
	.ZN(n_733));
   OAI21_X1 g30970 (.A(n_605),
	.B1(n_604),
	.B2(n_521),
	.ZN(n_683));
   DFF_X1 \ram_adr_reg_reg[5]  (.D(n_476),
	.CK(clk_i),
	.Q(ram_adr_o[5]),
	.QN(UNCONNECTED90));
   AOI22_X1 g31391 (.A1(n_630),
	.A2(\stack_reg[4] [0]),
	.B1(n_633),
	.B2(\stack_reg[3] [0]),
	.ZN(n_603));
   AOI22_X1 g31392 (.A1(n_689),
	.A2(\stack_reg[1] [1]),
	.B1(n_686),
	.B2(inst_reg[1]),
	.ZN(n_602));
   AOI22_X1 g31393 (.A1(n_630),
	.A2(\stack_reg[4] [1]),
	.B1(n_633),
	.B2(\stack_reg[3] [1]),
	.ZN(n_601));
   DFF_X1 \inc_pc_node_reg[6]  (.D(n_504),
	.CK(clk_i),
	.Q(UNCONNECTED91),
	.QN(inc_pc_node[6]));
   AOI22_X1 g31395 (.A1(n_695),
	.A2(\stack_reg[2] [5]),
	.B1(n_697),
	.B2(\stack_reg[7] [5]),
	.ZN(n_600));
   AOI22_X1 g31396 (.A1(n_689),
	.A2(\stack_reg[1] [3]),
	.B1(n_686),
	.B2(inst_reg[3]),
	.ZN(n_599));
   AOI22_X1 g31397 (.A1(n_630),
	.A2(\stack_reg[4] [3]),
	.B1(n_633),
	.B2(\stack_reg[3] [3]),
	.ZN(n_598));
   INV_X1 g31478 (.A(n_915),
	.ZN(n_597));
   AOI22_X1 g31398 (.A1(n_689),
	.A2(\stack_reg[1] [4]),
	.B1(n_686),
	.B2(inst_reg[4]),
	.ZN(n_596));
   INV_X1 g31477 (.A(n_818),
	.ZN(n_595));
   AOI22_X1 g31399 (.A1(n_630),
	.A2(\stack_reg[4] [4]),
	.B1(n_633),
	.B2(\stack_reg[3] [4]),
	.ZN(n_594));
   AOI22_X1 g31400 (.A1(n_854),
	.A2(\stack_reg[6] [5]),
	.B1(n_696),
	.B2(\stack_reg[5] [5]),
	.ZN(n_593));
   AOI22_X1 g31401 (.A1(n_695),
	.A2(\stack_reg[2] [6]),
	.B1(n_697),
	.B2(\stack_reg[7] [6]),
	.ZN(n_592));
   AOI22_X1 g31402 (.A1(n_630),
	.A2(\stack_reg[4] [6]),
	.B1(n_633),
	.B2(\stack_reg[3] [6]),
	.ZN(n_591));
   AOI22_X1 g31403 (.A1(n_695),
	.A2(\stack_reg[2] [7]),
	.B1(n_697),
	.B2(\stack_reg[7] [7]),
	.ZN(n_590));
   AOI22_X1 g31404 (.A1(n_630),
	.A2(\stack_reg[4] [7]),
	.B1(n_633),
	.B2(\stack_reg[3] [7]),
	.ZN(n_589));
   AOI22_X1 g31405 (.A1(n_854),
	.A2(\stack_reg[6] [7]),
	.B1(n_696),
	.B2(\stack_reg[5] [7]),
	.ZN(n_588));
   AOI22_X1 g31406 (.A1(n_695),
	.A2(\stack_reg[2] [8]),
	.B1(n_697),
	.B2(\stack_reg[7] [8]),
	.ZN(n_587));
   AOI22_X1 g31407 (.A1(n_630),
	.A2(\stack_reg[4] [8]),
	.B1(n_633),
	.B2(\stack_reg[3] [8]),
	.ZN(n_586));
   AOI22_X1 g31408 (.A1(n_854),
	.A2(\stack_reg[6] [8]),
	.B1(n_696),
	.B2(\stack_reg[5] [8]),
	.ZN(n_585));
   AOI22_X1 g31409 (.A1(n_695),
	.A2(\stack_reg[2] [9]),
	.B1(n_697),
	.B2(\stack_reg[7] [9]),
	.ZN(n_584));
   AOI22_X1 g31410 (.A1(n_630),
	.A2(\stack_reg[4] [9]),
	.B1(n_633),
	.B2(\stack_reg[3] [9]),
	.ZN(n_583));
   AOI22_X1 g31411 (.A1(n_854),
	.A2(\stack_reg[6] [9]),
	.B1(n_696),
	.B2(\stack_reg[5] [9]),
	.ZN(n_582));
   AOI22_X1 g31412 (.A1(n_695),
	.A2(\stack_reg[2] [10]),
	.B1(n_697),
	.B2(\stack_reg[7] [10]),
	.ZN(n_581));
   AOI22_X1 g31413 (.A1(n_630),
	.A2(\stack_reg[4] [10]),
	.B1(n_633),
	.B2(\stack_reg[3] [10]),
	.ZN(n_580));
   AOI22_X1 g31414 (.A1(n_854),
	.A2(\stack_reg[6] [10]),
	.B1(n_696),
	.B2(\stack_reg[5] [10]),
	.ZN(n_579));
   AOI22_X1 g31415 (.A1(n_695),
	.A2(\stack_reg[2] [11]),
	.B1(n_697),
	.B2(\stack_reg[7] [11]),
	.ZN(n_578));
   INV_X1 g31439 (.A(n_848),
	.ZN(n_577));
   NOR2_X1 g31456 (.A1(n_477),
	.A2(n_517),
	.ZN(n_792));
   DFF_X1 \ram_adr_reg_reg[4]  (.D(n_490),
	.CK(clk_i),
	.Q(ram_adr_o[4]),
	.QN(UNCONNECTED92));
   NAND2_X1 g31425 (.A1(n_793),
	.A2(n_1011),
	.ZN(n_769));
   DFF_X1 \aluinp2_reg_reg[0]  (.D(n_487),
	.CK(clk_i),
	.Q(n_77),
	.QN(aluinp2_reg[0]));
   NOR2_X1 g31466 (.A1(n_475),
	.A2(writeram_node),
	.ZN(n_721));
   NOR2_X1 g31473 (.A1(n_576),
	.A2(n_575),
	.ZN(n_823));
   NAND2_X1 g31428 (.A1(n_777),
	.A2(n_1011),
	.ZN(n_778));
   INV_X1 g31479 (.A(n_802),
	.ZN(n_803));
   NAND3_X1 g31434 (.A1(n_548),
	.A2(n_320),
	.A3(n_574),
	.ZN(n_1002));
   NOR2_X1 g31474 (.A1(n_573),
	.A2(n_575),
	.ZN(n_822));
   AOI22_X1 g31394 (.A1(n_630),
	.A2(\stack_reg[4] [2]),
	.B1(n_854),
	.B2(\stack_reg[6] [2]),
	.ZN(n_572));
   AND2_X1 g31175 (.A1(n_570),
	.A2(n_569),
	.ZN(n_571));
   OAI221_X1 g31487 (.A(n_324),
	.B1(n_558),
	.B2(n_567),
	.C1(n_557),
	.C2(status_reg[0]),
	.ZN(n_568));
   NOR2_X1 g30791 (.A1(n_466),
	.A2(n_461),
	.ZN(n_566));
   AOI22_X1 g31221 (.A1(n_653),
	.A2(n_564),
	.B1(n_563),
	.B2(n_116),
	.ZN(n_565));
   AOI22_X1 g31222 (.A1(n_653),
	.A2(n_84),
	.B1(n_563),
	.B2(n_117),
	.ZN(n_562));
   AOI22_X1 g31223 (.A1(n_653),
	.A2(n_14),
	.B1(n_563),
	.B2(n_216),
	.ZN(n_561));
   AOI22_X1 g31224 (.A1(n_653),
	.A2(n_13),
	.B1(n_563),
	.B2(option_reg[3]),
	.ZN(n_560));
   OAI221_X1 g31486 (.A(n_345),
	.B1(n_558),
	.B2(n_147),
	.C1(n_557),
	.C2(aluinp1_reg[6]),
	.ZN(n_559));
   OAI33_X1 g31342 (.A1(n_432),
	.A2(n_507),
	.A3(writeram_node),
	.B1(n_19),
	.B2(n_821),
	.B3(n_277),
	.ZN(n_556));
   OAI211_X1 g31344 (.A(n_357),
	.B(int_node),
	.C1(n_713),
	.C2(writeram_node),
	.ZN(n_555));
   OAI221_X1 g31485 (.A(n_346),
	.B1(n_558),
	.B2(n_44),
	.C1(n_557),
	.C2(aluinp1_reg[1]),
	.ZN(n_554));
   XNOR2_X1 g30954 (.A(n_505),
	.B(n_526),
	.ZN(n_553));
   AOI21_X1 g31480 (.A(n_454),
	.B1(n_551),
	.B2(w_reg[6]),
	.ZN(n_552));
   NAND2_X1 g31454 (.A1(n_649),
	.A2(eep_dat_o[5]),
	.ZN(n_550));
   INV_X1 g31438 (.A(n_548),
	.ZN(n_549));
   NAND2_X1 g31445 (.A1(n_546),
	.A2(n_292),
	.ZN(n_547));
   NAND2_X1 g31451 (.A1(n_649),
	.A2(eep_dat_o[6]),
	.ZN(n_545));
   DFFR_X1 \wdt_reg_reg[6]  (.D(n_462),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED93),
	.QN(wdt_reg[6]));
   DFF_X1 wdt_full_node_reg (.D(n_465),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED94),
	.QN(wdt_full_node));
   NOR2_X1 g30817 (.A1(n_543),
	.A2(\pc_reg[7]_2974 ),
	.ZN(n_606));
   NAND2_X1 g31468 (.A1(n_613),
	.A2(n_542),
	.ZN(n_848));
   INV_X1 g31340 (.A(n_796),
	.ZN(n_795));
   OAI21_X1 g31433 (.A(n_453),
	.B1(n_473),
	.B2(n_363),
	.ZN(n_1001));
   AND2_X1 g31469 (.A1(n_649),
	.A2(n_542),
	.ZN(n_865));
   OAI221_X1 g31505 (.A(n_373),
	.B1(n_659),
	.B2(n_68),
	.C1(n_531),
	.C2(n_540),
	.ZN(n_541));
   OAI221_X1 g31489 (.A(n_328),
	.B1(n_558),
	.B2(n_417),
	.C1(n_557),
	.C2(aluinp1_reg[4]),
	.ZN(n_539));
   OAI221_X1 g31490 (.A(n_327),
	.B1(n_558),
	.B2(n_537),
	.C1(n_557),
	.C2(aluinp1_reg[5]),
	.ZN(n_538));
   OAI221_X1 g31491 (.A(n_326),
	.B1(n_558),
	.B2(n_213),
	.C1(n_557),
	.C2(aluinp1_reg[2]),
	.ZN(n_536));
   OAI221_X1 g31492 (.A(n_325),
	.B1(n_558),
	.B2(n_64),
	.C1(n_557),
	.C2(aluinp1_reg[3]),
	.ZN(n_535));
   AOI21_X1 g31494 (.A(n_444),
	.B1(n_551),
	.B2(w_reg[4]),
	.ZN(n_534));
   AOI21_X1 g31495 (.A(n_440),
	.B1(n_551),
	.B2(w_reg[2]),
	.ZN(n_533));
   OAI221_X1 g31498 (.A(n_391),
	.B1(n_659),
	.B2(n_66),
	.C1(n_531),
	.C2(n_201),
	.ZN(n_532));
   OAI221_X1 g31499 (.A(n_377),
	.B1(n_659),
	.B2(n_215),
	.C1(n_531),
	.C2(n_220),
	.ZN(n_530));
   OAI221_X1 g31500 (.A(n_385),
	.B1(n_659),
	.B2(n_62),
	.C1(n_531),
	.C2(n_298),
	.ZN(n_529));
   OAI221_X1 g31502 (.A(n_388),
	.B1(n_659),
	.B2(n_527),
	.C1(n_531),
	.C2(n_526),
	.ZN(n_528));
   OAI221_X1 g31503 (.A(n_383),
	.B1(n_659),
	.B2(n_524),
	.C1(n_531),
	.C2(n_523),
	.ZN(n_525));
   OAI221_X1 g31488 (.A(n_321),
	.B1(n_558),
	.B2(n_521),
	.C1(n_557),
	.C2(aluinp1_reg[7]),
	.ZN(n_522));
   AOI21_X1 g31506 (.A(n_447),
	.B1(n_551),
	.B2(w_reg[5]),
	.ZN(n_520));
   AOI21_X1 g31507 (.A(n_446),
	.B1(n_551),
	.B2(w_reg[3]),
	.ZN(n_519));
   NOR4_X1 g31508 (.A1(n_431),
	.A2(n_412),
	.A3(n_514),
	.A4(n_517),
	.ZN(n_518));
   AOI222_X1 g31580 (.A1(n_512),
	.A2(n_515),
	.B1(n_514),
	.B2(aluinp1_reg[6]),
	.C1(n_511),
	.C2(n_400),
	.ZN(n_516));
   AOI222_X1 g31574 (.A1(n_512),
	.A2(n_428),
	.B1(n_514),
	.B2(aluinp1_reg[3]),
	.C1(n_511),
	.C2(n_406),
	.ZN(n_513));
   OAI221_X1 g31571 (.A(n_313),
	.B1(n_489),
	.B2(status_reg[7]),
	.C1(n_479),
	.C2(n_7),
	.ZN(n_510));
   INV_X1 g31552 (.A(n_480),
	.ZN(n_509));
   OR2_X1 g31539 (.A1(n_508),
	.A2(n_459),
	.ZN(n_715));
   NOR2_X1 g31512 (.A1(n_662),
	.A2(n_575),
	.ZN(n_802));
   NOR2_X1 g31542 (.A1(n_451),
	.A2(n_508),
	.ZN(n_745));
   OAI21_X1 g31511 (.A(n_627),
	.B1(n_399),
	.B2(n_507),
	.ZN(n_915));
   NAND2_X1 g31510 (.A1(n_506),
	.A2(n_542),
	.ZN(n_818));
   DFF_X1 \add_node_reg[3]  (.D(n_429),
	.CK(clk_i),
	.Q(add_node[3]),
	.QN(UNCONNECTED95));
   DFF_X1 \addlow_node_reg[4]  (.D(n_505),
	.CK(clk_i),
	.Q(UNCONNECTED96),
	.QN(addlow_node[4]));
   AOI21_X1 g30852 (.A(n_457),
	.B1(n_422),
	.B2(\pc_reg[6]_2973 ),
	.ZN(n_504));
   XOR2_X1 g30801 (.A(n_371),
	.B(w_reg[7]),
	.Z(n_503));
   SDFF_X1 \stack_reg_reg[7][7]  (.D(\stack_reg[7] [7]),
	.SE(n_502),
	.SI(prog_adr_o[7]),
	.CK(clk_i),
	.Q(\stack_reg[7] [7]),
	.QN(UNCONNECTED97));
   SDFF_X1 \stack_reg_reg[7][9]  (.D(\stack_reg[7] [9]),
	.SE(n_502),
	.SI(prog_adr_o[9]),
	.CK(clk_i),
	.Q(\stack_reg[7] [9]),
	.QN(UNCONNECTED98));
   SDFF_X1 \stack_reg_reg[0][6]  (.D(prog_adr_o[6]),
	.SE(n_498),
	.SI(\stack_reg[0] [6]),
	.CK(clk_i),
	.Q(\stack_reg[0] [6]),
	.QN(UNCONNECTED99));
   SDFF_X1 \stack_reg_reg[2][10]  (.D(prog_adr_o[10]),
	.SE(n_497),
	.SI(\stack_reg[2] [10]),
	.CK(clk_i),
	.Q(\stack_reg[2] [10]),
	.QN(UNCONNECTED100));
   SDFF_X1 \stack_reg_reg[5][1]  (.D(\stack_reg[5] [1]),
	.SE(n_495),
	.SI(prog_adr_o[1]),
	.CK(clk_i),
	.Q(\stack_reg[5] [1]),
	.QN(UNCONNECTED101));
   SDFF_X1 \stack_reg_reg[1][3]  (.D(prog_adr_o[3]),
	.SE(n_496),
	.SI(\stack_reg[1] [3]),
	.CK(clk_i),
	.Q(\stack_reg[1] [3]),
	.QN(UNCONNECTED102));
   SDFF_X1 \stack_reg_reg[0][11]  (.D(prog_adr_o[11]),
	.SE(n_498),
	.SI(\stack_reg[0] [11]),
	.CK(clk_i),
	.Q(\stack_reg[0] [11]),
	.QN(UNCONNECTED103));
   SDFF_X1 \stack_reg_reg[2][2]  (.D(prog_adr_o[2]),
	.SE(n_497),
	.SI(\stack_reg[2] [2]),
	.CK(clk_i),
	.Q(\stack_reg[2] [2]),
	.QN(UNCONNECTED104));
   SDFF_X1 \stack_reg_reg[4][2]  (.D(prog_adr_o[2]),
	.SE(n_493),
	.SI(\stack_reg[4] [2]),
	.CK(clk_i),
	.Q(\stack_reg[4] [2]),
	.QN(UNCONNECTED105));
   SDFF_X1 \stack_reg_reg[2][6]  (.D(prog_adr_o[6]),
	.SE(n_497),
	.SI(\stack_reg[2] [6]),
	.CK(clk_i),
	.Q(\stack_reg[2] [6]),
	.QN(UNCONNECTED106));
   SDFF_X1 \stack_reg_reg[1][5]  (.D(prog_adr_o[5]),
	.SE(n_496),
	.SI(\stack_reg[1] [5]),
	.CK(clk_i),
	.Q(\stack_reg[1] [5]),
	.QN(UNCONNECTED107));
   SDFF_X1 \stack_reg_reg[2][11]  (.D(prog_adr_o[11]),
	.SE(n_497),
	.SI(\stack_reg[2] [11]),
	.CK(clk_i),
	.Q(\stack_reg[2] [11]),
	.QN(UNCONNECTED108));
   SDFF_X1 \stack_reg_reg[2][12]  (.D(prog_adr_o[12]),
	.SE(n_497),
	.SI(\stack_reg[2] [12]),
	.CK(clk_i),
	.Q(\stack_reg[2] [12]),
	.QN(UNCONNECTED109));
   SDFF_X1 \stack_reg_reg[3][10]  (.D(prog_adr_o[10]),
	.SE(n_492),
	.SI(\stack_reg[3] [10]),
	.CK(clk_i),
	.Q(\stack_reg[3] [10]),
	.QN(UNCONNECTED110));
   SDFF_X1 \stack_reg_reg[0][12]  (.D(prog_adr_o[12]),
	.SE(n_498),
	.SI(\stack_reg[0] [12]),
	.CK(clk_i),
	.Q(\stack_reg[0] [12]),
	.QN(UNCONNECTED111));
   SDFF_X1 \stack_reg_reg[7][3]  (.D(\stack_reg[7] [3]),
	.SE(n_502),
	.SI(prog_adr_o[3]),
	.CK(clk_i),
	.Q(\stack_reg[7] [3]),
	.QN(UNCONNECTED112));
   SDFF_X1 \stack_reg_reg[2][7]  (.D(prog_adr_o[7]),
	.SE(n_497),
	.SI(\stack_reg[2] [7]),
	.CK(clk_i),
	.Q(\stack_reg[2] [7]),
	.QN(UNCONNECTED113));
   SDFF_X1 \stack_reg_reg[6][4]  (.D(\stack_reg[6] [4]),
	.SE(n_494),
	.SI(prog_adr_o[4]),
	.CK(clk_i),
	.Q(\stack_reg[6] [4]),
	.QN(UNCONNECTED114));
   SDFF_X1 \stack_reg_reg[5][7]  (.D(\stack_reg[5] [7]),
	.SE(n_495),
	.SI(prog_adr_o[7]),
	.CK(clk_i),
	.Q(\stack_reg[5] [7]),
	.QN(UNCONNECTED115));
   SDFF_X1 \stack_reg_reg[6][2]  (.D(\stack_reg[6] [2]),
	.SE(n_494),
	.SI(prog_adr_o[2]),
	.CK(clk_i),
	.Q(\stack_reg[6] [2]),
	.QN(UNCONNECTED116));
   SDFF_X1 \stack_reg_reg[4][12]  (.D(prog_adr_o[12]),
	.SE(n_493),
	.SI(\stack_reg[4] [12]),
	.CK(clk_i),
	.Q(\stack_reg[4] [12]),
	.QN(UNCONNECTED117));
   SDFF_X1 \stack_reg_reg[3][3]  (.D(prog_adr_o[3]),
	.SE(n_492),
	.SI(\stack_reg[3] [3]),
	.CK(clk_i),
	.Q(\stack_reg[3] [3]),
	.QN(UNCONNECTED118));
   SDFF_X1 \stack_reg_reg[0][2]  (.D(prog_adr_o[2]),
	.SE(n_498),
	.SI(\stack_reg[0] [2]),
	.CK(clk_i),
	.Q(\stack_reg[0] [2]),
	.QN(UNCONNECTED119));
   SDFF_X1 \stack_reg_reg[5][11]  (.D(\stack_reg[5] [11]),
	.SE(n_495),
	.SI(prog_adr_o[11]),
	.CK(clk_i),
	.Q(\stack_reg[5] [11]),
	.QN(UNCONNECTED120));
   SDFF_X1 \stack_reg_reg[5][9]  (.D(\stack_reg[5] [9]),
	.SE(n_495),
	.SI(prog_adr_o[9]),
	.CK(clk_i),
	.Q(\stack_reg[5] [9]),
	.QN(UNCONNECTED121));
   SDFF_X1 \stack_reg_reg[7][8]  (.D(\stack_reg[7] [8]),
	.SE(n_502),
	.SI(prog_adr_o[8]),
	.CK(clk_i),
	.Q(\stack_reg[7] [8]),
	.QN(UNCONNECTED122));
   SDFF_X1 \stack_reg_reg[3][11]  (.D(prog_adr_o[11]),
	.SE(n_492),
	.SI(\stack_reg[3] [11]),
	.CK(clk_i),
	.Q(\stack_reg[3] [11]),
	.QN(UNCONNECTED123));
   SDFF_X1 \stack_reg_reg[7][1]  (.D(\stack_reg[7] [1]),
	.SE(n_502),
	.SI(prog_adr_o[1]),
	.CK(clk_i),
	.Q(\stack_reg[7] [1]),
	.QN(UNCONNECTED124));
   SDFF_X1 \stack_reg_reg[2][8]  (.D(prog_adr_o[8]),
	.SE(n_497),
	.SI(\stack_reg[2] [8]),
	.CK(clk_i),
	.Q(\stack_reg[2] [8]),
	.QN(UNCONNECTED125));
   SDFF_X1 \stack_reg_reg[3][12]  (.D(prog_adr_o[12]),
	.SE(n_492),
	.SI(\stack_reg[3] [12]),
	.CK(clk_i),
	.Q(\stack_reg[3] [12]),
	.QN(UNCONNECTED126));
   SDFF_X1 \stack_reg_reg[2][9]  (.D(prog_adr_o[9]),
	.SE(n_497),
	.SI(\stack_reg[2] [9]),
	.CK(clk_i),
	.Q(\stack_reg[2] [9]),
	.QN(UNCONNECTED127));
   SDFF_X1 \stack_reg_reg[4][0]  (.D(prog_adr_o[0]),
	.SE(n_493),
	.SI(\stack_reg[4] [0]),
	.CK(clk_i),
	.Q(\stack_reg[4] [0]),
	.QN(UNCONNECTED128));
   SDFF_X1 \stack_reg_reg[1][1]  (.D(prog_adr_o[1]),
	.SE(n_496),
	.SI(\stack_reg[1] [1]),
	.CK(clk_i),
	.Q(\stack_reg[1] [1]),
	.QN(UNCONNECTED129));
   SDFF_X1 \stack_reg_reg[2][4]  (.D(prog_adr_o[4]),
	.SE(n_497),
	.SI(\stack_reg[2] [4]),
	.CK(clk_i),
	.Q(\stack_reg[2] [4]),
	.QN(UNCONNECTED130));
   SDFF_X1 \stack_reg_reg[4][8]  (.D(prog_adr_o[8]),
	.SE(n_493),
	.SI(\stack_reg[4] [8]),
	.CK(clk_i),
	.Q(\stack_reg[4] [8]),
	.QN(UNCONNECTED131));
   SDFF_X1 \stack_reg_reg[4][6]  (.D(prog_adr_o[6]),
	.SE(n_493),
	.SI(\stack_reg[4] [6]),
	.CK(clk_i),
	.Q(\stack_reg[4] [6]),
	.QN(UNCONNECTED132));
   SDFF_X1 \stack_reg_reg[3][7]  (.D(prog_adr_o[7]),
	.SE(n_492),
	.SI(\stack_reg[3] [7]),
	.CK(clk_i),
	.Q(\stack_reg[3] [7]),
	.QN(UNCONNECTED133));
   SDFF_X1 \stack_reg_reg[0][0]  (.D(prog_adr_o[0]),
	.SE(n_498),
	.SI(\stack_reg[0] [0]),
	.CK(clk_i),
	.Q(\stack_reg[0] [0]),
	.QN(UNCONNECTED134));
   SDFF_X1 \stack_reg_reg[4][3]  (.D(prog_adr_o[3]),
	.SE(n_493),
	.SI(\stack_reg[4] [3]),
	.CK(clk_i),
	.Q(\stack_reg[4] [3]),
	.QN(UNCONNECTED135));
   SDFF_X1 \stack_reg_reg[2][5]  (.D(prog_adr_o[5]),
	.SE(n_497),
	.SI(\stack_reg[2] [5]),
	.CK(clk_i),
	.Q(\stack_reg[2] [5]),
	.QN(UNCONNECTED136));
   SDFF_X1 \stack_reg_reg[5][5]  (.D(\stack_reg[5] [5]),
	.SE(n_495),
	.SI(prog_adr_o[5]),
	.CK(clk_i),
	.Q(\stack_reg[5] [5]),
	.QN(UNCONNECTED137));
   SDFF_X1 \stack_reg_reg[5][10]  (.D(\stack_reg[5] [10]),
	.SE(n_495),
	.SI(prog_adr_o[10]),
	.CK(clk_i),
	.Q(\stack_reg[5] [10]),
	.QN(UNCONNECTED138));
   SDFF_X1 \stack_reg_reg[0][8]  (.D(prog_adr_o[8]),
	.SE(n_498),
	.SI(\stack_reg[0] [8]),
	.CK(clk_i),
	.Q(\stack_reg[0] [8]),
	.QN(UNCONNECTED139));
   SDFF_X1 \stack_reg_reg[0][7]  (.D(prog_adr_o[7]),
	.SE(n_498),
	.SI(\stack_reg[0] [7]),
	.CK(clk_i),
	.Q(\stack_reg[0] [7]),
	.QN(UNCONNECTED140));
   SDFF_X1 \stack_reg_reg[0][10]  (.D(prog_adr_o[10]),
	.SE(n_498),
	.SI(\stack_reg[0] [10]),
	.CK(clk_i),
	.Q(\stack_reg[0] [10]),
	.QN(UNCONNECTED141));
   SDFF_X1 \stack_reg_reg[0][1]  (.D(prog_adr_o[1]),
	.SE(n_498),
	.SI(\stack_reg[0] [1]),
	.CK(clk_i),
	.Q(\stack_reg[0] [1]),
	.QN(UNCONNECTED142));
   SDFF_X1 \stack_reg_reg[0][3]  (.D(prog_adr_o[3]),
	.SE(n_498),
	.SI(\stack_reg[0] [3]),
	.CK(clk_i),
	.Q(\stack_reg[0] [3]),
	.QN(UNCONNECTED143));
   SDFF_X1 \stack_reg_reg[0][5]  (.D(prog_adr_o[5]),
	.SE(n_498),
	.SI(\stack_reg[0] [5]),
	.CK(clk_i),
	.Q(\stack_reg[0] [5]),
	.QN(UNCONNECTED144));
   SDFF_X1 \stack_reg_reg[2][3]  (.D(prog_adr_o[3]),
	.SE(n_497),
	.SI(\stack_reg[2] [3]),
	.CK(clk_i),
	.Q(\stack_reg[2] [3]),
	.QN(UNCONNECTED145));
   SDFF_X1 \stack_reg_reg[0][9]  (.D(prog_adr_o[9]),
	.SE(n_498),
	.SI(\stack_reg[0] [9]),
	.CK(clk_i),
	.Q(\stack_reg[0] [9]),
	.QN(UNCONNECTED146));
   SDFF_X1 \stack_reg_reg[1][0]  (.D(prog_adr_o[0]),
	.SE(n_496),
	.SI(\stack_reg[1] [0]),
	.CK(clk_i),
	.Q(\stack_reg[1] [0]),
	.QN(UNCONNECTED147));
   SDFF_X1 \stack_reg_reg[1][2]  (.D(prog_adr_o[2]),
	.SE(n_496),
	.SI(\stack_reg[1] [2]),
	.CK(clk_i),
	.Q(\stack_reg[1] [2]),
	.QN(UNCONNECTED148));
   SDFF_X1 \stack_reg_reg[1][4]  (.D(prog_adr_o[4]),
	.SE(n_496),
	.SI(\stack_reg[1] [4]),
	.CK(clk_i),
	.Q(\stack_reg[1] [4]),
	.QN(UNCONNECTED149));
   SDFF_X1 \stack_reg_reg[1][6]  (.D(prog_adr_o[6]),
	.SE(n_496),
	.SI(\stack_reg[1] [6]),
	.CK(clk_i),
	.Q(\stack_reg[1] [6]),
	.QN(UNCONNECTED150));
   SDFF_X1 \stack_reg_reg[1][8]  (.D(prog_adr_o[8]),
	.SE(n_496),
	.SI(\stack_reg[1] [8]),
	.CK(clk_i),
	.Q(\stack_reg[1] [8]),
	.QN(UNCONNECTED151));
   SDFF_X1 \stack_reg_reg[1][10]  (.D(prog_adr_o[10]),
	.SE(n_496),
	.SI(\stack_reg[1] [10]),
	.CK(clk_i),
	.Q(\stack_reg[1] [10]),
	.QN(UNCONNECTED152));
   SDFF_X1 \stack_reg_reg[1][12]  (.D(prog_adr_o[12]),
	.SE(n_496),
	.SI(\stack_reg[1] [12]),
	.CK(clk_i),
	.Q(\stack_reg[1] [12]),
	.QN(UNCONNECTED153));
   SDFF_X1 \stack_reg_reg[3][5]  (.D(prog_adr_o[5]),
	.SE(n_492),
	.SI(\stack_reg[3] [5]),
	.CK(clk_i),
	.Q(\stack_reg[3] [5]),
	.QN(UNCONNECTED154));
   SDFF_X1 \stack_reg_reg[3][0]  (.D(prog_adr_o[0]),
	.SE(n_492),
	.SI(\stack_reg[3] [0]),
	.CK(clk_i),
	.Q(\stack_reg[3] [0]),
	.QN(UNCONNECTED155));
   SDFF_X1 \stack_reg_reg[3][4]  (.D(prog_adr_o[4]),
	.SE(n_492),
	.SI(\stack_reg[3] [4]),
	.CK(clk_i),
	.Q(\stack_reg[3] [4]),
	.QN(UNCONNECTED156));
   SDFF_X1 \stack_reg_reg[3][6]  (.D(prog_adr_o[6]),
	.SE(n_492),
	.SI(\stack_reg[3] [6]),
	.CK(clk_i),
	.Q(\stack_reg[3] [6]),
	.QN(UNCONNECTED157));
   SDFF_X1 \stack_reg_reg[3][8]  (.D(prog_adr_o[8]),
	.SE(n_492),
	.SI(\stack_reg[3] [8]),
	.CK(clk_i),
	.Q(\stack_reg[3] [8]),
	.QN(UNCONNECTED158));
   OAI21_X1 g31562 (.A(n_380),
	.B1(n_489),
	.B2(fsr_reg[4]),
	.ZN(n_490));
   NOR2_X1 g31446 (.A1(n_485),
	.A2(pclath_reg[0]),
	.ZN(n_488));
   OAI211_X1 g31447 (.A(n_381),
	.B(n_343),
	.C1(n_416),
	.C2(w_reg[0]),
	.ZN(n_487));
   NOR2_X1 g31448 (.A1(n_485),
	.A2(pclath_reg[4]),
	.ZN(n_486));
   NOR2_X1 g31449 (.A1(n_485),
	.A2(pclath_reg[3]),
	.ZN(n_484));
   NOR2_X1 g31450 (.A1(n_485),
	.A2(pclath_reg[1]),
	.ZN(n_483));
   DFF_X1 \wdt_full_sync_reg_reg[2]  (.D(n_434),
	.CK(clk_i),
	.Q(wdt_full_sync_reg[2]),
	.QN(UNCONNECTED159));
   AOI221_X1 g31497 (.A(n_375),
	.B1(n_448),
	.B2(n_374),
	.C1(n_481),
	.C2(n_69),
	.ZN(n_482));
   AOI222_X1 g31564 (.A1(n_347),
	.A2(fsr_reg[6]),
	.B1(n_379),
	.B2(ram_adr_o[6]),
	.C1(n_479),
	.C2(inst_reg[6]),
	.ZN(n_480));
   INV_X1 g31515 (.A(n_718),
	.ZN(n_478));
   INV_X1 g31516 (.A(n_627),
	.ZN(n_477));
   OAI21_X1 g31563 (.A(n_378),
	.B1(n_489),
	.B2(fsr_reg[5]),
	.ZN(n_476));
   INV_X1 g31518 (.A(n_637),
	.ZN(n_475));
   NOR2_X1 g31444 (.A1(n_485),
	.A2(pclath_reg[2]),
	.ZN(n_474));
   SDFF_X1 \stack_reg_reg[6][11]  (.D(\stack_reg[6] [11]),
	.SE(n_494),
	.SI(prog_adr_o[11]),
	.CK(clk_i),
	.Q(\stack_reg[6] [11]),
	.QN(UNCONNECTED160));
   SDFF_X1 \stack_reg_reg[6][12]  (.D(\stack_reg[6] [12]),
	.SE(n_494),
	.SI(prog_adr_o[12]),
	.CK(clk_i),
	.Q(\stack_reg[6] [12]),
	.QN(UNCONNECTED161));
   SDFF_X1 \stack_reg_reg[7][0]  (.D(\stack_reg[7] [0]),
	.SE(n_502),
	.SI(prog_adr_o[0]),
	.CK(clk_i),
	.Q(\stack_reg[7] [0]),
	.QN(UNCONNECTED162));
   SDFF_X1 \stack_reg_reg[7][2]  (.D(\stack_reg[7] [2]),
	.SE(n_502),
	.SI(prog_adr_o[2]),
	.CK(clk_i),
	.Q(\stack_reg[7] [2]),
	.QN(UNCONNECTED163));
   SDFF_X1 \stack_reg_reg[7][4]  (.D(\stack_reg[7] [4]),
	.SE(n_502),
	.SI(prog_adr_o[4]),
	.CK(clk_i),
	.Q(\stack_reg[7] [4]),
	.QN(UNCONNECTED164));
   SDFF_X1 \stack_reg_reg[7][10]  (.D(\stack_reg[7] [10]),
	.SE(n_502),
	.SI(prog_adr_o[10]),
	.CK(clk_i),
	.Q(\stack_reg[7] [10]),
	.QN(UNCONNECTED165));
   SDFF_X1 \stack_reg_reg[7][6]  (.D(\stack_reg[7] [6]),
	.SE(n_502),
	.SI(prog_adr_o[6]),
	.CK(clk_i),
	.Q(\stack_reg[7] [6]),
	.QN(UNCONNECTED166));
   SDFF_X1 \stack_reg_reg[0][4]  (.D(prog_adr_o[4]),
	.SE(n_498),
	.SI(\stack_reg[0] [4]),
	.CK(clk_i),
	.Q(\stack_reg[0] [4]),
	.QN(UNCONNECTED167));
   SDFF_X1 \stack_reg_reg[7][11]  (.D(\stack_reg[7] [11]),
	.SE(n_502),
	.SI(prog_adr_o[11]),
	.CK(clk_i),
	.Q(\stack_reg[7] [11]),
	.QN(UNCONNECTED168));
   SDFF_X1 \stack_reg_reg[3][9]  (.D(prog_adr_o[9]),
	.SE(n_492),
	.SI(\stack_reg[3] [9]),
	.CK(clk_i),
	.Q(\stack_reg[3] [9]),
	.QN(UNCONNECTED169));
   SDFF_X1 \stack_reg_reg[5][3]  (.D(\stack_reg[5] [3]),
	.SE(n_495),
	.SI(prog_adr_o[3]),
	.CK(clk_i),
	.Q(\stack_reg[5] [3]),
	.QN(UNCONNECTED170));
   SDFF_X1 \stack_reg_reg[4][7]  (.D(prog_adr_o[7]),
	.SE(n_493),
	.SI(\stack_reg[4] [7]),
	.CK(clk_i),
	.Q(\stack_reg[4] [7]),
	.QN(UNCONNECTED171));
   SDFF_X1 \stack_reg_reg[1][9]  (.D(prog_adr_o[9]),
	.SE(n_496),
	.SI(\stack_reg[1] [9]),
	.CK(clk_i),
	.Q(\stack_reg[1] [9]),
	.QN(UNCONNECTED172));
   SDFF_X1 \stack_reg_reg[6][3]  (.D(\stack_reg[6] [3]),
	.SE(n_494),
	.SI(prog_adr_o[3]),
	.CK(clk_i),
	.Q(\stack_reg[6] [3]),
	.QN(UNCONNECTED173));
   SDFF_X1 \stack_reg_reg[4][1]  (.D(prog_adr_o[1]),
	.SE(n_493),
	.SI(\stack_reg[4] [1]),
	.CK(clk_i),
	.Q(\stack_reg[4] [1]),
	.QN(UNCONNECTED174));
   SDFF_X1 \stack_reg_reg[4][9]  (.D(prog_adr_o[9]),
	.SE(n_493),
	.SI(\stack_reg[4] [9]),
	.CK(clk_i),
	.Q(\stack_reg[4] [9]),
	.QN(UNCONNECTED175));
   SDFF_X1 \stack_reg_reg[4][11]  (.D(prog_adr_o[11]),
	.SE(n_493),
	.SI(\stack_reg[4] [11]),
	.CK(clk_i),
	.Q(\stack_reg[4] [11]),
	.QN(UNCONNECTED176));
   SDFF_X1 \stack_reg_reg[5][0]  (.D(\stack_reg[5] [0]),
	.SE(n_495),
	.SI(prog_adr_o[0]),
	.CK(clk_i),
	.Q(\stack_reg[5] [0]),
	.QN(UNCONNECTED177));
   SDFF_X1 \stack_reg_reg[1][11]  (.D(prog_adr_o[11]),
	.SE(n_496),
	.SI(\stack_reg[1] [11]),
	.CK(clk_i),
	.Q(\stack_reg[1] [11]),
	.QN(UNCONNECTED178));
   SDFF_X1 \stack_reg_reg[5][2]  (.D(\stack_reg[5] [2]),
	.SE(n_495),
	.SI(prog_adr_o[2]),
	.CK(clk_i),
	.Q(\stack_reg[5] [2]),
	.QN(UNCONNECTED179));
   SDFF_X1 \stack_reg_reg[5][4]  (.D(\stack_reg[5] [4]),
	.SE(n_495),
	.SI(prog_adr_o[4]),
	.CK(clk_i),
	.Q(\stack_reg[5] [4]),
	.QN(UNCONNECTED180));
   SDFF_X1 \stack_reg_reg[5][6]  (.D(\stack_reg[5] [6]),
	.SE(n_495),
	.SI(prog_adr_o[6]),
	.CK(clk_i),
	.Q(\stack_reg[5] [6]),
	.QN(UNCONNECTED181));
   NOR2_X1 g31455 (.A1(n_473),
	.A2(n_284),
	.ZN(n_548));
   SDFF_X1 \stack_reg_reg[2][1]  (.D(prog_adr_o[1]),
	.SE(n_497),
	.SI(\stack_reg[2] [1]),
	.CK(clk_i),
	.Q(\stack_reg[2] [1]),
	.QN(UNCONNECTED182));
   SDFF_X1 \stack_reg_reg[7][5]  (.D(\stack_reg[7] [5]),
	.SE(n_502),
	.SI(prog_adr_o[5]),
	.CK(clk_i),
	.Q(\stack_reg[7] [5]),
	.QN(UNCONNECTED183));
   SDFF_X1 \stack_reg_reg[6][0]  (.D(\stack_reg[6] [0]),
	.SE(n_494),
	.SI(prog_adr_o[0]),
	.CK(clk_i),
	.Q(\stack_reg[6] [0]),
	.QN(UNCONNECTED184));
   SDFF_X1 \stack_reg_reg[4][10]  (.D(prog_adr_o[10]),
	.SE(n_493),
	.SI(\stack_reg[4] [10]),
	.CK(clk_i),
	.Q(\stack_reg[4] [10]),
	.QN(UNCONNECTED185));
   SDFF_X1 \stack_reg_reg[2][0]  (.D(prog_adr_o[0]),
	.SE(n_497),
	.SI(\stack_reg[2] [0]),
	.CK(clk_i),
	.Q(\stack_reg[2] [0]),
	.QN(UNCONNECTED186));
   SDFF_X1 \stack_reg_reg[6][6]  (.D(\stack_reg[6] [6]),
	.SE(n_494),
	.SI(prog_adr_o[6]),
	.CK(clk_i),
	.Q(\stack_reg[6] [6]),
	.QN(UNCONNECTED187));
   SDFF_X1 \stack_reg_reg[5][8]  (.D(\stack_reg[5] [8]),
	.SE(n_495),
	.SI(prog_adr_o[8]),
	.CK(clk_i),
	.Q(\stack_reg[5] [8]),
	.QN(UNCONNECTED188));
   SDFF_X1 \stack_reg_reg[3][1]  (.D(prog_adr_o[1]),
	.SE(n_492),
	.SI(\stack_reg[3] [1]),
	.CK(clk_i),
	.Q(\stack_reg[3] [1]),
	.QN(UNCONNECTED189));
   SDFF_X1 \stack_reg_reg[5][12]  (.D(\stack_reg[5] [12]),
	.SE(n_495),
	.SI(prog_adr_o[12]),
	.CK(clk_i),
	.Q(\stack_reg[5] [12]),
	.QN(UNCONNECTED190));
   SDFF_X1 \stack_reg_reg[1][7]  (.D(prog_adr_o[7]),
	.SE(n_496),
	.SI(\stack_reg[1] [7]),
	.CK(clk_i),
	.Q(\stack_reg[1] [7]),
	.QN(UNCONNECTED191));
   SDFF_X1 \stack_reg_reg[6][1]  (.D(\stack_reg[6] [1]),
	.SE(n_494),
	.SI(prog_adr_o[1]),
	.CK(clk_i),
	.Q(\stack_reg[6] [1]),
	.QN(UNCONNECTED192));
   SDFF_X1 \stack_reg_reg[6][5]  (.D(\stack_reg[6] [5]),
	.SE(n_494),
	.SI(prog_adr_o[5]),
	.CK(clk_i),
	.Q(\stack_reg[6] [5]),
	.QN(UNCONNECTED193));
   SDFF_X1 \stack_reg_reg[6][7]  (.D(\stack_reg[6] [7]),
	.SE(n_494),
	.SI(prog_adr_o[7]),
	.CK(clk_i),
	.Q(\stack_reg[6] [7]),
	.QN(UNCONNECTED194));
   SDFF_X1 \stack_reg_reg[6][8]  (.D(\stack_reg[6] [8]),
	.SE(n_494),
	.SI(prog_adr_o[8]),
	.CK(clk_i),
	.Q(\stack_reg[6] [8]),
	.QN(UNCONNECTED195));
   NAND2_X1 g31524 (.A1(n_450),
	.A2(n_472),
	.ZN(n_573));
   NAND2_X1 g31525 (.A1(n_458),
	.A2(n_472),
	.ZN(n_576));
   SDFF_X1 \stack_reg_reg[6][10]  (.D(\stack_reg[6] [10]),
	.SE(n_494),
	.SI(prog_adr_o[10]),
	.CK(clk_i),
	.Q(\stack_reg[6] [10]),
	.QN(UNCONNECTED196));
   SDFF_X1 \stack_reg_reg[7][12]  (.D(\stack_reg[7] [12]),
	.SE(n_502),
	.SI(prog_adr_o[12]),
	.CK(clk_i),
	.Q(\stack_reg[7] [12]),
	.QN(UNCONNECTED197));
   SDFF_X1 \stack_reg_reg[3][2]  (.D(prog_adr_o[2]),
	.SE(n_492),
	.SI(\stack_reg[3] [2]),
	.CK(clk_i),
	.Q(\stack_reg[3] [2]),
	.QN(UNCONNECTED198));
   SDFF_X1 \stack_reg_reg[4][5]  (.D(prog_adr_o[5]),
	.SE(n_493),
	.SI(\stack_reg[4] [5]),
	.CK(clk_i),
	.Q(\stack_reg[4] [5]),
	.QN(UNCONNECTED199));
   SDFF_X1 \stack_reg_reg[4][4]  (.D(prog_adr_o[4]),
	.SE(n_493),
	.SI(\stack_reg[4] [4]),
	.CK(clk_i),
	.Q(\stack_reg[4] [4]),
	.QN(UNCONNECTED200));
   INV_X1 g31553 (.A(n_471),
	.ZN(n_726));
   SDFF_X1 \stack_reg_reg[6][9]  (.D(\stack_reg[6] [9]),
	.SE(n_494),
	.SI(prog_adr_o[9]),
	.CK(clk_i),
	.Q(\stack_reg[6] [9]),
	.QN(UNCONNECTED201));
   INV_X1 g31517 (.A(n_613),
	.ZN(n_663));
   NAND2_X1 g31467 (.A1(n_398),
	.A2(n_542),
	.ZN(n_777));
   NAND2_X1 g31476 (.A1(n_647),
	.A2(n_542),
	.ZN(n_732));
   NAND2_X1 g31509 (.A1(n_757),
	.A2(n_542),
	.ZN(n_793));
   NAND2_X1 g31436 (.A1(n_653),
	.A2(n_542),
	.ZN(n_1027));
   NAND2_X1 g31437 (.A1(n_563),
	.A2(n_542),
	.ZN(n_796));
   XNOR2_X1 g30839 (.A(n_469),
	.B(pscale_reg[7]),
	.ZN(n_470));
   AOI21_X1 g30851 (.A(n_353),
	.B1(n_467),
	.B2(tmr0_reg[6]),
	.ZN(n_468));
   XNOR2_X1 g30797 (.A(n_464),
	.B(wdt_reg[7]),
	.ZN(n_466));
   OAI22_X1 g30798 (.A1(n_464),
	.A2(n_107),
	.B1(wdt_full_node),
	.B2(n_544),
	.ZN(n_465));
   DFF_X1 \inc_pc_node_reg[5]  (.D(n_355),
	.CK(clk_i),
	.Q(UNCONNECTED202),
	.QN(inc_pc_node[5]));
   INV_X1 g31440 (.A(n_653),
	.ZN(n_463));
   NOR2_X1 g30811 (.A1(n_356),
	.A2(n_461),
	.ZN(n_462));
   INV_X1 g31059 (.A(n_505),
	.ZN(n_460));
   INV_X1 g31624 (.A(n_458),
	.ZN(n_459));
   AOI221_X1 g31092 (.A(n_67),
	.B1(n_149),
	.B2(n_49),
	.C1(n_329),
	.C2(n_148),
	.ZN(n_604));
   AOI21_X1 g31420 (.A(n_351),
	.B1(n_297),
	.B2(pscale_reg[4]),
	.ZN(n_570));
   DFFR_X1 \wdt_reg_reg[5]  (.D(n_354),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED203),
	.QN(wdt_reg[5]));
   INV_X1 g30874 (.A(n_457),
	.ZN(n_543));
   INV_X1 g31441 (.A(n_563),
	.ZN(n_691));
   DFF_X1 \intclr_reg_reg[0]  (.D(n_352),
	.CK(clk_i),
	.Q(UNCONNECTED204),
	.QN(intclr_reg[0]));
   NAND2_X1 g31533 (.A1(n_389),
	.A2(n_456),
	.ZN(n_718));
   NAND2_X1 g31537 (.A1(n_455),
	.A2(n_430),
	.ZN(n_627));
   NOR2_X1 g31538 (.A1(n_508),
	.A2(n_436),
	.ZN(n_613));
   INV_X1 g31519 (.A(n_542),
	.ZN(n_575));
   OAI221_X1 g31559 (.A(n_362),
	.B1(n_442),
	.B2(n_260),
	.C1(n_453),
	.C2(aluinp2_reg[6]),
	.ZN(n_454));
   INV_X1 g31594 (.A(n_551),
	.ZN(n_452));
   INV_X1 g31590 (.A(n_450),
	.ZN(n_451));
   AOI221_X1 g31576 (.A(n_361),
	.B1(n_448),
	.B2(n_318),
	.C1(n_410),
	.C2(n_76),
	.ZN(n_449));
   OAI221_X1 g31568 (.A(n_443),
	.B1(n_445),
	.B2(n_441),
	.C1(n_453),
	.C2(aluinp2_reg[5]),
	.ZN(n_447));
   OAI221_X1 g31566 (.A(n_439),
	.B1(n_445),
	.B2(n_438),
	.C1(n_453),
	.C2(aluinp2_reg[3]),
	.ZN(n_446));
   OAI221_X1 g31565 (.A(n_443),
	.B1(n_442),
	.B2(n_441),
	.C1(n_453),
	.C2(aluinp2_reg[4]),
	.ZN(n_444));
   OAI221_X1 g31561 (.A(n_439),
	.B1(n_442),
	.B2(n_438),
	.C1(n_453),
	.C2(aluinp2_reg[2]),
	.ZN(n_440));
   INV_X1 g31557 (.A(n_757),
	.ZN(n_437));
   NOR3_X1 g31584 (.A1(n_386),
	.A2(n_315),
	.A3(n_364),
	.ZN(n_546));
   AOI211_X1 g31583 (.A(n_248),
	.B(n_424),
	.C1(n_762),
	.C2(poweron_sync_reg),
	.ZN(n_471));
   INV_X1 g31556 (.A(n_713),
	.ZN(n_506));
   INV_X1 g31555 (.A(n_655),
	.ZN(n_662));
   NOR2_X1 g31540 (.A1(n_415),
	.A2(n_436),
	.ZN(n_649));
   NOR2_X1 g31541 (.A1(n_420),
	.A2(n_360),
	.ZN(n_637));
   NOR2_X2 g31549 (.A1(n_435),
	.A2(n_81),
	.ZN(n_689));
   NOR2_X2 g31543 (.A1(n_435),
	.A2(n_82),
	.ZN(n_633));
   NOR2_X2 g31548 (.A1(n_435),
	.A2(n_72),
	.ZN(n_697));
   NOR2_X2 g31550 (.A1(n_435),
	.A2(n_80),
	.ZN(n_696));
   NOR2_X1 g31521 (.A1(n_433),
	.A2(wdt_full_sync_reg[1]),
	.ZN(n_434));
   INV_X1 g31626 (.A(n_743),
	.ZN(n_432));
   NAND3_X1 g31631 (.A1(n_531),
	.A2(n_264),
	.A3(n_430),
	.ZN(n_431));
   XNOR2_X1 g31153 (.A(n_418),
	.B(n_428),
	.ZN(n_429));
   XOR2_X1 g30857 (.A(n_370),
	.B(w_reg[6]),
	.Z(n_427));
   NAND2_X1 g31523 (.A1(n_424),
	.A2(n_423),
	.ZN(n_425));
   NOR2_X1 g30888 (.A1(n_422),
	.A2(\pc_reg[6]_2973 ),
	.ZN(n_457));
   NOR3_X1 g31648 (.A1(n_421),
	.A2(n_396),
	.A3(n_397),
	.ZN(n_458));
   NOR2_X1 g31600 (.A1(n_421),
	.A2(n_420),
	.ZN(n_450));
   OAI21_X1 g31098 (.A(n_419),
	.B1(n_418),
	.B2(n_417),
	.ZN(n_505));
   NOR2_X1 g31471 (.A1(n_508),
	.A2(n_414),
	.ZN(n_563));
   NOR2_X1 g31611 (.A1(n_416),
	.A2(n_336),
	.ZN(n_551));
   NOR2_X1 g31470 (.A1(n_415),
	.A2(n_414),
	.ZN(n_653));
   AND2_X1 g31546 (.A1(n_413),
	.A2(n_335),
	.ZN(n_695));
   AND2_X1 g31545 (.A1(n_413),
	.A2(n_330),
	.ZN(n_855));
   AND2_X1 g31544 (.A1(n_413),
	.A2(n_331),
	.ZN(n_854));
   INV_X1 g31596 (.A(n_659),
	.ZN(n_412));
   AOI22_X1 g31579 (.A1(n_408),
	.A2(inst_reg[4]),
	.B1(n_410),
	.B2(n_390),
	.ZN(n_411));
   AOI22_X1 g31558 (.A1(n_408),
	.A2(inst_reg[3]),
	.B1(n_410),
	.B2(n_382),
	.ZN(n_409));
   AOI22_X1 g31569 (.A1(n_408),
	.A2(inst_reg[7]),
	.B1(n_410),
	.B2(n_406),
	.ZN(n_407));
   AOI22_X1 g31570 (.A1(n_408),
	.A2(inst_reg[1]),
	.B1(n_410),
	.B2(n_372),
	.ZN(n_405));
   AOI22_X1 g31572 (.A1(n_408),
	.A2(inst_reg[5]),
	.B1(n_410),
	.B2(n_376),
	.ZN(n_404));
   AOI22_X1 g31573 (.A1(n_408),
	.A2(inst_reg[6]),
	.B1(n_410),
	.B2(n_384),
	.ZN(n_403));
   AOI22_X1 g31577 (.A1(n_408),
	.A2(inst_reg[0]),
	.B1(n_410),
	.B2(n_387),
	.ZN(n_402));
   AOI22_X1 g31578 (.A1(n_408),
	.A2(inst_reg[2]),
	.B1(n_410),
	.B2(n_400),
	.ZN(n_401));
   NAND4_X1 g31581 (.A1(n_399),
	.A2(n_314),
	.A3(n_259),
	.A4(n_281),
	.ZN(n_473));
   INV_X1 g31554 (.A(n_398),
	.ZN(n_485));
   AND4_X1 g31587 (.A1(n_392),
	.A2(n_349),
	.A3(n_393),
	.A4(n_397),
	.ZN(n_655));
   NAND4_X1 g31588 (.A1(n_395),
	.A2(n_396),
	.A3(n_394),
	.A4(n_366),
	.ZN(n_713));
   AND4_X1 g31586 (.A1(n_472),
	.A2(n_395),
	.A3(n_394),
	.A4(n_393),
	.ZN(n_647));
   NOR2_X1 g31551 (.A1(n_208),
	.A2(writeram_node),
	.ZN(n_542));
   AND3_X1 g31589 (.A1(n_395),
	.A2(n_392),
	.A3(n_396),
	.ZN(n_757));
   AND2_X1 g31547 (.A1(n_413),
	.A2(n_333),
	.ZN(n_630));
   AOI22_X1 g31647 (.A1(n_514),
	.A2(aluinp1_reg[0]),
	.B1(n_511),
	.B2(n_390),
	.ZN(n_391));
   DFF_X1 \add_node_reg[2]  (.D(n_299),
	.CK(clk_i),
	.Q(add_node[2]),
	.QN(UNCONNECTED205));
   INV_X1 g31625 (.A(n_720),
	.ZN(n_389));
   AOI22_X1 g31628 (.A1(n_514),
	.A2(aluinp1_reg[4]),
	.B1(n_511),
	.B2(n_387),
	.ZN(n_388));
   NAND4_X1 g31629 (.A1(n_285),
	.A2(n_368),
	.A3(n_250),
	.A4(n_269),
	.ZN(n_386));
   AOI22_X1 g31630 (.A1(n_514),
	.A2(aluinp1_reg[2]),
	.B1(n_511),
	.B2(n_384),
	.ZN(n_385));
   AOI22_X1 g31632 (.A1(n_514),
	.A2(aluinp1_reg[7]),
	.B1(n_511),
	.B2(n_382),
	.ZN(n_383));
   AOI221_X1 g31634 (.A(n_340),
	.B1(n_410),
	.B2(n_77),
	.C1(n_339),
	.C2(n_198),
	.ZN(n_381));
   AOI22_X1 g31635 (.A1(n_379),
	.A2(ram_adr_o[4]),
	.B1(n_479),
	.B2(inst_reg[4]),
	.ZN(n_380));
   AOI22_X1 g31636 (.A1(n_379),
	.A2(ram_adr_o[5]),
	.B1(n_479),
	.B2(inst_reg[5]),
	.ZN(n_378));
   AOI22_X1 g31640 (.A1(n_514),
	.A2(aluinp1_reg[1]),
	.B1(n_511),
	.B2(n_376),
	.ZN(n_377));
   OAI22_X1 g31641 (.A1(n_319),
	.A2(n_374),
	.B1(n_453),
	.B2(aluinp2_reg[1]),
	.ZN(n_375));
   AOI22_X1 g31646 (.A1(n_514),
	.A2(aluinp1_reg[5]),
	.B1(n_511),
	.B2(n_372),
	.ZN(n_373));
   NAND2_X1 g30887 (.A1(n_370),
	.A2(n_369),
	.ZN(n_371));
   NAND2_X1 g31604 (.A1(n_308),
	.A2(n_368),
	.ZN(n_455));
   NAND4_X1 g31649 (.A1(n_365),
	.A2(n_394),
	.A3(n_393),
	.A4(n_397),
	.ZN(n_436));
   NAND3_X1 g31609 (.A1(n_307),
	.A2(n_761),
	.A3(n_367),
	.ZN(n_435));
   OAI21_X1 g31652 (.A(n_430),
	.B1(n_291),
	.B2(n_239),
	.ZN(n_558));
   OAI21_X1 g31653 (.A(n_366),
	.B1(n_365),
	.B2(n_348),
	.ZN(n_743));
   OAI21_X1 g31613 (.A(n_430),
	.B1(n_364),
	.B2(n_363),
	.ZN(n_659));
   INV_X1 g31696 (.A(n_361),
	.ZN(n_362));
   NAND4_X1 g31598 (.A1(n_366),
	.A2(n_249),
	.A3(n_243),
	.A4(n_288),
	.ZN(n_360));
   AOI211_X1 g31575 (.A(n_222),
	.B(n_358),
	.C1(n_357),
	.C2(\aluout_reg[7]_3008 ),
	.ZN(n_359));
   XNOR2_X1 g30850 (.A(n_317),
	.B(wdt_reg[6]),
	.ZN(n_356));
   AOI21_X1 g30921 (.A(n_342),
	.B1(n_303),
	.B2(\pc_reg[5]_2972 ),
	.ZN(n_355));
   NOR2_X1 g30878 (.A1(n_461),
	.A2(n_295),
	.ZN(n_354));
   NOR3_X1 g30880 (.A1(n_1016),
	.A2(n_467),
	.A3(tmr0_reg[6]),
	.ZN(n_353));
   OAI211_X1 g31560 (.A(n_279),
	.B(n_1011),
	.C1(n_278),
	.C2(intclr_reg[0]),
	.ZN(n_352));
   AOI21_X1 g31483 (.A(rateval[4]),
	.B1(n_296),
	.B2(n_350),
	.ZN(n_351));
   SDFF_X1 \ram_adr_reg_reg[1]  (.D(ram_adr_o[1]),
	.SE(n_479),
	.SI(n_396),
	.CK(clk_i),
	.Q(ram_adr_o[1]),
	.QN(UNCONNECTED206));
   DFFR_X1 \wdt_reg_reg[4]  (.D(n_309),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED207),
	.QN(wdt_reg[4]));
   SDFF_X1 \ram_adr_reg_reg[2]  (.D(ram_adr_o[2]),
	.SE(n_479),
	.SI(n_349),
	.CK(clk_i),
	.Q(ram_adr_o[2]),
	.QN(UNCONNECTED208));
   SDFF_X1 \ram_adr_reg_reg[7]  (.D(ram_adr_o[7]),
	.SE(n_479),
	.SI(n_338),
	.CK(clk_i),
	.Q(ram_adr_o[7]),
	.QN(UNCONNECTED209));
   SDFF_X1 \ram_adr_reg_reg[0]  (.D(ram_adr_o[0]),
	.SE(n_479),
	.SI(n_289),
	.CK(clk_i),
	.Q(ram_adr_o[0]),
	.QN(UNCONNECTED210));
   SDFF_X1 \ram_adr_reg_reg[3]  (.D(ram_adr_o[3]),
	.SE(n_479),
	.SI(n_394),
	.CK(clk_i),
	.Q(ram_adr_o[3]),
	.QN(UNCONNECTED211));
   NOR4_X1 g31585 (.A1(n_420),
	.A2(n_349),
	.A3(n_348),
	.A4(n_301),
	.ZN(n_398));
   INV_X1 g31592 (.A(n_424),
	.ZN(n_725));
   INV_X1 g31595 (.A(n_734),
	.ZN(n_481));
   INV_X1 g31702 (.A(n_531),
	.ZN(n_512));
   INV_X1 g31698 (.A(n_347),
	.ZN(n_489));
   DFF_X1 \inc_pc_node_reg[4]  (.D(n_263),
	.CK(clk_i),
	.Q(inc_pc_node[4]),
	.QN(UNCONNECTED212));
   AOI22_X1 g31633 (.A1(n_344),
	.A2(n_618),
	.B1(n_507),
	.B2(ram_dat_o[0]),
	.ZN(n_346));
   AOI22_X1 g31637 (.A1(n_344),
	.A2(n_390),
	.B1(n_507),
	.B2(ram_dat_o[5]),
	.ZN(n_345));
   AOI22_X1 g31627 (.A1(n_290),
	.A2(n_453),
	.B1(n_286),
	.B2(n_142),
	.ZN(n_343));
   INV_X1 g30951 (.A(n_342),
	.ZN(n_422));
   DFF_X1 \wdt_full_sync_reg_reg[1]  (.D(n_280),
	.CK(clk_i),
	.Q(UNCONNECTED213),
	.QN(wdt_full_sync_reg[1]));
   NOR2_X1 g30931 (.A1(n_991),
	.A2(n_341),
	.ZN(n_469));
   AOI21_X1 g31603 (.A(n_340),
	.B1(n_339),
	.B2(inst_reg[7]),
	.ZN(n_723));
   NOR2_X1 g31607 (.A1(n_316),
	.A2(n_410),
	.ZN(n_424));
   NAND2_X1 g31608 (.A1(n_338),
	.A2(n_366),
	.ZN(n_508));
   DFF_X1 writeram_node_reg (.D(n_283),
	.CK(clk_i),
	.Q(UNCONNECTED214),
	.QN(writeram_node));
   AOI21_X1 g31606 (.A(n_340),
	.B1(n_339),
	.B2(n_337),
	.ZN(n_735));
   NAND2_X1 g31612 (.A1(n_336),
	.A2(n_453),
	.ZN(n_734));
   NAND2_X1 g31620 (.A1(n_332),
	.A2(n_335),
	.ZN(n_492));
   NAND2_X1 g31619 (.A1(n_334),
	.A2(n_335),
	.ZN(n_497));
   NAND2_X1 g31618 (.A1(n_334),
	.A2(n_333),
	.ZN(n_493));
   AND2_X1 g31622 (.A1(n_332),
	.A2(n_331),
	.ZN(n_502));
   AND2_X1 g31621 (.A1(n_334),
	.A2(n_331),
	.ZN(n_494));
   NAND2_X1 g31616 (.A1(n_332),
	.A2(n_330),
	.ZN(n_496));
   AND2_X1 g31617 (.A1(n_332),
	.A2(n_333),
	.ZN(n_495));
   NAND2_X1 g31623 (.A1(n_334),
	.A2(n_330),
	.ZN(n_498));
   INV_X1 g31339 (.A(n_418),
	.ZN(n_329));
   AOI22_X1 g31642 (.A1(n_344),
	.A2(n_400),
	.B1(n_507),
	.B2(ram_dat_o[3]),
	.ZN(n_328));
   AOI22_X1 g31643 (.A1(n_344),
	.A2(n_382),
	.B1(n_507),
	.B2(ram_dat_o[4]),
	.ZN(n_327));
   AOI22_X1 g31644 (.A1(n_344),
	.A2(n_387),
	.B1(n_507),
	.B2(ram_dat_o[1]),
	.ZN(n_326));
   AOI22_X1 g31645 (.A1(n_344),
	.A2(n_372),
	.B1(n_507),
	.B2(ram_dat_o[2]),
	.ZN(n_325));
   AOI22_X1 g31638 (.A1(n_344),
	.A2(n_384),
	.B1(n_507),
	.B2(ram_dat_o[7]),
	.ZN(n_324));
   XNOR2_X1 g30922 (.A(n_300),
	.B(tmr0_reg[5]),
	.ZN(n_323));
   XNOR2_X1 g30919 (.A(n_302),
	.B(w_reg[5]),
	.ZN(n_322));
   AOI22_X1 g31639 (.A1(n_344),
	.A2(n_376),
	.B1(n_507),
	.B2(ram_dat_o[6]),
	.ZN(n_321));
   DFF_X1 intstart_reg_reg (.D(n_276),
	.CK(clk_i),
	.Q(n_667),
	.QN(intstart_reg));
   NAND2_X1 g31727 (.A1(n_349),
	.A2(n_348),
	.ZN(n_421));
   NAND2_X1 g31728 (.A1(n_320),
	.A2(n_274),
	.ZN(n_416));
   NOR2_X1 g31729 (.A1(n_319),
	.A2(n_318),
	.ZN(n_361));
   NOR2_X1 g31738 (.A1(n_379),
	.A2(n_311),
	.ZN(n_347));
   INV_X1 g31593 (.A(n_472),
	.ZN(n_415));
   DFF_X1 rbint_sync_reg_reg (.D(n_293),
	.CK(clk_i),
	.Q(UNCONNECTED215),
	.QN(rbint_sync_reg));
   OR2_X1 g30889 (.A1(n_317),
	.A2(wdt_reg[6]),
	.ZN(n_464));
   INV_X1 g31699 (.A(n_445),
	.ZN(n_448));
   NAND3_X1 g31650 (.A1(n_316),
	.A2(n_761),
	.A3(n_241),
	.ZN(n_720));
   NOR3_X1 g31651 (.A1(n_316),
	.A2(n_275),
	.A3(n_367),
	.ZN(n_413));
   NAND2_X1 g31744 (.A1(n_315),
	.A2(n_430),
	.ZN(n_531));
   AND4_X1 g31709 (.A1(n_233),
	.A2(n_271),
	.A3(n_242),
	.A4(n_234),
	.ZN(n_314));
   NAND3_X1 g31719 (.A1(n_479),
	.A2(n_312),
	.A3(n_311),
	.ZN(n_313));
   INV_X1 g31654 (.A(n_334),
	.ZN(n_310));
   NOR2_X1 g30958 (.A1(n_461),
	.A2(n_244),
	.ZN(n_309));
   DFF_X1 \inc_pc_node_reg[3]  (.D(n_245),
	.CK(clk_i),
	.Q(inc_pc_node[3]),
	.QN(UNCONNECTED216));
   INV_X1 g31697 (.A(n_336),
	.ZN(n_308));
   INV_X1 g31700 (.A(n_316),
	.ZN(n_307));
   AND4_X1 g31717 (.A1(n_219),
	.A2(n_54),
	.A3(n_96),
	.A4(n_52),
	.ZN(n_306));
   NAND4_X1 g31714 (.A1(n_304),
	.A2(wr_eep_req_o),
	.A3(n_21),
	.A4(intcon_reg[7]),
	.ZN(n_305));
   NOR2_X1 g30968 (.A1(n_303),
	.A2(\pc_reg[5]_2972 ),
	.ZN(n_342));
   NOR2_X1 g30969 (.A1(n_302),
	.A2(w_reg[5]),
	.ZN(n_370));
   NOR2_X1 g31599 (.A1(n_394),
	.A2(n_301),
	.ZN(n_392));
   NAND2_X1 g31724 (.A1(n_339),
	.A2(n_441),
	.ZN(n_443));
   OR2_X1 g30971 (.A1(n_300),
	.A2(tmr0_reg[5]),
	.ZN(n_1016));
   NOR2_X1 g31610 (.A1(n_338),
	.A2(n_301),
	.ZN(n_472));
   XNOR2_X1 g31347 (.A(n_287),
	.B(n_298),
	.ZN(n_299));
   INV_X1 g31591 (.A(n_296),
	.ZN(n_297));
   XNOR2_X1 g30920 (.A(n_262),
	.B(wdt_reg[5]),
	.ZN(n_295));
   INV_X1 g31745 (.A(n_291),
	.ZN(n_292));
   NAND2_X1 g31725 (.A1(n_339),
	.A2(n_438),
	.ZN(n_439));
   DFFR_X1 \wdt_reg_reg[3]  (.D(n_255),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED217),
	.QN(wdt_reg[3]));
   NOR2_X1 g31731 (.A1(n_290),
	.A2(n_184),
	.ZN(n_399));
   NAND4_X1 g31582 (.A1(n_237),
	.A2(n_393),
	.A3(n_289),
	.A4(n_288),
	.ZN(n_414));
   AOI21_X1 g31427 (.A(n_61),
	.B1(n_287),
	.B2(n_63),
	.ZN(n_418));
   NAND2_X1 g31737 (.A1(n_286),
	.A2(n_337),
	.ZN(n_442));
   NAND2_X1 g31739 (.A1(n_286),
	.A2(inst_reg[7]),
	.ZN(n_445));
   NOR2_X1 g31734 (.A1(n_349),
	.A2(n_397),
	.ZN(n_395));
   NOR2_X1 g31743 (.A1(n_574),
	.A2(n_410),
	.ZN(n_408));
   DFF_X1 \intclr_reg_reg[1]  (.D(n_258),
	.CK(clk_i),
	.Q(UNCONNECTED218),
	.QN(intclr_reg[1]));
   NOR3_X1 g31721 (.A1(n_228),
	.A2(n_232),
	.A3(n_284),
	.ZN(n_285));
   NOR2_X1 g31708 (.A1(n_240),
	.A2(n_667),
	.ZN(n_283));
   MUX2_X1 g31710 (.A(aluinp1_reg[7]),
	.B(aluinp1_reg[0]),
	.S(n_281),
	.Z(n_282));
   NOR2_X1 g31713 (.A1(n_433),
	.A2(wdt_full_sync_reg[0]),
	.ZN(n_280));
   OAI21_X1 g31715 (.A(n_278),
	.B1(n_277),
	.B2(n_203),
	.ZN(n_279));
   OAI22_X1 g31716 (.A1(n_169),
	.A2(n_668),
	.B1(n_275),
	.B2(int_node),
	.ZN(n_276));
   INV_X1 g31748 (.A(n_290),
	.ZN(n_274));
   NAND2_X1 g31656 (.A1(n_268),
	.A2(inst_reg[0]),
	.ZN(n_357));
   AOI222_X1 g31601 (.A1(n_120),
	.A2(pscale_reg[2]),
	.B1(n_164),
	.B2(n_71),
	.C1(pscale_reg[3]),
	.C2(rateval[3]),
	.ZN(n_296));
   NAND4_X1 g31730 (.A1(n_273),
	.A2(n_761),
	.A3(n_39),
	.A4(n_272),
	.ZN(n_959));
   AOI21_X1 g31723 (.A(n_507),
	.B1(n_281),
	.B2(n_271),
	.ZN(n_517));
   AOI22_X1 g31726 (.A1(n_156),
	.A2(n_363),
	.B1(n_193),
	.B2(n_270),
	.ZN(n_456));
   OAI22_X1 g31733 (.A1(n_269),
	.A2(inst_reg[8]),
	.B1(n_235),
	.B2(inst_reg[9]),
	.ZN(n_336));
   NOR2_X1 g31740 (.A1(n_728),
	.A2(stack_pnt_reg[0]),
	.ZN(n_332));
   AOI21_X1 g31741 (.A(n_268),
	.B1(n_126),
	.B2(n_251),
	.ZN(n_316));
   INV_X1 g31701 (.A(n_301),
	.ZN(n_366));
   NOR2_X1 g31683 (.A1(n_728),
	.A2(n_367),
	.ZN(n_334));
   XNOR2_X1 g31151 (.A(n_254),
	.B(tmr0_reg[4]),
	.ZN(n_267));
   XNOR2_X1 g31154 (.A(n_253),
	.B(n_265),
	.ZN(n_266));
   INV_X1 g31754 (.A(n_511),
	.ZN(n_264));
   DFF_X1 \add_node_reg[1]  (.D(n_221),
	.CK(clk_i),
	.Q(add_node[1]),
	.QN(UNCONNECTED219));
   AOI21_X1 g31109 (.A(n_252),
	.B1(n_227),
	.B2(\pc_reg[4]_2971 ),
	.ZN(n_263));
   OR2_X1 g30941 (.A1(n_262),
	.A2(wdt_reg[5]),
	.ZN(n_317));
   INV_X1 g31751 (.A(n_349),
	.ZN(n_365));
   INV_X1 g31750 (.A(n_339),
	.ZN(n_319));
   AOI21_X1 g31529 (.A(intcon_reg[3]),
	.B1(n_211),
	.B2(n_130),
	.ZN(n_293));
   NOR2_X1 g31758 (.A1(n_261),
	.A2(n_182),
	.ZN(n_291));
   NOR2_X1 g31759 (.A1(n_261),
	.A2(n_441),
	.ZN(n_315));
   NOR2_X1 g31761 (.A1(n_261),
	.A2(n_438),
	.ZN(n_364));
   NOR4_X1 g31800 (.A1(n_410),
	.A2(n_226),
	.A3(n_260),
	.A4(inst_reg[10]),
	.ZN(n_340));
   DFF_X1 clk_o_reg_reg (.D(n_238),
	.CK(clk_i),
	.Q(clk_o),
	.QN(UNCONNECTED220));
   NAND2_X1 g31088 (.A1(n_985),
	.A2(pscale_reg[5]),
	.ZN(n_991));
   INV_X1 g31752 (.A(n_394),
	.ZN(n_348));
   INV_X1 g31783 (.A(n_479),
	.ZN(n_379));
   NOR2_X1 g31777 (.A1(n_259),
	.A2(n_507),
	.ZN(n_514));
   OAI211_X1 g31720 (.A(n_257),
	.B(n_1011),
	.C1(intclr_reg[1]),
	.C2(n_246),
	.ZN(n_258));
   NOR2_X1 g31703 (.A1(n_200),
	.A2(n_205),
	.ZN(n_256));
   NOR2_X1 g31180 (.A1(n_461),
	.A2(n_194),
	.ZN(n_255));
   SDFF_X1 \rateval_reg[7]  (.D(rateval[7]),
	.SE(pon_rst_n_i),
	.SI(n_134),
	.CK(n_1010),
	.Q(rateval[7]),
	.QN(UNCONNECTED221));
   OR2_X1 g31190 (.A1(n_254),
	.A2(tmr0_reg[4]),
	.ZN(n_300));
   NAND2_X1 g31188 (.A1(n_253),
	.A2(n_265),
	.ZN(n_302));
   INV_X1 g31158 (.A(n_252),
	.ZN(n_303));
   NAND2_X1 g31736 (.A1(n_396),
	.A2(n_397),
	.ZN(n_420));
   AOI221_X1 g31801 (.A(n_153),
	.B1(n_251),
	.B2(n_3),
	.C1(n_223),
	.C2(n_260),
	.ZN(n_574));
   NOR2_X1 g31763 (.A1(n_410),
	.A2(n_189),
	.ZN(n_286));
   NAND2_X1 g31768 (.A1(n_250),
	.A2(n_192),
	.ZN(n_290));
   DFF_X1 \rateval_reg[3]  (.D(n_206),
	.CK(n_1010),
	.Q(UNCONNECTED222),
	.QN(rateval[3]));
   AOI21_X1 g31742 (.A(n_199),
	.B1(n_136),
	.B2(n_145),
	.ZN(n_301));
   NOR2_X1 g31772 (.A1(n_410),
	.A2(n_128),
	.ZN(n_339));
   NAND2_X1 g31773 (.A1(n_249),
	.A2(n_38),
	.ZN(n_349));
   OR2_X1 g31774 (.A1(n_507),
	.A2(n_271),
	.ZN(n_557));
   INV_X1 g31782 (.A(n_728),
	.ZN(n_248));
   NOR3_X1 g31794 (.A1(n_246),
	.A2(n_197),
	.A3(n_155),
	.ZN(n_247));
   DFF_X1 \inc_pc_node_reg[2]  (.D(n_209),
	.CK(clk_i),
	.Q(UNCONNECTED223),
	.QN(inc_pc_node[2]));
   AOI21_X1 g31484 (.A(n_195),
	.B1(n_139),
	.B2(\pc_reg[3]_2970 ),
	.ZN(n_245));
   DFF_X1 \add_node_reg[0]  (.D(n_202),
	.CK(clk_i),
	.Q(add_node[0]),
	.QN(UNCONNECTED224));
   XNOR2_X1 g31152 (.A(n_225),
	.B(wdt_reg[4]),
	.ZN(n_244));
   INV_X1 g31781 (.A(n_236),
	.ZN(n_368));
   DFFR_X1 \wdt_reg_reg[2]  (.D(n_196),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED225),
	.QN(wdt_reg[2]));
   DFF_X1 aluout_zero_node_reg (.D(n_210),
	.CK(clk_i),
	.Q(n_270),
	.QN(aluout_zero_node));
   NOR2_X1 g31798 (.A1(n_410),
	.A2(n_363),
	.ZN(n_320));
   DFF_X1 int_node_reg (.D(n_204),
	.CK(clk_i),
	.Q(n_358),
	.QN(int_node));
   NAND2_X1 g31775 (.A1(n_243),
	.A2(n_20),
	.ZN(n_394));
   NOR2_X1 g31803 (.A1(n_281),
	.A2(n_507),
	.ZN(n_344));
   NOR2_X1 g31778 (.A1(n_242),
	.A2(n_507),
	.ZN(n_511));
   OAI21_X1 g31807 (.A(n_410),
	.B1(n_231),
	.B2(n_178),
	.ZN(n_479));
   NOR2_X1 g31805 (.A1(n_275),
	.A2(n_241),
	.ZN(n_686));
   AOI221_X1 g31795 (.A(n_239),
	.B1(n_151),
	.B2(inst_reg[7]),
	.C1(n_363),
	.C2(n_144),
	.ZN(n_240));
   NAND2_X1 g31788 (.A1(n_177),
	.A2(n_951),
	.ZN(n_238));
   INV_X1 g31779 (.A(n_212),
	.ZN(n_237));
   OAI21_X1 g31797 (.A(n_235),
	.B1(n_234),
	.B2(n_260),
	.ZN(n_236));
   INV_X1 g31840 (.A(n_232),
	.ZN(n_233));
   SDFF_X1 \portb_i_sync_reg_reg[1]  (.D(portb_i[1]),
	.SE(n_231),
	.SI(portb_i_sync_reg[1]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[1]),
	.QN(UNCONNECTED226));
   NAND2_X1 g31760 (.A1(n_230),
	.A2(n_231),
	.ZN(n_278));
   AND2_X1 g31762 (.A1(n_229),
	.A2(wr_eep_sync_reg),
	.ZN(n_304));
   INV_X1 g31816 (.A(n_228),
	.ZN(n_259));
   SDFF_X1 \portb_i_sync_reg_reg[4]  (.D(portb_i[4]),
	.SE(n_231),
	.SI(portb_i_sync_reg[4]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[4]),
	.QN(UNCONNECTED227));
   NOR2_X1 g31187 (.A1(n_227),
	.A2(\pc_reg[4]_2971 ),
	.ZN(n_252));
   SDFF_X1 \porta_i_sync_reg_reg[2]  (.D(porta_i[2]),
	.SE(n_231),
	.SI(porta_i_sync_reg[2]),
	.CK(clk_i),
	.Q(porta_i_sync_reg[2]),
	.QN(UNCONNECTED228));
   NOR4_X1 g31799 (.A1(n_146),
	.A2(n_135),
	.A3(n_226),
	.A4(inst_reg[7]),
	.ZN(n_268));
   SDFF_X1 \porta_i_sync_reg_reg[4]  (.D(porta_i[4]),
	.SE(n_231),
	.SI(porta_i_sync_reg[4]),
	.CK(clk_i),
	.Q(porta_i_sync_reg[4]),
	.QN(UNCONNECTED229));
   OR2_X1 g31189 (.A1(n_225),
	.A2(wdt_reg[4]),
	.ZN(n_262));
   SDFF_X1 \portb_i_sync_reg_reg[7]  (.D(portb_i[7]),
	.SE(n_231),
	.SI(portb_i_sync_reg[7]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[7]),
	.QN(UNCONNECTED230));
   MUX2_X1 g31735 (.A(fsr_reg[7]),
	.B(n_224),
	.S(n_311),
	.Z(n_338));
   NOR2_X1 g31830 (.A1(n_154),
	.A2(n_223),
	.ZN(n_261));
   OAI21_X1 g31802 (.A(n_668),
	.B1(n_131),
	.B2(n_667),
	.ZN(n_728));
   SDFF_X1 \inst_reg_reg[10]  (.D(prog_dat_i[10]),
	.SE(n_222),
	.SI(inst_reg[10]),
	.CK(clk_i),
	.Q(inst_reg[10]),
	.QN(n_32));
   SDFF_X1 \inst_reg_reg[6]  (.D(prog_dat_i[6]),
	.SE(n_222),
	.SI(inst_reg[6]),
	.CK(clk_i),
	.Q(inst_reg[6]),
	.QN(UNCONNECTED231));
   SDFF_X1 \inst_reg_reg[3]  (.D(prog_dat_i[3]),
	.SE(n_222),
	.SI(inst_reg[3]),
	.CK(clk_i),
	.Q(inst_reg[3]),
	.QN(n_20));
   SDFF_X1 \inst_reg_reg[7]  (.D(prog_dat_i[7]),
	.SE(n_222),
	.SI(inst_reg[7]),
	.CK(clk_i),
	.Q(inst_reg[7]),
	.QN(n_337));
   INV_X1 g31820 (.A(n_410),
	.ZN(n_453));
   SDFF_X1 \inst_reg_reg[2]  (.D(prog_dat_i[2]),
	.SE(n_222),
	.SI(inst_reg[2]),
	.CK(clk_i),
	.Q(inst_reg[2]),
	.QN(n_38));
   AND3_X1 g31804 (.A1(n_229),
	.A2(rd_eep_req_o),
	.A3(rd_eep_sync_reg),
	.ZN(n_864));
   SDFF_X1 \inst_reg_reg[0]  (.D(prog_dat_i[0]),
	.SE(n_222),
	.SI(inst_reg[0]),
	.CK(clk_i),
	.Q(inst_reg[0]),
	.QN(n_5));
   SDFF_X1 \inst_reg_reg[4]  (.D(prog_dat_i[4]),
	.SE(n_222),
	.SI(inst_reg[4]),
	.CK(clk_i),
	.Q(inst_reg[4]),
	.QN(n_24));
   DFF_X1 \wdt_full_sync_reg_reg[0]  (.D(n_171),
	.CK(clk_i),
	.Q(UNCONNECTED232),
	.QN(wdt_full_sync_reg[0]));
   XOR2_X1 g31567 (.A(n_214),
	.B(n_220),
	.Z(n_221));
   AOI221_X1 g31845 (.A(n_129),
	.B1(n_705),
	.B2(porta_o[4]),
	.C1(n_711),
	.C2(porta_o[1]),
	.ZN(n_219));
   XNOR2_X1 g31481 (.A(n_180),
	.B(w_reg[3]),
	.ZN(n_218));
   XNOR2_X1 g31496 (.A(n_181),
	.B(tmr0_reg[3]),
	.ZN(n_217));
   SDFF_X1 \portb_i_sync_reg_reg[3]  (.D(portb_i[3]),
	.SE(n_231),
	.SI(portb_i_sync_reg[3]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[3]),
	.QN(UNCONNECTED233));
   SDFF_X1 \portb_i_sync_reg_reg[2]  (.D(portb_i[2]),
	.SE(n_231),
	.SI(portb_i_sync_reg[2]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[2]),
	.QN(UNCONNECTED234));
   DFF_X1 inte_sync_reg_reg (.D(n_186),
	.CK(clk_i),
	.Q(UNCONNECTED235),
	.QN(inte_sync_reg));
   SDFF_X1 \rateval_reg[1]  (.D(rateval[1]),
	.SE(pon_rst_n_i),
	.SI(n_105),
	.CK(n_1010),
	.Q(rateval[1]),
	.QN(UNCONNECTED236));
   SDFF_X1 \rateval_reg[4]  (.D(rateval[4]),
	.SE(pon_rst_n_i),
	.SI(n_216),
	.CK(n_1010),
	.Q(rateval[4]),
	.QN(UNCONNECTED237));
   SDFF_X1 \porta_i_sync_reg_reg[1]  (.D(porta_i[1]),
	.SE(n_231),
	.SI(porta_i_sync_reg[1]),
	.CK(clk_i),
	.Q(porta_i_sync_reg[1]),
	.QN(UNCONNECTED238));
   OAI21_X1 g31535 (.A(n_215),
	.B1(n_214),
	.B2(n_213),
	.ZN(n_287));
   SDFF_X1 \portb_i_sync_reg_reg[5]  (.D(portb_i[5]),
	.SE(n_231),
	.SI(portb_i_sync_reg[5]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[5]),
	.QN(UNCONNECTED239));
   SDFF_X1 \portb_i_sync_reg_reg[6]  (.D(portb_i[6]),
	.SE(n_231),
	.SI(portb_i_sync_reg[6]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[6]),
	.QN(UNCONNECTED240));
   SDFF_X1 \portb_i_sync_reg_reg[0]  (.D(portb_i[0]),
	.SE(n_231),
	.SI(portb_i_sync_reg[0]),
	.CK(clk_i),
	.Q(portb_i_sync_reg[0]),
	.QN(UNCONNECTED241));
   SDFF_X1 \porta_i_sync_reg_reg[0]  (.D(porta_i[0]),
	.SE(n_231),
	.SI(porta_i_sync_reg[0]),
	.CK(clk_i),
	.Q(porta_i_sync_reg[0]),
	.QN(UNCONNECTED242));
   SDFF_X1 \porta_i_sync_reg_reg[3]  (.D(porta_i[3]),
	.SE(n_231),
	.SI(porta_i_sync_reg[3]),
	.CK(clk_i),
	.Q(porta_i_sync_reg[3]),
	.QN(UNCONNECTED243));
   DFF_X1 \rateval_reg[5]  (.D(n_172),
	.CK(n_1010),
	.Q(rateval[5]),
	.QN(n_0));
   NOR2_X1 g31464 (.A1(n_984),
	.A2(n_350),
	.ZN(n_985));
   DFF_X1 \rateval_reg[6]  (.D(n_160),
	.CK(n_1010),
	.Q(UNCONNECTED244),
	.QN(rateval[6]));
   SDFF_X1 \rateval_reg[2]  (.D(rateval[2]),
	.SE(pon_rst_n_i),
	.SI(n_104),
	.CK(n_1010),
	.Q(rateval[2]),
	.QN(UNCONNECTED245));
   INV_X1 g31753 (.A(n_396),
	.ZN(n_393));
   SDFF_X1 \inst_reg_reg[12]  (.D(prog_dat_i[12]),
	.SE(n_222),
	.SI(inst_reg[12]),
	.CK(clk_i),
	.Q(inst_reg[12]),
	.QN(n_29));
   SDFF_X1 \inst_reg_reg[13]  (.D(prog_dat_i[13]),
	.SE(n_222),
	.SI(inst_reg[13]),
	.CK(clk_i),
	.Q(inst_reg[13]),
	.QN(UNCONNECTED246));
   SDFF_X1 \inst_reg_reg[9]  (.D(prog_dat_i[9]),
	.SE(n_222),
	.SI(inst_reg[9]),
	.CK(clk_i),
	.Q(inst_reg[9]),
	.QN(n_30));
   SDFF_X1 \inst_reg_reg[8]  (.D(prog_dat_i[8]),
	.SE(n_222),
	.SI(inst_reg[8]),
	.CK(clk_i),
	.Q(inst_reg[8]),
	.QN(n_31));
   SDFF_X1 \inst_reg_reg[5]  (.D(prog_dat_i[5]),
	.SE(n_222),
	.SI(inst_reg[5]),
	.CK(clk_i),
	.Q(inst_reg[5]),
	.QN(UNCONNECTED247));
   SDFF_X1 \inst_reg_reg[1]  (.D(prog_dat_i[1]),
	.SE(n_222),
	.SI(inst_reg[1]),
	.CK(clk_i),
	.Q(inst_reg[1]),
	.QN(n_272));
   SDFF_X1 \inst_reg_reg[11]  (.D(prog_dat_i[11]),
	.SE(n_222),
	.SI(inst_reg[11]),
	.CK(clk_i),
	.Q(inst_reg[11]),
	.QN(n_3));
   AOI21_X1 g31787 (.A(n_311),
	.B1(fsr_reg[3]),
	.B2(fsr_reg[2]),
	.ZN(n_212));
   NOR3_X1 g31711 (.A1(n_150),
	.A2(intdown_reg[4]),
	.A3(intdown_reg[1]),
	.ZN(n_211));
   AND4_X1 g31824 (.A1(n_86),
	.A2(n_37),
	.A3(\aluout_reg[0]_3001 ),
	.A4(\aluout_reg[4]_3005 ),
	.ZN(n_210));
   AOI21_X1 g31722 (.A(n_157),
	.B1(n_41),
	.B2(\pc_reg[2]_2969 ),
	.ZN(n_209));
   INV_X1 g31817 (.A(n_668),
	.ZN(n_208));
   OAI21_X1 g31793 (.A(n_246),
	.B1(n_114),
	.B2(n_667),
	.ZN(n_207));
   OAI22_X1 g31792 (.A1(n_100),
	.A2(n_159),
	.B1(rateval[3]),
	.B2(pon_rst_n_i),
	.ZN(n_206));
   NAND4_X1 g31784 (.A1(n_55),
	.A2(n_57),
	.A3(n_92),
	.A4(n_89),
	.ZN(n_205));
   AOI21_X1 g31785 (.A(n_203),
	.B1(n_99),
	.B2(n_119),
	.ZN(n_204));
   XNOR2_X1 g31704 (.A(n_201),
	.B(c_in_1014),
	.ZN(n_202));
   NAND4_X1 g31790 (.A1(n_50),
	.A2(n_51),
	.A3(n_123),
	.A4(n_95),
	.ZN(n_200));
   AOI211_X1 g31791 (.A(inst_reg[4]),
	.B(n_58),
	.C1(n_137),
	.C2(n_112),
	.ZN(n_199));
   DFFR_X1 \wdt_reg_reg[1]  (.D(n_143),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED248),
	.QN(wdt_reg[1]));
   NOR3_X1 g31757 (.A1(n_167),
	.A2(n_198),
	.A3(n_103),
	.ZN(n_273));
   NAND2_X1 g31828 (.A1(n_197),
	.A2(n_166),
	.ZN(n_832));
   OR2_X1 g31825 (.A1(n_183),
	.A2(n_441),
	.ZN(n_250));
   NAND2_X1 g31827 (.A1(n_179),
	.A2(n_78),
	.ZN(n_242));
   DFFR_X1 \wdt_reg_reg[0]  (.D(n_132),
	.RN(n_544),
	.CK(wdt_clk_i),
	.Q(UNCONNECTED249),
	.QN(wdt_reg[0]));
   OAI21_X1 g31776 (.A(n_272),
	.B1(n_185),
	.B2(n_109),
	.ZN(n_396));
   NOR2_X1 g31520 (.A1(n_461),
	.A2(n_141),
	.ZN(n_196));
   INV_X1 g31514 (.A(n_227),
	.ZN(n_195));
   XNOR2_X1 g31482 (.A(n_152),
	.B(wdt_reg[3]),
	.ZN(n_194));
   INV_X1 g31841 (.A(n_192),
	.ZN(n_193));
   OR3_X1 g31846 (.A1(n_190),
	.A2(n_1011),
	.A3(poweron_sync_reg),
	.ZN(n_191));
   AOI21_X1 g31847 (.A(n_239),
	.B1(n_363),
	.B2(inst_reg[11]),
	.ZN(n_189));
   NAND2_X1 g31848 (.A1(n_762),
	.A2(n_170),
	.ZN(n_188));
   INV_X1 g31749 (.A(n_397),
	.ZN(n_289));
   OR4_X1 g31856 (.A1(n_185),
	.A2(inst_reg[1]),
	.A3(fsr_reg[2]),
	.A4(inst_reg[0]),
	.ZN(n_249));
   INV_X1 g31815 (.A(n_184),
	.ZN(n_269));
   NOR2_X1 g31855 (.A1(n_183),
	.A2(n_182),
	.ZN(n_232));
   OR4_X1 g31858 (.A1(n_111),
	.A2(inst_reg[4]),
	.A3(fsr_reg[3]),
	.A4(inst_reg[0]),
	.ZN(n_243));
   OR2_X1 g31534 (.A1(n_181),
	.A2(tmr0_reg[3]),
	.ZN(n_254));
   NOR2_X1 g31832 (.A1(n_183),
	.A2(n_438),
	.ZN(n_228));
   NOR2_X1 g31536 (.A1(n_180),
	.A2(w_reg[3]),
	.ZN(n_253));
   NAND2_X1 g31829 (.A1(n_179),
	.A2(n_374),
	.ZN(n_271));
   INV_X1 g31818 (.A(n_761),
	.ZN(n_275));
   NAND2_X1 g31836 (.A1(n_179),
	.A2(n_79),
	.ZN(n_281));
   OR2_X1 g31839 (.A1(n_951),
	.A2(n_178),
	.ZN(n_410));
   NAND2_X1 g31821 (.A1(clk_o),
	.A2(n_222),
	.ZN(n_177));
   AOI221_X1 g31852 (.A(n_331),
	.B1(n_367),
	.B2(n_175),
	.C1(n_330),
	.C2(stack_pnt_reg[0]),
	.ZN(n_176));
   XNOR2_X1 g31705 (.A(n_140),
	.B(n_173),
	.ZN(n_174));
   OAI21_X1 g31789 (.A(n_118),
	.B1(n_0),
	.B2(pon_rst_n_i),
	.ZN(n_172));
   AND2_X1 g31823 (.A1(wdt_full_o),
	.A2(n_170),
	.ZN(n_171));
   NAND2_X1 g31822 (.A1(n_1011),
	.A2(n_667),
	.ZN(n_169));
   XNOR2_X1 g31706 (.A(n_138),
	.B(tmr0_reg[2]),
	.ZN(n_168));
   NOR2_X1 g31831 (.A1(n_167),
	.A2(n_30),
	.ZN(n_184));
   NOR2_X1 g31826 (.A1(n_167),
	.A2(n_31),
	.ZN(n_284));
   AOI221_X1 g31796 (.A(intcon_reg[4]),
	.B1(n_2),
	.B2(intrise_reg[0]),
	.C1(option_reg[6]),
	.C2(intdown_reg[0]),
	.ZN(n_186));
   NOR2_X1 g31833 (.A1(n_231),
	.A2(n_667),
	.ZN(n_229));
   NAND2_X1 g31674 (.A1(n_989),
	.A2(pscale_reg[3]),
	.ZN(n_984));
   NOR2_X1 g31835 (.A1(n_222),
	.A2(n_166),
	.ZN(n_668));
   AOI21_X1 g31771 (.A(inst_reg[0]),
	.B1(n_59),
	.B2(n_45),
	.ZN(n_397));
   NOR2_X1 g31837 (.A1(n_222),
	.A2(n_178),
	.ZN(n_761));
   MUX2_X1 g31806 (.A(n_34),
	.B(clk_o),
	.S(option_reg[5]),
	.Z(n_1010));
   AOI21_X1 g31842 (.A(n_333),
	.B1(n_335),
	.B2(n_367),
	.ZN(n_165));
   AOI221_X1 g31849 (.A(n_163),
	.B1(n_162),
	.B2(rateval[2]),
	.C1(n_161),
	.C2(rateval[1]),
	.ZN(n_164));
   OAI22_X1 g31851 (.A1(n_133),
	.A2(n_159),
	.B1(rateval[6]),
	.B2(pon_rst_n_i),
	.ZN(n_160));
   DFF_X1 \inc_pc_node_reg[1]  (.D(n_101),
	.CK(clk_i),
	.Q(inc_pc_node[1]),
	.QN(UNCONNECTED250));
   OAI22_X1 g31850 (.A1(n_127),
	.A2(aluout_zero_node),
	.B1(n_125),
	.B2(n_270),
	.ZN(n_156));
   INV_X1 g31866 (.A(n_951),
	.ZN(n_155));
   INV_X1 g31864 (.A(n_234),
	.ZN(n_154));
   INV_X1 g31865 (.A(n_235),
	.ZN(n_153));
   OR4_X1 g31857 (.A1(rbint_sync_reg),
	.A2(n_203),
	.A3(n_950),
	.A4(n_667),
	.ZN(n_257));
   OR4_X1 g31854 (.A1(n_203),
	.A2(inte_sync_reg),
	.A3(n_950),
	.A4(n_667),
	.ZN(n_230));
   OR2_X1 g31531 (.A1(n_152),
	.A2(wdt_reg[3]),
	.ZN(n_225));
   NAND3_X1 g31859 (.A1(n_151),
	.A2(n_318),
	.A3(inst_reg[11]),
	.ZN(n_192));
   OR2_X1 g31532 (.A1(n_139),
	.A2(\pc_reg[3]_2970 ),
	.ZN(n_227));
   NAND2_X1 g31860 (.A1(n_1011),
	.A2(n_222),
	.ZN(n_821));
   SDFFR_X1 wdt_full_reg_reg (.D(wdt_full_o),
	.RN(n_544),
	.SE(n_461),
	.SI(wdt_ena_i),
	.CK(wdt_clk_i),
	.Q(wdt_full_o),
	.QN(UNCONNECTED251));
   INV_X1 g31819 (.A(n_507),
	.ZN(n_430));
   NAND4_X1 g31843 (.A1(intrise_reg[4]),
	.A2(intrise_reg[3]),
	.A3(intrise_reg[2]),
	.A4(intrise_reg[1]),
	.ZN(n_150));
   OAI21_X1 g31712 (.A(n_527),
	.B1(n_419),
	.B2(n_537),
	.ZN(n_149));
   NOR3_X1 g31718 (.A1(n_147),
	.A2(n_417),
	.A3(n_537),
	.ZN(n_148));
   NAND4_X1 g31853 (.A1(n_145),
	.A2(n_110),
	.A3(n_374),
	.A4(n_144),
	.ZN(n_146));
   NOR2_X1 g31786 (.A1(n_461),
	.A2(n_60),
	.ZN(n_143));
   INV_X1 g31863 (.A(n_198),
	.ZN(n_142));
   XNOR2_X1 g31707 (.A(n_98),
	.B(wdt_reg[2]),
	.ZN(n_141));
   AOI21_X1 g31732 (.A(n_65),
	.B1(n_43),
	.B2(c_in_1014),
	.ZN(n_214));
   NAND2_X1 g31765 (.A1(n_140),
	.A2(n_173),
	.ZN(n_180));
   INV_X1 g31747 (.A(n_139),
	.ZN(n_157));
   OR2_X1 g31764 (.A1(n_138),
	.A2(tmr0_reg[2]),
	.ZN(n_181));
   INV_X1 g31869 (.A(n_231),
	.ZN(n_246));
   INV_X1 g31867 (.A(n_170),
	.ZN(n_433));
   NAND4_X1 g31861 (.A1(n_102),
	.A2(n_145),
	.A3(n_137),
	.A4(n_272),
	.ZN(n_311));
   OR2_X1 g31838 (.A1(n_950),
	.A2(n_178),
	.ZN(n_507));
   OAI21_X1 g31918 (.A(n_135),
	.B1(n_272),
	.B2(inst_reg[4]),
	.ZN(n_136));
   NOR2_X1 g31873 (.A1(n_133),
	.A2(option_reg[0]),
	.ZN(n_134));
   AND2_X1 g31874 (.A1(n_42),
	.A2(wdt_reg[0]),
	.ZN(n_132));
   NOR2_X1 g31882 (.A1(n_241),
	.A2(inst_reg[11]),
	.ZN(n_131));
   NOR2_X1 g31885 (.A1(intdown_reg[3]),
	.A2(intdown_reg[2]),
	.ZN(n_130));
   INV_X1 g31905 (.A(n_83),
	.ZN(n_129));
   NAND2_X1 g31889 (.A1(n_144),
	.A2(n_363),
	.ZN(n_128));
   NOR2_X1 g31886 (.A1(n_127),
	.A2(n_48),
	.ZN(n_223));
   INV_X1 g31906 (.A(n_222),
	.ZN(n_197));
   AND2_X1 g31893 (.A1(n_126),
	.A2(n_363),
	.ZN(n_239));
   NAND2_X1 g31897 (.A1(n_40),
	.A2(n_251),
	.ZN(n_235));
   OR2_X1 g31891 (.A1(n_226),
	.A2(n_127),
	.ZN(n_183));
   NOR2_X1 g31894 (.A1(n_226),
	.A2(n_125),
	.ZN(n_179));
   NAND2_X1 g31892 (.A1(n_151),
	.A2(n_126),
	.ZN(n_234));
   NAND2_X1 g31898 (.A1(readram_o),
	.A2(state_reg[2]),
	.ZN(n_951));
   INV_X1 g31870 (.A(n_1011),
	.ZN(n_762));
   AOI22_X1 g31907 (.A1(n_122),
	.A2(portb_o[5]),
	.B1(n_121),
	.B2(portb_o[4]),
	.ZN(n_123));
   NOR2_X1 g31880 (.A1(n_70),
	.A2(rateval[2]),
	.ZN(n_120));
   INV_X1 g31904 (.A(n_56),
	.ZN(n_119));
   OAI211_X1 g31844 (.A(n_216),
	.B(pon_rst_n_i),
	.C1(n_117),
	.C2(n_116),
	.ZN(n_118));
   INV_X1 g31862 (.A(n_114),
	.ZN(n_115));
   NAND3_X1 g31872 (.A1(fsr_reg[4]),
	.A2(n_27),
	.A3(fsr_reg[5]),
	.ZN(n_112));
   NAND2_X1 g31875 (.A1(n_145),
	.A2(n_110),
	.ZN(n_111));
   NAND2_X1 g31876 (.A1(n_137),
	.A2(n_108),
	.ZN(n_109));
   OR2_X1 g31877 (.A1(wdt_reg[7]),
	.A2(n_106),
	.ZN(n_107));
   OR2_X1 g31878 (.A1(n_104),
	.A2(n_116),
	.ZN(n_105));
   NAND3_X1 g31879 (.A1(n_102),
	.A2(inst_reg[6]),
	.A3(inst_reg[5]),
	.ZN(n_103));
   AOI21_X1 g31883 (.A(n_97),
	.B1(\pc_reg[1]_2968 ),
	.B2(\pc_reg[0]_2967 ),
	.ZN(n_101));
   AOI21_X1 g31884 (.A(n_216),
	.B1(n_117),
	.B2(n_116),
	.ZN(n_100));
   INV_X1 g31903 (.A(n_53),
	.ZN(n_99));
   NAND2_X1 g31887 (.A1(n_145),
	.A2(n_102),
	.ZN(n_185));
   OR2_X1 g31767 (.A1(n_98),
	.A2(wdt_reg[2]),
	.ZN(n_152));
   NAND2_X1 g31766 (.A1(n_97),
	.A2(prog_adr_o[2]),
	.ZN(n_139));
   NOR2_X1 g31895 (.A1(n_161),
	.A2(n_162),
	.ZN(n_989));
   NAND2_X1 g31896 (.A1(n_151),
	.A2(n_144),
	.ZN(n_167));
   NAND2_X1 g31890 (.A1(n_374),
	.A2(n_337),
	.ZN(n_198));
   AOI22_X1 g31915 (.A1(n_730),
	.A2(porta_o[2]),
	.B1(porta_dir_o[1]),
	.B2(porta_i_sync_reg[1]),
	.ZN(n_96));
   AOI22_X1 g31919 (.A1(n_94),
	.A2(portb_o[7]),
	.B1(n_93),
	.B2(portb_o[6]),
	.ZN(n_95));
   AOI22_X1 g31920 (.A1(n_91),
	.A2(portb_o[1]),
	.B1(n_90),
	.B2(portb_o[0]),
	.ZN(n_92));
   AOI22_X1 g31921 (.A1(n_88),
	.A2(portb_o[3]),
	.B1(n_87),
	.B2(portb_o[2]),
	.ZN(n_89));
   NOR4_X1 g31923 (.A1(ram_dat_o[3]),
	.A2(ram_dat_o[7]),
	.A3(ram_dat_o[5]),
	.A4(ram_dat_o[6]),
	.ZN(n_86));
   AOI22_X1 g31927 (.A1(n_564),
	.A2(tmr0_reg[1]),
	.B1(n_84),
	.B2(tmr0_reg[0]),
	.ZN(n_85));
   AOI22_X1 g31917 (.A1(n_708),
	.A2(porta_o[3]),
	.B1(n_714),
	.B2(porta_o[0]),
	.ZN(n_83));
   INV_X1 g31983 (.A(n_335),
	.ZN(n_82));
   INV_X1 g31984 (.A(n_330),
	.ZN(n_81));
   INV_X1 g31985 (.A(n_333),
	.ZN(n_80));
   INV_X1 g31987 (.A(n_438),
	.ZN(n_79));
   INV_X1 g31989 (.A(n_441),
	.ZN(n_78));
   INV_X1 g31868 (.A(n_950),
	.ZN(n_277));
   AOI22_X1 g31928 (.A1(n_367),
	.A2(stack_pnt_reg[1]),
	.B1(stack_pnt_reg[0]),
	.B2(n_47),
	.ZN(n_423));
   AOI22_X1 g31930 (.A1(n_387),
	.A2(aluinp2_reg[0]),
	.B1(n_77),
	.B2(aluinp1_reg[0]),
	.ZN(n_201));
   XNOR2_X1 g31934 (.A(n_384),
	.B(aluinp2_reg[6]),
	.ZN(n_515));
   XNOR2_X1 g31935 (.A(n_382),
	.B(aluinp2_reg[3]),
	.ZN(n_428));
   AOI22_X1 g31936 (.A1(n_406),
	.A2(aluinp2_reg[7]),
	.B1(n_76),
	.B2(aluinp1_reg[7]),
	.ZN(n_523));
   NOR2_X1 g31899 (.A1(poweron_sync_reg),
	.A2(mclr_sync_reg),
	.ZN(n_170));
   NAND2_X1 g31901 (.A1(n_75),
	.A2(state_reg[2]),
	.ZN(n_231));
   OR3_X1 g31937 (.A1(n_74),
	.A2(n_33),
	.A3(state_reg[1]),
	.ZN(n_222));
   NAND2_X2 g31902 (.A1(n_75),
	.A2(n_74),
	.ZN(n_1011));
   NAND2_X1 g31990 (.A1(ram_dat_o[1]),
	.A2(\aluout_reg[0]_3001 ),
	.ZN(n_73));
   INV_X1 g31986 (.A(n_331),
	.ZN(n_72));
   INV_X1 g31938 (.A(n_70),
	.ZN(n_71));
   XNOR2_X1 g31926 (.A(w_reg[0]),
	.B(w_reg[1]),
	.ZN(n_69));
   INV_X1 g31809 (.A(n_67),
	.ZN(n_68));
   INV_X1 g31811 (.A(n_65),
	.ZN(n_66));
   INV_X1 g31812 (.A(n_63),
	.ZN(n_64));
   INV_X1 g31813 (.A(n_61),
	.ZN(n_62));
   XNOR2_X1 g31925 (.A(wdt_reg[0]),
	.B(wdt_reg[1]),
	.ZN(n_60));
   NOR4_X1 g31924 (.A1(inst_reg[4]),
	.A2(inst_reg[2]),
	.A3(inst_reg[3]),
	.A4(inst_reg[6]),
	.ZN(n_59));
   INV_X1 g31988 (.A(n_145),
	.ZN(n_58));
   DFFR_X1 \intdown_reg_reg[1]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(n_22),
	.Q(intdown_reg[1]),
	.QN(UNCONNECTED252));
   AOI22_X1 g31916 (.A1(portb_dir_o[1]),
	.A2(portb_i_sync_reg[1]),
	.B1(portb_dir_o[0]),
	.B2(portb_i_sync_reg[0]),
	.ZN(n_57));
   OAI22_X1 g31914 (.A1(intcon_reg[1]),
	.A2(intcon_reg[4]),
	.B1(intcon_reg[3]),
	.B2(intcon_reg[0]),
	.ZN(n_56));
   AOI22_X1 g31913 (.A1(portb_dir_o[5]),
	.A2(portb_i_sync_reg[5]),
	.B1(portb_dir_o[4]),
	.B2(portb_i_sync_reg[4]),
	.ZN(n_55));
   AOI22_X1 g31912 (.A1(porta_dir_o[4]),
	.A2(porta_i_sync_reg[4]),
	.B1(porta_dir_o[2]),
	.B2(porta_i_sync_reg[2]),
	.ZN(n_54));
   OAI22_X1 g31908 (.A1(intcon_reg[6]),
	.A2(eecon1_reg[4]),
	.B1(intcon_reg[5]),
	.B2(intcon_reg[2]),
	.ZN(n_53));
   AOI22_X1 g31909 (.A1(porta_dir_o[3]),
	.A2(porta_i_sync_reg[3]),
	.B1(porta_dir_o[0]),
	.B2(porta_i_sync_reg[0]),
	.ZN(n_52));
   AOI22_X1 g31910 (.A1(portb_dir_o[3]),
	.A2(portb_i_sync_reg[3]),
	.B1(portb_dir_o[2]),
	.B2(portb_i_sync_reg[2]),
	.ZN(n_51));
   AOI22_X1 g31911 (.A1(portb_dir_o[7]),
	.A2(portb_i_sync_reg[7]),
	.B1(portb_dir_o[6]),
	.B2(portb_i_sync_reg[6]),
	.ZN(n_50));
   NAND2_X1 g32010 (.A1(n_84),
	.A2(n_564),
	.ZN(n_138));
   INV_X1 g31808 (.A(n_49),
	.ZN(n_147));
   XNOR2_X1 g31932 (.A(aluinp1_reg[1]),
	.B(aluinp2_reg[1]),
	.ZN(n_220));
   XNOR2_X1 g31931 (.A(aluinp1_reg[5]),
	.B(aluinp2_reg[5]),
	.ZN(n_540));
   XNOR2_X1 g31929 (.A(aluinp1_reg[4]),
	.B(aluinp2_reg[4]),
	.ZN(n_526));
   XNOR2_X1 g31933 (.A(aluinp1_reg[2]),
	.B(aluinp2_reg[2]),
	.ZN(n_298));
   INV_X1 g31981 (.A(n_48),
	.ZN(n_251));
   INV_X1 g31941 (.A(n_151),
	.ZN(n_226));
   NOR2_X1 g32020 (.A1(n_47),
	.A2(stack_pnt_reg[2]),
	.ZN(n_333));
   OR3_X1 g31900 (.A1(n_74),
	.A2(state_reg[0]),
	.A3(state_reg[1]),
	.ZN(n_950));
   INV_X1 g31943 (.A(n_106),
	.ZN(n_544));
   DFFR_X1 \intdown_reg_reg[3]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(n_36),
	.Q(intdown_reg[3]),
	.QN(UNCONNECTED253));
   DFFR_X1 \intdown_reg_reg[2]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(n_6),
	.Q(intdown_reg[2]),
	.QN(UNCONNECTED254));
   DFFR_X1 \intdown_reg_reg[0]  (.D(1'b1),
	.RN(intclr_reg[0]),
	.CK(n_4),
	.Q(UNCONNECTED255),
	.QN(intdown_reg[0]));
   NOR3_X1 g31881 (.A1(inst_reg[1]),
	.A2(inst_reg[5]),
	.A3(fsr_reg[0]),
	.ZN(n_45));
   INV_X1 g31810 (.A(n_43),
	.ZN(n_44));
   INV_X1 g31942 (.A(n_461),
	.ZN(n_42));
   INV_X1 g31814 (.A(n_97),
	.ZN(n_41));
   INV_X1 g31980 (.A(n_125),
	.ZN(n_40));
   NOR2_X1 g31991 (.A1(n_38),
	.A2(inst_reg[0]),
	.ZN(n_39));
   NOR2_X1 g31992 (.A1(ram_dat_o[2]),
	.A2(ram_dat_o[1]),
	.ZN(n_37));
   DFFR_X1 \intdown_reg_reg[4]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(n_36),
	.Q(intdown_reg[4]),
	.QN(UNCONNECTED256));
   INV_X1 g31982 (.A(n_161),
	.ZN(n_35));
   XNOR2_X1 g31922 (.A(option_reg[4]),
	.B(t0cki_i),
	.ZN(n_34));
   NAND2_X1 g31995 (.A1(n_24),
	.A2(inst_reg[3]),
	.ZN(n_135));
   AND2_X1 g31960 (.A1(n_33),
	.A2(state_reg[1]),
	.ZN(readram_o));
   INV_X1 g31939 (.A(n_374),
	.ZN(n_182));
   NOR2_X1 g31964 (.A1(n_76),
	.A2(n_406),
	.ZN(n_567));
   NAND3_X1 g31888 (.A1(powerdown_o),
	.A2(rbint_sync_reg),
	.A3(inte_sync_reg),
	.ZN(n_114));
   NAND2_X1 g31993 (.A1(n_216),
	.A2(n_117),
	.ZN(n_133));
   NAND2_X1 g32003 (.A1(n_76),
	.A2(n_406),
	.ZN(n_524));
   AND2_X1 g32005 (.A1(n_671),
	.A2(w_reg[0]),
	.ZN(n_140));
   NAND2_X1 g32008 (.A1(n_32),
	.A2(inst_reg[11]),
	.ZN(n_127));
   NOR2_X1 g32014 (.A1(n_32),
	.A2(inst_reg[11]),
	.ZN(n_126));
   NAND2_X1 g31968 (.A1(n_29),
	.A2(inst_reg[13]),
	.ZN(n_241));
   INV_X1 g31940 (.A(n_260),
	.ZN(n_318));
   OR2_X1 g31974 (.A1(n_667),
	.A2(exec_op_reg),
	.ZN(n_178));
   NOR2_X1 g32018 (.A1(n_175),
	.A2(stack_pnt_reg[1]),
	.ZN(n_335));
   NOR2_X1 g32019 (.A1(n_175),
	.A2(n_47),
	.ZN(n_330));
   NAND2_X1 g32024 (.A1(n_31),
	.A2(inst_reg[9]),
	.ZN(n_441));
   NAND2_X1 g32022 (.A1(n_30),
	.A2(inst_reg[8]),
	.ZN(n_438));
   NOR2_X1 g32025 (.A1(n_29),
	.A2(inst_reg[13]),
	.ZN(n_363));
   DFFR_X1 \intrise_reg_reg[3]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(int6_i),
	.Q(UNCONNECTED257),
	.QN(intrise_reg[3]));
   DFF_X1 wr_eep_sync_reg_reg (.D(wr_eep_ack_i),
	.CK(clk_i),
	.Q(wr_eep_sync_reg),
	.QN(UNCONNECTED258));
   DFF_X1 mclr_sync_reg_reg (.D(mclr_n_i),
	.CK(clk_i),
	.Q(UNCONNECTED259),
	.QN(mclr_sync_reg));
   OR2_X1 g31958 (.A1(pscale_reg[6]),
	.A2(rateval[6]),
	.ZN(n_28));
   DFFR_X1 \intrise_reg_reg[4]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(int7_i),
	.Q(UNCONNECTED260),
	.QN(intrise_reg[4]));
   OR2_X1 g32004 (.A1(aluinp2_reg[6]),
	.A2(aluinp1_reg[6]),
	.ZN(n_605));
   NOR2_X1 g31963 (.A1(pscale_reg[0]),
	.A2(pscale_reg[1]),
	.ZN(n_163));
   NOR2_X1 g31965 (.A1(pscale_reg[3]),
	.A2(rateval[3]),
	.ZN(n_70));
   OR2_X1 g32002 (.A1(aluinp2_reg[1]),
	.A2(aluinp1_reg[1]),
	.ZN(n_215));
   NAND2_X1 g31998 (.A1(option_reg[2]),
	.A2(option_reg[1]),
	.ZN(n_104));
   NAND2_X1 g31996 (.A1(aluinp2_reg[2]),
	.A2(aluinp1_reg[2]),
	.ZN(n_63));
   OR2_X1 g32006 (.A1(wdt_reg[1]),
	.A2(wdt_reg[0]),
	.ZN(n_98));
   NAND2_X1 g32016 (.A1(inst_reg[13]),
	.A2(inst_reg[12]),
	.ZN(n_48));
   AND2_X1 g31961 (.A1(aluinp2_reg[1]),
	.A2(aluinp1_reg[1]),
	.ZN(n_213));
   NOR2_X1 g32001 (.A1(aluinp2_reg[0]),
	.A2(aluinp1_reg[0]),
	.ZN(n_65));
   NAND2_X1 g32011 (.A1(inst_reg[11]),
	.A2(inst_reg[10]),
	.ZN(n_125));
   NOR2_X1 g31969 (.A1(inst_reg[4]),
	.A2(inst_reg[3]),
	.ZN(n_102));
   AND2_X1 g31970 (.A1(state_reg[1]),
	.A2(state_reg[0]),
	.ZN(n_75));
   NOR2_X1 g32012 (.A1(inst_reg[2]),
	.A2(inst_reg[0]),
	.ZN(n_137));
   DFF_X1 poweron_sync_reg_reg (.D(pon_rst_n_i),
	.CK(clk_i),
	.Q(UNCONNECTED261),
	.QN(poweron_sync_reg));
   NOR2_X1 g32007 (.A1(inst_reg[11]),
	.A2(inst_reg[10]),
	.ZN(n_144));
   NOR2_X1 g31977 (.A1(inst_reg[13]),
	.A2(inst_reg[12]),
	.ZN(n_151));
   NAND2_X1 g31976 (.A1(inst_reg[9]),
	.A2(inst_reg[8]),
	.ZN(n_260));
   DFFR_X1 \intrise_reg_reg[0]  (.D(1'b1),
	.RN(intclr_reg[0]),
	.CK(int0_i),
	.Q(UNCONNECTED262),
	.QN(intrise_reg[0]));
   DFFR_X1 \intrise_reg_reg[2]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(int5_i),
	.Q(UNCONNECTED263),
	.QN(intrise_reg[2]));
   DFF_X1 \inc_pc_node_reg[0]  (.D(\pc_reg[0]_2967 ),
	.CK(clk_i),
	.Q(inc_pc_node[0]),
	.QN(UNCONNECTED264));
   DFFR_X1 \intrise_reg_reg[1]  (.D(1'b1),
	.RN(intclr_reg[1]),
	.CK(int4_i),
	.Q(UNCONNECTED265),
	.QN(intrise_reg[1]));
   DFF_X1 rd_eep_sync_reg_reg (.D(rd_eep_ack_i),
	.CK(clk_i),
	.Q(rd_eep_sync_reg),
	.QN(UNCONNECTED266));
   NAND2_X1 g31967 (.A1(aluinp2_reg[5]),
	.A2(aluinp1_reg[5]),
	.ZN(n_49));
   NOR2_X1 g31999 (.A1(aluinp2_reg[5]),
	.A2(aluinp1_reg[5]),
	.ZN(n_67));
   NOR2_X1 g32000 (.A1(aluinp2_reg[2]),
	.A2(aluinp1_reg[2]),
	.ZN(n_61));
   NOR2_X1 g31966 (.A1(inst_reg[3]),
	.A2(inst_reg[2]),
	.ZN(n_288));
   NOR2_X1 g31994 (.A1(inst_reg[2]),
	.A2(inst_reg[1]),
	.ZN(n_110));
   AND2_X1 g31962 (.A1(aluinp2_reg[6]),
	.A2(aluinp1_reg[6]),
	.ZN(n_521));
   NAND2_X1 g31959 (.A1(aluinp2_reg[0]),
	.A2(aluinp1_reg[0]),
	.ZN(n_43));
   AND2_X1 g31997 (.A1(intstart_reg),
	.A2(exec_op_reg),
	.ZN(n_166));
   AND2_X1 g31971 (.A1(aluinp2_reg[3]),
	.A2(aluinp1_reg[3]),
	.ZN(n_417));
   NAND2_X1 g31979 (.A1(pon_rst_n_i),
	.A2(mclr_n_i),
	.ZN(n_106));
   OR2_X1 g32009 (.A1(aluinp2_reg[3]),
	.A2(aluinp1_reg[3]),
	.ZN(n_419));
   NOR2_X1 g32015 (.A1(\pc_reg[1]_2968 ),
	.A2(\pc_reg[0]_2967 ),
	.ZN(n_97));
   OR2_X1 g32013 (.A1(aluinp2_reg[4]),
	.A2(aluinp1_reg[4]),
	.ZN(n_527));
   AND2_X1 g31973 (.A1(aluinp2_reg[4]),
	.A2(aluinp1_reg[4]),
	.ZN(n_537));
   NAND2_X1 g32017 (.A1(pscale_reg[0]),
	.A2(pscale_reg[1]),
	.ZN(n_161));
   NOR2_X1 g32021 (.A1(stack_pnt_reg[2]),
	.A2(stack_pnt_reg[1]),
	.ZN(n_331));
   NOR2_X1 g32023 (.A1(inst_reg[6]),
	.A2(inst_reg[5]),
	.ZN(n_145));
   NOR2_X1 g31975 (.A1(inst_reg[9]),
	.A2(inst_reg[8]),
	.ZN(n_374));
   NAND2_X1 g31978 (.A1(wdt_full_node),
	.A2(wdt_ena_i),
	.ZN(n_461));
   INV_X1 g32078 (.A(int4_i),
	.ZN(n_22));
   INV_X1 g32026 (.A(int5_i),
	.ZN(n_6));
   INV_X1 g32079 (.A(int0_i),
	.ZN(n_4));
   INV_X1 g32035 (.A(int7_i),
	.ZN(n_36));
   INV_X1 g32136 (.A(pon_rst_n_i),
	.ZN(n_159));
   XOR2_X1 g2 (.A(n_973),
	.B(prog_adr_o[12]),
	.Z(n_1164));
   NOR3_X1 g32572 (.A1(n_706),
	.A2(n_640),
	.A3(n_658),
	.ZN(n_1165));
   OR4_X1 g32573 (.A1(n_186),
	.A2(n_293),
	.A3(wdt_full_o),
	.A4(n_106),
	.ZN(startclk_o));
endmodule

