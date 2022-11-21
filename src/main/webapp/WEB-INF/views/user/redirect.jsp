<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-21
  Time: 오후 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">

  let message = '${msg}';

  let returnUrl = '${url}';

  alert(message);

  document.location.href = returnUrl;

</script>
</body>
</html>
