/**
 * Created by Max on 16/4/22.
 */
require('RelativeEnum.js');
require('Frame.js');

var calculate = function (item) {
    var father = item.father || new Item();
    
    switch (item.refrenceX) {
        case RefrenceX.RefrenceLL:
            item.position.x = item.offSet.x + father.position.x;
            break;
        case RefrenceX.RefrenceLC:
            item.position.x = item.offSet.x + father.size.width / 2 + father.position.x;
            break;
        case RefrenceX.RefrenceLR:
            item.position.x = item.offSet.x + father.size.width + father.position.x;
            break;
        case RefrenceX.RefrenceCL:
            item.position.x = item.offSet.x + item.size.width / 2 + father.position.x;
            break;
        case RefrenceX.RefrenceCC:
            item.position.x = item.offSet.x + item.size.width / 2 - father.size.width / 2 + father.position.x;
            break;
        case RefrenceX.RefrenceCR:
            item.position.x = item.offSet.x + item.size.width / 2 - father.size.width + father.position.x;
            break;
        case RefrenceX.RefrenceRL:
            item.position.x = item.offSet.x + item.size.width + father.position.x;
            break;
        case RefrenceX.RefrenceRC:
            item.position.x = item.offSet.x + item.size.width - father.size.width / 2 + father.position.x;
            break;
        case RefrenceX.RefrenceRR:
            item.position.x = item.offSet.x + item.size.width - father.size.width + father.position.x;
            break;
    }

    switch (item.refrenceY) {
        case RefrenceY.RefrenceTT:
            item.position.y = item.offSet.y + father.position.y;
            break;
        case RefrenceY.RefrenceTC:
            item.position.y = item.offSet.y + father.size.height / 2 + father.position.y;
            break;
        case RefrenceY.RefrenceTB:
            item.position.y = item.offSet.y + father.size.height + father.position.y;
            break;
        case RefrenceY.RefrenceCT:
            item.position.y = item.offSet.y + item.size.height / 2 + father.position.y;
            break;
        case RefrenceY.RefrenceCC:
            item.position.y = item.offSet.y + item.size.height / 2 - father.size.height / 2 + father.position.y;
            break;
        case RefrenceY.RefrenceCB:
            item.position.y = item.offSet.y + item.size.height / 2 - father.size.height + father.position.y;
            break;
        case RefrenceY.RefrenceBT:
            item.position.y = item.offSet.y + item.size.height + father.position.y;
            break;
        case RefrenceY.RefrenceBC:
            item.position.y = item.offSet.y + item.size.height - father.size.height / 2 + father.position.y;
            break;
        case RefrenceY.RefrenceBB:
            item.position.y = item.offSet.y + item.size.height - father.size.height + father.position.y;
            break;
    }
    
    item.frame = new Frame(item.size,item.position);
}