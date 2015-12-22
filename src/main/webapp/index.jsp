<%
    System.out.println("this is index page,will redirect right now");
    request.getRequestDispatcher("/index").forward(request,response);
%>
