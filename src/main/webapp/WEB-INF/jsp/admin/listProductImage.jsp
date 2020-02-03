<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<script>
    $(function () {
        $(".addFormSingle").submit(function () {
            if(!checkEmpty("filepathSingle", "产品缩略图"))
                return false;
            return true;
        });
        $(".addFormDetail").submit(function () {
            if(!checkEmpty("filepathDetail", "产品详细图"))
                return false;
            return true;
        });
    });
</script>
<title>产品图片管理</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
        <li class="active">${p.name}</li>
        <li class="active">产品图片管理</li>
    </ol>

    <table class="addPictureTable" align="center">
        <tr>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">新增产品图片</div>
                        <div class="panel-body">
                            <form method="post" class="addFormSingle" action="admin_add_productImage" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 尺寸400X400 为佳</td>
                                        <td><input id="filepathSingle" accept="image/*" type="file" name="image"></td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td colspan="2" align="center">
                                            <input type="hidden" name="type" value="type_single">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <button type="submit" class="btn btn-success">提交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">

                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>产品缩略图</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listSingle}" var="c">
                            <tr>
                                <td>${c.id}</td>
                                <td><a title="点击查看原图" href="img/productSingle/${c.id}.jpg"><img height="50px" src="img/productSingle/${c.id}.jpg"></a></td>
                                <td><a deleteLink="true" href="admin_delete_productImage?id=${c.id}"a><span class="glyphicon glyphicon-trash"></span></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </td>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">新增产品详细图片</div>
                        <div class="panel-body">
                            <form method="post" class="addFormDetail" action="admin_add_productImage" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 尺寸790X790 为佳</td>
                                        <td><input id="filepathDetail" accept="image/*" type="file" name="image"></td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td colspan="2" align="center">
                                            <input type="hidden" name="type" value="type_detail">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <button type="submit" class="btn btn-success">提交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">

                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>产品详细图</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listDetail}" var="c">
                            <tr>
                                <td>${c.id}</td>
                                <td><a title="点击查看原图" href="img/productDetail/${c.id}.jpg"><img height="50px" src="img/productDetail/${c.id}.jpg"></a></td>
                                <td><a deleteLink="true" href="admin_delete_productImage?id=${c.id}"a><span class="glyphicon glyphicon-trash"></span></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    </table>

    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>