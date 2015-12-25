map1=function(){
    for(var i in this.productSeriesPrices){
        emit(this,this.productSeriesPrices[i]);
    }
}
reduce1=function(key,emits){
    var now=new Date();
    for(var i in emits){
        var productSeriesPrice=emits[i];
        if(productSeriesPrice.beginDate&&productSeriesPrice.beginDate<now&&(!productSeriesPrice.endDate||productSeriesPrice.endDate>now)){
            return productSeriesPrice;
        }
    }
}
mr=db.runCommand({"mapreduce":"productSeries","map":map1,"reduce":reduce1,"out":"xxx"})

sbs=[1,2,3,4,5,'s','b']
for(var i in sbs){
    i
}