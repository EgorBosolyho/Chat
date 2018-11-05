<#import "parts/common.ftl" as c>
<#import "parts/logInOut.ftl" as l>
<@c.page>
<@l.logout/>
<#if admin?has_content>
<div><a href="/user">Список пользователей</a></div>
</#if>
<form method="post" enctype="multipart/form-data">
    <input type="text" name="text" placeholder="Введите сообщение"/>
    <input type="text" name="tag" placeholder="Введите тэг"/>
    <input type="file" name="file">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>  <#--csrf только для post-->
    <button type="submit">Отправить</button>
</form>

<form method="get" action="/main">
    <input type="text" name="filter" value="${filter!}" placeholder="Тэг для поиска.."/>
    <button type="submit">Отфильтровать</button>
</form>

<div>Список сообщений:</div>
<#list messages as message>
<strong>${message.getAuthorName()} : </strong>
    <a>${message.text}</a>
    <i> / ${message.tag}</i>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}" height="200" width="200"/>
        </#if>
    </div>
    <br>
<#else>
Сообщений нет
</#list>
</@c.page>