<#import "parts/common.ftl" as c>
<#import "parts/logInOut.ftl" as l>
<@c.page>
<@l.logout/>


<form method="post">
    <input type="text" name="text" placeholder="Введите сообщение"/>
    <input type="text" name="tag" placeholder="Введите тэг"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit">Отправить</button>
</form>

<form method="post" action="filter">
    <input type="text" name="filter" placeholder="Фраза для поиска.."/>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit">Отфильтровать</button>
</form>

<div>Список сообщений:</div>
<#list messages as message>
    <b>${message.id}</b>
    <splan>${message.text}</splan>
    <i>${message.tag}</i>
    <strong>${message.getAuthorName()}</strong>
    <br>
<#else>
Сообщений нет
</#list>
</@c.page>