<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title>输入产品</title>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${path}/statics/assets/plugins/multi-file-upload/css/default.css">
    <link href="${path}/statics/assets/plugins/multi-file-upload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <!--[if IE]>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
    <script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>

</head>
<body>
<div  ng-app="productSeriesInputApp">
    <div class="container table-bordered bg-success">
        <div class="text-info text-center" style="margin-top: 60px;margin-bottom: 60px;">输入产品</div>
        <div class="row table-bordered bg-success">
            <form role="form"  action="${path}/admin/product_series/new" name="productSeries" enctype="multipart/form-data" method="post">
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">产品名称</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="text" class="form-control" required="true" name="name" ng-model="name"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">price</div>
                    <div class="col-lg-4 col-sm-4">
                        <input type="text" class="form-control " required="true" name="price" ng-model="price"/>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right ">description</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="text" name="description" class="form-control" required="true" model="description"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">brand</div>
                    <div class="col-lg-10 col-sm-10">
                        <input type="text" name="brand" class="form-control " required="true" ng-model="brand"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">产品分类</div>
                    <div class="col-lg-6 col-sm-6 form-inline">
                        <div ng-controller='psiCtrl'>
                            <div ng-if="list.length>0 &&!noSortFit">
                                大类：
                                <select ng-model="productCategory" ng-options="obj as obj.categoryName for obj in list" name="productCategory" >
                                    <option>--选择大类--</option>
                                </select>
                                <label ng-show="productCategory.productSubCategories.length>0">
                                    小类：
                                    <select ng-model="productSubCategoryId" required="true" name="productSubCategoryId">
                                        <option ng-repeat="productSubCategory in productCategory.productSubCategories" value="{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</option>
                                    </select>
                                </label>
                                <label class=" form-inline">没有找到分类？点<a href="${path}/admin/product_category/create_input.jsp">这里</a>新建产品分类</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">pictures</div>
                    <div class="col-lg-6 col-sm-6 form-group">
                        <div class="form-group">
                            <input name="files" id="file-5" class="file" type="file" multiple data-preview-file-type="any"
                                   data-show-upload="false" data-preview-file-icon="" data-preview-class="bg-info clearfix">
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">property</div>
                    <div class="col-lg-10 col-sm-10">
                        <div class="row" data-property-index="0">
                            <div class="col-lg-2 col-sm-2">
                                <input type="text" name="propertyName0" class="form-control propertyName" placeholder="属性名，如:包装"/>
                            </div>
                            <div class="col-lg-5 col-sm-5">
                                <input type="text" name="propertyValue0" class="form-control propertyValue" placeholder="属性值，如：散装,袋装，多个属性用英文逗号隔开"/>
                            </div>
                            <div class="col-lg-3 col-sm-3">
                                <a class="btn btn-primary addNewProperty">再增加一个属性</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right "></div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="submit" value="提交" class="btn btn-primary" />
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function() {
        $("#test-upload").fileinput({
            'showPreview' : false,
            'allowedFileExtensions' : ['jpg', 'png','gif'],
            'elErrorContainer': '#errorBlock'
        });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
        $(document).on("click",".addNewProperty",function(){
            var $pp=$(this).parent().parent();
            var index=$pp.data("propertyIndex");
            index++;
            var $new=$pp.clone();
            var $propertyName= $new.find("input.propertyName");
            var $propertyValue= $new.find("input.propertyValue");
            $propertyName.val(null);
            $propertyValue.val(null);
            $propertyName.attr("name","propertyName"+index);
            $propertyValue.attr("name","propertyValue"+index);
            $new.data("propertyIndex",index);
            $pp.find(".addNewProperty").remove();
            $pp.after($new);
        });
    });
    $(".btn-warning").on('click', function() {
        if ($('#file-4').attr('disabled')) {
            $('#file-4').fileinput('enable');
        } else {
            $('#file-4').fileinput('disable');
        }
    });
    $(".btn-info").on('click', function() {
        $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
    });
    var app = angular.module('productSeriesInputApp', []);
    app.controller('psiCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.list = [];
        $scope.productSubCategories=[];
        $scope.noSortFit=false;
        $http.get('${path}/admin/product/categories').success(function (data) {
            $scope.list = data;
        });
    }]);
//    angular.bootstrap(document, ['productSeriesInputApp']);

</script>