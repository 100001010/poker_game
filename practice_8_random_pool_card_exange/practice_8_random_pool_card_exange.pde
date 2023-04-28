//四种花色分别为黑桃♠（piques，又名葵扇）、紅心♥（cœurs，又名红桃）、梅花♣（trèfles，又名草花）、方块♦（carreaux，又名菱形、鑽石、紅磚、磚塊、階磚或方片，中國川渝地区称为"巴片"），黑桃和梅花為黑色，紅心和方块為红色。
//https://www.youtube.com/watch?v=7C8ZCVtKMsk教學網站
//https://zhuanlan.zhihu.com/p/259580884
int peopleNumMax = 3;
String[][][] people =new String [peopleNumMax][5][2];//[number][card][deck];
String[] faces ={
   "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
   "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
   "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K", 
   "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",};  
String [] object ={"金錢財富","慈善愛心","公平正直","別緻精彩"};//[]為陣列，黑桃：金錢財富,紅心：慈悲愛心,方塊：公平正義,梅花：別緻精彩，依序編為0,1,2,3號
void setup(){ //void寫程式碼
  size(1300,700);//設定桌面大小
  background(#FAFCDB);//設定桌面背景顏色
  stroke(#DDF5A3);//筆觸顏色為淺綠色
  print(PFont.list());
  PFont font= createFont("PingFangTC-Light",30);//font：字體；建立一個字形的變數。(PFont是變數名稱)
  textFont(font);//套用字型；createFont("字體",大小);設定內建的一個字型。另一種讀字體檔的方法loadFont("字體檔案"); 
  licensing();
}

void licensing(){
  myShuffle();
  String deck = "1";
  int deckCard=0;
  for(int number=0;number<peopleNumMax;number++){
    for(int numberCard=0;numberCard<5;numberCard++){
      deckCard++;
      if(deckCard==52){
        myShuffle();
        deckCard=0;
        deck+=1;
      }     
      people[number][numberCard][0]=faces[deckCard];
      people[number][numberCard][1]= deck;
    }
  } 
}
void myShuffle(){ 
  for(int i=0;i<1000;i++){
    int a = int(random(52));
    int b = int(random(52));
    //目標：faces[a] vs. faces[b];
    String temp = faces[a]; //牌面a倒入temp
    faces[a] = faces[b]; //牌面b倒入牌面a
    faces[b] = temp; //temp倒入牌面b,ab兩牌面完成交換
  }
  //int(random(數字))表示隨機取小於該數字以下整數，所以是0...12，要加1
} //洗牌的英文Shuffle,可以再新增一個void mousePressed(){}就可以按一下就洗牌
int peopleNum=0;
 //<>// //<>// //<>//
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      peopleNum ++ ;
    } else if (keyCode == DOWN) {
      peopleNum--;
    } 
  }
  if(peopleNum>peopleNumMax-1||peopleNum<0)
    peopleNum=0;
}

String face1, face2, face3, face4, face5, face6, face7,face8;
String object1, object2, object3, object4;
int W=peopleNumMax;//兩張重疊卡片寬度差

void draw(){//使用函式，畫七張卡
  int x=150,y=80;
  for(int i=0;i<5;i++)
    drawPokerCard(  x+=150,y,people[peopleNum][i][0]);
 }//牌面：黑桃Spade,紅心Heart,方塊Diamond,梅花Club

void drawPokerCard(int x, int y, String face){
  //外掛rawPokerCard程式，設定參數值為字串string，字串放在牌面face上
  fill(255);//最下層牌面設定為白色
  rect(x-W/2,y-W/2,120+W,200+W,18);//畫第一個撲克牌(左側X座標點，左側Y座標點，寬度，長度，幅度值)
  fill(#B9FFB4);//第二層牌面底色淺綠色，填充圖形顏色，要寫在圖形前面
  rect(x,y,120,200,18);//幅度值18
  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0011);//變數 . indexOf("字")可以測變數裡面有沒有這個字
  else fill (0);//變數.indexOf( "字") == -1表示變數裡沒有這個字
  textSize(35);//設定字體大小
  text(face,x+9,y+40);//字的位置
  fill(#E9FCB8);//第三層牌面底色淺淺綠色，填充圖形顏色，要寫在圖形前面
  rect(x,y+60,120,140,0,0,18,18);//設定邊角幅度rect ( x ,  y , 寬, 高,  左上圓滑, 右上圓滑, 右下圓滑, 左下圓滑); 對各邊設定
  fill(0);//黑色字
  textSize(25);
  if(face.indexOf("黑桃")==0) text(object[0], x+10,y+130);//變數 . indexOf("字")可以測變數裡面有沒有這個字，沒有為-1，0,1,2,3,為出現順序現的編號
  else fill(#F72007); 
       if(face.indexOf("紅心")==0) text(object[1], x+10,y+130);//不理解該字的使用方式，如"indexOf",直接對該字按右鍵看說明，了解該指令的使用方式
       else fill(#2F0EC9);
            if(face.indexOf("方塊")==0) text(object[2], x+10,y+130);
            else fill(#DA1BDB);
                 if(face.indexOf("梅花")==0) text(object[3], x+10,y+130);            
}
