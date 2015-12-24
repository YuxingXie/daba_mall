map1=function(){
    for(var i in this.productSeriesPrices){
        //this.onePrice=this.productSeriesPrices[i];
        var key=this._id;
        var value=this;
        var emVal={"product":this,"price":this.productSeriesPrices[i]}
        emit("price_",emVal);
    }
}
reduce1=function(key,emits){
    var now=new Date();
    for(var i in emits){
        var productSeriesPrice=emits[i].price;
        if(productSeriesPrice.beginDate&&productSeriesPrice.beginDate<now&&(!productSeriesPrice.endDate||productSeriesPrice.endDate>now)){
            emits[i].product.currentPrice=productSeriesPrice;
            return emits[i].product;
        }
    }
}
mr=db.runCommand({"mapreduce":"productSeries","map":map1,"reduce":reduce1,"out":"xxx"})

sbs=[1,2,3,4,5,'s','b']
for(var i in sbs){
    i
}