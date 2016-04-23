/**
 * Created by Max on 16/4/19.
 */
var OffSet = function (x,y) {
    this.x = x || 0;
    this.y = y || 0;
}

var Size = function (w,h) {
    this.width = w || 0;
    this.height = h || 0;
}

var Position = function (x,y) {
    this.x = x || 0;
    this.y = y || 0;
}

var Frame = function (s,p) {
    this.size = s || new Size();
    this.position = p || new Position();
}

var Item = function () {
    this.father = undefined;
    this.refrenceX = undefined;
    this.refrenceY = undefined;
    this.offSet = new OffSet();
    this.size = new Size();
    this.position = new Position();
    this.frame = new Frame();
}

Item.prototype.setOffSet = function (x, y) {
    this.offSet.x = x;
    this.offSet.y = y;
}


Item.prototype.setPosition = function (x, y) {
    this.position.x = x;
    this.position.y = y;
}

Item.prototype.setSize = function (w, h) {
    this.size.width = w;
    this.size.height = h;
}