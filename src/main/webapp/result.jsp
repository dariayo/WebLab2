<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="image/cat.png" type="image/x-icon">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <style>
        <%@include file="/css/style.css"%>
    </style>
    <script src="js/validate.js"></script>
    <script src="js/sendServer.js"></script>
    <script src="js/clearTable.js"></script>
    <script src="js/graph.js"></script>
    <script type="module" src="js/jquery-3.7.1.js"></script>
    <title>Web</title>
</head>
<body background="image/wallpaper.avif">
<div class="back-container">
    <div class="resultPage">
        <div id="back-button">
            <button class='pointer' id='prevResult' onClick="window.location.replace('index.jsp');" type="reset"
                    onclick="">Back
            </button>
        </div>
        <div id="resultTable">
            <table class="table-header" id="results">
                <tr>
                    <th class="header__item"><a id="x-table" class="space">X</a></th>
                    <th class="header__item"><a id="y-table" class="space">Y</a></th>
                    <th class="header__item"><a id="r-table" class="space">R</a></th>
                    <th class="header__item"><a id="result-table" class="space">result</a>
                    </th>
                    <th class="header__item"><a id="time-table" class="space">Time</a>
                    </th>
                    <th class="header__item"><a id="runtime-table" class="space">Runtime</a></th>
                </tr>
                <%--@elvariable id="dots" type="org.example.model.PointCollection"--%>
                <tr>
<%--                    <c:if test="${not empty dots.collection}">--%>
<%--                        <td>${dots.last.x.toString().format("%.2f", dots.last.x)}</td>--%>
<%--                        <td>${dots.last.y.toString().format("%.2f", dots.last.y)}</td>--%>
<%--                        <td>${dots.last.r.toString().format("%.2f", dots.last.r)}</td>--%>
<%--                        <td>${dots.last.status}</td>--%>
<%--                        <td>${dots.last.time}</td>--%>
<%--                        <td>${dots.last.runtime}</td>--%>
<%--                    </c:if>--%>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
