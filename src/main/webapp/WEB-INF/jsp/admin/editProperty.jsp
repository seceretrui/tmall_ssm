<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>编辑属性</title>
<div class="panel panel-warning addDiv">
    <div class="panel-heading">编辑属性</div>
    <div class="panel-body">
        <form method="post" id="addForm" action="admin_property_update">
            <table class="addTable">
                <tr>
                    <td>属性名称</td>
                    <td><input id="name" name="name" class="form-control" value="${p.name}"></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <input type="hidden" name="id" value="${p.id}">
                        <input type="hidden" name="cid" value="${p.category.id}">
                        <button type="submit" class="btn btn-success">提交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp"%>