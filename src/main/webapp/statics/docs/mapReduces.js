map1=function(){
    for(var i in this.productSelectedList){
        emit(this.productSelectedList[i].productSeries.$id,this.productSelectedList[i].amount);
    }
}
reduce1=function(key,emits){
    var amount=0;

    for(var i in emits){
        amount+=emits[i];
    }
    return amount;
}
mr=db.runCommand({"mapreduce":"order","map":map1,"reduce":reduce1,"out":"xxx"})

sbs=[1,2,3,4,5,'s','b']
for(var i in sbs){
    i
}