<#import "parts/common.ftl" as c>
<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input class="form-control" type="text" name="filter" value="${filter!}" placeholder="Тэг для поиска.."/>
            <button class="btn btn-primary ml-2" type="submit">Отфильтровать</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#newMessage" role="button" aria-expanded="false" aria-controls="collapseExample">
    Довавить новое сообщение
</a>
<div class="collapse" id="newMessage">
    <div class="form-group mt-2">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control" type="text" name="text" placeholder="Введите сообщение"/>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="tag" placeholder="Введите тэг"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="file">
                    <label class="custom-file-label" for="file" aria-describedby="inputGroupFileAddon02">Выбрать файл</label>
                </div>
            </div>
        <#--security-->
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">Отправить</button>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list messages as message>
        <div class="card my-2" >
         <#if message.filename??>
         <img class="card-img-top" src="/img/${message.filename}" alt="Card image cap">
         </#if>
            <div class="card-header">
                Пользователь: ${message.getAuthorName()}
            </div>
            <div class="card-body">
                <h5 class="card-title">Тэг: ${message.tag}</h5>
                <p class="card-text">Сообщение: ${message.text}</p>
            </div>
            <br>
        </div>
    <#else>
Сообщений нет
    </#list>
</div>
</@c.page>