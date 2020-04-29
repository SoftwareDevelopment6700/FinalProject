<%-- 
    Document   : index
    Created on : Apr 21, 2020, 9:51:41 PM
    Author     : haoyu
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="categories" dataSource="jdbc/myDataSource">
    SELECT * FROM category
</sql:query>


            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p style="font-size: larger">[WELCOME TEXT]</p>

                </div>
            </div>
    
            <div id="indexRightColumn">
                <c:forEach var="category" items="${categories.rows}">
                    <div class="categoryBox">
                        <a href="category?${category.id}">
                            <span class="categoryLabel"></span>
                            <span class="categoryLabelText">${category.name}</span>

                            <img src="${initParam.categoryImagePath}${category.name}.jpg"
                                 alt="${category.name}" class="categoryImage">
                        </a>
                    </div>
                </c:forEach>
            </div>