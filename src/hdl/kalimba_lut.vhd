Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity kalimba_lut is
    generic (
        DEPTH : integer := 2048;
        WIDTH : integer := 16
    );
    port (
        clk   : in  std_logic;
        addr  : in  std_logic_vector(10 downto 0);
        dout  : out std_logic_vector(WIDTH-1 downto 0)
    );
end kalimba_lut;

architecture arch of kalimba_lut is
    type lut_array is array(0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
    signal lut: lut_array := (
 x"0000", x"01E6", x"03CD", x"05B2", x"0797", x"097B", x"0B5D", x"0D3D", 
    x"0F1B", x"10F7", x"12D0", x"14A6", x"1679", x"1849", x"1A14", x"1BDC", 
    x"1D9F", x"1F5E", x"2118", x"22CD", x"247D", x"2628", x"27CC", x"296B", 
    x"2B04", x"2C97", x"2E24", x"2FAA", x"312A", x"32A2", x"3414", x"357F", 
    x"36E3", x"3840", x"3995", x"3AE3", x"3C2A", x"3D6A", x"3EA2", x"3FD2", 
    x"40FB", x"421D", x"4337", x"444A", x"4555", x"4659", x"4756", x"484C", 
    x"493A", x"4A21", x"4B01", x"4BDA", x"4CAD", x"4D78", x"4E3D", x"4EFC", 
    x"4FB4", x"5066", x"5111", x"51B7", x"5257", x"52F1", x"5386", x"5415", 
    x"549F", x"5524", x"55A4", x"561F", x"5696", x"5708", x"5776", x"57E0", 
    x"5846", x"58A8", x"5906", x"5962", x"59B9", x"5A0E", x"5A5F", x"5AAE", 
    x"5AFA", x"5B44", x"5B8B", x"5BD0", x"5C12", x"5C53", x"5C91", x"5CCE", 
    x"5D09", x"5D43", x"5D7B", x"5DB2", x"5DE7", x"5E1C", x"5E4F", x"5E81", 
    x"5EB2", x"5EE2", x"5F12", x"5F40", x"5F6E", x"5F9C", x"5FC8", x"5FF4", 
    x"6020", x"604B", x"6075", x"60A0", x"60C9", x"60F2", x"611B", x"6143", 
    x"616B", x"6193", x"61BA", x"61E0", x"6207", x"622C", x"6252", x"6277", 
    x"629B", x"62BF", x"62E3", x"6306", x"6329", x"634B", x"636C", x"638D", 
    x"63AE", x"63CE", x"63ED", x"640C", x"642A", x"6447", x"6464", x"6481", 
    x"649C", x"64B8", x"64D2", x"64EC", x"6505", x"651E", x"6536", x"654D", 
    x"6564", x"657A", x"6590", x"65A5", x"65BA", x"65CE", x"65E2", x"65F5", 
    x"6608", x"661B", x"662D", x"663F", x"6650", x"6662", x"6673", x"6684", 
    x"6695", x"66A6", x"66B7", x"66C7", x"66D8", x"66E9", x"66FA", x"670B", 
    x"671D", x"672F", x"6741", x"6753", x"6766", x"6779", x"678D", x"67A1", 
    x"67B6", x"67CB", x"67E1", x"67F8", x"6810", x"6828", x"6840", x"685A", 
    x"6874", x"6890", x"68AC", x"68C9", x"68E6", x"6905", x"6925", x"6945", 
    x"6966", x"6989", x"69AC", x"69D0", x"69F5", x"6A1A", x"6A41", x"6A68", 
    x"6A91", x"6ABA", x"6AE4", x"6B0F", x"6B3A", x"6B66", x"6B93", x"6BC1", 
    x"6BEF", x"6C1E", x"6C4D", x"6C7D", x"6CAE", x"6CDF", x"6D10", x"6D42", 
    x"6D74", x"6DA6", x"6DD9", x"6E0C", x"6E3F", x"6E72", x"6EA5", x"6ED9", 
    x"6F0C", x"6F40", x"6F73", x"6FA7", x"6FDA", x"700D", x"7040", x"7073", 
    x"70A5", x"70D7", x"7109", x"713B", x"716C", x"719D", x"71CE", x"71FE", 
    x"722E", x"725E", x"728D", x"72BB", x"72EA", x"7317", x"7345", x"7372", 
    x"739E", x"73CA", x"73F6", x"7421", x"744C", x"7477", x"74A1", x"74CB", 
    x"74F4", x"751D", x"7546", x"756F", x"7597", x"75BF", x"75E7", x"760E", 
    x"7636", x"765D", x"7684", x"76AB", x"76D2", x"76F9", x"7720", x"7747", 
    x"776E", x"7794", x"77BB", x"77E2", x"7809", x"7830", x"7858", x"787F", 
    x"78A7", x"78CE", x"78F6", x"791E", x"7946", x"796E", x"7997", x"79BF", 
    x"79E8", x"7A11", x"7A3A", x"7A63", x"7A8C", x"7AB5", x"7ADE", x"7B08", 
    x"7B31", x"7B5B", x"7B84", x"7BAD", x"7BD7", x"7C00", x"7C29", x"7C51", 
    x"7C7A", x"7CA2", x"7CCA", x"7CF1", x"7D19", x"7D3F", x"7D65", x"7D8B", 
    x"7DB0", x"7DD4", x"7DF8", x"7E1B", x"7E3D", x"7E5E", x"7E7E", x"7E9D", 
    x"7EBC", x"7ED9", x"7EF5", x"7F10", x"7F2A", x"7F42", x"7F59", x"7F6F", 
    x"7F83", x"7F96", x"7FA8", x"7FB8", x"7FC6", x"7FD3", x"7FDE", x"7FE8", 
    x"7FF0", x"7FF6", x"7FFB", x"7FFD", x"7FFE", x"7FFE", x"7FFB", x"7FF7", 
    x"7FF1", x"7FEA", x"7FE0", x"7FD5", x"7FC8", x"7FBA", x"7FA9", x"7F97", 
    x"7F83", x"7F6E", x"7F57", x"7F3E", x"7F24", x"7F09", x"7EEC", x"7ECD", 
    x"7EAD", x"7E8C", x"7E69", x"7E45", x"7E20", x"7DFA", x"7DD2", x"7DAA", 
    x"7D81", x"7D56", x"7D2B", x"7CFF", x"7CD2", x"7CA5", x"7C77", x"7C48", 
    x"7C19", x"7BE9", x"7BB9", x"7B89", x"7B58", x"7B27", x"7AF7", x"7AC6", 
    x"7A94", x"7A63", x"7A33", x"7A02", x"79D1", x"79A1", x"7971", x"7941", 
    x"7912", x"78E3", x"78B4", x"7886", x"7859", x"782C", x"77FF", x"77D4", 
    x"77A9", x"777E", x"7755", x"772C", x"7704", x"76DC", x"76B6", x"7690", 
    x"766B", x"7646", x"7623", x"7600", x"75DE", x"75BD", x"759D", x"757D", 
    x"755E", x"7540", x"7523", x"7507", x"74EB", x"74D0", x"74B5", x"749B", 
    x"7482", x"7469", x"7451", x"743A", x"7423", x"740D", x"73F7", x"73E2", 
    x"73CD", x"73B8", x"73A4", x"7390", x"737D", x"7369", x"7356", x"7344", 
    x"7331", x"731F", x"730D", x"72FB", x"72E9", x"72D8", x"72C6", x"72B4", 
    x"72A3", x"7291", x"7280", x"726E", x"725D", x"724B", x"7239", x"7228", 
    x"7216", x"7204", x"71F2", x"71E0", x"71CD", x"71BB", x"71A8", x"7196", 
    x"7183", x"7170", x"715C", x"7149", x"7136", x"7122", x"710E", x"70FA", 
    x"70E6", x"70D1", x"70BD", x"70A8", x"7093", x"707E", x"7069", x"7054", 
    x"703F", x"7029", x"7013", x"6FFE", x"6FE8", x"6FD2", x"6FBB", x"6FA5", 
    x"6F8F", x"6F78", x"6F61", x"6F4B", x"6F34", x"6F1D", x"6F06", x"6EEE", 
    x"6ED7", x"6EBF", x"6EA8", x"6E90", x"6E78", x"6E60", x"6E48", x"6E2F", 
    x"6E17", x"6DFE", x"6DE5", x"6DCC", x"6DB2", x"6D99", x"6D7F", x"6D65", 
    x"6D4A", x"6D30", x"6D15", x"6CFA", x"6CDE", x"6CC2", x"6CA6", x"6C89", 
    x"6C6C", x"6C4F", x"6C31", x"6C13", x"6BF4", x"6BD5", x"6BB6", x"6B96", 
    x"6B75", x"6B54", x"6B33", x"6B11", x"6AEE", x"6ACB", x"6AA7", x"6A83", 
    x"6A5E", x"6A38", x"6A12", x"69EB", x"69C4", x"699C", x"6973", x"694A", 
    x"6920", x"68F5", x"68CA", x"689E", x"6872", x"6845", x"6817", x"67E9", 
    x"67BA", x"678A", x"675A", x"6729", x"66F7", x"66C5", x"6693", x"665F", 
    x"662B", x"65F7", x"65C2", x"658D", x"6556", x"6520", x"64E9", x"64B1", 
    x"6479", x"6440", x"6407", x"63CE", x"6394", x"6359", x"631E", x"62E3", 
    x"62A7", x"626B", x"622F", x"61F2", x"61B5", x"6177", x"6139", x"60FB", 
    x"60BC", x"607D", x"603E", x"5FFE", x"5FBE", x"5F7E", x"5F3D", x"5EFC", 
    x"5EBB", x"5E79", x"5E37", x"5DF4", x"5DB2", x"5D6F", x"5D2B", x"5CE7", 
    x"5CA3", x"5C5E", x"5C19", x"5BD4", x"5B8E", x"5B47", x"5B00", x"5AB9", 
    x"5A71", x"5A29", x"59E0", x"5997", x"594D", x"5903", x"58B8", x"586C", 
    x"5820", x"57D3", x"5786", x"5737", x"56E9", x"5699", x"5649", x"55F8", 
    x"55A7", x"5554", x"5501", x"54AE", x"5459", x"5404", x"53AE", x"5357", 
    x"5300", x"52A7", x"524E", x"51F4", x"519A", x"513E", x"50E2", x"5086", 
    x"5028", x"4FCA", x"4F6B", x"4F0B", x"4EAB", x"4E4A", x"4DE8", x"4D86", 
    x"4D23", x"4CBF", x"4C5B", x"4BF7", x"4B92", x"4B2D", x"4AC7", x"4A61", 
    x"49FA", x"4993", x"492C", x"48C5", x"485E", x"47F6", x"478E", x"4727", 
    x"46BF", x"4657", x"45F0", x"4588", x"4521", x"44BA", x"4453", x"43ED", 
    x"4387", x"4321", x"42BC", x"4258", x"41F4", x"4191", x"412E", x"40CC", 
    x"406B", x"400B", x"3FAB", x"3F4D", x"3EEF", x"3E93", x"3E37", x"3DDD", 
    x"3D83", x"3D2B", x"3CD4", x"3C7E", x"3C29", x"3BD6", x"3B84", x"3B33", 
    x"3AE4", x"3A96", x"3A49", x"39FE", x"39B5", x"396C", x"3925", x"38E0", 
    x"389C", x"3859", x"3818", x"37D9", x"379B", x"375E", x"3723", x"36E9", 
    x"36B1", x"367A", x"3645", x"3611", x"35DF", x"35AE", x"357E", x"3550", 
    x"3523", x"34F7", x"34CC", x"34A3", x"347B", x"3455", x"342F", x"340B", 
    x"33E8", x"33C6", x"33A5", x"3385", x"3366", x"3348", x"332B", x"330F", 
    x"32F3", x"32D9", x"32C0", x"32A7", x"328F", x"3278", x"3261", x"324B", 
    x"3236", x"3222", x"320E", x"31FA", x"31E7", x"31D5", x"31C3", x"31B2", 
    x"31A1", x"3190", x"3180", x"3170", x"3160", x"3151", x"3142", x"3134", 
    x"3125", x"3117", x"3109", x"30FB", x"30EE", x"30E0", x"30D3", x"30C6", 
    x"30B8", x"30AB", x"309F", x"3092", x"3085", x"3078", x"306B", x"305F", 
    x"3052", x"3045", x"3038", x"302C", x"301F", x"3012", x"3005", x"2FF8", 
    x"2FEB", x"2FDE", x"2FD0", x"2FC3", x"2FB5", x"2FA7", x"2F99", x"2F8B", 
    x"2F7C", x"2F6D", x"2F5E", x"2F4F", x"2F40", x"2F30", x"2F20", x"2F0F", 
    x"2EFE", x"2EED", x"2EDB", x"2EC9", x"2EB6", x"2EA3", x"2E8F", x"2E7B", 
    x"2E66", x"2E51", x"2E3B", x"2E25", x"2E0D", x"2DF5", x"2DDD", x"2DC3", 
    x"2DA9", x"2D8E", x"2D72", x"2D55", x"2D38", x"2D19", x"2CFA", x"2CD9", 
    x"2CB8", x"2C95", x"2C72", x"2C4D", x"2C27", x"2C00", x"2BD8", x"2BAF", 
    x"2B84", x"2B59", x"2B2C", x"2AFE", x"2ACE", x"2A9D", x"2A6B", x"2A37", 
    x"2A03", x"29CC", x"2995", x"295C", x"2921", x"28E6", x"28A8", x"286A", 
    x"282A", x"27E8", x"27A5", x"2761", x"271B", x"26D4", x"268B", x"2641", 
    x"25F5", x"25A8", x"255A", x"250A", x"24B9", x"2467", x"2413", x"23BE", 
    x"2368", x"2310", x"22B7", x"225D", x"2202", x"21A5", x"2148", x"20E9", 
    x"2089", x"2028", x"1FC6", x"1F63", x"1EFF", x"1E9A", x"1E34", x"1DCD", 
    x"1D65", x"1CFD", x"1C94", x"1C2A", x"1BBF", x"1B53", x"1AE7", x"1A7B", 
    x"1A0D", x"19A0", x"1931", x"18C3", x"1853", x"17E4", x"1774", x"1704", 
    x"1693", x"1623", x"15B2", x"1541", x"14CF", x"145E", x"13ED", x"137B", 
    x"130A", x"1299", x"1227", x"11B6", x"1145", x"10D4", x"1064", x"0FF4", 
    x"0F84", x"0F14", x"0EA5", x"0E36", x"0DC7", x"0D59", x"0CEC", x"0C7F", 
    x"0C12", x"0BA6", x"0B3B", x"0AD0", x"0A67", x"09FD", x"0995", x"092D", 
    x"08C7", x"0861", x"07FC", x"0798", x"0735", x"06D3", x"0672", x"0612", 
    x"05B3", x"0555", x"04F8", x"049D", x"0443", x"03EA", x"0392", x"033C", 
    x"02E7", x"0294", x"0242", x"01F2", x"01A3", x"0155", x"010A", x"00C0", 
    x"0077", x"0030", x"FFEC", x"FFA9", x"FF67", x"FF28", x"FEEA", x"FEAE", 
    x"FE74", x"FE3C", x"FE06", x"FDD2", x"FDA0", x"FD70", x"FD42", x"FD16", 
    x"FCED", x"FCC5", x"FCA0", x"FC7D", x"FC5C", x"FC3D", x"FC20", x"FC06", 
    x"FBEE", x"FBD8", x"FBC4", x"FBB3", x"FBA4", x"FB97", x"FB8D", x"FB84", 
    x"FB7E", x"FB7A", x"FB79", x"FB79", x"FB7C", x"FB80", x"FB87", x"FB90", 
    x"FB9B", x"FBA9", x"FBB8", x"FBC9", x"FBDC", x"FBF1", x"FC07", x"FC20", 
    x"FC3A", x"FC56", x"FC74", x"FC93", x"FCB3", x"FCD6", x"FCF9", x"FD1E", 
    x"FD44", x"FD6C", x"FD94", x"FDBE", x"FDE8", x"FE14", x"FE40", x"FE6D", 
    x"FE9B", x"FEC9", x"FEF8", x"FF28", x"FF58", x"FF88", x"FFB8", x"FFE8", 
    x"0018", x"0048", x"0078", x"00A8", x"00D8", x"0108", x"0137", x"0165", 
    x"0193", x"01C0", x"01EC", x"0218", x"0242", x"026C", x"0294", x"02BC", 
    x"02E2", x"0307", x"032A", x"034D", x"036D", x"038C", x"03AA", x"03C6", 
    x"03E0", x"03F9", x"040F", x"0424", x"0437", x"0448", x"0457", x"0465", 
    x"0470", x"0479", x"0480", x"0484", x"0487", x"0487", x"0486", x"0482", 
    x"047C", x"0473", x"0469", x"045C", x"044D", x"043C", x"0428", x"0412", 
    x"03FA", x"03E0", x"03C3", x"03A4", x"0383", x"0360", x"033B", x"0313", 
    x"02EA", x"02BE", x"0290", x"0260", x"022E", x"01FA", x"01C4", x"018C", 
    x"0152", x"0116", x"00D8", x"0099", x"0057", x"0014", x"FFD0", x"FF89", 
    x"FF40", x"FEF6", x"FEAB", x"FE5D", x"FE0E", x"FDBE", x"FD6C", x"FD19", 
    x"FCC4", x"FC6E", x"FC16", x"FBBD", x"FB63", x"FB08", x"FAAB", x"FA4D", 
    x"F9EE", x"F98E", x"F92D", x"F8CB", x"F868", x"F804", x"F79F", x"F739", 
    x"F6D3", x"F66B", x"F603", x"F599", x"F530", x"F4C5", x"F45A", x"F3EE", 
    x"F381", x"F314", x"F2A7", x"F239", x"F1CA", x"F15B", x"F0EC", x"F07C", 
    x"F00C", x"EF9C", x"EF2C", x"EEBB", x"EE4A", x"EDD9", x"ED67", x"ECF6", 
    x"EC85", x"EC13", x"EBA2", x"EB31", x"EABF", x"EA4E", x"E9DD", x"E96D", 
    x"E8FC", x"E88C", x"E81C", x"E7AD", x"E73D", x"E6CF", x"E660", x"E5F3", 
    x"E585", x"E519", x"E4AD", x"E441", x"E3D6", x"E36C", x"E303", x"E29B", 
    x"E233", x"E1CC", x"E166", x"E101", x"E09D", x"E03A", x"DFD8", x"DF77", 
    x"DF17", x"DEB8", x"DE5B", x"DDFE", x"DDA3", x"DD49", x"DCF0", x"DC98", 
    x"DC42", x"DBED", x"DB99", x"DB47", x"DAF6", x"DAA6", x"DA58", x"DA0B", 
    x"D9BF", x"D975", x"D92C", x"D8E5", x"D89F", x"D85B", x"D818", x"D7D6", 
    x"D796", x"D758", x"D71A", x"D6DF", x"D6A4", x"D66B", x"D634", x"D5FD", 
    x"D5C9", x"D595", x"D563", x"D532", x"D502", x"D4D4", x"D4A7", x"D47C", 
    x"D451", x"D428", x"D400", x"D3D9", x"D3B3", x"D38E", x"D36B", x"D348", 
    x"D327", x"D306", x"D2E7", x"D2C8", x"D2AB", x"D28E", x"D272", x"D257", 
    x"D23D", x"D223", x"D20B", x"D1F3", x"D1DB", x"D1C5", x"D1AF", x"D19A", 
    x"D185", x"D171", x"D15D", x"D14A", x"D137", x"D125", x"D113", x"D102", 
    x"D0F1", x"D0E0", x"D0D0", x"D0C0", x"D0B1", x"D0A2", x"D093", x"D084", 
    x"D075", x"D067", x"D059", x"D04B", x"D03D", x"D030", x"D022", x"D015", 
    x"D008", x"CFFB", x"CFEE", x"CFE1", x"CFD4", x"CFC8", x"CFBB", x"CFAE", 
    x"CFA1", x"CF95", x"CF88", x"CF7B", x"CF6E", x"CF61", x"CF55", x"CF48", 
    x"CF3A", x"CF2D", x"CF20", x"CF12", x"CF05", x"CEF7", x"CEE9", x"CEDB", 
    x"CECC", x"CEBE", x"CEAF", x"CEA0", x"CE90", x"CE80", x"CE70", x"CE5F", 
    x"CE4E", x"CE3D", x"CE2B", x"CE19", x"CE06", x"CDF2", x"CDDE", x"CDCA", 
    x"CDB5", x"CD9F", x"CD88", x"CD71", x"CD59", x"CD40", x"CD27", x"CD0D", 
    x"CCF1", x"CCD5", x"CCB8", x"CC9A", x"CC7B", x"CC5B", x"CC3A", x"CC18", 
    x"CBF5", x"CBD1", x"CBAB", x"CB85", x"CB5D", x"CB34", x"CB09", x"CADD", 
    x"CAB0", x"CA82", x"CA52", x"CA21", x"C9EF", x"C9BB", x"C986", x"C94F", 
    x"C917", x"C8DD", x"C8A2", x"C865", x"C827", x"C7E8", x"C7A7", x"C764", 
    x"C720", x"C6DB", x"C694", x"C64B", x"C602", x"C5B7", x"C56A", x"C51C", 
    x"C4CD", x"C47C", x"C42A", x"C3D7", x"C382", x"C32C", x"C2D5", x"C27D", 
    x"C223", x"C1C9", x"C16D", x"C111", x"C0B3", x"C055", x"BFF5", x"BF95", 
    x"BF34", x"BED2", x"BE6F", x"BE0C", x"BDA8", x"BD44", x"BCDF", x"BC79", 
    x"BC13", x"BBAD", x"BB46", x"BADF", x"BA78", x"BA10", x"B9A9", x"B941", 
    x"B8D9", x"B872", x"B80A", x"B7A2", x"B73B", x"B6D4", x"B66D", x"B606", 
    x"B59F", x"B539", x"B4D3", x"B46E", x"B409", x"B3A5", x"B341", x"B2DD", 
    x"B27A", x"B218", x"B1B6", x"B155", x"B0F5", x"B095", x"B036", x"AFD8", 
    x"AF7A", x"AF1E", x"AEC2", x"AE66", x"AE0C", x"ADB2", x"AD59", x"AD00", 
    x"ACA9", x"AC52", x"ABFC", x"ABA7", x"AB52", x"AAFF", x"AAAC", x"AA59", 
    x"AA08", x"A9B7", x"A967", x"A917", x"A8C9", x"A87A", x"A82D", x"A7E0", 
    x"A794", x"A748", x"A6FD", x"A6B3", x"A669", x"A620", x"A5D7", x"A58F", 
    x"A547", x"A500", x"A4B9", x"A472", x"A42C", x"A3E7", x"A3A2", x"A35D", 
    x"A319", x"A2D5", x"A291", x"A24E", x"A20C", x"A1C9", x"A187", x"A145", 
    x"A104", x"A0C3", x"A082", x"A042", x"A002", x"9FC2", x"9F83", x"9F44", 
    x"9F05", x"9EC7", x"9E89", x"9E4B", x"9E0E", x"9DD1", x"9D95", x"9D59", 
    x"9D1D", x"9CE2", x"9CA7", x"9C6C", x"9C32", x"9BF9", x"9BC0", x"9B87", 
    x"9B4F", x"9B17", x"9AE0", x"9AAA", x"9A73", x"9A3E", x"9A09", x"99D5", 
    x"99A1", x"996D", x"993B", x"9909", x"98D7", x"98A6", x"9876", x"9846", 
    x"9817", x"97E9", x"97BB", x"978E", x"9762", x"9736", x"970B", x"96E0", 
    x"96B6", x"968D", x"9664", x"963C", x"9615", x"95EE", x"95C8", x"95A2", 
    x"957D", x"9559", x"9535", x"9512", x"94EF", x"94CD", x"94AC", x"948B", 
    x"946A", x"944A", x"942B", x"940C", x"93ED", x"93CF", x"93B1", x"9394", 
    x"9377", x"935A", x"933E", x"9322", x"9306", x"92EB", x"92D0", x"92B6", 
    x"929B", x"9281", x"9267", x"924E", x"9234", x"921B", x"9202", x"91E9", 
    x"91D1", x"91B8", x"91A0", x"9188", x"9170", x"9158", x"9141", x"9129", 
    x"9112", x"90FA", x"90E3", x"90CC", x"90B5", x"909F", x"9088", x"9071", 
    x"905B", x"9045", x"902E", x"9018", x"9002", x"8FED", x"8FD7", x"8FC1", 
    x"8FAC", x"8F97", x"8F82", x"8F6D", x"8F58", x"8F43", x"8F2F", x"8F1A", 
    x"8F06", x"8EF2", x"8EDE", x"8ECA", x"8EB7", x"8EA4", x"8E90", x"8E7D", 
    x"8E6A", x"8E58", x"8E45", x"8E33", x"8E20", x"8E0E", x"8DFC", x"8DEA", 
    x"8DD8", x"8DC7", x"8DB5", x"8DA3", x"8D92", x"8D80", x"8D6F", x"8D5D", 
    x"8D4C", x"8D3A", x"8D28", x"8D17", x"8D05", x"8CF3", x"8CE1", x"8CCF", 
    x"8CBC", x"8CAA", x"8C97", x"8C83", x"8C70", x"8C5C", x"8C48", x"8C33", 
    x"8C1E", x"8C09", x"8BF3", x"8BDD", x"8BC6", x"8BAF", x"8B97", x"8B7E", 
    x"8B65", x"8B4B", x"8B30", x"8B15", x"8AF9", x"8ADD", x"8AC0", x"8AA2", 
    x"8A83", x"8A63", x"8A43", x"8A22", x"8A00", x"89DD", x"89BA", x"8995", 
    x"8970", x"894A", x"8924", x"88FC", x"88D4", x"88AB", x"8882", x"8857", 
    x"882C", x"8801", x"87D4", x"87A7", x"877A", x"874C", x"871D", x"86EE", 
    x"86BF", x"868F", x"865F", x"862F", x"85FE", x"85CD", x"859D", x"856C", 
    x"853A", x"8509", x"84D9", x"84A8", x"8477", x"8447", x"8417", x"83E7", 
    x"83B8", x"8389", x"835B", x"832E", x"8301", x"82D5", x"82AA", x"827F", 
    x"8256", x"822E", x"8206", x"81E0", x"81BB", x"8197", x"8174", x"8153", 
    x"8133", x"8114", x"80F7", x"80DC", x"80C2", x"80A9", x"8092", x"807D", 
    x"8069", x"8057", x"8046", x"8038", x"802B", x"8020", x"8016", x"800F", 
    x"8009", x"8005", x"8002", x"8001", x"8003", x"8005", x"800A", x"8010", 
    x"8018", x"8022", x"802D", x"803A", x"8048", x"8058", x"806A", x"807D", 
    x"8091", x"80A7", x"80BE", x"80D6", x"80F0", x"810B", x"8127", x"8144", 
    x"8163", x"8182", x"81A2", x"81C3", x"81E5", x"8208", x"822C", x"8250", 
    x"8275", x"829B", x"82C1", x"82E7", x"830F", x"8336", x"835E", x"8386", 
    x"83AF", x"83D7", x"8400", x"8429", x"8453", x"847C", x"84A5", x"84CF", 
    x"84F8", x"8522", x"854B", x"8574", x"859D", x"85C6", x"85EF", x"8618", 
    x"8641", x"8669", x"8692", x"86BA", x"86E2", x"870A", x"8732", x"8759", 
    x"8781", x"87A8", x"87D0", x"87F7", x"881E", x"8845", x"886C", x"8892", 
    x"88B9", x"88E0", x"8907", x"892E", x"8955", x"897C", x"89A3", x"89CA", 
    x"89F2", x"8A19", x"8A41", x"8A69", x"8A91", x"8ABA", x"8AE3", x"8B0C", 
    x"8B35", x"8B5F", x"8B89", x"8BB4", x"8BDF", x"8C0A", x"8C36", x"8C62", 
    x"8C8E", x"8CBB", x"8CE9", x"8D16", x"8D45", x"8D73", x"8DA2", x"8DD2", 
    x"8E02", x"8E32", x"8E63", x"8E94", x"8EC5", x"8EF7", x"8F29", x"8F5B", 
    x"8F8D", x"8FC0", x"8FF3", x"9026", x"9059", x"908D", x"90C0", x"90F4", 
    x"9127", x"915B", x"918E", x"91C1", x"91F4", x"9227", x"925A", x"928C", 
    x"92BE", x"92F0", x"9321", x"9352", x"9383", x"93B3", x"93E2", x"9411", 
    x"943F", x"946D", x"949A", x"94C6", x"94F1", x"951C", x"9546", x"956F", 
    x"9598", x"95BF", x"95E6", x"960B", x"9630", x"9654", x"9677", x"969A", 
    x"96BB", x"96DB", x"96FB", x"971A", x"9737", x"9754", x"9770", x"978C", 
    x"97A6", x"97C0", x"97D8", x"97F0", x"9808", x"981F", x"9835", x"984A", 
    x"985F", x"9873", x"9887", x"989A", x"98AD", x"98BF", x"98D1", x"98E3", 
    x"98F5", x"9906", x"9917", x"9928", x"9939", x"9949", x"995A", x"996B", 
    x"997C", x"998D", x"999E", x"99B0", x"99C1", x"99D3", x"99E5", x"99F8", 
    x"9A0B", x"9A1E", x"9A32", x"9A46", x"9A5B", x"9A70", x"9A86", x"9A9C", 
    x"9AB3", x"9ACA", x"9AE2", x"9AFB", x"9B14", x"9B2E", x"9B48", x"9B64", 
    x"9B7F", x"9B9C", x"9BB9", x"9BD6", x"9BF4", x"9C13", x"9C32", x"9C52", 
    x"9C73", x"9C94", x"9CB5", x"9CD7", x"9CFA", x"9D1D", x"9D41", x"9D65", 
    x"9D89", x"9DAE", x"9DD4", x"9DF9", x"9E20", x"9E46", x"9E6D", x"9E95", 
    x"9EBD", x"9EE5", x"9F0E", x"9F37", x"9F60", x"9F8B", x"9FB5", x"9FE0", 
    x"A00C", x"A038", x"A064", x"A092", x"A0C0", x"A0EE", x"A11E", x"A14E", 
    x"A17F", x"A1B1", x"A1E4", x"A219", x"A24E", x"A285", x"A2BD", x"A2F7", 
    x"A332", x"A36F", x"A3AD", x"A3EE", x"A430", x"A475", x"A4BC", x"A506", 
    x"A552", x"A5A1", x"A5F2", x"A647", x"A69E", x"A6FA", x"A758", x"A7BA", 
    x"A820", x"A88A", x"A8F8", x"A96A", x"A9E1", x"AA5C", x"AADC", x"AB61", 
    x"ABEB", x"AC7A", x"AD0F", x"ADA9", x"AE49", x"AEEF", x"AF9A", x"B04C", 
    x"B104", x"B1C3", x"B288", x"B353", x"B426", x"B4FF", x"B5DF", x"B6C6", 
    x"B7B4", x"B8AA", x"B9A7", x"BAAB", x"BBB6", x"BCC9", x"BDE3", x"BF05", 
    x"C02E", x"C15E", x"C296", x"C3D6", x"C51D", x"C66B", x"C7C0", x"C91D", 
    x"CA81", x"CBEC", x"CD5E", x"CED6", x"D056", x"D1DC", x"D369", x"D4FC", 
    x"D695", x"D834", x"D9D8", x"DB83", x"DD33", x"DEE8", x"E0A2", x"E261", 
    x"E424", x"E5EC", x"E7B7", x"E987", x"EB5A", x"ED30", x"EF09", x"F0E5", 
    x"F2C3", x"F4A3", x"F685", x"F869", x"FA4E", x"FC33", x"FE1A", x"0000"



    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            dout <= lut(to_integer(unsigned(addr)));
        end if;
    end process;
end arch;
