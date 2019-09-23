<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>{{.SITE_NAME}} - Powered by MinDoc</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="Minho" />
    <meta name="site" content="https://www.iminho.me" />
    <meta name="keywords" content="MinDoc,文档在线管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理">
    <meta name="description" content="MinDoc文档在线管理系统 {{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">

</head>
<body>
<div class="manual-reader manual-container">
    {{template "widgets/header.tpl" .}}
    <div class="container manual-body">
        <div class="row">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>空间</th>
                  <th>作者</th>
                  <th>创建时间</th>
                  <th>文档数量</th></tr>
              </thead>
              <tbody>{{range $index,$item := .Lists}}
                <tr>
                  <td>
                    <a href="{{urlfor " DocumentController.Index " ":key " $item.Identify}}" class="name" title="{{$item.BookName}}-{{$item.CreateName}}" target="_blank">{{$item.BookName}}</a></td>
                  <td>{{if eq $item.RealName "" }}{{$item.CreateName}}{{else}}{{$item.RealName}}{{end}}</td>
                  <td>{{date_format $item.CreateTime "2006-01-02 15:04:05"}}</td>
                  <td>{{$item.DocCount}}</td></tr>{{else}}
                    <div class="text-center">暂无项目</div>{{end}}
                </tbody>
           </table>
            <nav class="pagination-container">
                {{if gt .TotalPages 1}}
                {{.PageHtml}}
                {{end}}
                <div class="clearfix"></div>
            </nav>
        </div>
    </div>
    {{template "widgets/footer.tpl" .}}
</div>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}" type="text/javascript"></script>
{{.Scripts}}
</body>
</html>
