//任務：卡牌遊戲,換牌步驟
//step01：原來的牌7張，pool可放一張牌
//step02：pool可以秀出來
//step03：發一張牌到pool
//step04：如果pool有牌，要把的牌，放到你點的位置pool
int pool=-1;//-1代表沒有牌
int [] myCard={1,2,3,4,5,6,7};
void setup(){
  size(600, 300);
  PFont font= createFont("標楷體",30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<7; i++){
  //if(myCard[i]==-1) continue;// -1 & continue表示下面指令不執行，回頭重新操作，此行可以改個寫法：if(myCard[i]!=-1){ }，如下
    if(myCard[i]!=-1){
    fill(255); rect(20+i*80, 40, 70, 100);
    fill(0); text(myCard[i], 20+i*80+35,70);
    }
  }
  if(pool != -1){
    fill(255); rect(20+3*80, 180, 70, 100);
    fill(0); text(pool, 20+3*80+35,210);
  }
}
void mousePressed(){
  for(int i=0; i<7; i++){
    if(20+i*80< mouseX && mouseX <20+i*80+70 && 40< mouseY && mouseY <40+100){
      int temp = pool;
      pool = myCard[i];
      myCard[i] = temp;
    }
  }
}
