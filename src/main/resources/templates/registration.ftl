<#import "parts/common.ftl" as c>
<#import "parts/logInOut.ftl" as l>
<@c.page>
<div class="mb-2">Регистрация нового пользователя:</div>
${message!}
<@l.login "/registration" true/>
</@c.page>