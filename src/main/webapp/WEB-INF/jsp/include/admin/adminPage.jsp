<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

	
<script>
$(function(){
	$("ul.pagination li.disabled a").click(function(){
		return false;
	});
});

</script>

<c:if test="${page.totalPage!=0}">
    <nav aria-label="Page navigation" >
        <ul class="pagination">
            <li <c:if test="${!page.hasPrevious}">class="disabled" </c:if>>
                <a href="?start=0${page.param}" aria-label="Previous">
                    <span aria-hidden="true"><<</span>
                </a>
            </li>
            <li <c:if test="${!page.hasPrevious}">class="disabled" </c:if>>
                <a href="?start=${page.start - page.count}${page.param}" aria-label="Previous">
                    <span aria-hidden="true"><</span>
                </a>
            </li>

            <c:forEach begin="0" end="${page.totalPage - 1}" varStatus="status">
                <li>
                    <a href="?start=${page.count * status.index}${page.param}" class="current">${status.count}</a>
                </li>
            </c:forEach>

            <li <c:if test="${!page.hasNext}">class="disabled" </c:if>>
                <a href="?start=${page.start + page.count}${page.param}" aria-label="Next">
                    <span aria-hidden="true">></span>
                </a>
            </li>
            <li <c:if test="${!page.hasNext}">class="disabled" </c:if>>
                <a href="?start=${page.last}${page.param}" aria-label="Next">
                    <span aria-hidden="true">>></span>
                </a>
            </li>
        </ul>
    </nav>
</c:if>
