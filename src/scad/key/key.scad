// key

//$fn = 10;

imgSize = 128; //256;

module key(a=10,b=3,x=0,y=0,rot=0,hash="1234567890abcde"){
    aa = a;
    a = .95*a;
    imgSize = 128; //256;
    translate([x,y,0]) 
        rotate([0,0,rot]){
            difference(){
            union(){
                    // head
                    scale([1,1,b/a]) cube(a,center = true);
                    // tail
                    translate([1.55*a,0,0]) scale([2.1,.5,b/a]) cube(a,center = true);
                    // connectors
                    color("red")
                    translate([-aa/2,0,0]) scale([.1,.1,b/a]) cube(a,center = true);
                    color("red")
                    translate([2.5*aa,0,0]) scale([.1,.1,b/a]) cube(a,center = true);
                }
                
                translate([1.55*a,0,.8]) linear_extrude(height=1.0) 
                {
                    text(hash, size = a/15, halign="center", valign="center", font="Arial");
                };
                
                translate([1.1*a,0,-b/2-.8]) linear_extrude(height=1.0) 
                {
                    mirror([0,1,0]) text("Universal Data Key", size = a/10, halign="center", valign="center", font="Arial");
                };
                
                translate([0,0,b/2+.3]) rotate([0,0,0]) scale ([aa/imgSize,aa/imgSize,.01]) surface(file = "CfKA3dsquare_medium_gray.png", invert = true, center = true);
            }
        }
}

keys = ["7bc24367e6d671f78f37fa52baca17042dba3180",
"ac4b084f884808434a41db1a939ae739a318ab7b",
"f3a20ac4151ca9899bce1b79fa757adbea6d10a2",
"cb3785dfc8880c0c9d2a9655c327a6c58c0e247b",
"b5e739f8557228b19091c18a41d186ace9e66a6a",
"3a9abbe083ca6d585efe111b17c357f989925488",
"6301260d7d0dd60a41f8df9af626144a846e2a1f",
"03a4bd2cd3e4cfcedf6a4dfd38316b200ce7ede3",
"ff5e47ee4b9fde8c1daa00d94145fecdc0e3fad2",
"478a417bd29d38d789e473a092d181db3f3eba73",
"ab59afd766fe2e39240fba9b9716f26344a06c5c",
"5fda0f0020b807b7825539449314520473663120",
"229fda86b1d7c61a79a93c4ee816dc0445bb9dc4",
"1ac297ae45299a9745394ad3bed9aca7054cd641",
"cdf17a1a55ddb5af106358966c939a4256f167a0",
"63d6a9b93f1f0439d286b3c558300de84162f461",
"be1c7af3f32fa0ac79ca91b7e6b38d36915edc08",
"f7d82afdbd6cf58fb34d87bfa1cf28a30134ceb8",
"36f66ed8532eb2d3def4ea5d91dfb844fa8fc139",
"925d1119855d6cb1a37e3f5985f5befdcbafdad2",
"dab9b5824c7c34f9665d54ea64056e4ffaf88072",
"a67699d080b4a7e808d2fd0c1649e556aea641f4",
"8ddf1691b84af5e8ae3a0417d0a5af8524ae3e94",
"768689cc11171791fa3ecb9ecd01f318dd4daf81",
"2581ad08fbe027512031831c2c98bc9a717b7500",
"30bcf68fb01d556fd5b5aecfd44ccb1e6bc70b2f",
"30e147518a22688039a90239fc6a04b9a0dad685",
"d39641d5c127cfb889cb77875189e55e0d8aa3ef",
"03dc2b6a00b08bd0ed92437a4b62fed38dc81f08",
"8a6aec169ee9466bb88698ba51aab09437183b9e",
"01bb00f23e29cea1c81795cfa1e9e1305aa51c80",
"0b2c734df35cb26959493eb811c7e33d6980e597",
"f0a31c70a1cd2a70de36524d4b246927aa3508b5",
"ecfd0facc6f4f239865e4e3ba6f2be60f88e719b",
"2efdb6a1c014791feab4a323f0d5e4f25ef7c1f0",
"37acb0cf65b6181432582fd8e35e70592ea175f9",
"934e51edfa5bff5b5762d4c317152d11f4d43b0c",
"b361c2128e3ca12e87a34520769016ea1ea73300",
"3508e4608b20be768a1624a41cf586e1ded33320",
"fb31ab99fb35d4c189e38cbdb9bf503f48d78be3",
"f886cf70bcdfff666bec129690dd6562e2ce113f",
"67d3918ab83455d41e8bbdb3bf87646529dc0245",
"dfa1d8ded3be28877102f92f61313b87db0a3911",
"fff9b9857e2f0bf05a36d58ad146bf40a91d690e",
"c1ca68242b5524aa2ef63cf08879000fe926d1d7",
"3d500d66cd10f36780bd5c8f696b5a5f82b510e5",
"7f3c2d7b9fef5cb54153b74a62672deffb318cbc",
"d5c64442587bfb3f314a0f3dfdd96758e65e4329",
"efb857a402e30e0b5a38bfb4ddd7ae820b015fbf",
"7578849c4070eb6d49af28278ea6d7709959fd14"];

a = 25;

for (k=0,i = [0:2]){
    key(a=a, x=0,y=a*i,hash=keys[k + 2*i]);
    key(a=a, x=a*3,y=(i+.5)*a, rot = 180, hash=keys[k + 2*i+1]);
}
/*
for (k=8, i = [0:7]){
    key(a=a, x=4*a,y=a*i,hash=keys[k + 2*i]);
    key(a=a, x=a*7,y=(i+.5)*a, rot = 180, hash=keys[k + 2*i+1]);
}
*/

    //translate([0,0,2-.8]) rotate([0,0,0]) scale ([a/imgSize,a/imgSize,.004]) surface(file = "CfKA3dsquare.png", invert = true, center = true);
