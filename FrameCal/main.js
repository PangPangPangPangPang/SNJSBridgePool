/**
 * Created by Max on 16/4/23.
 */

require('Calculate');

function test() {
    var father = new Item();
    father.offSet = new OffSet(1,2);
    father.setPosition(20,10);
    father.size = new Size(10,20);
    var item = new Item();
    item.father = father;
    item.refrenceX = RefrenceX.RefrenceLL;
    item.refrenceY = RefrenceY.RefrenceTT;
    item.setSize(10,10);
    item.setOffSet(10,30);
    calculate(item);
    print(item.frame.position.x);
    print(item.position.y);
    return item.frame;
}