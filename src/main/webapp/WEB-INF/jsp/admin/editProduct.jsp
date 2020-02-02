<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>编辑产品</title>
<div class="panel panel-warning addDiv">
    <div class="panel-heading">编辑产品</div>
    <div class="panel-body">
        <form method="post" id="addForm" action="admin_product_update">
            <table class="addTable">
                <tr>
                    <td>产品名称</td>
                    <td><input id="name" name="name" type="text" value="${p.name}"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>产品副标题</td>
                    <td><input id="subTitle" name="subTitle" type="text" value="${p.subTitle}"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>产品原价格</td>
                    <td><input id="originalPrice" name="originalPrice" type="text" value="${p.originalPrice}"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>产品折扣价</td>
                    <td><input id="promotePrice" name="promotePrice" type="text" value="${p.promotePrice}"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>产品库存</td>
                    <td><input id="stock" name="stock" type="text" value="${p.stock}"
                               class="form-control"></td>
                </tr>

                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <input type="hidden" name="id" value="${p.id}">
                        <input type="hidden" name="cid" value="${p.cid}">
                        <button type="submit" class="btn btn-success">提 交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>