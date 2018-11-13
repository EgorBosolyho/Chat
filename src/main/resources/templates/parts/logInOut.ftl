<#macro login mapping isRegister>
<form method="post" action="${mapping}">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Имя пользователя:</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="username" placeholder="Введите свой логин">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль:</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" name="password" placeholder="Введите свой пароль">
        </div>
    </div>
<#--security-->
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="mb-2">
        <button type="submit" class="btn btn-primary">
        <#if isRegister>
            Зарегистрировать
        <#else>
            Войти
        </#if>
        </button>
    </div>
    <#if !isRegister>
    <div>
        <a class="btn btn-primary" href="/registration">Регистрация</a>
    </div>
    </#if>
</form>
</#macro>

<#macro logout>
    <form method="post" action="/logout">
        <button type="submit" class="btn btn-primary">Выйти</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>