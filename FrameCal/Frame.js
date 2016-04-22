/**
 * Created by Max on 16/4/19.
 */
var OffSet = function (x,y) {
    this.x = x || 0;
    this.y = y || 0;
}

var Size = function (x,y,w,h) {
    this.x = x || 0;
    this.y = y || 0;
    this.w = w || 0;
    this.h = h || 0;

}

var Item = function () {
    this.father = undefined;
    this.refrenceX = undefined;
    this.refrenceY = undefined;
    this.offSet = new OffSet();
    this.size = new Size();
}

Item.prototype.offSet = function (x, y) {
    this.offSet.x = x;
    this.offSet.y = y;
}

Item.prototype.father = function (father) {
    this.father = father;
}
