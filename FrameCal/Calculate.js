/**
 * Created by Max on 16/4/22.
 */
require('RelativeEnum.js');
require('Frame.js');

var calculate = function (item) {
    var size = new Size();
    var father = item.father.size;
    switch (item.refrenceX) {
        case RefrenceX.RefrenceLL:
            item.position.x = item.offSet.x;
            break;
        case RefrenceX.RefrenceLC:
            item.position.x = item.offSet.x + father.size.width / 2;
            break;
        case RefrenceX.RefrenceLR:
            item.position.x = item.offSet.x + father.size.width;
            break;
        case RefrenceX.RefrenceCL:
            item.position.x = item.offSet.x + item.size.width / 2;
            break;
        case RefrenceX.RefrenceCC:
            item.position.x = item.offSet.x + item.size.width / 2 - father.size.width / 2;
            break;
        case RefrenceX.RefrenceCR:
            item.position.x = item.offSet.x + item.size.width / 2 - father.size.width;
            break;
        case RefrenceX.RefrenceRL:
            item.position.x = item.offSet.x + item.size.width;
            break;
        case RefrenceX.RefrenceRC:
            item.position.x = item.offSet.x + item.size.width - father.size.width / 2;
            break;
        case RefrenceX.RefrenceRR:
            item.position.x = item.offSet.x + item.size.width - father.size.width;
            break;
    }

    switch (item.refrenceY) {
        case RefrenceX.RefrenceTT:
            item.position.y = item.offSet.y;
            break;
        case RefrenceX.RefrenceTC:
            item.position.y = item.offSet.y + father.size.height / 2;
            break;
        case RefrenceX.RefrenceTB:
            item.position.y = item.offSet.y + father.size.height;
            break;
        case RefrenceX.RefrenceCT:
            item.position.y = item.offSet.y + item.size.height / 2;
            break;
        case RefrenceX.RefrenceCC:
            item.position.y = item.offSet.y + item.size.height / 2 - father.size.height / 2;
            break;
        case RefrenceX.RefrenceCB:
            item.position.y = item.offSet.y + item.size.height / 2 - father.size.height;
            break;
        case RefrenceX.RefrenceBT:
            item.position.y = item.offSet.y + item.size.height;
            break;
        case RefrenceX.RefrenceBC:
            item.position.y = item.offSet.y + item.size.height - father.size.height / 2;
            break;
        case RefrenceX.RefrenceBB:
            item.position.y = item.offSet.y + item.size.height - father.size.height;
            break;
    }
    return size;
}

var item = new Item();
var size = calculate(item);
print(size.x)

