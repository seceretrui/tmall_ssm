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
                        <td><img></td>
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
        })
    })
</script>
<nav>
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?start=0" aria-label="Previous">
                <span aria-hidden="true"><<</span>
            </a>
        </li>
        <li <c:if test="${!page.hasPreviouse}">class="disabled" </c:if>>
            <a href="?start=${page.start-page.count}" aria-label="Previous">
                <span aria-hidden="true"><</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li>
                <a href="?start=${status.index*page.count}" class="current">${status.count}</a>
            </li>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled" </c:if>>
            <a href="?start=${page.start+page.count}" aria-label="Next">
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

<%@include file="../include/admin/adminFooter.jsp"%>