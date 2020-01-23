<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>分类管理</title>

<div class="workingArea">
    <h1 class="label label-info"></h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
                <tr class="success">
                    <th>ID</th>
                    <th>图片</th>
                    <th>分类名称</th>
                    <th>属性管理</th>
                    <th>产品管理</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${categoryList}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                        <td>${c.name}</td>
                        <td><a href="admin_property_list?cid=${c.id}.jpg"><span class="glyphicon glyphicon-th-list"></span></a></td>
                        <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                        <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(function () {
        $(".disabled").click(function () {
            return false;
        });

        $("#addForm").submit(function () {
            if(!checkEmpty("name", "分类名称"))
                return false;
            if(!checkEmpty("categoryPic", "分类图片"))
                return false;
            return true;
        });
    });
</script>
<nav aria-label="Page navigation">
    <ul class="pagination">
        <li <c:if test="${!page.hasPrevious}">class="disabled" </c:if>>
            <a href="?start=0" aria-label="Previous">
                <span aria-hidden="true"><<</span>
            </a>
        </li>
        <li <c:if test="${!page.hasPrevious}">class="disabled" </c:if>>
            <a href="?start=${page.start - page.count}" aria-label="Previous">
                <span aria-hidden="true"><</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage - 1}" varStatus="status">
            <li>
                <a href="?start=${page.count * status.index}" class="current">${status.count}</a>
            </li>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled" </c:if>>
            <a href="?start=${page.start + page.count}" aria-label="Next">
                <span aria-hidden="true">></span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled" </c:if>>
            <a href="?start=${page.last}" aria-label="Next">
                <span aria-hidden="true">>></span>
            </a>
        </li>
    </ul>
</nav>

<div class="panel panel-warning addDiv">
    <div class="panel-heading">新增分类</div>
    <div class="panel-body">
        <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
            <table class="addTable">
                <tr>
                    <td>分类名称</td>
                    <td><input id="name" name="name" class="form-control"></td>
                </tr>
                <tr>
                    <td>分类图片</td>
                    <td><input id="categoryPic" accept="image/*" type="file" name="image"></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-success">提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>