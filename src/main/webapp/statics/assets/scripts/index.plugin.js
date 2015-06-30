+function ($) {
    'use strict';
    var Index = function () {

        return {
            initLayerSlider: function () {
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

    }
    var index=new Index();
    index.initLayerSlider();
}(jQuery)
