/**
 * Created by Max on 16/4/22.
 */
require('RelativeEnum.js');
require('Frame.js');

var calculate = function (item) {
    var size = new Size(1,2,3,4);
    return size;
}

var item = new Item();
var size = calculate(item);
print(size.x)

