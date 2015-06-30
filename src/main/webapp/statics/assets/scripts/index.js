var Index = function () {

    return {
        initLayerSlider: function () {
            console.log("initLayerSlider");
            $('#layerslider').layerSlider({
                skin : 'fullwidth',
                thumbnailNavigation : 'hover',
                hoverPrevNext : false,
                responsive : false,
                responsiveUnder : 960,
                sublayerContainer : 960
            });
        }
    };

}();