<#import "parts/common.ftl" as c>
<#import "parts/logInOut.ftl" as l>
<@c.page>
Регистрация нового пользователя <br>
${message!}
<@l.login "/registration"/>
</@c.page>